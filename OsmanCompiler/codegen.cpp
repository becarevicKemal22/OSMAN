#include "codegen.h"

#include <fstream>
#include <stdexcept>

CodeGenerator::CodeGenerator(Program& program)
    : program(program), brojacLabela(0), uMainu(true) {
}

void CodeGenerator::emituj(const std::string& linija) {
    kod << linija << "\n";
}
bool CodeGenerator::jePokazivacUOkviru(const std::string& ime) const {
    auto it = okvir.find(ime);
    return it != okvir.end() && it->second.kind == VarKind::Pointer;
}

std::string CodeGenerator::labelaVarijable(const std::string& ime) const {
    return "VAR_" + ime;
}

std::string CodeGenerator::novaLabela(const std::string& prefiks) {
    return prefiks + "_" + std::to_string(brojacLabela++);
}

void CodeGenerator::gurni(const std::string& reg) {
    emituj("SUBI SP, 1");
    emituj("ST " + reg + ", SP[0]");
}

void CodeGenerator::skini(const std::string& reg) {
    emituj("LD " + reg + ", SP[0]");
    emituj("ADDI SP, 1");
}

void CodeGenerator::ucitajVarijablu(const std::string& ime, const std::string& reg) {
    if (uMainu) {
        provjeriVarijablu(ime);
        emituj("LDI " + reg + ", " + labelaVarijable(ime));
    } else {
        auto it = okvir.find(ime);
        if (it == okvir.end()) {
            throw std::runtime_error("Varijabla '" + ime + "' nije deklarisana.");
        }
        emituj("LD " + reg + ", E[" + std::to_string(it->second.offset) + "]");
    }
}

void CodeGenerator::spremiVarijablu(const std::string& reg, const std::string& ime) {
    if (uMainu) {
        provjeriVarijablu(ime);
        emituj("STI " + reg + ", " + labelaVarijable(ime));
    } else {
        auto it = okvir.find(ime);
        if (it == okvir.end()) {
            throw std::runtime_error("Varijabla '" + ime + "' nije deklarisana.");
        }
        emituj("ST " + reg + ", E[" + std::to_string(it->second.offset) + "]");
    }
}

void CodeGenerator::dodajVarijablu(const std::string& ime, VarKind kind, int velicina) {
    if (varijable.count(ime)) {
        throw std::runtime_error("Varijabla '" + ime + "' je vec deklarisana.");
    }
    varijable[ime] = {kind, velicina};
    varijableRedom.push_back(ime);
}

VarInfo CodeGenerator::infoVarijable(const std::string& ime) const {
    auto it = varijable.find(ime);
    if (it == varijable.end()) {
        throw std::runtime_error("Varijabla '" + ime + "' nije deklarisana.");
    }
    return it->second;
}

void CodeGenerator::provjeriVarijablu(const std::string& ime) const {
    infoVarijable(ime);
}

FunctionDecl* CodeGenerator::nadjiMain() {
    for (auto& funkcija : program.funkcije) {
        if (funkcija->ime == "main") {
            return funkcija.get();
        }
    }
    throw std::runtime_error("Program mora imati funkciju main.");
}

void CodeGenerator::prikupiVarijable(const BlockStmt& blok) {
    for (const auto& naredba : blok.naredbe) {
        if (auto deklaracija = dynamic_cast<VarDeclStmt*>(naredba.get())) {
            dodajVarijablu(deklaracija->ime, deklaracija->kind, deklaracija->velicina);
        } else if (auto ifNaredba = dynamic_cast<IfStmt*>(naredba.get())) {
            prikupiVarijable(*ifNaredba->thenBlok);
            if (ifNaredba->elseBlok) prikupiVarijable(*ifNaredba->elseBlok);
        } else if (auto whileNaredba = dynamic_cast<WhileStmt*>(naredba.get())) {
            prikupiVarijable(*whileNaredba->tijelo);
        } else if (auto forNaredba = dynamic_cast<ForStmt*>(naredba.get())) {
            if (forNaredba->tijelo) prikupiVarijable(*forNaredba->tijelo);
        }
    }
}

void CodeGenerator::prikupiLokalne(const BlockStmt& blok, int& brojLokalnih) {
    for (const auto& naredba : blok.naredbe) {
        if (auto deklaracija = dynamic_cast<VarDeclStmt*>(naredba.get())) {
    if (deklaracija->kind == VarKind::Array) {
        throw std::runtime_error("Nizovi kao lokalne varijable unutar funkcija (osim main) trenutno nisu podrzani: '" + deklaracija->ime + "'.");
    }
    if (okvir.count(deklaracija->ime)) {
        throw std::runtime_error("Varijabla '" + deklaracija->ime + "' je vec deklarisana.");
    }
    int offset = -(1 + brojLokalnih);
    if (offset < -16) {
        throw std::runtime_error("Previse lokalnih varijabli u funkciji (max 16).");
    }
    okvir[deklaracija->ime] = {offset, deklaracija->kind};
    brojLokalnih++;
} else if (auto ifNaredba = dynamic_cast<IfStmt*>(naredba.get())) {
            prikupiLokalne(*ifNaredba->thenBlok, brojLokalnih);
            if (ifNaredba->elseBlok) prikupiLokalne(*ifNaredba->elseBlok, brojLokalnih);
        } else if (auto whileNaredba = dynamic_cast<WhileStmt*>(naredba.get())) {
            prikupiLokalne(*whileNaredba->tijelo, brojLokalnih);
        } else if (auto forNaredba = dynamic_cast<ForStmt*>(naredba.get())) {
            if (forNaredba->tijelo) prikupiLokalne(*forNaredba->tijelo, brojLokalnih);
        }
    }
}

void CodeGenerator::generisiBlok(const BlockStmt& blok) {
    for (const auto& naredba : blok.naredbe) {
        generisiNaredbu(naredba.get());
    }
}

void CodeGenerator::generisiNaredbu(const Stmt* naredba) {
    if (auto dekl = dynamic_cast<const VarDeclStmt*>(naredba)) {
        if (!uMainu && !dekl->inicijalizator.empty()) {
            generisiIzraz(dekl->inicijalizator[0].get(), "A");
            spremiVarijablu("A", dekl->ime);
        }
        return;
    }

    if (auto dodjela = dynamic_cast<const AssignStmt*>(naredba)) {
        generisiDodjelu(dodjela->cilj.get(), dodjela->izraz.get());
        return;
    }

    if (auto izrazNaredba = dynamic_cast<const ExprStmt*>(naredba)) {
        generisiIzraz(izrazNaredba->izraz.get(), "A");   // npr. poziv funkcije; rezultat se odbacuje
        return;
    }

    if (auto output = dynamic_cast<const OutputStmt*>(naredba)) {
        bool dinamickaAdresa = false;
        std::string ciljnaAdresa = "OUT";

        if (output->adresa) {
            if (auto fiksna = dynamic_cast<const NumberExpr*>(output->adresa.get())) {
                ciljnaAdresa = std::to_string(fiksna->vrijednost);
            } else {
                dinamickaAdresa = true;
            }
        }

        generisiIzraz(output->izraz.get(), "A");

        if (output->bit) {
            if (auto konst = dynamic_cast<const NumberExpr*>(output->bit.get())) {
                int maska = 1 << konst->vrijednost;
                emituj("LI B, " + std::to_string(maska));
                emituj("AND A, B");
                std::string nula = novaLabela("BIT_IS_ZERO");
                std::string kraj = novaLabela("BIT_END");
                emituj("CMPI A, 0");
                emituj("BEQ " + nula);
                emituj("LI A, 1");
                emituj("JMP " + kraj);
                emituj(nula + ":");
                emituj("LI A, 0");
                emituj(kraj + ":");
            } else {
                throw std::runtime_error("Inicijalizacija bita podrzava samo konstantne vrijednosti.");
            }
        }

        if (dinamickaAdresa) {
            gurni("A");
            generisiIzraz(output->adresa.get(), "C");
            skini("A");
            emituj("ST A, C[0]");
        } else {
            emituj("STI A, " + ciljnaAdresa);
        }
        return;
    }

    if (auto ret = dynamic_cast<const ReturnStmt*>(naredba)) {
        generisiIzraz(ret->izraz.get(), "A");
        emituj("MOV PV, A");
        if (uMainu) {
            emituj("JMP END");
        } else {
            emituj("JMP " + krajFunkcijeLabela);
        }
        return;
    }

    if (auto ink = dynamic_cast<const IncrementStmt*>(naredba)) {
        generisiInkrement(ink->cilj.get(), ink->povecaj);
        return;
    }

    if (auto ifNaredba = dynamic_cast<const IfStmt*>(naredba)) { generisiIf(ifNaredba); return; }
    if (auto whileNaredba = dynamic_cast<const WhileStmt*>(naredba)) { generisiWhile(whileNaredba); return; }
    if (auto forNaredba = dynamic_cast<const ForStmt*>(naredba)) { generisiFor(forNaredba); return; }

    throw std::runtime_error("Nepoznata naredba u code generatoru.");
}

void CodeGenerator::generisiAdresu(const Expr* izraz, const std::string& registar) {
    if (auto var = dynamic_cast<const VariableExpr*>(izraz)) {
        if (uMainu) {
            provjeriVarijablu(var->ime);
            emituj("LA " + registar + ", " + labelaVarijable(var->ime));
        } else if (jePokazivacUOkviru(var->ime)) {
            // var je pokazivacki parametar - vrijednost u njemu JE adresa
            ucitajVarijablu(var->ime, registar);
        } else {
            throw std::runtime_error("Ne moze se uzeti adresa varijable '" + var->ime + "' unutar funkcije.");
        }
        return;
    }

    if (auto niz = dynamic_cast<const ArrayAccessExpr*>(izraz)) {
        if (uMainu) {
            VarInfo info = infoVarijable(niz->ime);
            if (info.kind != VarKind::Array) {
                throw std::runtime_error("Varijabla '" + niz->ime + "' nije niz.");
            }
            generisiIzraz(niz->indeks.get(), "A");
            emituj("MOV B, A");
            emituj("LA " + registar + ", " + labelaVarijable(niz->ime));
            emituj("ADD " + registar + ", B");
        } else if (jePokazivacUOkviru(niz->ime)) {
            // pristup p[i] gdje je p pokazivacki parametar
            generisiIzraz(niz->indeks.get(), "A");
            emituj("MOV B, A");
            ucitajVarijablu(niz->ime, registar);
            emituj("ADD " + registar + ", B");
        } else {
            throw std::runtime_error("Varijabla '" + niz->ime + "' nije niz ni pokazivac.");
        }
        return;
    }

    if (auto deref = dynamic_cast<const DereferenceExpr*>(izraz)) {
        generisiIzraz(deref->pokazivac.get(), registar);
        return;
    }

    throw std::runtime_error("Ne moze se izracunati adresa zadatog izraza.");
}

void CodeGenerator::generisiDodjelu(const Expr* cilj, const Expr* izraz) {
    if (auto var = dynamic_cast<const VariableExpr*>(cilj)) {
        generisiIzraz(izraz, "A");
        spremiVarijablu("A", var->ime);
        return;
    }

    if (dynamic_cast<const ArrayAccessExpr*>(cilj) || dynamic_cast<const DereferenceExpr*>(cilj)) {
        generisiIzraz(izraz, "A");
        gurni("A");
        generisiAdresu(cilj, "C");
        skini("A");
        emituj("ST A, C[0]");
        return;
    }

    throw std::runtime_error("Neispravan cilj dodjele.");
}

void CodeGenerator::generisiInkrement(const Expr* cilj, bool povecaj) {
    if (auto var = dynamic_cast<const VariableExpr*>(cilj)) {
        ucitajVarijablu(var->ime, "A");
        emituj(povecaj ? "ADDI A, 1" : "SUBI A, 1");
        spremiVarijablu("A", var->ime);
        return;
    }

    if (dynamic_cast<const ArrayAccessExpr*>(cilj) || dynamic_cast<const DereferenceExpr*>(cilj)) {
        generisiAdresu(cilj, "C");
        emituj("LD A, C[0]");
        emituj(povecaj ? "ADDI A, 1" : "SUBI A, 1");
        emituj("ST A, C[0]");
        return;
    }

    throw std::runtime_error("Neispravan cilj inkrementa.");
}

void CodeGenerator::generisiIzraz(const Expr* izraz, const std::string& registar) {
    if (auto broj = dynamic_cast<const NumberExpr*>(izraz)) {
        emituj("LI " + registar + ", " + std::to_string(broj->vrijednost));
        return;
    }

    if (auto poziv = dynamic_cast<const CallExpr*>(izraz)) {
        generisiPoziv(poziv, registar);
        return;
    }

    if (auto unos = dynamic_cast<const InputExpr*>(izraz)) {
    if (auto fiksna = dynamic_cast<const NumberExpr*>(unos->adresa.get())) {
        emituj("LDI " + registar + ", " + std::to_string(fiksna->vrijednost));
    } else {
        generisiIzraz(unos->adresa.get(), "C");
        emituj("LD " + registar + ", C[0]");
    }
    return;
}

    if (auto var = dynamic_cast<const VariableExpr*>(izraz)) {
        if (uMainu) {
            VarInfo info = infoVarijable(var->ime);
            if (info.kind == VarKind::Array) {
                emituj("LA " + registar + ", " + labelaVarijable(var->ime));
            } else {
                emituj("LDI " + registar + ", " + labelaVarijable(var->ime));
            }
        } else {
            ucitajVarijablu(var->ime, registar);
        }
        return;
    }

    if (auto niz = dynamic_cast<const ArrayAccessExpr*>(izraz)) {
        generisiAdresu(niz, "C");
        emituj("LD A, C[0]");
        if (registar != "A") emituj("MOV " + registar + ", A");
        return;
    }

    if (auto adresa = dynamic_cast<const AddressOfExpr*>(izraz)) {
        generisiAdresu(adresa->cilj.get(), registar);
        return;
    }

    if (auto deref = dynamic_cast<const DereferenceExpr*>(izraz)) {
        generisiIzraz(deref->pokazivac.get(), "C");
        emituj("LD A, C[0]");
        if (registar != "A") emituj("MOV " + registar + ", A");
        return;
    }

    if (auto unarni = dynamic_cast<const UnaryExpr*>(izraz)) {
        if (unarni->op == "!") {
            std::string tacno = novaLabela("NOT_TRUE");
            std::string kraj = novaLabela("NOT_END");
            generisiIzraz(unarni->izraz.get(), "A");
            emituj("CMPI A, 0");
            emituj("BEQ " + tacno);
            emituj("LI A, 0");
            emituj("JMP " + kraj);
            emituj(tacno + ":");
            emituj("LI A, 1");
            emituj(kraj + ":");
            if (registar != "A") emituj("MOV " + registar + ", A");
            return;
        }
        if (unarni->op == "-") {
            generisiIzraz(unarni->izraz.get(), "A");
            emituj("MOV B, A");
            emituj("LI A, 0");
            emituj("SUB A, B");
            if (registar != "A") emituj("MOV " + registar + ", A");
            return;
        }
        throw std::runtime_error("Nepodrzan unarni operator '" + unarni->op + "'.");
    }

    if (auto binarni = dynamic_cast<const BinaryExpr*>(izraz)) {
        if (binarni->op == "==" || binarni->op == "!=" ||
            binarni->op == "<" || binarni->op == "<=" ||
            binarni->op == ">" || binarni->op == ">=") {
            generisiPoredjenje(binarni, registar);
            return;
        }
        if (binarni->op == "*") { generisiMnozenje(binarni, registar); return; }
        if (binarni->op == "/") { generisiDijeljenje(binarni, registar); return; }

        generisiIzraz(binarni->lijevo.get(), "A");
        gurni("A");
        generisiIzraz(binarni->desno.get(), "A");
        emituj("MOV B, A");
        skini("A");

        if (binarni->op == "+") emituj("ADD A, B");
        else if (binarni->op == "-") emituj("SUB A, B");
        else if (binarni->op == "&") emituj("AND A, B");
        else if (binarni->op == "|") emituj("OR A, B");
        else if (binarni->op == "^") emituj("XOR A, B");
        else throw std::runtime_error("Nepodrzan operator '" + binarni->op + "'.");

        if (registar != "A") emituj("MOV " + registar + ", A");
        return;
    }

    throw std::runtime_error("Nepoznat izraz u code generatoru.");
}

void CodeGenerator::generisiPoziv(const CallExpr* poziv, const std::string& registar) {
    int n = static_cast<int>(poziv->argumenti.size());


    for (int i = n - 1; i >= 0; --i) {
        generisiIzraz(poziv->argumenti[i].get(), "A");
        gurni("A");
    }

    emituj("CALL " + poziv->ime);

    if (n > 0) {
        emituj("ADDI SP, " + std::to_string(n));
    }

    if (registar != "PV") {
        emituj("MOV " + registar + ", PV");
    }
}

void CodeGenerator::generisiPoredjenje(const BinaryExpr* izraz, const std::string& registar) {
    std::string tacno = novaLabela("CMP_TRUE");
    std::string kraj = novaLabela("CMP_END");

    generisiIzraz(izraz->lijevo.get(), "A");
    gurni("A");
    generisiIzraz(izraz->desno.get(), "A");
    emituj("MOV B, A");
    skini("A");

    if (izraz->op == ">" || izraz->op == "<=") {
        emituj("CMP B, A");
    } else {
        emituj("CMP A, B");
    }

    if (izraz->op == "==") emituj("BEQ " + tacno);
    else if (izraz->op == "!=") emituj("BNE " + tacno);
    else if (izraz->op == "<") emituj("BLT " + tacno);
    else if (izraz->op == ">=") emituj("BGE " + tacno);
    else if (izraz->op == ">") emituj("BLT " + tacno);
    else if (izraz->op == "<=") emituj("BGE " + tacno);

    emituj("LI A, 0");
    emituj("JMP " + kraj);
    emituj(tacno + ":");
    emituj("LI A, 1");
    emituj(kraj + ":");

    if (registar != "A") emituj("MOV " + registar + ", A");
}

void CodeGenerator::generisiMnozenje(const BinaryExpr* izraz, const std::string& registar) {
    std::string pocetak = novaLabela("MUL_START");
    std::string kraj = novaLabela("MUL_END");

    generisiIzraz(izraz->lijevo.get(), "A");
    gurni("A");
    generisiIzraz(izraz->desno.get(), "A");
    emituj("MOV B, A");
    skini("A");

    emituj("LI C, 0");
    emituj(pocetak + ":");
    emituj("CMPI B, 0");
    emituj("BEQ " + kraj);
    emituj("ADD C, A");
    emituj("SUBI B, 1");
    emituj("JMP " + pocetak);
    emituj(kraj + ":");
    emituj("MOV A, C");

    if (registar != "A") emituj("MOV " + registar + ", A");
}

void CodeGenerator::generisiDijeljenje(const BinaryExpr* izraz, const std::string& registar) {
    std::string pocetak = novaLabela("DIV_START");
    std::string kraj = novaLabela("DIV_END");

    generisiIzraz(izraz->lijevo.get(), "A");
    gurni("A");
    generisiIzraz(izraz->desno.get(), "A");
    emituj("MOV B, A");
    skini("A");

    emituj("LI C, 0");
    emituj("CMPI B, 0");
    emituj("BEQ " + kraj);
    emituj(pocetak + ":");
    emituj("CMP A, B");
    emituj("BLT " + kraj);
    emituj("SUB A, B");
    emituj("ADDI C, 1");
    emituj("JMP " + pocetak);
    emituj(kraj + ":");
    emituj("MOV A, C");

    if (registar != "A") emituj("MOV " + registar + ", A");
}

void CodeGenerator::generisiIf(const IfStmt* naredba) {
    std::string elseLabela = novaLabela("IF_ELSE");
    std::string krajLabela = novaLabela("IF_END");

    generisiIzraz(naredba->uslov.get(), "A");
    emituj("CMPI A, 0");

    if (naredba->elseBlok) {
        emituj("BEQ " + elseLabela);
        generisiBlok(*naredba->thenBlok);
        emituj("JMP " + krajLabela);
        emituj(elseLabela + ":");
        generisiBlok(*naredba->elseBlok);
        emituj(krajLabela + ":");
    } else {
        emituj("BEQ " + krajLabela);
        generisiBlok(*naredba->thenBlok);
        emituj(krajLabela + ":");
    }
}

void CodeGenerator::generisiWhile(const WhileStmt* naredba) {
    std::string pocetak = novaLabela("WHILE_START");
    std::string kraj = novaLabela("WHILE_END");

    emituj(pocetak + ":");
    generisiIzraz(naredba->uslov.get(), "A");
    emituj("CMPI A, 0");
    emituj("BEQ " + kraj);
    generisiBlok(*naredba->tijelo);
    emituj("JMP " + pocetak);
    emituj(kraj + ":");
}

void CodeGenerator::generisiFor(const ForStmt* naredba) {
    std::string pocetak = novaLabela("FOR_START");
    std::string kraj = novaLabela("FOR_END");

    if (naredba->inicijalizacija) generisiNaredbu(naredba->inicijalizacija.get());

    emituj(pocetak + ":");
    if (naredba->uslov) {
        generisiIzraz(naredba->uslov.get(), "A");
        emituj("CMPI A, 0");
        emituj("BEQ " + kraj);
    }
    generisiBlok(*naredba->tijelo);
    if (naredba->promjena) generisiNaredbu(naredba->promjena.get());
    emituj("JMP " + pocetak);
    emituj(kraj + ":");
}

void CodeGenerator::generisiGlavnu(FunctionDecl* funkcija) {
    uMainu = true;
    okvir.clear();
    prikupiVarijable(*funkcija->tijelo);

    emituj("MAIN:");
    generisiBlok(*funkcija->tijelo);
    emituj("END:");
    emituj("JMP END");
}

void CodeGenerator::generisiProceduru(FunctionDecl* funkcija) {
    uMainu = false;
    okvir.clear();

   for (size_t i = 0; i < funkcija->parametri.size(); ++i) {
    const Parametar& p = funkcija->parametri[i];
    int offset = 2 + static_cast<int>(i);
    if (offset > 15) {
        throw std::runtime_error("Previse parametara u funkciji '" + funkcija->ime + "' (max 14).");
    }
    if (okvir.count(p.ime)) {
        throw std::runtime_error("Dupli parametar '" + p.ime + "'.");
    }
    okvir[p.ime] = {offset, p.kind};
}

    int brojLokalnih = 0;
    prikupiLokalne(*funkcija->tijelo, brojLokalnih);

    krajFunkcijeLabela = funkcija->ime + "_END";

    emituj(funkcija->ime + ":");
    emituj("SUBI SP, 1");
    emituj("ST PA, SP[0]");
    emituj("SUBI SP, 1");
    emituj("ST E, SP[0]");
    emituj("MOV E, SP");
    if (brojLokalnih > 0) {
        emituj("SUBI SP, " + std::to_string(brojLokalnih));
    }

    generisiBlok(*funkcija->tijelo);

    emituj(krajFunkcijeLabela + ":");
    emituj("MOV SP, E");
    emituj("LD E, SP[0]");
    emituj("ADDI SP, 1");
    emituj("LD PA, SP[0]");
    emituj("ADDI SP, 1");
    emituj("RET");
}

std::string CodeGenerator::generisi() {
    FunctionDecl* mainFunkcija = nadjiMain();

    kod.str("");
    kod.clear();

    emituj(".CODE");
    emituj("LA SP, STACK_TOP");

    generisiGlavnu(mainFunkcija);

    for (auto& funkcija : program.funkcije) {
        if (funkcija->ime == "main") continue;
        generisiProceduru(funkcija.get());
    }

    std::string codeSekcija = kod.str();

    std::ostringstream izlaz;
    izlaz << ".EQU OUT 0xFF\n\n";

    izlaz << ".DATA\n";

    // stek na vrhu memorije (raste prema dolje)
    izlaz << "STACK_TOP: .BYTE 0\n";
    izlaz << "STACK_BUFFER: .BYTE ";
    for (int i = 0; i < VELICINA_STEKA; ++i) {
        if (i != 0) izlaz << ", ";
        izlaz << "0";
    }
    izlaz << "\n";

    for (const std::string& var : varijableRedom) {
        VarInfo info = infoVarijable(var);
        izlaz << labelaVarijable(var) << ": .BYTE ";

        const VarDeclStmt* dekl = nullptr;
        for (const auto& naredba : mainFunkcija->tijelo->naredbe) {
            if (auto v = dynamic_cast<const VarDeclStmt*>(naredba.get())) {
                if (v->ime == var) { dekl = v; break; }
            }
        }

        if (dekl && !dekl->inicijalizator.empty()) {
            for (int i = 0; i < info.velicina; i++) {
                if (i != 0) izlaz << ", ";
                if (i < static_cast<int>(dekl->inicijalizator.size())) {
                    if (auto broj = dynamic_cast<const NumberExpr*>(dekl->inicijalizator[i].get())) {
                        izlaz << broj->vrijednost;
                    } else {
                        throw std::runtime_error("Inicijalizacija podrzava samo konstantne vrijednosti.");
                    }
                } else {
                    izlaz << "0";
                }
            }
        } else {
            for (int i = 0; i < info.velicina; i++) {
                if (i != 0) izlaz << ", ";
                izlaz << "0";
            }
        }
        izlaz << "\n";
    }

    izlaz << "\n" << codeSekcija;
    return izlaz.str();
}

void CodeGenerator::generisiUFajl(const std::string& nazivFajla) {
    std::ofstream izlaz(nazivFajla);
    if (!izlaz.is_open()) {
        throw std::runtime_error("Ne mogu otvoriti izlazni fajl: " + nazivFajla);
    }
    izlaz << generisi();
}
