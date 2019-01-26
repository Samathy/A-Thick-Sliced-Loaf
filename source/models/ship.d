module atsl.models.ship;

import primordial.models.container;
import primordial.models.component;
import primordial.primitives.shapes;
import primordial.sdl.display;

import primordial.colors : white, red;

static public model_container ship;

void init(sdl_window window, int x, int y)
{
    immutable triangle_height = 100;
    immutable triangle_width = 100;

    ship = new model_container("ship", x, y, 1);

    line_triangle top = new line_triangle(0, 0, triangle_width,
            triangle_height, white, window.get_renderer());

    model_component top_tri = new model_component(top, function(int x, int y,
            renderable_abstract_object renderable) {
        renderable.setx(x);
        renderable.sety(y);
    });

    ship.addComponent(top_tri);

    line_circle enginel = new line_circle(0, 0, 10, white, window.get_renderer());
    line_circle enginer = new line_circle(0, 0, 10, white, window.get_renderer());

    model_component left_engine = new model_component(enginel, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x - 30); //Should be triangle height/width 
        renderable.sety(y + 60); //but this is a function, not a delegate
    });

    model_component right_engine = new model_component(enginer, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x + 30);
        renderable.sety(y + 60);
    });

    ship.addComponent(left_engine);
    ship.addComponent(right_engine);

    line jet1r = new line(0, 0, -4, +5, white, window.get_renderer());

    model_component right_jet_1 = new model_component(jet1r, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x + 25);
        renderable.sety(y + 70);
    });

    ship.addComponent(right_jet_1);

    line jet2r = new line(0, 0, -4, -5, white, window.get_renderer());

    model_component right_jet_2 = new model_component(jet2r, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x + 40);
        renderable.sety(y + 75);
    });

    ship.addComponent(right_jet_2);

    line jet1l = new line(0, 0, -4, -5, white, window.get_renderer());

    model_component left_jet_1 = new model_component(jet1l, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x - 20);
        renderable.sety(y + 75);
    });

    ship.addComponent(left_jet_1);

    line jet2l = new line(0, 0, -4, +5, white, window.get_renderer());

    model_component left_jet_2 = new model_component(jet2l, function(int x,
            int y, renderable_abstract_object renderable) {
        renderable.setx(x - 38);
        renderable.sety(y + 68);
    });

    ship.addComponent(left_jet_2);

    line jet2midl = new line(0, 0, 0, -9, white, window.get_renderer());

    model_component left_middle_jet_1 = new model_component(jet2midl,
            function(int x, int y, renderable_abstract_object renderable) {
                renderable.setx(x - 30);
                renderable.sety(y + 79);
            });

    ship.addComponent(left_middle_jet_1);

    line jet2midr = new line(0, 0, 0, -9, white, window.get_renderer());

    model_component right_middle_jet_1 = new model_component(jet2midr,
            function(int x, int y, renderable_abstract_object renderable) {
                renderable.setx(x + 30);
                renderable.sety(y + 79);
            });

    ship.addComponent(right_middle_jet_1);

}
