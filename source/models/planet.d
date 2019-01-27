module atsl.models.planet;

import primordial.sdl.display;
import primordial.primitives.shapes : renderable_abstract_object, line_circle;
import primordial.models.container;
import primordial.models.component;
import primordial.colors : white;

public static model_container planet;

void init(sdl_window window, int x, int y)
{

    planet = new model_container("planet", x, y, 2);

    line_circle circle = new line_circle(0, 0, 30, white, window.get_renderer());

    model_component circle_c = new model_component(circle, function(int x, int y,
            renderable_abstract_object renderable) {
        renderable.setx(x);
        renderable.sety(y);
    });

    planet.addComponent(circle_c);
}

// Unlike init() this returns a new instance of a planet
// instead a global model instance
model_container factory(sdl_window window, int x, int y)
{
    model_container nplanet = new model_container("planet", x, y, 2);

    line_circle circle = new line_circle(0, 0, 30, white, window.get_renderer());

    model_component circle_c = new model_component(circle, function(int x, int y,
            renderable_abstract_object renderable) {
        renderable.setx(x);
        renderable.sety(y);
    });

    nplanet.addComponent(circle_c);

    return nplanet;

}
