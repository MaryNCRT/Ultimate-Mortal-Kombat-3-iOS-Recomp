cmake_minimum_required(VERSION 3.16)
project(umk3 C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(umk3
    runtime/main.c
    runtime/character.c
    runtime/lime/meshset.c
    runtime/lime/skin.c
    runtime/lime/limemath.c
    runtime/lime/pvr.c
    runtime/lime/light.c
)

target_include_directories(umk3 PRIVATE runtime)

# win32 needs nothing installed and is what the vertical slice was built on;
# sdl2 is the portable path. Both implement platform.h and nothing else.
if(WIN32)
    set(UMK3_BACKEND "win32" CACHE STRING "Platform backend: win32 or sdl2")
else()
    set(UMK3_BACKEND "sdl2" CACHE STRING "Platform backend: win32 or sdl2")
endif()
set_property(CACHE UMK3_BACKEND PROPERTY STRINGS win32 sdl2)

if(UMK3_BACKEND STREQUAL "win32")
    if(NOT WIN32)
        message(FATAL_ERROR "The win32 backend only builds on Windows. "
                            "Configure with -DUMK3_BACKEND=sdl2.")
    endif()
    target_sources(umk3 PRIVATE runtime/platform/win32_gl.c)
    target_link_libraries(umk3 PRIVATE opengl32 gdi32)
elseif(UMK3_BACKEND STREQUAL "sdl2")
    find_package(SDL2 REQUIRED)
    find_package(OpenGL REQUIRED)
    target_sources(umk3 PRIVATE runtime/platform/sdl_gl.c)
    # SDL2_INCLUDE_DIRS is the spelling the Debian/Ubuntu config module uses;
    # the imported target covers the rest.
    target_include_directories(umk3 PRIVATE ${SDL2_INCLUDE_DIRS})
    target_link_libraries(umk3 PRIVATE ${SDL2_LIBRARIES} OpenGL::GL m)
else()
    message(FATAL_ERROR "Unknown UMK3_BACKEND '${UMK3_BACKEND}'.")
endif()

if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
    target_compile_options(umk3 PRIVATE -Wall -Wextra)
endif()
