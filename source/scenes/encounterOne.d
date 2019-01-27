module atsl.scenes.encounters.encounter_one;

import core.thread;

import derelict.sdl2.sdl;

import primordial.sdl.display;
import primordial.primitives.shapes;
import primordial.colors : white, black;
import primordial.input.keyboard;

import atsl.models.encounterOne.explaination;

bool accepted = false;

void wait_for_next(sdl_event_listener keyboard)
{
    bool shutdown;

    while (!shutdown)
    {
        SDL_Keycode keycode = keyboard.getLastKey();
        if (keycode == SDLK_RETURN || keycode == SDLK_KP_ENTER)
        {
            accepted = true;
            keyboard.clearEvents();
            break;
        }
        else if (keycode == SDLK_BACKSPACE || keycode == SDLK_KP_BACKSPACE)
        {
            accepted = false;
            keyboard.clearEvents();
            break;
        }

        Thread.sleep(dur!("msecs")(500));
    }
}

void init(sdl_window window, sdl_event_listener keyboard)
{
    import std.stdio;

    /* Explain Homeworld, enter to continue, backspace to quit */

    window.clear(black);

    atsl.models.encounterOne.explaination.init(window, 320, 500);

    atsl.models.encounterOne.explaination.encounterone_text.render();

    window.update();

    wait_for_next(keyboard);

    if(accepted)
    {
        //
    }

}
