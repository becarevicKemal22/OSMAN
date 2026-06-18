#include "lexer.h"

#include <cctype>
#include <stdexcept>
#include <unordered_map>

Lexer::Lexer(const std::string& izvor)
    : izvor(izvor), trenutni(0), linija(1) {
}
bool Lexer::isHexDigit(char c) {
    return std::isdigit(static_cast<unsigned char>(c)) ||
           (c >= 'a' && c <= 'f') ||
           (c >= 'A' && c <= 'F');
}

bool Lexer::jeNaKraju() const {
    return trenutni >= static_cast<int>(izvor.length());
}

char Lexer::trenutniZnak() const {
    if (jeNaKraju()) return '\0';
    return izvor[trenutni];
}

char Lexer::sljedeciZnak() const {
    if (trenutni + 1 >= static_cast<int>(izvor.length())) return '\0';
    return izvor[trenutni + 1];
}

char Lexer::uzmiZnak() {
    if (jeNaKraju()) return '\0';
    return izvor[trenutni++];
}

void Lexer::dodajToken(TokenType tip, const std::string& vrijednost) {
    tokeni.push_back(Token(tip, vrijednost, linija));
}

void Lexer::dodajToken(TokenType tip, char znak) {
    tokeni.push_back(Token(tip, std::string(1, znak), linija));
}

void Lexer::obradiIdentifikator() {
    std::string tekst;

    while (std::isalnum(static_cast<unsigned char>(trenutniZnak())) || trenutniZnak() == '_') {
        tekst += uzmiZnak();
    }

    static const std::unordered_map<std::string, TokenType> kljucneRijeci = {
        {"number", TokenType::KeywordNumber},
        {"return", TokenType::KeywordReturn},
        {"if", TokenType::KeywordIf},
        {"else", TokenType::KeywordElse},
        {"while", TokenType::KeywordWhile},
        {"for", TokenType::KeywordFor},
        {"output", TokenType::KeywordOutput},
        {"input", TokenType::KeywordInput},

    };

    auto it = kljucneRijeci.find(tekst);

    if (it != kljucneRijeci.end()) {
        dodajToken(it->second, tekst);
    } else {
        dodajToken(TokenType::Identifier, tekst);
    }
}

void Lexer::obradiBroj() {
    std::string broj;

    if (trenutniZnak() == '0' &&
        (sljedeciZnak() == 'x' || sljedeciZnak() == 'X')) {

        broj += uzmiZnak();
        broj += uzmiZnak();

        if (!isHexDigit(trenutniZnak())) {
            throw std::runtime_error(
                "Hex literal bez cifri iza '0x' na liniji " + std::to_string(linija));
        }

        while (isHexDigit(trenutniZnak())) {
            broj += uzmiZnak();
        }

        dodajToken(TokenType::NumberLiteral, broj);
        return;
    }

    while (std::isdigit(static_cast<unsigned char>(trenutniZnak()))) {
        broj += uzmiZnak();
    }

    dodajToken(TokenType::NumberLiteral, broj);
}

void Lexer::preskociKomentar() {
    while (!jeNaKraju() && trenutniZnak() != '\n' && trenutniZnak() != '\r') {
        uzmiZnak();
    }
}

std::vector<Token> Lexer::tokeniziraj() {
    tokeni.clear();

    while (!jeNaKraju()) {
        char c = trenutniZnak();

        if (c == ' ' || c == '\t') {
            uzmiZnak();
        } else if (c == '\n') {
            linija++;
            uzmiZnak();
        } else if (c == '\r') {
            linija++;
            uzmiZnak();
            if (trenutniZnak() == '\n') uzmiZnak();
        } else if (std::isalpha(static_cast<unsigned char>(c)) || c == '_') {
            obradiIdentifikator();
        } else if (std::isdigit(static_cast<unsigned char>(c))) {
            obradiBroj();
        } else if (c == '(') {
            dodajToken(TokenType::LeftParen, c);
            uzmiZnak();
        } else if (c == ')') {
            dodajToken(TokenType::RightParen, c);
            uzmiZnak();
        } else if (c == '{') {
            dodajToken(TokenType::LeftBrace, c);
            uzmiZnak();
        } else if (c == '}') {
            dodajToken(TokenType::RightBrace, c);
            uzmiZnak();
        } else if (c == '[') {
            dodajToken(TokenType::LeftBracket, c);
            uzmiZnak();
        } else if (c == ']') {
            dodajToken(TokenType::RightBracket, c);
            uzmiZnak();
        } else if (c == ';') {
            dodajToken(TokenType::Semicolon, c);
            uzmiZnak();
        } else if (c == ',') {
            dodajToken(TokenType::Comma, c);
            uzmiZnak();
        } else if (c == '+') {
            if (sljedeciZnak() == '+') {
                dodajToken(TokenType::Increment, "++");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Plus, c);
                uzmiZnak();
            }
        } else if (c == '-') {
            if (sljedeciZnak() == '-') {
                dodajToken(TokenType::Decrement, "--");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Minus, c);
                uzmiZnak();
            }
        } else if (c == '*') {
            dodajToken(TokenType::Star, c);
            uzmiZnak();
        } else if (c == '/') {
            if (sljedeciZnak() == '/') {
                preskociKomentar();
            } else {
                dodajToken(TokenType::Slash, c);
                uzmiZnak();
            }
        } else if (c == '&') {
            dodajToken(TokenType::Ampersand, c);
            uzmiZnak();
        } else if (c == '|') {
            dodajToken(TokenType::Pipe, c);
            uzmiZnak();
        } else if (c == '^') {
            dodajToken(TokenType::Caret, c);
            uzmiZnak();
        } else if (c == '!') {
            if (sljedeciZnak() == '=') {
                dodajToken(TokenType::NotEqual, "!=");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Not, c);
                uzmiZnak();
            }
        } else if (c == '=') {
            if (sljedeciZnak() == '=') {
                dodajToken(TokenType::Equal, "==");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Assign, c);
                uzmiZnak();
            }
        } else if (c == '<') {
            if (sljedeciZnak() == '=') {
                dodajToken(TokenType::LessEqual, "<=");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Less, c);
                uzmiZnak();
            }
        } else if (c == '>') {
            if (sljedeciZnak() == '=') {
                dodajToken(TokenType::GreaterEqual, ">=");
                uzmiZnak();
                uzmiZnak();
            } else {
                dodajToken(TokenType::Greater, c);
                uzmiZnak();
            }
        } else {
            throw std::runtime_error("Nepoznat znak '" + std::string(1, c) + "' na liniji " + std::to_string(linija));
        }
    }

    dodajToken(TokenType::EndOfFile, "");
    return tokeni;
}
