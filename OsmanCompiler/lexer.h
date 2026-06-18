#ifndef LEXER_H
#define LEXER_H

#include <string>
#include <vector>

#include "token.h"

class Lexer {
    std::string izvor;
    int trenutni;
    int linija;
    std::vector<Token> tokeni;

    bool jeNaKraju() const;
    char trenutniZnak() const;
    char sljedeciZnak() const;
    char uzmiZnak();

    void dodajToken(TokenType tip, const std::string& vrijednost);
    void dodajToken(TokenType tip, char znak);

    void obradiIdentifikator();
    void obradiBroj();
    void preskociKomentar();
    bool isHexDigit(char c);

public:
    Lexer(const std::string& izvor);

    std::vector<Token> tokeniziraj();
};

#endif
