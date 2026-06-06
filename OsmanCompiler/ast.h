#ifndef AST_H
#define AST_H

#include <memory>
#include <string>
#include <vector>

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

    VarDeclStmt(const std::string& ime) : ime(ime) {}
};

struct AssignStmt : Stmt {
    std::string ime;
    std::unique_ptr<Expr> izraz;

    AssignStmt(const std::string& ime, std::unique_ptr<Expr> izraz)
        : ime(ime), izraz(std::move(izraz)) {}
};

struct OutputStmt : Stmt {
    std::unique_ptr<Expr> izraz;

    OutputStmt(std::unique_ptr<Expr> izraz)
        : izraz(std::move(izraz)) {}
};

struct ReturnStmt : Stmt {
    std::unique_ptr<Expr> izraz;

    ReturnStmt(std::unique_ptr<Expr> izraz)
        : izraz(std::move(izraz)) {}
};

struct IncrementStmt : Stmt {
    std::string ime;
    bool povecaj;

    IncrementStmt(const std::string& ime, bool povecaj)
        : ime(ime), povecaj(povecaj) {}
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
