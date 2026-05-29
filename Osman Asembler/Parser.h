//
// Created by kemal on 22-May-26.
//

#ifndef OSMAN_ASEMBLER_PARSER_H
#define OSMAN_ASEMBLER_PARSER_H
#include <vector>
#include <sstream>

#include "Instructions.h"
#include "Token.h"


constexpr uint8_t DATA_SECTION_START = 0xF7; // zavisi od broja memorijski mapiranih uredjaja, posto oni trenutno pocinju na 0xF8, data section pocinje na 0xF7 i raste prema dole
constexpr unsigned int RAM_SIZE = 256;

class Parser {
public:
    explicit Parser(const std::vector<Token*>& tokens) : tokens(tokens) {
        currentSection = Section::CODE;
        currentToken = 0;
        instructionPointer = 0;
        dataPointer = DATA_SECTION_START;
        memoryContents = std::vector<uint8_t>(256);
    }
    void parse();

private:
    unsigned int currentToken;
    uint8_t instructionPointer;
    uint8_t dataPointer;
    std::vector<Token*> tokens;
    std::unordered_map<std::string, std::pair<Section, unsigned int>> symbolTable; // <lokacija, {Sekcija, vrijednost}>
    Section currentSection;

    std::stringstream binaryOutput;
    std::stringstream hexOutput;

    std::vector<uint8_t> memoryContents;
    std::stringstream dataBinaryOutput;
    std::stringstream dataHexOutput;
    void setMemory(uint8_t address, uint8_t value);

    void firstPass();
    void secondPass();

    void advance() { currentToken++; }
    void skip() { at()->type = TokenType::Skip; advance(); }
    Token* at() const { return tokens[currentToken]; }
    Token* previous() const { return tokens[currentToken - 1]; }
    void expectAndAdvance(TokenType tokenType);
    void expectAndSkip(TokenType tokenType);
    void backToStart() { currentToken = 0; }
    bool atType(TokenType type) const {
        return tokens[currentToken]->type == type;
    }

    void emit(uint16_t instrMachineCode);
    void emitMemoryContents();

    void writeOutputs(const std::string& binPath, const std::string& hexPath, const std::string& dataBinPath, const std::string& dataHexPath);
    uint8_t resolveRegister(std::string name);
    void parseNoOp(InstructionSpec spec);
    void parseOneReg(InstructionSpec spec);
    void parseRegReg(InstructionSpec spec);
    void parseRegImm(InstructionSpec spec);

    int parseLabel(InstructionSpec spec);
    int parseNumber(bool skipInsteadOfAdvance = false);

    void parseJump(InstructionSpec spec);
    void parseRegBaseOffset(InstructionSpec spec);

    void parseDirective(const std::string& label);
    void parseEquDirective();
    void parseDataDirective();
    void parseCodeDirective();
    void parseByteDirective(const std::string& label);
    void parseSpaceDirective(const std::string& label);

    void checkImmInBounds(int num, unsigned int line);
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
