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
    //first pass
    unsigned int instructionCount = 0;
    while(!atType(TokenType::Eof)){
        if(!atType(TokenType::Identifier)){
           while(!atType(TokenType::LineEnd) && !atType(TokenType::Eof)){
               instructionCount += atType(TokenType::Instruction);
               advance();
           }
           if(atType(TokenType::LineEnd)) advance();
            continue;
        }
        std::string labela = at()->value;
        unsigned int line = at()->line;
        auto it = symbolTable.find(labela);
        if(it != symbolTable.end()){
            Greska("Labela '" + labela + "' je vec deklarisana.", line);
        }
        symbolTable.insert({labela, instructionCount});
        at()->type = TokenType::Skip;
        advance();
        if(!atType(TokenType::Colon)){
            Greska("Ocekivano ':', dobijeno '" + at()->value + "'.", at()->line);
        }
        at()->type = TokenType::Skip;
        advance();
    }
    backToStart();

    // second pass OSLANJA SE NA TO DA SU LABELE UKLONJENE SA LIJEVE STRANE
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
    writeOutputs("binary.txt", "hex.txt");
}

void Parser::expectAndAdvance(TokenType tokenType) {
    if (!atType(tokenType)) {
        throw std::runtime_error("Ocekivano: " + TokenTypeToStr(tokenType) + ", dobijeno: " + TokenTypeToStr(at()->type) + " na liniji " + std::to_string(at()->line));
    }
    advance();
}

void Parser::emit(uint16_t instruction) {
    binaryOutput << std::bitset<16>(instruction).to_string() << "\n";

    hexOutput << std::hex << std::setw(4)
              << std::setfill('0') << std::uppercase << instruction << "\n";
}

void Parser::writeOutputs(const std::string& binPath, const std::string& hexPath) {
    std::ofstream bin(binPath);
    if (bin.is_open()) {
        bin << binaryOutput.str();
        bin.close();
    } else {
        std::cout << "Greška pri otvaranju fajla 1" << std::endl;
    }

    std::ofstream hex(hexPath);
    if (hex.is_open()) {
        hex << hexOutput.str();
        hex.close();
    } else {
        std::cout << "Greška pri otvaranju hex fajla!" << std::endl;
    }
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

    bool negative = false;
    if (atType(TokenType::Minus)) {
        negative = true;
        advance();
    }
    if (!atType(TokenType::Number)) {
        throw std::runtime_error("Ocekivan kao drugi operand na liniji: " + std::to_string(at()->line));
    }

    int num = std::stoi(at()->value);
    num = (negative) ? -num : num;
    checkImmInBounds(num, instruction, at()->line);
    setImm(kod, static_cast<uint8_t>(num));
    advance();

    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
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

    auto it = symbolTable.find(at()->value);
    if(it == symbolTable.end()){
        Greska("Nepoznata labela '" + at()->value + "'.", at()->line);
    }
    unsigned int jumpLoc = it->second;
    setImm(kod, static_cast<uint8_t>(jumpLoc));
    advance();
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

    bool negative = false;
    if(atType(TokenType::Minus)){
        negative = true;
        advance();
    }

    if(!atType(TokenType::Number)){
        Greska("Ocekivan broj nakon '['", line);
    }

    int num = std::stoi(at()->value);
    num = (negative) ? -num : num;
    if(num < -16 || num > 15){
        Greska("Offset izvan opsega [-16, 15]", line);
    }
    setOffset(kod, static_cast<uint8_t>(num));
    advance();
    expectAndAdvance(TokenType::ClosedBracket);

    expectAndAdvance(TokenType::LineEnd);
    emit(kod);
}

void Parser::checkImmInBounds(int num, std::string instruction, unsigned int line) {
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
