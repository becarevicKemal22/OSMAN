#ifndef CODEGEN_H
#define CODEGEN_H

#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

#include "ast.h"

struct VarInfo {
    VarKind kind;
    int velicina;
};

class CodeGenerator {
    Program& program;

    std::ostringstream kod;

    std::vector<std::string> varijableRedom;
    std::unordered_map<std::string, VarInfo> varijable;

    int brojacLabela;

    struct OkvirInfo {
    int offset;
    VarKind kind;
};

bool uMainu;
std::unordered_map<std::string, OkvirInfo> okvir;
std::string krajFunkcijeLabela;
    static const int VELICINA_STEKA = 120;
    bool jePokazivacUOkviru(const std::string& ime) const;

    void emituj(const std::string& linija);

    std::string labelaVarijable(const std::string& ime) const;
    std::string novaLabela(const std::string& prefiks);

    void gurni(const std::string& reg);
    void skini(const std::string& reg);

    void ucitajVarijablu(const std::string& ime, const std::string& reg);
    void spremiVarijablu(const std::string& reg, const std::string& ime);

    void dodajVarijablu(const std::string& ime, VarKind kind, int velicina);
    VarInfo infoVarijable(const std::string& ime) const;
    void provjeriVarijablu(const std::string& ime) const;
    void prikupiVarijable(const BlockStmt& blok);

    void prikupiLokalne(const BlockStmt& blok, int& brojLokalnih);

    FunctionDecl* nadjiMain();

    void generisiGlavnu(FunctionDecl* funkcija);
    void generisiProceduru(FunctionDecl* funkcija);

    void generisiBlok(const BlockStmt& blok);
    void generisiNaredbu(const Stmt* naredba);
    void generisiIzraz(const Expr* izraz, const std::string& registar);
    void generisiPoziv(const CallExpr* poziv, const std::string& registar);

    void generisiDodjelu(const Expr* cilj, const Expr* izraz);
    void generisiInkrement(const Expr* cilj, bool povecaj);
    void generisiAdresu(const Expr* izraz, const std::string& registar);

    void generisiIf(const IfStmt* naredba);
    void generisiWhile(const WhileStmt* naredba);
    void generisiFor(const ForStmt* naredba);

    void generisiPoredjenje(const BinaryExpr* izraz, const std::string& registar);
    void generisiMnozenje(const BinaryExpr* izraz, const std::string& registar);
    void generisiDijeljenje(const BinaryExpr* izraz, const std::string& registar);

public:
    CodeGenerator(Program& program);

    std::string generisi();
    void generisiUFajl(const std::string& nazivFajla);
};

#endif
