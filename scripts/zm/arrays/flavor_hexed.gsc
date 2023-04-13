#using scripts\codescripts\struct;
#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_zonemgr;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace flavor_hexed;

#define SYSTEM_NAME "flavor_hexed"

function init()
{
    REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM,&random_override);
    thread main();
}

function random_override(array)
{
    if(level flag::get("inital_blackscreen_passed") && !level.gum_done)
    {
        
    }
}