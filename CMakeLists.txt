cmake_minimum_required(VERSION 3.16)
project(umk3 C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(umk3
    runtime/main.c
    runtime/lime/meshset.c
    runtime/lime/limemath.c
    runtime/lime/pvr.c
)

target_include_directories(umk3 PRIVATE runtime)

if(WIN32)
    target_sources(umk3 PRIVATE runtime/platform/win32_gl.c)
    target_link_libraries(umk3 PRIVATE opengl32 gdi32)
else()
    message(FATAL_ERROR
        "Only the Win32 backend exists so far. runtime/platform/ is where a "
        "portable SDL2 backend goes; the interface in platform.h is shaped "
        "for it.")
endif()

if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(umk3 PRIVATE -Wall -Wextra)
endif()
