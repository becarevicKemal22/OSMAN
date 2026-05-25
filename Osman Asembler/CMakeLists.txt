cmake_minimum_required(VERSION 3.26)
project(Osman_Asembler)

set(CMAKE_CXX_STANDARD 20)

add_executable(Osman_Asembler
        main.cpp
        Lexer.h
        Lexer.cpp
        Token.h
        Token.cpp
        Instructions.h
        Parser.cpp
        Parser.h
)
