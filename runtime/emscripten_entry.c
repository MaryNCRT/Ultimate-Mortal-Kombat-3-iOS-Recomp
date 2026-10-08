int umk3_test_main(int argc, char **argv);

int emscripten_program_entry(int argc, char **argv) __asm__("main");

int emscripten_program_entry(int argc, char **argv)
{
    return umk3_test_main(argc, argv);
}
