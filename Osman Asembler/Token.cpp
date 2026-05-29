//
// Created by kemal on 22-May-26.
//
#include "Token.h"

std::string TokenTypeToStr(TokenType type){
    switch (type) {
        case TokenType::Comma:
            return ",";
        case TokenType::Dot:
            return ".";
        case TokenType::Semicolon:
            return ";";
        case TokenType::OpenBracket:
            return "[";
        case TokenType::ClosedBracket:
            return "]";
        case TokenType::Identifier:
            return "identifikator";
        case TokenType::Number:
            return "broj";
        case TokenType::Instruction:
            return "instrukcija";
        case TokenType::Directive:
            return "direktiva";
        case TokenType::Minus:
            return "-";
        case TokenType::Colon:
            return ":";
        case TokenType::LineEnd:
            return "kraj linije";
        case TokenType::Eof:
            return "kraj datoteke";
        case TokenType::Skip:
            return "skip";
    }
    return "Nepoznat tip tokena";
}
