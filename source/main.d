module atsl.main;

import core.thread;

import derelict.sdl2.sdl;

import primordial.init;
import primordial.sdl.display;
import primordial.colors : black;

import atsl.models.ship;

version (unittest) import blerp;

int main()
{
    primordial.init.primordial_init(true, true);

    sdl_window main_window = new sdl_window("A Thick Sliced Loaf",
            SDL_WINDOWPOS_UNDEFINED, 0, 640, 1000);

    main_window.clear(black);

    atsl.models.ship.init(main_window, 320, 800);

    atsl.models.ship.ship.render();

    main_window.update();

    Thread.sleep(dur!("seconds")(10));

    return 0;
}
