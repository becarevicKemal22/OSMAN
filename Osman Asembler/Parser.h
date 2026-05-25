//
// Created by kemal on 22-May-26.
//

#ifndef OSMAN_ASEMBLER_PARSER_H
#define OSMAN_ASEMBLER_PARSER_H
#include <vector>
#include <sstream>

#include "Instructions.h"
#include "Token.h"


class Parser {
public:
    explicit Parser(const std::vector<Token*>& tokens) : tokens(tokens) {}
    void parse();

private:
    unsigned int current = 0;
    std::vector<Token*> tokens;
    std::unordered_map<std::string, unsigned int> symbolTable;

    std::stringstream binaryOutput;
    std::stringstream hexOutput;

    void advance() { current++; }
    Token* at() const { return tokens[current]; }
    Token* previous() const { return tokens[current - 1]; }
    void expectAndAdvance(TokenType tokenType);
    void backToStart() { current = 0; }
    bool atType(TokenType type) const {
        return tokens[current]->type == type;
    }

    void emit(uint16_t instrMachineCode);
    void writeOutputs(const std::string& binPath, const std::string& hexPath);
    uint8_t resolveRegister(std::string name);
    void parseNoOp(InstructionSpec spec);
    void parseOneReg(InstructionSpec spec);
    void parseRegReg(InstructionSpec spec);
    void parseRegImm(InstructionSpec spec);
    void parseJump(InstructionSpec spec);
    void parseRegBaseOffset(InstructionSpec spec);

    void checkImmInBounds(int num, std::string instruction, unsigned int line);
    void Greska(std::string msg, unsigned int line);

    const std::unordered_map<std::string, uint8_t> REGISTERMAP = {
        {"SP", 0x00},
        {"A", 0x01},
        {"B", 0x02},
        {"C", 0x03},
        {"D", 0x04},
        {"E", 0x05},
        {"PV", 0x06},
        {"PA", 0x07}
    };
};


#endif //OSMAN_ASEMBLER_PARSER_H
