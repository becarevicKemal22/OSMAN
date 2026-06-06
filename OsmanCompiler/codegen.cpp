#include "codegen.h"

#include <fstream>
#include <stdexcept>

CodeGenerator::CodeGenerator(Program& program)
    : program(program), brojacLabela(0), brojacPrivremenih(0) {
}

void CodeGenerator::emituj(const std::string& linija) {
    kod << linija << "\n";
}

std::string CodeGenerator::labelaVarijable(const std::string& ime) const {
    return "VAR_" + ime;
}

std::string CodeGenerator::novaLabela(const std::string& prefiks) {
    return prefiks + "_" + std::to_string(brojacLabela++);
}

std::string CodeGenerator::novaPrivremena() {
    std::string ime = "TMP_" + std::to_string(brojacPrivremenih++);
    privremeneVarijable.push_back(ime);
    return ime;
}

void CodeGenerator::dodajVarijablu(const std::string& ime) {
    if (varijable.count(ime)) {
        throw std::runtime_error("Varijabla '" + ime + "' je vec deklarisana.");
    }

    varijable.insert(ime);
    varijableRedom.push_back(ime);
}

void CodeGenerator::provjeriVarijablu(const std::string& ime) const {
    if (!varijable.count(ime)) {
        throw std::runtime_error("Varijabla '" + ime + "' nije deklarisana.");
    }
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
            dodajVarijablu(deklaracija->ime);
        } else if (auto ifNaredba = dynamic_cast<IfStmt*>(naredba.get())) {
            prikupiVarijable(*ifNaredba->thenBlok);
            if (ifNaredba->elseBlok) {
                prikupiVarijable(*ifNaredba->elseBlok);
            }
        } else if (auto whileNaredba = dynamic_cast<WhileStmt*>(naredba.get())) {
            prikupiVarijable(*whileNaredba->tijelo);
        } else if (auto forNaredba = dynamic_cast<ForStmt*>(naredba.get())) {
            if (forNaredba->tijelo) {
                prikupiVarijable(*forNaredba->tijelo);
            }
        }
    }
}

void CodeGenerator::generisiBlok(const BlockStmt& blok) {
    for (const auto& naredba : blok.naredbe) {
        generisiNaredbu(naredba.get());
    }
}

void CodeGenerator::generisiNaredbu(const Stmt* naredba) {
    if (dynamic_cast<const VarDeclStmt*>(naredba)) {
        return;
    }

    if (auto dodjela = dynamic_cast<const AssignStmt*>(naredba)) {
        provjeriVarijablu(dodjela->ime);
        generisiIzraz(dodjela->izraz.get(), "A");
        emituj("STI A, " + labelaVarijable(dodjela->ime));
        return;
    }

    if (auto output = dynamic_cast<const OutputStmt*>(naredba)) {
        generisiIzraz(output->izraz.get(), "A");
        emituj("STI A, OUT");
        return;
    }

    if (auto ret = dynamic_cast<const ReturnStmt*>(naredba)) {
        generisiIzraz(ret->izraz.get(), "A");
        std::string tmp = novaPrivremena();
        emituj("STI A, " + tmp);
        emituj("LDI PV, " + tmp);
        emituj("JMP END");
        return;
    }

    if (auto ink = dynamic_cast<const IncrementStmt*>(naredba)) {
        provjeriVarijablu(ink->ime);
        emituj("LDI A, " + labelaVarijable(ink->ime));
        if (ink->povecaj) {
            emituj("ADDI A, 1");
        } else {
            emituj("SUBI A, 1");
        }
        emituj("STI A, " + labelaVarijable(ink->ime));
        return;
    }

    if (auto ifNaredba = dynamic_cast<const IfStmt*>(naredba)) {
        generisiIf(ifNaredba);
        return;
    }

    if (auto whileNaredba = dynamic_cast<const WhileStmt*>(naredba)) {
        generisiWhile(whileNaredba);
        return;
    }

    if (auto forNaredba = dynamic_cast<const ForStmt*>(naredba)) {
        generisiFor(forNaredba);
        return;
    }

    throw std::runtime_error("Nepoznata naredba u code generatoru.");
}

void CodeGenerator::generisiIzraz(const Expr* izraz, const std::string& registar) {
    if (auto broj = dynamic_cast<const NumberExpr*>(izraz)) {
        emituj("LI " + registar + ", " + std::to_string(broj->vrijednost));
        return;
    }

    if (auto var = dynamic_cast<const VariableExpr*>(izraz)) {
        provjeriVarijablu(var->ime);
        emituj("LDI " + registar + ", " + labelaVarijable(var->ime));
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

            if (registar != "A") {
                std::string tmp = novaPrivremena();
                emituj("STI A, " + tmp);
                emituj("LDI " + registar + ", " + tmp);
            }

            return;
        }

        if (unarni->op == "-") {
            std::string tmp = novaPrivremena();

            generisiIzraz(unarni->izraz.get(), "A");
            emituj("STI A, " + tmp);
            emituj("LI A, 0");
            emituj("LDI B, " + tmp);
            emituj("SUB A, B");

            if (registar != "A") {
                std::string tmp2 = novaPrivremena();
                emituj("STI A, " + tmp2);
                emituj("LDI " + registar + ", " + tmp2);
            }

            return;
        }
    }

    if (auto binarni = dynamic_cast<const BinaryExpr*>(izraz)) {
        if (binarni->op == "==" || binarni->op == "!=" ||
            binarni->op == "<" || binarni->op == "<=" ||
            binarni->op == ">" || binarni->op == ">=") {
            generisiPoredjenje(binarni, registar);
            return;
        }

        std::string lijevo = novaPrivremena();
        std::string desno = novaPrivremena();

        generisiIzraz(binarni->lijevo.get(), "A");
        emituj("STI A, " + lijevo);

        generisiIzraz(binarni->desno.get(), "A");
        emituj("STI A, " + desno);

        emituj("LDI A, " + lijevo);
        emituj("LDI B, " + desno);

        if (binarni->op == "+") {
            emituj("ADD A, B");
        } else if (binarni->op == "-") {
            emituj("SUB A, B");
        } else if (binarni->op == "&") {
            emituj("AND A, B");
        } else if (binarni->op == "|") {
            emituj("OR A, B");
        } else if (binarni->op == "^") {
            emituj("XOR A, B");
        } else {
            throw std::runtime_error("Nepodrzan operator '" + binarni->op + "'.");
        }

        if (registar != "A") {
            std::string tmp = novaPrivremena();
            emituj("STI A, " + tmp);
            emituj("LDI " + registar + ", " + tmp);
        }

        return;
    }

    throw std::runtime_error("Nepoznat izraz u code generatoru.");
}

void CodeGenerator::generisiPoredjenje(const BinaryExpr* izraz, const std::string& registar) {
    std::string lijevo = novaPrivremena();
    std::string desno = novaPrivremena();
    std::string tacno = novaLabela("CMP_TRUE");
    std::string kraj = novaLabela("CMP_END");

    generisiIzraz(izraz->lijevo.get(), "A");
    emituj("STI A, " + lijevo);

    generisiIzraz(izraz->desno.get(), "A");
    emituj("STI A, " + desno);

    if (izraz->op == ">" || izraz->op == "<=") {
        emituj("LDI A, " + desno);
        emituj("LDI B, " + lijevo);
    } else {
        emituj("LDI A, " + lijevo);
        emituj("LDI B, " + desno);
    }

    emituj("CMP A, B");

    if (izraz->op == "==") {
        emituj("BEQ " + tacno);
    } else if (izraz->op == "!=") {
        emituj("BNE " + tacno);
    } else if (izraz->op == "<") {
        emituj("BLT " + tacno);
    } else if (izraz->op == ">=") {
        emituj("BGE " + tacno);
    } else if (izraz->op == ">") {
        emituj("BLT " + tacno);
    } else if (izraz->op == "<=") {
        emituj("BGE " + tacno);
    }

    emituj("LI A, 0");
    emituj("JMP " + kraj);

    emituj(tacno + ":");
    emituj("LI A, 1");

    emituj(kraj + ":");

    if (registar != "A") {
        std::string tmp = novaPrivremena();
        emituj("STI A, " + tmp);
        emituj("LDI " + registar + ", " + tmp);
    }
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

    if (naredba->inicijalizacija) {
        generisiNaredbu(naredba->inicijalizacija.get());
    }

    emituj(pocetak + ":");

    if (naredba->uslov) {
        generisiIzraz(naredba->uslov.get(), "A");
        emituj("CMPI A, 0");
        emituj("BEQ " + kraj);
    }

    generisiBlok(*naredba->tijelo);

    if (naredba->promjena) {
        generisiNaredbu(naredba->promjena.get());
    }

    emituj("JMP " + pocetak);
    emituj(kraj + ":");
}

std::string CodeGenerator::generisi() {
    FunctionDecl* mainFunkcija = nadjiMain();

    prikupiVarijable(*mainFunkcija->tijelo);

    kod.str("");
    kod.clear();

    emituj(".CODE");
    emituj("MAIN:");

    generisiBlok(*mainFunkcija->tijelo);

    emituj("END:");
    emituj("JMP END");

    std::string codeSekcija = kod.str();

    std::ostringstream izlaz;

    izlaz << ".EQU OUT 0xF8\n\n";

    izlaz << ".DATA\n";
    for (const std::string& var : varijableRedom) {
        izlaz << labelaVarijable(var) << ": .BYTE 0\n";
    }

    for (const std::string& tmp : privremeneVarijable) {
        izlaz << tmp << ": .BYTE 0\n";
    }

    izlaz << "\n";
    izlaz << codeSekcija;

    return izlaz.str();
}

void CodeGenerator::generisiUFajl(const std::string& nazivFajla) {
    std::ofstream izlaz(nazivFajla);

    if (!izlaz.is_open()) {
        throw std::runtime_error("Ne mogu otvoriti izlazni fajl: " + nazivFajla);
    }

    izlaz << generisi();
}
