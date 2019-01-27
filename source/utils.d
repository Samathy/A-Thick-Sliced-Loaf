module atsl.utils;

import std.random;

import primordial.sdl.display;
import primordial.models.container;

import atsl.models.planet;

model_container[] generatePlanets(sdl_window window, int planetCount)
{
    static immutable int y = 30;
    model_container[] planets;

    auto rnd = new Random(unpredictableSeed);

    for (int i; i < planetCount; i++)
    {
        planets ~= atsl.models.planet.factory(window, uniform(20, 980, rnd), y);

    }

    return planets;
}
