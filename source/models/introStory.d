module atsl.models.intro_story;

import primordial.models.container;
import primordial.models.component;
import primordial.primitives.shapes : renderable_abstract_object, text;
import primordial.sdl.display;
import primordial.colors : white;

public static model_container intro_story_text;

private
{
    static string story_string_line1 = "You have left home in your brother's ship after a heated argument with your parents.";
    static string story_string_line2 = "where the point of contention,  amongst other things, a loaf of bread.";
    static string story_string_line3 = "You're angry with your home life, as all teenagers are.";
    static string story_string_line4 = "You're flying toward your future, looking for a new home, a new world, a new family";
    static string story_string_line5 = "Avoid the planets with your left and right keys, or A and D, Enter is your action key.";
    static string story_string_line6 = "Seek out a new home.";
}

private text story_line1;
private text story_line2;
private text story_line3;
private text story_line4;
private text story_line5;
private text story_line6;

void init(sdl_window window, int x, int y)
{

    //model_component taking a function() not a delegate() is really annoying.
    //Lots of duplicate code here, we could probably do this better.

    intro_story_text = new model_container("intro story", x, y, 0);

    story_line1 = new text(story_string_line1, 0, 0, white, 12, window.get_renderer());
    story_line2 = new text(story_string_line2, 0, 0, white, 12, window.get_renderer());
    story_line3 = new text(story_string_line3, 0, 0, white, 12, window.get_renderer());
    story_line4 = new text(story_string_line4, 0, 0, white, 12, window.get_renderer());
    story_line5 = new text(story_string_line5, 0, 0, white, 12, window.get_renderer());
    story_line6 = new text(story_string_line6, 0, 0, white, 12, window.get_renderer());

    model_component story_line1_c = new model_component(story_line1,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y);
                renderable.centered(s);
            });

    model_component story_line2_c = new model_component(story_line2,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 15);
            });

    model_component story_line3_c = new model_component(story_line3,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 45);
            });

    model_component story_line4_c = new model_component(story_line4,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 60);
            });

    model_component story_line5_c = new model_component(story_line5,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 75);
            });

    model_component story_line6_c = new model_component(story_line6,
            function(int x, int y, renderable_abstract_object renderable) {
                screen_dimensions s = {640, 1000}; //Ew, hardcoded....
                renderable.setx(x);
                renderable.sety(y + 15);
                renderable.centered(s);
                renderable.sety(renderable.gety() + 90);
            });

    intro_story_text.addComponent(story_line1_c);
    intro_story_text.addComponent(story_line2_c);
    intro_story_text.addComponent(story_line3_c);
    intro_story_text.addComponent(story_line4_c);
    intro_story_text.addComponent(story_line5_c);
    intro_story_text.addComponent(story_line6_c);
}
