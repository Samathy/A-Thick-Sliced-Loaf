module atsl.models.encounterOne.explaination;

import primordial.primitives.shapes;
import primordial.models.container;
import primordial.models.component;
import primordial.sdl.display;
import primordial.colors;

static model_container encounterone_text;

private
{
    static string explaination_text_1 = "Hello! We are the Elbas.";
    static string explaination_text_2 = "We hear that you're looking for a new home?";
    static string explaination_text_3 = "You can join us, we have a thriving world";
    static string explaination_text_4 = "where everyone has a high-tech job and money is no object. Come with us?";

    text explaination_text_t1;
    text explaination_text_t2;
    text explaination_text_t3;
    text explaination_text_t4;

}

public void init(sdl_window window, int x, int y)
{

    encounterone_text = new model_container("encounter_one text", 320, 500, 0);

    explaination_text_t1 = new text(explaination_text_1, 0, 0, white, 12, window.get_renderer());
    explaination_text_t2 = new text(explaination_text_2, 0, 0, white, 12, window.get_renderer());
    explaination_text_t3 = new text(explaination_text_3, 0, 0, white, 12, window.get_renderer());
    explaination_text_t4 = new text(explaination_text_4, 0, 0, white, 12, window.get_renderer());

    model_component explaination_text_t1_c = new model_component(explaination_text_t1,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y);
                renderable.centered(s);
            });

    model_component explaination_text_t2_c = new model_component(explaination_text_t2,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 15);
            });

    model_component explaination_text_t3_c = new model_component(explaination_text_t3,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 45);
            });

    model_component explaination_text_t4_c = new model_component(explaination_text_t4,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 60);
            });

    encounterone_text.addComponent(explaination_text_t1_c);
    encounterone_text.addComponent(explaination_text_t2_c);
    encounterone_text.addComponent(explaination_text_t3_c);
    encounterone_text.addComponent(explaination_text_t4_c);

}
