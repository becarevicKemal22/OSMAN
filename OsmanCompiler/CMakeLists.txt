cmake_minimum_required(VERSION 4.1)
project(OsmanCompiler)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(OsmanCompiler
        ast.h
        codegen.cpp
        codegen.h
        lexer.cpp
        lexer.h
        main.cpp
        parser.cpp
        parser.h
        test.osc.c
        token.cpp
        token.h)
