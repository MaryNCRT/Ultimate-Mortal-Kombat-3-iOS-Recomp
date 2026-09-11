cmake_minimum_required(VERSION 3.16)
project(umk3 C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(umk3
    runtime/main.c
    runtime/lime/meshset.c
    runtime/lime/limemath.c
    runtime/lime/pvr.c
    runtime/lime/png.c
    runtime/lime/light.c
)

target_include_directories(umk3 PRIVATE runtime)

# The front end, in a window. `runtime/menu_main.c` and `runtime/draw_gl.c`
# have existed for a while but were never a build target, so the only way to
# see the menu was to remember the gcc line in menu_main.c's header. It is a
# separate executable rather than a mode of `umk3` because it links the whole
# of decomp/gamecode and decomp/lime, which the mesh viewer has no use for.
#
# UMK3_REAL_GL is what swaps the counting platform layer for the drawing one.
file(GLOB UMK3_MENU_GAMECODE decomp/gamecode/*.c)
file(GLOB UMK3_MENU_LIME     decomp/lime/*.c)
file(GLOB UMK3_MENU_RUNLIME  runtime/lime/*.c)

add_executable(umk3-menu
    runtime/menu_main.c
    runtime/draw_gl.c
    runtime/gamecode_globals.c
    runtime/gamecode_stubs.c
    runtime/lime_menu.c
    runtime/lime_platform.c
    ${UMK3_MENU_GAMECODE}
    ${UMK3_MENU_LIME}
    ${UMK3_MENU_RUNLIME}
)
target_include_directories(umk3-menu PRIVATE runtime decomp/lime)
target_compile_definitions(umk3-menu PRIVATE UMK3_REAL_GL)

# The fight scene. It links ONLY mk3.c out of decomp/gamecode/logic, because
# that is the one file whose functions this scene actually calls --
# TranslateJoybits for the input and gravity_n_bounds for the physics -- and
# the rest of the directory still has 159 undefined functions and 229
# unextracted data tables between it and a link.
#
# What the scene supplies instead of the missing engine is written down at the
# top of runtime/fight_scene.c, under "WHAT IS REAL HERE, AND WHAT IS NOT".
add_executable(umk3-fight
    runtime/fight_scene.c
    runtime/fight_render.c
    runtime/fight_audio.c
    runtime/fight_select.c
    runtime/fight_stubs.c
    runtime/lime/meshset.c
    runtime/lime/scene.c
    runtime/lime/events.c
    runtime/lime/skin.c
    runtime/lime/light.c
    runtime/lime/limemath.c
    runtime/lime/pvr.c
    runtime/lime/png.c
    decomp/gamecode/logic/mk3.c
)
target_include_directories(umk3-fight PRIVATE runtime decomp/lime)

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
    target_sources(umk3-menu PRIVATE runtime/platform/win32_gl.c)
    target_link_libraries(umk3-menu PRIVATE opengl32 gdi32)
    target_sources(umk3-fight PRIVATE runtime/platform/win32_gl.c
                                     runtime/platform/win32_audio.c)
    target_link_libraries(umk3-fight PRIVATE opengl32 gdi32 winmm)
elseif(UMK3_BACKEND STREQUAL "sdl2")
    find_package(SDL2 REQUIRED)
    find_package(OpenGL REQUIRED)
    target_sources(umk3 PRIVATE runtime/platform/sdl_gl.c)
    target_sources(umk3-menu PRIVATE runtime/platform/sdl_gl.c)
    target_include_directories(umk3-menu PRIVATE ${SDL2_INCLUDE_DIRS})
    target_link_libraries(umk3-menu PRIVATE ${SDL2_LIBRARIES} OpenGL::GL m)
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
