#include "token.h"

std::string tokenTypeToString(TokenType type) {
    switch (type) {
        case TokenType::EndOfFile: return "kraj fajla";

        case TokenType::KeywordNumber: return "number";
        case TokenType::KeywordReturn: return "return";
        case TokenType::KeywordIf: return "if";
        case TokenType::KeywordElse: return "else";
        case TokenType::KeywordWhile: return "while";
        case TokenType::KeywordFor: return "for";
        case TokenType::KeywordOutput: return "output";
        case TokenType::KeywordInput: return "input";

        case TokenType::Identifier: return "identifikator";
        case TokenType::NumberLiteral: return "broj";

        case TokenType::LeftParen: return "(";
        case TokenType::RightParen: return ")";
        case TokenType::LeftBrace: return "{";
        case TokenType::RightBrace: return "}";
        case TokenType::LeftBracket: return "[";
        case TokenType::RightBracket: return "]";

        case TokenType::Semicolon: return ";";
        case TokenType::Comma: return ",";

        case TokenType::Plus: return "+";
        case TokenType::Minus: return "-";
        case TokenType::Star: return "*";
        case TokenType::Slash: return "/";
        case TokenType::Ampersand: return "&";
        case TokenType::Pipe: return "|";
        case TokenType::Caret: return "^";
        case TokenType::Not: return "!";
        case TokenType::Increment: return "++";
        case TokenType::Decrement: return "--";

        case TokenType::Assign: return "=";
        case TokenType::Equal: return "==";
        case TokenType::NotEqual: return "!=";
        case TokenType::Less: return "<";
        case TokenType::LessEqual: return "<=";
        case TokenType::Greater: return ">";
        case TokenType::GreaterEqual: return ">=";
    }

    return "nepoznat token";
}
