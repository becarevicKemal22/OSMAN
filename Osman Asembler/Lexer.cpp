//
// Created by kemal on 5/21/2026.
//

#include "Lexer.h"

#include <algorithm>
#include <stdexcept>

#include "Instructions.h"

void Lexer::tokenize() {
    unsigned int length = source.length();
    while (currentChar < length) {
        char c = source[currentChar];
        if (c == '.') {
            addToken(TokenType::Dot, c);
            advance();
        } else if (c == ':') {
            addToken(TokenType::Colon, c);
            advance();
        } else if (c == '-') {
            addToken(TokenType::Minus, c);
            advance();
        } else if(c == '['){
            addToken(TokenType::OpenBracket, c);
            advance();
        } else if(c == ']') {
            addToken(TokenType::ClosedBracket, c);
            advance();
        } else if(c == ';') {
            handleComment();
        } else if(c == ',') {
            addToken(TokenType::Comma, c);
            advance();
        } else if(c == ' ' || c == '\t') {
            advance();
        } else if(c == '\n' || c == '\r'){
            handleNewLine();
        }
        else if(isalnum(c)){
            if(isalpha(c)){
                std::string identifier;
                identifier += c;
                while((isalnum(peek()) || peek() == '_') && peek() != '\0'){
                    advance();
                    identifier += source[currentChar];
                }

                TokenType type = TokenType::Identifier;
                std::transform(identifier.begin(), identifier.end(), identifier.begin(), ::toupper);

                auto it = INSTRUCTIONS.find(identifier);
                if(it != INSTRUCTIONS.end()){
                    type = TokenType::Instruction;
                }

                auto it2 = DIRECTIVES.find(identifier);
                if (it2 != DIRECTIVES.end()) {
                    type = TokenType::Directive;
                }

                addToken(type, identifier);
                advance();
            }else{
                std::string number;
                bool hex = false;
                if (peek() == 'X' || peek() == 'x') {
                    if (c != '0') {
                        throw std::runtime_error("Ocekivano '0' prije 'x'");
                    }
                    hex = true;
                    advance();
                } else {
                    number += c;
                }
                while((isdigit(peek()) || isHexChar(peek())) && peek() != '\0'){
                    advance();
                    number += source[currentChar];
                }
                if (number.empty()) throw std::runtime_error("Nepravilan format broja na liniji: " + std::to_string(line));
                if (hex) {
                    number = convertHexStrToNumStr(number);
                }
                addToken(TokenType::Number, number);
                advance();
            }
        } else{
            throw std::runtime_error("Greska u citanju alfanumerickih znakova na liniji: " + std::to_string(line));
        }
    }
    if (source[currentChar - 1] != '\n') addToken(TokenType::LineEnd, '\n');
    addToken(TokenType::Eof, "");
}

void Lexer::addToken(TokenType type, char character) {
    tokens.push_back(new Token(type, std::string(1, character), line));
}

void Lexer::addToken(TokenType type, const std::string& value) {
    tokens.push_back(new Token(type, value, line));
}

bool Lexer::isHexChar(char c) {
    c = tolower(c);
    return c >= 'a' && c <= 'f';
}

std::string Lexer::convertHexStrToNumStr(std::string number) {
    int decimalValue = std::stoi(number, nullptr, 16);
    return std::to_string(decimalValue);
}

void Lexer::handleNewLine() {
    line++;
    if(source[currentChar] == '\r' && currentChar + 1 < source.length() && source[currentChar + 1] == '\n'){
        currentChar++;
    }
    currentChar++;
    addToken(TokenType::LineEnd, '\n');
}

void Lexer::handleComment() {
    while(source[currentChar] != '\n' && source[currentChar] != '\0'){
        advance();
    }
    if (source[currentChar] == '\n') handleNewLine();
}
