//
// Created by kemal on 22-May-26.
//
#include "Token.h"

std::string TokenTypeToStr(TokenType type){
    switch (type) {
        case TokenType::Comma:
            return "zarez";
        case TokenType::Semicolon:
            return "tacka zarez";
        case TokenType::OpenBracket:
            return "";
        case TokenType::ClosedBracket:
            return "closed bracket";
        case TokenType::Identifier:
            return "identifier";
        case TokenType::Number:
            return "number";
        case TokenType::Instruction:
            return "instruction";
        case TokenType::Minus:
            return "minus";
        case TokenType::Colon:
            return "colon";
        case TokenType::LineEnd:
            return "line end";
        case TokenType::Eof:
            return "eof";
        case TokenType::Skip:
            return "skip";
    }
    return "Greska";
}
