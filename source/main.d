module atsl.main;

import core.thread;
import std.concurrency;
import std.algorithm : remove;
import std.stdio : writeln;
import core.time;
import std.random;

import derelict.sdl2.sdl;

import primordial.init;
import primordial.sdl.display;
import primordial.colors : black;
import primordial.input.keyboard;
import primordial.models.container;

import atsl.models.ship;
import atsl.models.planet;
import atsl.scenes.introduction;
import atsl.scenes.game_over;
import atsl.utils;

version (unittest) import blerp;

int main()
{

    bool shutdown = false;
    bool gameOver = false;

    int collisionCount = 0;
    static immutable collisionMax = 4; //Because one collision registers multiple times as the planet passes

    MonoTime timeSinceLastPlanetMove = MonoTime.currTime();
    MonoTime timeSinceLastPlanetGen = MonoTime.currTime();

    auto rnd = new Random(unpredictableSeed);

    MonoTime framestart;
    MonoTime frameend;
    Duration difference;

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
        framestart = MonoTime.currTime;

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

        if ((timeSinceLastPlanetMove - MonoTime.currTime()) <= msecs(-60))
        {
            timeSinceLastPlanetMove = MonoTime.currTime;
            foreach (planet; planets)
            {
                planet.sety(planet.gety() + 20);
            }

        }

        if ((timeSinceLastPlanetGen - MonoTime.currTime()) <= msecs(-160))
        {
            timeSinceLastPlanetGen = MonoTime.currTime;
            if (planets.length < 6)
            {
                planets ~= generatePlanets(main_window, uniform(0, 2, rnd));
            }
        }

        foreach (int i, ref planet; planets)
        {
            if (planet.gety() >= 980)
            {
                planets = planets.remove(i);
            }

            if (planet.gety() >= 800 - 30 && planet.gety() <= 800 + 30
                    && planet.getx() >= (atsl.models.ship.ship.getx() - 60)
                    && planet.getx() <= (atsl.models.ship.ship.getx() + 60))
            {
                collisionCount += 1;

                if (planet.getx() >= (atsl.models.ship.ship.getx() - 60)
                        && planet.getx() <= (atsl.models.ship.ship.getx()))
                {
                    atsl.models.ship.moveRight(50);
                    planet.setx(planet.getx() - 30);
                }

                else if (planet.getx() >= atsl.models.ship.ship.getx()
                        && planet.getx() <= (atsl.models.ship.ship.getx() + 60))
                {
                    atsl.models.ship.moveLeft(50);
                    planet.setx(planet.getx() + 30);
                }

                if (collisionCount >= collisionMax)
                {
                    atsl.scenes.game_over.doGameOver(main_window, keyboard);
                    gameOver = true;
                    break;
                }

                break;
            }
        }

        if (gameOver == true)
        {
            writeln("Game Over");
            break;
        }

        /* Draw */

        main_window.clear(black);

        atsl.models.ship.ship.render();

        foreach (p; planets)
        {
            p.render();
        }

        main_window.update();

        frameend = MonoTime.currTime;

        difference = framestart - frameend;
    }

    return 0;
}
