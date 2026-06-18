#ifndef PARSER_H
#define PARSER_H

#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

#include "token.h"
#include "ast.h"

class Parser {
    std::vector<Token> tokeni;
    int trenutni;

    bool jeNaKraju() const;
    bool provjeri(TokenType tip) const;
    bool provjeriSljedeci(TokenType tip) const;
    Token uzmi();
    Token prethodni() const;
    Token trenutniToken() const;

    bool poklopi(TokenType tip);
    Token ocekuj(TokenType tip, const std::string& poruka);

    std::unique_ptr<FunctionDecl> parsirajFunkciju();
    std::unique_ptr<BlockStmt> parsirajBlok();

    std::unique_ptr<Stmt> parsirajNaredbu();
    std::unique_ptr<Expr> parsirajInput();
    std::unique_ptr<Stmt> parsirajDeklaracijuVarijable();
    std::unique_ptr<Stmt> parsirajDodjeluIliInkrement(bool ocekujTackaZarez = true);
    std::unique_ptr<Stmt> parsirajOutput();
    std::unique_ptr<Stmt> parsirajReturn();
    std::unique_ptr<Stmt> parsirajIf();
    std::unique_ptr<Stmt> parsirajWhile();
    std::unique_ptr<Stmt> parsirajFor();

    std::unique_ptr<Expr> parsirajLValue();
    std::unique_ptr<Expr> parsirajIzraz();
    std::unique_ptr<Expr> parsirajPoredjenje();
    std::unique_ptr<Expr> parsirajBitOr();
    std::unique_ptr<Expr> parsirajBitXor();
    std::unique_ptr<Expr> parsirajBitAnd();
    std::unique_ptr<Expr> parsirajSabiranje();
    std::unique_ptr<Expr> parsirajMnozenje();
    std::unique_ptr<Expr> parsirajUnarni();
    std::unique_ptr<Expr> parsirajPrimarni();

public:
    Parser(const std::vector<Token>& tokeni);

    Program parsiraj();
};

#endif
