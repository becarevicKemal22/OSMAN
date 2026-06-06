#ifndef TOKEN_H
#define TOKEN_H

#include <string>

enum class TokenType {
    EndOfFile,

    KeywordNumber,
    KeywordReturn,
    KeywordIf,
    KeywordElse,
    KeywordWhile,
    KeywordFor,
    KeywordOutput,

    Identifier,
    NumberLiteral,

    LeftParen,
    RightParen,
    LeftBrace,
    RightBrace,

    Semicolon,
    Comma,

    Plus,
    Minus,
    Ampersand,
    Pipe,
    Caret,
    Not,
    Increment,
    Decrement,

    Assign,
    Equal,
    NotEqual,
    Less,
    LessEqual,
    Greater,
    GreaterEqual
};

struct Token {
    TokenType type;
    std::string value;
    int line;

    Token(TokenType type, const std::string& value, int line)
        : type(type), value(value), line(line) {}
};

std::string tokenTypeToString(TokenType type);

#endif
