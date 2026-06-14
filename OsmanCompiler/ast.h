#ifndef AST_H
#define AST_H

#include <memory>
#include <string>
#include <vector>

enum class VarKind {
    Normal,
    Pointer,
    Array
};

struct Expr {
    virtual ~Expr() = default;
};

struct NumberExpr : Expr {
    int vrijednost;

    NumberExpr(int vrijednost) : vrijednost(vrijednost) {}
};

struct VariableExpr : Expr {
    std::string ime;

    VariableExpr(const std::string& ime) : ime(ime) {}
};

struct ArrayAccessExpr : Expr {
    std::string ime;
    std::unique_ptr<Expr> indeks;

    ArrayAccessExpr(const std::string& ime, std::unique_ptr<Expr> indeks)
        : ime(ime), indeks(std::move(indeks)) {}
};

struct AddressOfExpr : Expr {
    std::unique_ptr<Expr> cilj;

    AddressOfExpr(std::unique_ptr<Expr> cilj)
        : cilj(std::move(cilj)) {}
};

struct DereferenceExpr : Expr {
    std::unique_ptr<Expr> pokazivac;

    DereferenceExpr(std::unique_ptr<Expr> pokazivac)
        : pokazivac(std::move(pokazivac)) {}
};

struct UnaryExpr : Expr {
    std::string op;
    std::unique_ptr<Expr> izraz;

    UnaryExpr(const std::string& op, std::unique_ptr<Expr> izraz)
        : op(op), izraz(std::move(izraz)) {}
};

struct BinaryExpr : Expr {
    std::string op;
    std::unique_ptr<Expr> lijevo;
    std::unique_ptr<Expr> desno;

    BinaryExpr(std::unique_ptr<Expr> lijevo, const std::string& op, std::unique_ptr<Expr> desno)
        : op(op), lijevo(std::move(lijevo)), desno(std::move(desno)) {}
};

struct Stmt {
    virtual ~Stmt() = default;
};

struct VarDeclStmt : Stmt {
    std::string ime;
    VarKind kind;
    int velicina;
    std::vector<std::unique_ptr<Expr>> inicijalizator;

    VarDeclStmt(const std::string& ime, VarKind kind = VarKind::Normal, int velicina = 1,
        std::vector<std::unique_ptr<Expr>> inicijalizator = {})
        : ime(ime), kind(kind), velicina(velicina), inicijalizator(std::move(inicijalizator)) {}
};

struct AssignStmt : Stmt {
    std::unique_ptr<Expr> cilj;
    std::unique_ptr<Expr> izraz;

    AssignStmt(std::unique_ptr<Expr> cilj, std::unique_ptr<Expr> izraz)
        : cilj(std::move(cilj)), izraz(std::move(izraz)) {}
};

struct OutputStmt : Stmt {
    std::unique_ptr<Expr> izraz;
    std::unique_ptr<Expr> adresa;
    std::unique_ptr<Expr> bit;

    OutputStmt(std::unique_ptr<Expr> izraz,
                std::unique_ptr<Expr> adresa = nullptr,
                std::unique_ptr<Expr> bit = nullptr)
         : izraz(std::move(izraz)), adresa(std::move(adresa)), bit(std::move(bit)) {}
};

struct ReturnStmt : Stmt {
    std::unique_ptr<Expr> izraz;

    ReturnStmt(std::unique_ptr<Expr> izraz)
        : izraz(std::move(izraz)) {}
};

struct IncrementStmt : Stmt {
    std::unique_ptr<Expr> cilj;
    bool povecaj;

    IncrementStmt(std::unique_ptr<Expr> cilj, bool povecaj)
        : cilj(std::move(cilj)), povecaj(povecaj) {}
};

struct BlockStmt : Stmt {
    std::vector<std::unique_ptr<Stmt>> naredbe;
};

struct IfStmt : Stmt {
    std::unique_ptr<Expr> uslov;
    std::unique_ptr<BlockStmt> thenBlok;
    std::unique_ptr<BlockStmt> elseBlok;

    IfStmt(std::unique_ptr<Expr> uslov,
           std::unique_ptr<BlockStmt> thenBlok,
           std::unique_ptr<BlockStmt> elseBlok)
        : uslov(std::move(uslov)),
          thenBlok(std::move(thenBlok)),
          elseBlok(std::move(elseBlok)) {}
};

struct WhileStmt : Stmt {
    std::unique_ptr<Expr> uslov;
    std::unique_ptr<BlockStmt> tijelo;

    WhileStmt(std::unique_ptr<Expr> uslov, std::unique_ptr<BlockStmt> tijelo)
        : uslov(std::move(uslov)), tijelo(std::move(tijelo)) {}
};

struct ForStmt : Stmt {
    std::unique_ptr<Stmt> inicijalizacija;
    std::unique_ptr<Expr> uslov;
    std::unique_ptr<Stmt> promjena;
    std::unique_ptr<BlockStmt> tijelo;

    ForStmt(std::unique_ptr<Stmt> inicijalizacija,
            std::unique_ptr<Expr> uslov,
            std::unique_ptr<Stmt> promjena,
            std::unique_ptr<BlockStmt> tijelo)
        : inicijalizacija(std::move(inicijalizacija)),
          uslov(std::move(uslov)),
          promjena(std::move(promjena)),
          tijelo(std::move(tijelo)) {}
};

struct FunctionDecl {
    std::string ime;
    std::unique_ptr<BlockStmt> tijelo;

    FunctionDecl(const std::string& ime, std::unique_ptr<BlockStmt> tijelo)
        : ime(ime), tijelo(std::move(tijelo)) {}
};

struct Program {
    std::vector<std::unique_ptr<FunctionDecl>> funkcije;
};

#endif
