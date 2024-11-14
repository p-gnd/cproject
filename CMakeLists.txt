cmake_minimum_required(VERSION 3.18)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(
    Dummy
    VERSION 0.1
    DESCRIPTION "Dummy - A dummy library"
    LANGUAGES C
    )



add_library(
    ${PROJECT_NAME}
    src/dummy.c
)

target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    include
)

set_property(
    TARGET ${PROJECT_NAME}
    PROPERTY C_STANDARD 11
)
