module atsl.scenes.introduction;

import core.thread;

import derelict.sdl2.sdl;

import primordial.sdl.display;
import primordial.primitives.shapes;
import primordial.colors : white, black;
import primordial.input.keyboard;

import atsl.models.intro_story;

string intro_text = "Welcome to A Thick Sliced Loaf";

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

public void doInitialIntroduction(sdl_window main_window, sdl_event_listener keyboard)
{

    bool shutdown;
    text introTextString = new text(intro_text, 320, 500, white, 12, main_window.get_renderer());

    atsl.models.intro_story.init(main_window, 320, 500);

    main_window.clear(black);
    introTextString.centered(main_window.get_size());
    introTextString.render();
    main_window.update();

    wait_for_next(keyboard);

    main_window.clear(black);

    atsl.models.intro_story.intro_story_text.render();

    main_window.update();

    wait_for_next(keyboard);

    return;

}
