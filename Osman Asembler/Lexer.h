//
// Created by kemal on 5/21/2026.
//

#ifndef OSMAN_ASEMBLER_LEXER_H
#define OSMAN_ASEMBLER_LEXER_H

#include <string>
#include <vector>

#include "Token.h"

class Lexer {
private:
    std::string source;
    unsigned int line = 1;
    char currentChar = 0;

    void addToken(TokenType type, char character);
    void addToken(TokenType type, const std::string& value);
    void advance(){ currentChar++; }
    char peek(){ return source[currentChar + 1]; }
public:
    Lexer(const std::string&  source) : source(source){}
    ~Lexer(){}

    std::vector<Token*> tokens{};
    void tokenize();
};


#endif //OSMAN_ASEMBLER_LEXER_H
