//
// Created by kemal on 5/21/2026.
//

#ifndef OSMAN_ASEMBLER_TOKEN_H
#define OSMAN_ASEMBLER_TOKEN_H

#include <string>

enum class TokenType {
    LineEnd,
    Skip, // za preskakanje labela pri drugom prolasku
    Minus,
    Comma,
    Dot,
    Semicolon,
    Colon,
    OpenBracket,
    ClosedBracket,
    Identifier,
    Number,
    Instruction,
    Directive,
    Eof
};

std::string TokenTypeToStr(TokenType type);

class Token {
public:
    Token(TokenType type, const std::string& value, unsigned int line) : type(type), value(value), line(line)  {}
    TokenType type;
    std::string value;
    unsigned int line;
};

#endif //OSMAN_ASEMBLER_TOKEN_H
