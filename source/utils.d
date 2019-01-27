module atsl.utils;

import std.random;

import primordial.sdl.display;
import primordial.models.container;
import primordial.input.keyboard;

import atsl.models.planet;
import atsl.scenes.encounters.encounter_one;

model_container[] generatePlanets(sdl_window window, int planetCount)
{
    static immutable int y = 30;
    model_container[] planets;

    auto rnd = new Random(unpredictableSeed);

    for (int i; i < planetCount; i++)
    {
        planets ~= atsl.models.planet.factory(window, uniform(20 + 30, 980 - 30, rnd), y);

    }

    return planets;
}

void loadRandomEncounter(sdl_window main_window, sdl_event_listener keyboard)
{
    auto rnd = new Random(unpredictableSeed);
    int encounter = uniform(1, 2, rnd);

    encounter = 1;

    switch (encounter)
    {
    case 1:
        {
            atsl.scenes.encounters.encounter_one.init(main_window, keyboard);
        }
    case 2:
        {
            //       atsl.scenes.encounter_two.run(main_window, keyboard);
        }
    default:
        {
            //      atsl.scenes.encounter_one.run(main_window, keyboard);
        }
    }

}
