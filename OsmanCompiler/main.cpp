#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <stdexcept>

#include "lexer.h"
#include "parser.h"
#include "codegen.h"

std::string ucitajFajl(const std::string& nazivFajla) {
    std::ifstream ulaz(nazivFajla);

    if (!ulaz.is_open()) {
        throw std::runtime_error("Ne mogu otvoriti fajl: " + nazivFajla);
    }

    std::stringstream sadrzaj;
    sadrzaj << ulaz.rdbuf();

    return sadrzaj.str();
}

int main() {
    try {
        std::string kod = ucitajFajl("testnizDod.osc");

        Lexer lexer(kod);
        std::vector<Token> tokeni = lexer.tokeniziraj();

        Parser parser(tokeni);
        Program program = parser.parsiraj();

        CodeGenerator generator(program);
        std::string assembly = generator.generisi();

        std::ofstream izlaz("prog.osm");
        if (!izlaz.is_open()) {
            throw std::runtime_error("Ne mogu napraviti fajl prog.osm");
        }

        izlaz << assembly;
        izlaz.close();

        std::cout << "Kompajliranje uspjesno." << std::endl;
        std::cout << "Generisan je fajl prog.osm." << std::endl;
        std::cout << std::endl;
        std::cout << "Generisani assembly:" << std::endl;
        std::cout << "-------------------" << std::endl;
        std::cout << assembly << std::endl;

    } catch (const std::exception& greska) {
        std::cout << greska.what() << std::endl;
    }

    return 0;
}
