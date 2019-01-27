module atsl.main;

import core.thread;
import std.concurrency;
import std.algorithm : remove;

import derelict.sdl2.sdl;

import primordial.init;
import primordial.sdl.display;
import primordial.colors : black;
import primordial.input.keyboard;
import primordial.models.container;

import atsl.models.ship;
import atsl.models.planet;
import atsl.scenes.introduction;
import atsl.utils;

version (unittest) import blerp;

int main()
{

    bool shutdown = false;

    model_container[] planets;
    sdl_window main_window;

    primordial.init.primordial_init(true, true);

    main_window = new sdl_window("A Thick Sliced Loaf", SDL_WINDOWPOS_UNDEFINED, 0, 640, 1000);

    sdl_event_listener keyboard = new sdl_event_listener(main_window);

    keyboard.listen();

    doInitialIntroduction(main_window, keyboard);

    atsl.models.ship.init(main_window, 320, 800);

    while (shutdown == false)
    {
        /* Update */
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

        //Move every planet down by 20 and kill it if its off screen?

        foreach (int i, ref planet; planets)
        {
            if (planet.gety() >= 980)
            {
                planets = planets.remove(i);
            }
        }

        foreach (planet; planets)
        {
            planet.sety(planet.gety() + 20);
        }

        planets ~= generatePlanets(main_window, 4);

        /* Draw */

        main_window.clear(black);

        atsl.models.ship.ship.render();

        foreach (p; planets)
        {
            p.render();
        }

        main_window.update();

    }

    return 0;
}
