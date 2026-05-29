//
// Created by kemal on 22-May-26.
//

#ifndef OSMAN_ASEMBLER_INSTRUCTIONS_H
#define OSMAN_ASEMBLER_INSTRUCTIONS_H
#include <cstdint>
#include <set>
#include <unordered_map>
#include <string>

enum class Section {CODE, DATA, EQU};

enum class InstructionFormat {
    NoOp,
    OneReg,
    RegReg,
    RegImm,
    Jump,
    RegBaseOffset
};

struct InstructionSpec {
    uint8_t opcode;
    InstructionFormat format;
    std::set<Section> allowedLabelSections; // koristi se za instrukcije poput LI i LA da se npr ne dozvoli za LI da dobije nesto iz .data
};

const std::unordered_map<std::string, InstructionSpec> INSTRUCTIONS = {
    {"NOP",  {0b00000, InstructionFormat::NoOp, {}}},
    {"ADD",  {0b00001, InstructionFormat::RegReg, {}}},
    {"SUB",  {0b00010, InstructionFormat::RegReg, {}}},
    {"NOT",  {0b00011, InstructionFormat::OneReg, {}}},
    {"AND",  {0b00100, InstructionFormat::RegReg, {}}},
    {"OR",   {0b00101, InstructionFormat::RegReg, {}}},
    {"XOR",  {0b00110, InstructionFormat::RegReg, {}}},
    {"SL",   {0b00111, InstructionFormat::OneReg, {}}},
    {"SR",   {0b01000, InstructionFormat::OneReg, {}}},
    {"ADDI", {0b01001, InstructionFormat::RegImm, {Section::EQU}}},
    {"SUBI", {0b01010, InstructionFormat::RegImm, {Section::EQU}}},
    {"ANDI", {0b01011, InstructionFormat::RegImm, {Section::EQU}}},
    {"ORI",  {0b01100, InstructionFormat::RegImm, {Section::EQU}}},
    {"XORI", {0b01101, InstructionFormat::RegImm, {Section::EQU}}},
    {"CALL", {0b01110, InstructionFormat::Jump, {Section::CODE}}},
    {"RET",  {0b01111, InstructionFormat::NoOp, {}}},
    {"LDI",  {0b10000, InstructionFormat::RegImm, {Section::EQU, Section::DATA}}},
    {"STI",  {0b10001, InstructionFormat::RegImm, {Section::EQU, Section::DATA}}},
    {"LI",   {0b10010, InstructionFormat::RegImm, {Section::EQU}}},
    {"LA",   {0b10010, InstructionFormat::RegImm, {Section::DATA}}}, // PSEUDO INSTRUCTION
    {"JMP",  {0b10011, InstructionFormat::Jump, {Section::CODE}}},
    {"BEQ",  {0b10100, InstructionFormat::Jump, {Section::CODE}}},
    {"BNE",  {0b10101, InstructionFormat::Jump, {Section::CODE}}},
    {"BLT",  {0b10110, InstructionFormat::Jump, {Section::CODE}}},
    {"BGE",  {0b10111, InstructionFormat::Jump, {Section::CODE}}},
    {"BC",   {0b11000, InstructionFormat::Jump, {Section::CODE}}},
    {"BNC",  {0b11001, InstructionFormat::Jump, {Section::CODE}}},
    {"LD",   {0b11010, InstructionFormat::RegBaseOffset, {}}},
    {"ST",   {0b11011, InstructionFormat::RegBaseOffset, {}}},
    {"LEA",  {0b11100, InstructionFormat::RegBaseOffset, {}}},
    {"CMP",  {0b11101, InstructionFormat::RegReg, {}}},
    {"CMPI", {0b11110, InstructionFormat::RegImm, {Section::EQU}}},
};

enum class DirectiveType {
    EQU, DATA, CODE, BYTE, SPACE
};

const std::unordered_map<std::string, DirectiveType> DIRECTIVES = {
    {"EQU", DirectiveType::EQU},
    {"DATA", DirectiveType::DATA},
    {"CODE", DirectiveType::CODE},
    {"BYTE", DirectiveType::BYTE},
    {"SPACE", DirectiveType::SPACE}
};

//const std::set<std::string> INSTRUCTIONSWITHUNSIGNEDIMM = {
//        "LDI", "STI", "JMP", "BEQ", "BNE", "BLT", "BGE", "BC", "BNC"
//};

#endif //OSMAN_ASEMBLER_INSTRUCTIONS_H
