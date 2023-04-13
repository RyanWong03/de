#using scripts\shared\ai\zombie_utility;
#using scripts\zm\_zm_zonemgr;
#using scripts\shared\flag_shared;

#namespace fixed_zombie_speed;

function main()
{
	thread zombie_speed();
}

function zombie_speed()
{
	level flag::wait_till("initial_blackscreen_passed");
	//if(level.round_number )
	zombie_utility::set_zombie_var( "zombie_move_speed_multiplier", 20, true );
	//zombie_utility::set_zombie_var( "zombie_move_speed_multiplier_easy", 20, true );
	level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
}