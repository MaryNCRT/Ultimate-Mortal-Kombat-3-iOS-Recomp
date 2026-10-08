#include "platform/platform.h"
#include "platform/gl.h"

extern long SplashCount;
void Task_LoadSplashScreen(void);
void limeBegin(void);
void limeFinish(void);

int menu_play_splash(void)
{
#ifdef __EMSCRIPTEN__
    while (SplashCount <= 491) {
        int width, height;

        if (!plat_poll())
            return 0;

        plat_size(&width, &height);
        if (width <= 0 || height <= 0)
            continue;
        glViewport(0, 0, width, height);
        glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        limeBegin();
        Task_LoadSplashScreen();
        limeFinish();

        if (!plat_swap())
            return 0;
    }
#else
    double last = plat_time();
    double acc = 0.0;

    while (SplashCount <= 491) {
        double now;
        int width, height;

        if (!plat_poll())
            return 0;

        now = plat_time();
        acc += now - last;
        last = now;
        if (acc > 0.25)
            acc = 0.25;
        if (acc < 1.0 / 60.0)
            continue;

        plat_size(&width, &height);
        if (width <= 0 || height <= 0)
            continue;
        glViewport(0, 0, width, height);
        glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        while (acc >= 1.0 / 60.0 && SplashCount <= 491) {
            limeBegin();
            Task_LoadSplashScreen();
            limeFinish();
            acc -= 1.0 / 60.0;
        }

        if (!plat_swap())
            return 0;
    }

#endif

    return 1;
}
