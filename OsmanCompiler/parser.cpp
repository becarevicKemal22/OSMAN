#include "parser.h"

Parser::Parser(const std::vector<Token>& tokeni)
    : tokeni(tokeni), trenutni(0) {
}

bool Parser::jeNaKraju() const {
    return trenutniToken().type == TokenType::EndOfFile;
}

bool Parser::provjeri(TokenType tip) const {
    if (jeNaKraju()) return tip == TokenType::EndOfFile;
    return trenutniToken().type == tip;
}

bool Parser::provjeriSljedeci(TokenType tip) const {
    if (trenutni + 1 >= static_cast<int>(tokeni.size())) return false;
    return tokeni[trenutni + 1].type == tip;
}

Token Parser::uzmi() {
    if (!jeNaKraju()) trenutni++;
    return prethodni();
}

Token Parser::prethodni() const {
    return tokeni[trenutni - 1];
}

Token Parser::trenutniToken() const {
    return tokeni[trenutni];
}

bool Parser::poklopi(TokenType tip) {
    if (!provjeri(tip)) return false;
    uzmi();
    return true;
}

Token Parser::ocekuj(TokenType tip, const std::string& poruka) {
    if (provjeri(tip)) return uzmi();

    throw std::runtime_error(
        "Greska na liniji " + std::to_string(trenutniToken().line) +
        ": " + poruka + ", dobijeno '" + tokenTypeToString(trenutniToken().type) + "'"
    );
}

Program Parser::parsiraj() {
    Program program;

    while (!jeNaKraju()) {
        program.funkcije.push_back(parsirajFunkciju());
    }

    return program;
}

std::unique_ptr<FunctionDecl> Parser::parsirajFunkciju() {
    ocekuj(TokenType::KeywordNumber, "ocekivan tip funkcije 'number'");

    Token ime = ocekuj(TokenType::Identifier, "ocekivano ime funkcije");

    ocekuj(TokenType::LeftParen, "ocekivano '(' nakon imena funkcije");

    std::vector<Parametar> parametri;
if (!provjeri(TokenType::RightParen)) {
    do {
        ocekuj(TokenType::KeywordNumber, "ocekivan tip parametra 'number'");

        VarKind kind = VarKind::Normal;
        if (poklopi(TokenType::Star)) {
            kind = VarKind::Pointer;
        }

        Token p = ocekuj(TokenType::Identifier, "ocekivano ime parametra");
        parametri.push_back(Parametar(p.value, kind));
    } while (poklopi(TokenType::Comma));
}

    ocekuj(TokenType::RightParen, "ocekivano ')' nakon parametara");

    std::unique_ptr<BlockStmt> tijelo = parsirajBlok();

    return std::make_unique<FunctionDecl>(ime.value, std::move(parametri), std::move(tijelo));
}

std::unique_ptr<BlockStmt> Parser::parsirajBlok() {
    ocekuj(TokenType::LeftBrace, "ocekivano '{'");

    auto blok = std::make_unique<BlockStmt>();

    while (!provjeri(TokenType::RightBrace) && !jeNaKraju()) {
        blok->naredbe.push_back(parsirajNaredbu());
    }

    ocekuj(TokenType::RightBrace, "ocekivano '}'");

    return blok;
}

std::unique_ptr<Stmt> Parser::parsirajNaredbu() {
    if (provjeri(TokenType::KeywordNumber)) {
        return parsirajDeklaracijuVarijable();
    }

    if (provjeri(TokenType::KeywordOutput)) {
        return parsirajOutput();
    }

    if (provjeri(TokenType::KeywordReturn)) {
        return parsirajReturn();
    }

    if (provjeri(TokenType::KeywordIf)) {
        return parsirajIf();
    }

    if (provjeri(TokenType::KeywordWhile)) {
        return parsirajWhile();
    }

    if (provjeri(TokenType::KeywordFor)) {
        return parsirajFor();
    }

    if (provjeri(TokenType::Increment) || provjeri(TokenType::Decrement) ||
        provjeri(TokenType::Identifier) || provjeri(TokenType::Star)) {
        if (provjeri(TokenType::Identifier) && provjeriSljedeci(TokenType::LeftParen)) {
            std::unique_ptr<Expr> izraz = parsirajIzraz();
            ocekuj(TokenType::Semicolon, "ocekivano ';' nakon poziva funkcije");
            return std::make_unique<ExprStmt>(std::move(izraz));
        }
        return parsirajDodjeluIliInkrement(true);
    }

    throw std::runtime_error(
        "Greska na liniji " + std::to_string(trenutniToken().line) +
        ": neocekivana naredba '" + trenutniToken().value + "'"
    );
}

std::unique_ptr<Stmt> Parser::parsirajDeklaracijuVarijable() {
    ocekuj(TokenType::KeywordNumber, "ocekivano 'number'");

    VarKind kind = VarKind::Normal;

    if (poklopi(TokenType::Star)) {
        kind = VarKind::Pointer;
    }

    Token ime = ocekuj(TokenType::Identifier, "ocekivano ime varijable");

    int velicina = 1;
    std::vector<std::unique_ptr<Expr>> inicijalizator;

    if (poklopi(TokenType::LeftBracket)) {
        kind = VarKind::Array;

        Token broj = ocekuj(TokenType::NumberLiteral, "ocekivana velicina niza");
velicina = std::stoi(broj.value, nullptr, 0);

        if (velicina <= 0) {
            throw std::runtime_error("Greska na liniji " + std::to_string(broj.line) + ": velicina niza mora biti veca od 0");
        }

        ocekuj(TokenType::RightBracket, "ocekivano ']' nakon velicine niza");
    }

    if (poklopi(TokenType::Assign)) {
        ocekuj(TokenType::LeftBrace, "ocekivano '{' na pocetku liste inicijalizacije");

        if (!provjeri(TokenType::RightBrace)) {
            do {
                inicijalizator.push_back(parsirajIzraz());
            } while (poklopi(TokenType::Comma));
        }

        ocekuj(TokenType::RightBrace, "ocekivano '}' na kraju liste inicijalizacije");
        if (kind == VarKind::Array && inicijalizator.size() > static_cast<size_t>(velicina)) {
            throw std::runtime_error("Greska: Broj elemenata u inicijalizatoru je veci od velicine niza.");
        }
    }

    ocekuj(TokenType::Semicolon, "ocekivano ';' nakon deklaracije varijable");

    return std::make_unique<VarDeclStmt>(ime.value, kind, velicina, std::move(inicijalizator));
}

std::unique_ptr<Expr> Parser::parsirajLValue() {
    if (poklopi(TokenType::Star)) {
        std::unique_ptr<Expr> pokazivac = parsirajUnarni();
        return std::make_unique<DereferenceExpr>(std::move(pokazivac));
    }

    Token ime = ocekuj(TokenType::Identifier, "ocekivano ime varijable");

    if (poklopi(TokenType::LeftBracket)) {
        std::unique_ptr<Expr> indeks = parsirajIzraz();
        ocekuj(TokenType::RightBracket, "ocekivano ']' nakon indeksa");
        return std::make_unique<ArrayAccessExpr>(ime.value, std::move(indeks));
    }

    return std::make_unique<VariableExpr>(ime.value);
}

std::unique_ptr<Stmt> Parser::parsirajDodjeluIliInkrement(bool ocekujTackaZarez) {
    if (poklopi(TokenType::Increment)) {
        std::unique_ptr<Expr> cilj = parsirajLValue();
        if (ocekujTackaZarez) ocekuj(TokenType::Semicolon, "ocekivano ';' nakon inkrementa");
        return std::make_unique<IncrementStmt>(std::move(cilj), true);
    }

    if (poklopi(TokenType::Decrement)) {
        std::unique_ptr<Expr> cilj = parsirajLValue();
        if (ocekujTackaZarez) ocekuj(TokenType::Semicolon, "ocekivano ';' nakon dekrementa");
        return std::make_unique<IncrementStmt>(std::move(cilj), false);
    }

    std::unique_ptr<Expr> cilj = parsirajLValue();

    if (poklopi(TokenType::Increment)) {
        if (ocekujTackaZarez) ocekuj(TokenType::Semicolon, "ocekivano ';' nakon inkrementa");
        return std::make_unique<IncrementStmt>(std::move(cilj), true);
    }

    if (poklopi(TokenType::Decrement)) {
        if (ocekujTackaZarez) ocekuj(TokenType::Semicolon, "ocekivano ';' nakon dekrementa");
        return std::make_unique<IncrementStmt>(std::move(cilj), false);
    }

    ocekuj(TokenType::Assign, "ocekivano '=' u dodjeli");

    std::unique_ptr<Expr> izraz = parsirajIzraz();

    if (ocekujTackaZarez) {
        ocekuj(TokenType::Semicolon, "ocekivano ';' nakon dodjele");
    }

    return std::make_unique<AssignStmt>(std::move(cilj), std::move(izraz));
}

std::unique_ptr<Stmt> Parser::parsirajOutput() {
    ocekuj(TokenType::KeywordOutput, "ocekivano 'output'");
    ocekuj(TokenType::LeftParen, "ocekivano '(' nakon output");

    std::vector<std::unique_ptr<Expr>> argumenti;
    if (!provjeri(TokenType::RightParen)) {
        do {
            argumenti.push_back(parsirajIzraz());
        } while (poklopi(TokenType::Comma));
    }
    ocekuj(TokenType::RightParen, "ocekivano ')' nakon output argumenata");
    ocekuj(TokenType::Semicolon, "ocekivano ';' nakon output naredbe");

    if (argumenti.size() == 1) {
        return std::make_unique<OutputStmt>(std::move(argumenti[0]));
    }
    else if (argumenti.size() == 2) {
        return std::make_unique<OutputStmt>(std::move(argumenti[1]), std::move(argumenti[0]));
    }
    else if (argumenti.size() == 3) {
        return std::make_unique<OutputStmt>(std::move(argumenti[1]), std::move(argumenti[0]), std::move(argumenti[2]));
    }
    else {
        throw std::runtime_error("Greska: Funkcija output prima minimalno 1, a maksimalno 3 argumenta.");
    }
}

std::unique_ptr<Stmt> Parser::parsirajReturn() {
    ocekuj(TokenType::KeywordReturn, "ocekivano 'return'");

    std::unique_ptr<Expr> izraz = parsirajIzraz();

    ocekuj(TokenType::Semicolon, "ocekivano ';' nakon return naredbe");

    return std::make_unique<ReturnStmt>(std::move(izraz));
}

std::unique_ptr<Stmt> Parser::parsirajIf() {
    ocekuj(TokenType::KeywordIf, "ocekivano 'if'");
    ocekuj(TokenType::LeftParen, "ocekivano '(' nakon if");

    std::unique_ptr<Expr> uslov = parsirajIzraz();

    ocekuj(TokenType::RightParen, "ocekivano ')' nakon if uslova");

    std::unique_ptr<BlockStmt> thenBlok = parsirajBlok();
    std::unique_ptr<BlockStmt> elseBlok = nullptr;

    if (poklopi(TokenType::KeywordElse)) {
        elseBlok = parsirajBlok();
    }

    return std::make_unique<IfStmt>(std::move(uslov), std::move(thenBlok), std::move(elseBlok));
}

std::unique_ptr<Stmt> Parser::parsirajWhile() {
    ocekuj(TokenType::KeywordWhile, "ocekivano 'while'");
    ocekuj(TokenType::LeftParen, "ocekivano '(' nakon while");

    std::unique_ptr<Expr> uslov = parsirajIzraz();

    ocekuj(TokenType::RightParen, "ocekivano ')' nakon while uslova");

    std::unique_ptr<BlockStmt> tijelo = parsirajBlok();

    return std::make_unique<WhileStmt>(std::move(uslov), std::move(tijelo));
}

std::unique_ptr<Stmt> Parser::parsirajFor() {
    ocekuj(TokenType::KeywordFor, "ocekivano 'for'");
    ocekuj(TokenType::LeftParen, "ocekivano '(' nakon for");

    std::unique_ptr<Stmt> inicijalizacija = nullptr;

    if (!provjeri(TokenType::Semicolon)) {
        inicijalizacija = parsirajDodjeluIliInkrement(true);
    } else {
        ocekuj(TokenType::Semicolon, "ocekivano ';'");
    }

    std::unique_ptr<Expr> uslov = nullptr;

    if (!provjeri(TokenType::Semicolon)) {
        uslov = parsirajIzraz();
    }

    ocekuj(TokenType::Semicolon, "ocekivano ';' nakon for uslova");

    std::unique_ptr<Stmt> promjena = nullptr;

    if (!provjeri(TokenType::RightParen)) {
        promjena = parsirajDodjeluIliInkrement(false);
    }

    ocekuj(TokenType::RightParen, "ocekivano ')' nakon for dijela");

    std::unique_ptr<BlockStmt> tijelo = parsirajBlok();

    return std::make_unique<ForStmt>(
        std::move(inicijalizacija),
        std::move(uslov),
        std::move(promjena),
        std::move(tijelo)
    );
}

std::unique_ptr<Expr> Parser::parsirajIzraz() {
    return parsirajPoredjenje();
}

std::unique_ptr<Expr> Parser::parsirajPoredjenje() {
    std::unique_ptr<Expr> izraz = parsirajBitOr();

    while (provjeri(TokenType::Equal) ||
           provjeri(TokenType::NotEqual) ||
           provjeri(TokenType::Less) ||
           provjeri(TokenType::LessEqual) ||
           provjeri(TokenType::Greater) ||
           provjeri(TokenType::GreaterEqual)) {
        Token op = uzmi();
        std::unique_ptr<Expr> desno = parsirajBitOr();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajBitOr() {
    std::unique_ptr<Expr> izraz = parsirajBitXor();

    while (poklopi(TokenType::Pipe)) {
        Token op = prethodni();
        std::unique_ptr<Expr> desno = parsirajBitXor();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajBitXor() {
    std::unique_ptr<Expr> izraz = parsirajBitAnd();

    while (poklopi(TokenType::Caret)) {
        Token op = prethodni();
        std::unique_ptr<Expr> desno = parsirajBitAnd();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajBitAnd() {
    std::unique_ptr<Expr> izraz = parsirajSabiranje();

    while (poklopi(TokenType::Ampersand)) {
        Token op = prethodni();
        std::unique_ptr<Expr> desno = parsirajSabiranje();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajSabiranje() {
    std::unique_ptr<Expr> izraz = parsirajMnozenje();

    while (provjeri(TokenType::Plus) || provjeri(TokenType::Minus)) {
        Token op = uzmi();
        std::unique_ptr<Expr> desno = parsirajMnozenje();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajMnozenje() {
    std::unique_ptr<Expr> izraz = parsirajUnarni();

    while (provjeri(TokenType::Star) || provjeri(TokenType::Slash)) {
        Token op = uzmi();
        std::unique_ptr<Expr> desno = parsirajUnarni();
        izraz = std::make_unique<BinaryExpr>(std::move(izraz), op.value, std::move(desno));
    }

    return izraz;
}

std::unique_ptr<Expr> Parser::parsirajUnarni() {
    if (poklopi(TokenType::Not)) {
        Token op = prethodni();
        std::unique_ptr<Expr> izraz = parsirajUnarni();
        return std::make_unique<UnaryExpr>(op.value, std::move(izraz));
    }

    if (poklopi(TokenType::Minus)) {
        Token op = prethodni();
        std::unique_ptr<Expr> izraz = parsirajUnarni();
        return std::make_unique<UnaryExpr>(op.value, std::move(izraz));
    }

    if (poklopi(TokenType::Star)) {
        std::unique_ptr<Expr> pokazivac = parsirajUnarni();
        return std::make_unique<DereferenceExpr>(std::move(pokazivac));
    }

    if (poklopi(TokenType::Ampersand)) {
        std::unique_ptr<Expr> cilj = parsirajLValue();
        return std::make_unique<AddressOfExpr>(std::move(cilj));
    }

    return parsirajPrimarni();
}

std::unique_ptr<Expr> Parser::parsirajPrimarni() {
    if (poklopi(TokenType::NumberLiteral)) {
    return std::make_unique<NumberExpr>(std::stoi(prethodni().value, nullptr, 0));
}

 if (poklopi(TokenType::KeywordInput)) {
        ocekuj(TokenType::LeftParen, "ocekivano '(' nakon input");
        std::unique_ptr<Expr> adresa = parsirajIzraz();
        ocekuj(TokenType::RightParen, "ocekivano ')' nakon input adrese");
        return std::make_unique<InputExpr>(std::move(adresa));
    }

    if (poklopi(TokenType::Identifier)) {
        std::string ime = prethodni().value;

        if (poklopi(TokenType::LeftParen)) {
            std::vector<std::unique_ptr<Expr>> argumenti;
            if (!provjeri(TokenType::RightParen)) {
                do {
                    argumenti.push_back(parsirajIzraz());
                } while (poklopi(TokenType::Comma));
            }
            ocekuj(TokenType::RightParen, "ocekivano ')' nakon argumenata poziva");
            return std::make_unique<CallExpr>(ime, std::move(argumenti));
        }

        if (poklopi(TokenType::LeftBracket)) {
            std::unique_ptr<Expr> indeks = parsirajIzraz();
            ocekuj(TokenType::RightBracket, "ocekivano ']' nakon indeksa");
            return std::make_unique<ArrayAccessExpr>(ime, std::move(indeks));
        }

        return std::make_unique<VariableExpr>(ime);
    }

    if (poklopi(TokenType::LeftParen)) {
        std::unique_ptr<Expr> izraz = parsirajIzraz();
        ocekuj(TokenType::RightParen, "ocekivano ')' nakon izraza");
        return izraz;
    }

    throw std::runtime_error(
        "Greska na liniji " + std::to_string(trenutniToken().line) +
        ": ocekivan izraz, dobijeno '" + trenutniToken().value + "'"
    );
}
