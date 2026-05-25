//
// Created by kemal on 5/21/2026.
//

#ifndef OSMAN_ASEMBLER_LEXER_H
#define OSMAN_ASEMBLER_LEXER_H

#include <string>
#include <vector>

#include "Token.h"

class Lexer {
    std::string source;
    unsigned int line = 1;
    unsigned int currentChar = 0;

    void addToken(TokenType type, char character);
    void addToken(TokenType type, const std::string& value);
    void advance(){ currentChar++; }
    char peek() const {
        if (currentChar + 1 >= source.length()) return '\0';
        return source[currentChar + 1];
    }
    bool isHexChar(char c);
    std::string convertHexStrToNumStr(std::string number);
    void handleNewLine();
    void handleComment();
public:
    Lexer(const std::string&  source) : source(source){}
    ~Lexer() {
        for (auto token : tokens) {
            delete token;
        }
    }

    std::vector<Token*> tokens{};
    void tokenize();
};


#endif //OSMAN_ASEMBLER_LEXER_H
