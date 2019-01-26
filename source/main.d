module atsl.main;

import core.thread;

import derelict.sdl2.sdl;

import primordial.init;
import primordial.sdl.display;
import primordial.colors : black;
import primordial.input.keyboard;

import atsl.models.ship;

version (unittest) import blerp;

int main()
{

    bool shutdown = false;

    primordial.init.primordial_init(true, true);

    sdl_window main_window = new sdl_window("A Thick Sliced Loaf",
            SDL_WINDOWPOS_UNDEFINED, 0, 640, 1000);

    sdl_event_listener keyboard = new sdl_event_listener(main_window);

    keyboard.listen();

    atsl.models.ship.init(main_window, 320, 800);

    while (shutdown == false)
    {
        SDL_Keycode keycode = keyboard.getLastKey();
        if (keycode == SDLK_q)
        {
            keyboard.sendShutdown();
            break;
        }
        else if (keycode == SDLK_a || keycode == SDLK_LEFT)
        {
            if (atsl.models.ship.ship.getx() >= 50)
            {
                atsl.models.ship.moveLeft(10);
            }
        }
        else if (keycode == SDLK_d || keycode == SDLK_RIGHT)
        {
            if (atsl.models.ship.ship.getx() <= 590)
            {
                atsl.models.ship.moveRight(10);
            }
        }

        keyboard.clearEvents();

        main_window.clear(black);

        atsl.models.ship.ship.render();

        main_window.update();

    }

    return 0;
}
