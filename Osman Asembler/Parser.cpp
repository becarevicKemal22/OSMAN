//
// Created by kemal on 22-May-26.
//

#include "Parser.h"

#include <bitset>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <stdexcept>

#include "Instructions.h"

void Parser::parse() {
    firstPass();
    secondPass();
}

void Parser::firstPass() {
    while(!atType(TokenType::Eof)){
        if(!atType(TokenType::Identifier) && !atType(TokenType::Dot)){
            while(!atType(TokenType::LineEnd) && !atType(TokenType::Eof)){
                instructionPointer += atType(TokenType::Instruction);
                advance();
            }
            if(atType(TokenType::LineEnd)) advance();
            continue;
        }
        if (atType(TokenType::Dot)) {
            skip();
            if (!atType(TokenType::Directive)) {
                Greska("Ocekivan naziv direktive nakon '.'", at()->line);
            }
            parseDirective("");
            continue;
        }
        std::string labela = at()->value;
        unsigned int line = at()->line;
        auto it = symbolTable.find(labela);
        if(it != symbolTable.end()){
            Greska("Labela '" + labela + "' je vec deklarisana.", line);
        }
        skip();
        if(!atType(TokenType::Colon)){
            Greska("Ocekivano ':', dobijeno '" + at()->value + "'.", at()->line);
        }
        skip();
        if (atType(TokenType::Dot)) {
            skip();
            parseDirective(labela);
        }else {
            symbolTable.insert({labela, {currentSection, instructionPointer}});
        }

    }
    backToStart();
}

void Parser::parseDirective(const std::string& label) {
    DirectiveType type = DIRECTIVES.find(at()->value)->second;
    switch (type) {
        case DirectiveType::EQU:
            parseEquDirective();
            break;
        case DirectiveType::DATA:
            parseDataDirective();
            break;
        case DirectiveType::CODE:
            parseCodeDirective();
            break;
        case DirectiveType::BYTE:
            parseByteDirective(label);
        case DirectiveType::SPACE:
            parseSpaceDirective(label);
    }
}

void Parser::parseEquDirective() {
    skip();
    if (!atType(TokenType::Identifier)) {
        Greska("Ocekivan identifikator nakon equ direktive.", at()->line);
    }
    std::string label = at()->value;
    skip();
    if (!atType(TokenType::Number)) {
        Greska("Ocekivan broj umjesto '" + TokenTypeToStr(at()->type) + "'.", at()->line);
    }
    int num = parseNumber(true);
    symbolTable.insert({label, {Section::EQU, num}});
}

void Parser::parseDataDirective() {
    skip();
    currentSection = Section::DATA;
}

void Parser::parseCodeDirective() {
    skip();
    currentSection = Section::CODE;
}

void Parser::parseByteDirective(const std::string& label) {
    skip();
    std::vector<int> nums{};
    while (true) {
        int num = parseNumber(true);
        nums.push_back(num);
        if (atType(TokenType::LineEnd) || atType(TokenType::Eof)) {
            if (atType(TokenType::LineEnd)) skip();
            break;
        }
        if (!atType(TokenType::Comma)) {
            Greska("Ocekivan kraj linije ili zarez umjesto '" + at()->value + "'.", at()->line);
        }
        skip();
    }

    for (int i = nums.size() - 1; i >= 0; i--){
        setMemory(dataPointer--, nums[i]);
    }

    symbolTable.insert({label, {currentSection, dataPointer + 1}});
}

void Parser::parseSpaceDirective(const std::string& label) {
}

int Parser::parseNumber(bool skipInsteadOfAdvance) {
    bool negative = false;
    if (atType(TokenType::Minus)) {
        negative = true;
        skipInsteadOfAdvance ? skip() : advance();
    }
    if (!atType(TokenType::Number)) {
        throw std::runtime_error("Ocekivan kao drugi operand na liniji: " + std::to_string(at()->line));
    }

    int num = std::stoi(at()->value);
    num = (negative) ? -num : num;
    checkImmInBounds(num, at()->line);
    skipInsteadOfAdvance ? skip() : advance();
    return num;
}

void Parser::setMemory(uint8_t address, uint8_t value) {
    memoryContents[address] = value;
}

void Parser::secondPass() {
    while (!atType(TokenType::Eof)){
        if(atType(TokenType::LineEnd) || atType(TokenType::Skip)){
            advance();
            continue;
        }
        if (!atType(TokenType::Instruction)){
            Greska("Ocekivana instrukcija, dobijeno '" + at()->value + "'", at()->line);
        }

        auto it = INSTRUCTIONS.find(at()->value);
        if (it == INSTRUCTIONS.end()) {
            Greska("Nepoznata instrukcija '" + at()->value + "'.", at()->line);
        }

        InstructionSpec spec = it->second;
        switch (spec.format) {
            case InstructionFormat::NoOp:
                parseNoOp(spec);
                break;
            case InstructionFormat::OneReg:
                parseOneReg(spec);
                break;
            case InstructionFormat::RegReg:
                parseRegReg(spec);
                break;
            case InstructionFormat::RegImm:
                parseRegImm(spec);
                break;
            case InstructionFormat::Jump:
                parseJump(spec);
                break;
            case InstructionFormat::RegBaseOffset:
                parseRegBaseOffset(spec);
                break;
        }
    }
    writeOutputs("binary.txt", "hex.txt", "dataBin.txt", "dataHex.txt");
}

void Parser::expectAndAdvance(TokenType tokenType) {
    if (!atType(tokenType)) {
        throw std::runtime_error("Ocekivano: " + TokenTypeToStr(tokenType) + ", dobijeno: " + TokenTypeToStr(at()->type) + " na liniji " + std::to_string(at()->line));
    }
    advance();
}

void Parser::expectAndSkip(TokenType tokenType) {
    if (!atType(tokenType)) {
        throw std::runtime_error("Ocekivano: '" + TokenTypeToStr(tokenType) + "', dobijeno: " + TokenTypeToStr(at()->type) + " na liniji " + std::to_string(at()->line));
    }
    skip();
}

void Parser::emit(uint16_t instruction) {
    binaryOutput << std::bitset<16>(instruction).to_string() << "\n";

    hexOutput << std::hex << std::setw(4)
              << std::setfill('0') << std::uppercase << instruction << "\n";
}

void Parser::emitMemoryContents() {
    for (const auto value : memoryContents) {
        dataBinaryOutput<< std::bitset<8>(value).to_string() << "\n";

        dataHexOutput << std::hex << std::setw(2)
                  << std::setfill('0') << std::uppercase << static_cast<int>(value) << "\n";
    }
}

void dumpStringStreamIntoFile(const std::string& path, const std::stringstream& stream) {
    std::ofstream f(path);
    if (f.is_open()) {
        f << stream.str();
        f.close();
    } else {
        std::cout << "Greška pri otvaranju fajla 1" << std::endl;
    }
}

void Parser::writeOutputs(const std::string& binPath, const std::string& hexPath, const std::string& dataBinPath, const std::string& dataHexPath) {
    dumpStringStreamIntoFile(binPath, binaryOutput);
    dumpStringStreamIntoFile(hexPath, hexOutput);

    emitMemoryContents();
    dumpStringStreamIntoFile(dataBinPath, dataBinaryOutput);
    dumpStringStreamIntoFile(dataHexPath, dataHexOutput);
}

uint8_t Parser::resolveRegister(std::string name) {
    auto it = REGISTERMAP.find(name);
    if (it == REGISTERMAP.end()) {
        Greska("Ocekivano ime registra umjesto '" + name + "'.", at()->line);
    }
    return it->second;
}

void setOpcode(uint16_t& instruction, uint8_t opcode) {
    instruction &= ~(0xF800);
    instruction |= (static_cast<uint16_t>(opcode) << 11);
}

void setOr(uint16_t& instruction, uint8_t reg) {
    instruction &= ~(0x0700);
    instruction |= (static_cast<uint16_t>(reg) << 8);
}

void setIr(uint16_t& instruction, uint8_t reg) {
    instruction &= ~(0x00E0);
    instruction |= (static_cast<uint16_t>(reg) << 5);
}

void setImm(uint16_t& instruction, uint8_t imm) {
    instruction &= ~(0x00FF);
    instruction |= static_cast<uint16_t>(imm);
}

void setOffset(uint16_t& instruction, uint8_t reg) {
    instruction &= ~(0x001F);
    instruction |= static_cast<uint16_t>(reg);
}

void Parser::parseNoOp(InstructionSpec spec) {
    uint16_t kod = 0x00;
    if (at()->value == "NOP") {
        setOpcode(kod, spec.opcode);
    }else { // RET
        setOpcode(kod, spec.opcode);
        setOr(kod, resolveRegister("PA"));
    }
    emit(kod);
    advance();
    expectAndAdvance(TokenType::LineEnd);
}

void Parser::parseOneReg(InstructionSpec spec) {
    uint16_t kod = 0x00;
    std::string instruction = at()->value;
    setOpcode(kod, spec.opcode);
    advance();

    if (!atType(TokenType::Identifier)) {
        Greska("Ocekivano ime registra umjesto '" + at()->value + "'.", at()->line);
    }

    setOr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

void Parser::parseRegReg(InstructionSpec spec) {
    uint16_t kod = 0x00;
    std::string instruction = at()->value;
    unsigned int line = at()->line;
    setOpcode(kod, spec.opcode);
    advance();

    if (!atType(TokenType::Identifier)) {
        Greska("Ocekivano ime registra umjesto '" + at()->value + "'.", line);
    }
    setOr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::Comma);

    if (!atType(TokenType::Identifier)) {
        Greska("Ocekivano ime registra umjesto '" + at()->value + "'.", line);
    }
    setIr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

void Parser::parseRegImm(InstructionSpec spec) {
    uint16_t kod = 0x00;
    std::string instruction = at()->value;
    setOpcode(kod, spec.opcode);
    advance();

    if (!atType(TokenType::Identifier)) {
        throw std::domain_error("Ocekivano ime registra nakon instrukcije na liniji: " + std::to_string(at()->line));
    }
    setOr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::Comma);

    int num;
    if (atType(TokenType::Identifier)) {
        num = parseLabel(spec);
    } else {
        num = parseNumber();
    }
    setImm(kod, static_cast<uint8_t>(num));

    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

int Parser::parseLabel(InstructionSpec spec) {
    auto it = symbolTable.find(at()->value);
    if (it == symbolTable.end()) {
        Greska("Nepoznat identifikator'" + at()->value + "'.", at()->line);
    }
    if (!spec.allowedLabelSections.contains(it->second.first)) {
        Greska("Nedozvoljen tip labele za instrukciju.", at()->line);
    }
    advance();
    return it->second.second;
}

void Parser::parseJump(InstructionSpec spec) {
    uint16_t kod = 0x00;
    std::string instruction = at()->value;
    unsigned int line = at()->line;
    setOpcode(kod, spec.opcode);
    advance();

    setOr(kod, 7);

    if(!atType(TokenType::Identifier)){
        std::string poruka = "Ocekivana labela skoka nakon '" + instruction + "'.";
        Greska(poruka, line);
    }

    unsigned int jumpLoc = parseLabel(spec);
    setImm(kod, static_cast<uint8_t>(jumpLoc));
    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

void Parser::parseRegBaseOffset(InstructionSpec spec) {
    uint16_t kod = 0x00;
    std::string instruction = at()->value;
    unsigned int line = at()->line;
    setOpcode(kod, spec.opcode);
    advance();

    if(!atType(TokenType::Identifier)){
        Greska("Ocekivano ime registra nakon '" + instruction + "'.", line);
    }

    setOr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::Comma);

    if(!atType(TokenType::Identifier)){
        Greska("Ocekivano ime registra nakon ','", line);
    }

    setIr(kod, resolveRegister(at()->value));
    advance();
    expectAndAdvance(TokenType::OpenBracket);

    int num = parseNumber();
    if(num < -16 || num > 15){
        Greska("Offset izvan opsega [-16, 15]", line);
    }
    setOffset(kod, static_cast<uint8_t>(num));
    expectAndAdvance(TokenType::ClosedBracket);

    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

void Parser::checkImmInBounds(int num, unsigned int line) {
    //auto it = INSTRUCTIONSWITHUNSIGNEDIMM.find(instruction);
    //bool isUnsigned = it != INSTRUCTIONSWITHUNSIGNEDIMM.end();
    //if(isUnsigned && !(num >= 0 && num <= 255)){
    //    throw std::runtime_error("Konstanta izvan opsega [0, 255] na liniji " + std::to_string(at()->line));
    //}
    //if(!isUnsigned && !(num >= -128 && num <= 127)){
    //    throw std::runtime_error("Konstanta izvan opsega [-128, 127] na liniji " + std::to_string(at()->line));
    //}
    if(num < -128 || num > 255){
        Greska("Konstanta izlazi van dozvoljenog opsega.", line);
    }
}

void Parser::Greska(std::string msg, unsigned int line) {
    throw std::runtime_error("Greska na liniji " + std::to_string(line) + ": " + msg);
}
