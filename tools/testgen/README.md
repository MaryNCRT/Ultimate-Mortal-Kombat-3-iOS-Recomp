# Differential-test classes

This folder reserves the deliberately narrow portion of the automated loop
that may generate test harnesses. The test must be derived from a function's
**signature**, never from its clean implementation.

| Class | Inputs and observation | Status |
|---|---|---|
| A | scalar / one vector; compare return or in-place result | calibration proven by `limeVector.cpp` |
| B | float array output; compare complete buffer | calibration proven by `Matrix.cpp` |
| C | multiple independent buffers | next template |
| D | known structure only | next template; requires a reviewed structure declaration |
| F | callbacks, coroutines, unknown ownership | intentionally not automated |

No generator is enabled merely because a function looks simple. A function is
submitted to `tools/decomp_loop.py --candidate` only after a reviewed template
has produced an independent test, and it must pass the strict gate.
