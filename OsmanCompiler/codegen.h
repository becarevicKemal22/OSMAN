#ifndef CODEGEN_H
#define CODEGEN_H

#include <sstream>
#include <string>
#include <unordered_set>
#include <vector>

#include "ast.h"

class CodeGenerator {
    Program& program;

    std::ostringstream kod;

    std::vector<std::string> varijableRedom;
    std::unordered_set<std::string> varijable;

    std::vector<std::string> privremeneVarijable;

    int brojacLabela;
    int brojacPrivremenih;

    void emituj(const std::string& linija);

    std::string labelaVarijable(const std::string& ime) const;
    std::string novaLabela(const std::string& prefiks);
    std::string novaPrivremena();

    void dodajVarijablu(const std::string& ime);
    void provjeriVarijablu(const std::string& ime) const;

    FunctionDecl* nadjiMain();
    void prikupiVarijable(const BlockStmt& blok);

    void generisiBlok(const BlockStmt& blok);
    void generisiNaredbu(const Stmt* naredba);
    void generisiIzraz(const Expr* izraz, const std::string& registar);

    void generisiIf(const IfStmt* naredba);
    void generisiWhile(const WhileStmt* naredba);
    void generisiFor(const ForStmt* naredba);

    void generisiPoredjenje(const BinaryExpr* izraz, const std::string& registar);

public:
    CodeGenerator(Program& program);

    std::string generisi();
    void generisiUFajl(const std::string& nazivFajla);
};

#endif
