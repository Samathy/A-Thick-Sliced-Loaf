module atsl.scenes.game_over;

import core.thread;

import derelict.sdl2.sdl;

import primordial.sdl.display;
import primordial.input.keyboard;
import primordial.colors : black;

import atsl.models.game_over_model;

void wait_for_next(sdl_event_listener keyboard)
{
    bool shutdown;

    while (!shutdown)
    {
        SDL_Keycode keycode = keyboard.getLastKey();
        if (keycode == SDLK_RETURN || keycode == SDLK_KP_ENTER)
        {
            keyboard.clearEvents();
            break;
        }

        Thread.sleep(dur!("msecs")(500));
    }
}

void doGameOver(sdl_window window, sdl_event_listener keyboard)
{

    atsl.models.game_over_model.init(window, 320, 500);

    window.clear(black);
    atsl.models.game_over_model.game_over_text.render();
    window.update();

    wait_for_next(keyboard);

    return;

}
