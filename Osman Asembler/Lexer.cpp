//
// Created by kemal on 5/21/2026.
//

#include "Lexer.h"

void Lexer::tokenize() {
    unsigned int length = source.length();
    while (currentChar < length) {
        wchar_t c = source[currentChar];
        if(c == '['){
            addToken(TokenType::OpenBracket, c);
            advance();
        } else if(c == ']') {
            addToken(TokenType::ClosedBracket, c);
            advance();
        } else if(c == ';') {
            addToken(TokenType::Semicolon, c);
            advance();
        } else if(c == ',') {
            addToken(TokenType::Comma, c);
            advance();
        } else if(c == ' '){
            advance();
        } else if(c == '\t'){
            advance();
        } else if(c == '\n' || c == '\r'){
            line++;
            if(source[currentChar] == '\r' && source[currentChar + 1] == '\n'){
                currentChar++;
            }
            currentChar++;
        }
        else if(isalnum(c)){
            if(isalpha(c)){
                std::string identifier;
                identifier += c;
                while(isalnum(peek()) && peek() != '\0'){
                    advance();
                    identifier += source[currentChar];
                }
                TokenType type = TokenType::Identifier;
                auto it = INSTRUCTIONS.find(identifier);
                if(it != INSTRUCTIONS.end()){
                    type = TokenType::Instruction;
                }

                if(type == TokenType::Identifier){
                    addToken(type, identifier);
                }
                advance();
            }else{
                std::string number;
                number += c;
                while((iswdigit(peek()) || (peek() == '.' && iswdigit(source[currentChar + 2]))) && peek() != '\0'){
                    advance();
                    number += source[currentChar];
                }
                addToken(TokenType::Number, number);
                advance();
            }
        } else{
            throw UnexpectedCharacter(line, charIndexOnLine, c);
        }
    }
    addToken(TokenType::Eof, L"");
}

void Lexer::addToken(TokenType type, char character) {
    tokens.push_back(new Token(type, std::string(1, character), line));
}

void Lexer::addToken(TokenType type, const std::string& value) {
    tokens.push_back(new Token(type, value, line));
}
