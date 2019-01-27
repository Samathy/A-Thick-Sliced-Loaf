module atsl.models.saucer;

import primordial.models.container;
import primordial.models.component;
import primordial.primitives.shapes;
import primordial.sdl.display;

import primordial.colors : white;


static public model_container saucer;

void init(sdl_window window, int x, int y)
{
    saucer = factory(window, x, y);
}

model_container factory(sdl_window window, int x, int y)
{
    model_container saucer = new model_container("saucer", x, y, 1);

    line_circle dome = new line_circle(0,0, 20, white, window.get_renderer());

    model_component dome_c = new model_component(dome, function(int x, int y, renderable_abstract_object renderable)
            {
                renderable.setx(x);
                renderable.sety(y);
            });

    saucer.addComponent(dome_c);

    line_rectangle base = new line_rectangle(0,0,60,15, white, window.get_renderer());
    
    model_component base_c = new model_component(base, function(int x, int y, renderable_abstract_object renderable)
            {
                renderable.setx(x-30);
                renderable.sety(y+5);
                }
            );

    saucer.addComponent(base_c);

    return saucer;
}
