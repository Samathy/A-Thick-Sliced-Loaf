module atsl.models.game_over_model;

import primordial.sdl.display;
import primordial.primitives.shapes;
import primordial.models.container;
import primordial.models.component;
import primordial.colors : white;

public static model_container game_over_text;

private
{
    static string game_over_line1 = "GAME OVER";
    static string game_over_line2 = "You collided with too many planets!";
    static string game_over_line3 = "Your adventure is over.";
    static string game_over_line4 = "You'll never learn how wonderful your home really is.";

    text game_over1;
    text game_over2;
    text game_over3;
    text game_over4;
}

void init(sdl_window window, int x, int y)
{

    game_over_text = new model_container("game over", x, y, 0);

    game_over1 = new text(game_over_line1, 0, 0, white, 12, window.get_renderer());
    game_over2 = new text(game_over_line2, 0, 0, white, 12, window.get_renderer());
    game_over3 = new text(game_over_line3, 0, 0, white, 12, window.get_renderer());
    game_over4 = new text(game_over_line4, 0, 0, white, 12, window.get_renderer());

    model_component game_over1_c = new model_component(game_over1,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y);
                renderable.centered(s);
            });

    model_component game_over2_c = new model_component(game_over2,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 15);
            });

    model_component game_over3_c = new model_component(game_over3,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 30);
            });

    model_component game_over4_c = new model_component(game_over4,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 45);
            });

    game_over_text.addComponent(game_over1_c);
    game_over_text.addComponent(game_over2_c);
    game_over_text.addComponent(game_over3_c);
    game_over_text.addComponent(game_over4_c);
}
