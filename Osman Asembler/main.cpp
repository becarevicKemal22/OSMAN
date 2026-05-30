#include <iostream>
#include <sstream>
#include <fstream>

#include "Lexer.h"
#include "Parser.h"

std::string loadFile(const std::string& putanjaDoFajla) {
    std::ifstream file(putanjaDoFajla);

    if (!file.is_open()) {
        throw "Greska pri otvaranju fajla";
    }

    std::stringstream buffer;
    buffer << file.rdbuf();

    return buffer.str();
}
int main() {
    try {
        std::string source = loadFile("prog.osm");

        Lexer lexer(source);
        lexer.tokenize();

        // Ispis svih tokena
        //for (auto token : lexer.tokens) {
        //    std::cout << "Type: " << TokenTypeToStr(token->type) << ", value: " << token->value << std::endl;
        //}

        Parser parser(lexer.tokens);
        parser.parse();
    }catch (std::exception& e) {
        std::cout << e.what() << std::endl;
    }

    return 0;
}
