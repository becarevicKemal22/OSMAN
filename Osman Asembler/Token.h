//
// Created by kemal on 5/21/2026.
//

#ifndef OSMAN_ASEMBLER_TOKEN_H
#define OSMAN_ASEMBLER_TOKEN_H

#include <string>
#include <unordered_map>
enum class TokenType {
    Comma,
    Semicolon,
    OpenBracket,
    ClosedBracket,
    Identifier,
    Number,
    Instruction
};

const std::unordered_map<std::string, std::string> INSTRUCTIONS = {
        {"NOP", ""},
        {"ADD", ""}
};
class Token {
public:
    Token(TokenType type, const std::string& value, unsigned int line) : type(type), value(value), line(line)  {}
    TokenType type;
    std::string value;
    unsigned int line;
};

#endif //OSMAN_ASEMBLER_TOKEN_H
