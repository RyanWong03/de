#using scripts\codescripts\struct;

#using scripts\shared\audio_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\flagsys_shared;
#using scripts\shared\fx_shared;
#using scripts\shared\demo_shared;
#using scripts\shared\hud_message_shared;
#using scripts\shared\load_shared;
#using scripts\shared\lui_shared;
#using scripts\shared\music_shared;
#using scripts\shared\_oob;
#using scripts\shared\scene_shared;
#using scripts\shared\serverfaceanim_shared;
#using scripts\shared\system_shared;
#using scripts\shared\turret_shared;
#using scripts\shared\util_shared;
#using scripts\shared\vehicle_shared;
#using scripts\shared\archetype_shared\archetype_shared;
#using scripts\shared\abilities\_ability_player;	
#using scripts\shared\ai\zombie_utility;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#using scripts\zm\_zm;
#using scripts\zm\gametypes\_spawnlogic;
#using scripts\zm\_destructible;
#using scripts\zm\_util;
#using scripts\zm\_zm_spawner;
#using scripts\zm\gametypes\_clientids;
#using scripts\zm\gametypes\_scoreboard;
#using scripts\zm\gametypes\_serversettings;
#using scripts\zm\gametypes\_shellshock;
#using scripts\zm\gametypes\_spawnlogic;
#using scripts\zm\gametypes\_spectating;
#using scripts\zm\gametypes\_weaponobjects;
#using scripts\zm\_art;
#using scripts\zm\_callbacks;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_behavior;
#using scripts\zm\_zm_blockers;
#using scripts\zm\_zm_bot;
#using scripts\zm\_zm_clone;
#using scripts\zm\_zm_devgui;
#using scripts\zm\_zm_magicbox;
#using scripts\zm\_zm_playerhealth;
#using scripts\zm\_zm_weapons;
#using scripts\zm\gametypes\_weaponobjects;
#using scripts\zm\_zm_power;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_stats;
#using scripts\zm\_zm_traps;
#using scripts\zm\_zm_unitrigger;
#using scripts\zm\_zm_zonemgr;

//custom files
#using scripts\zm\_zm_ai_dogs;
#using scripts\zm\_zm_perks;
#using scripts\zm\castle_wisps;
#using scripts\zm\castle_keeper;
#using scripts\zm\arrays\abh_locations;
#using scripts\zm\hud\timer;
#using scripts\zm\hud\zombie_counter;
#using scripts\zm\arrays\spawns;
#using scripts\zm\void_symbols;
#using scripts\zm\fireplace;
#using scripts\zm\simon_says;
//#using scripts\zm\keeper_bow_order;
#using scripts\zm\arrays\fixed_zombie_speed;
#using scripts\zm\panzers;
#using scripts\zm\arrays\player_spawn_points;
#using scripts\zm\hud\rocket_timer;

#precache( "fx", "_t6/bio/player/fx_footstep_dust" );
#precache( "fx", "_t6/bio/player/fx_footstep_sand" );
#precache( "fx", "_t6/bio/player/fx_footstep_mud" );
#precache( "fx", "_t6/bio/player/fx_footstep_water" );

#namespace load;

function main()
{
	zm::init();
	level._loadStarted = true;
	register_clientfields();
	level.aiTriggerSpawnFlags = getaitriggerflags();
	level.vehicleTriggerSpawnFlags = getvehicletriggerflags();
	level thread start_intro_screen_zm();
	setup_traversals();
 	footsteps();
	system::wait_till( "all" );
	level thread load::art_review();
	level thread debug();
	level thread castle_wisps::init();
	level thread castle_keeper_route::init();
	level thread abh_locations::init();
	level thread spawns::init();
	level thread show_custom_hud_elements();
	level thread void_symbols::init();
	level thread fireplace::init();
	level thread simon_says::init();
	//level thread castle_bow_order::init();
	level thread fixed_zombie_speed::main();
	level thread panzers::init();
	level thread initial_spawn_points::init();

	//SetDvar("zm_private_rankedmatch",1);

	//level thread bow();
 	level flagsys::set( "load_main_complete" );
}

function bow()
{
	if(!level.rankedMatch && !GetDvarInt("zm_private_rankedmatch"))
	{
		level.var_dfc343e9 = 0;
	}
}
function debug()
{
	level flag::wait_till("initial_blackscreen_passed");
	wait 8;

	// level flag::set("power_on");
	// level flag::set("soul_catchers_charged");
	
	pl = GetPlayers()[0];

	weapon = GetWeapon("bowie_knife");
	pl zm_weapons::weapon_give(weapon, 0, 0, 1);
}

function footsteps()
{
	if ( IS_TRUE( level.FX_exclude_footsteps ) ) 
	{
		return;
	}
	zombie_utility::setFootstepEffect( "asphalt",  "_t6/bio/player/fx_footstep_dust" ); 
	zombie_utility::setFootstepEffect( "brick",    "_t6/bio/player/fx_footstep_dust" );
	zombie_utility::setFootstepEffect( "carpet",   "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "cloth",    "_t6/bio/player/fx_footstep_dust" );
	zombie_utility::setFootstepEffect( "concrete", "_t6/bio/player/fx_footstep_dust" ); 
	zombie_utility::setFootstepEffect( "dirt",     "_t6/bio/player/fx_footstep_sand" );
	zombie_utility::setFootstepEffect( "foliage",  "_t6/bio/player/fx_footstep_sand" );  
	zombie_utility::setFootstepEffect( "gravel",   "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "grass",    "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "metal",    "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "mud",      "_t6/bio/player/fx_footstep_mud" ); 
	zombie_utility::setFootstepEffect( "paper",    "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "plaster",  "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "rock",     "_t6/bio/player/fx_footstep_dust" );  
	zombie_utility::setFootstepEffect( "sand",     "_t6/bio/player/fx_footstep_sand" );  
	zombie_utility::setFootstepEffect( "water",    "_t6/bio/player/fx_footstep_water" );
	zombie_utility::setFootstepEffect( "wood",     "_t6/bio/player/fx_footstep_dust" ); 
}

function setup_traversals()
{
}

function start_intro_screen_zm( )
{
	players = GetPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] lui::screen_fade_out( 0, undefined );
		players[i] freezecontrols(true);
	}
	wait 1;
}

function register_clientfields()
{
	clientfield::register( "allplayers", "zmbLastStand", VERSION_SHIP, 1, "int" );
	clientfield::register( "clientuimodel", "zmhud.swordEnergy", VERSION_SHIP, 7, "float" ); // energy: 0 to 1
	clientfield::register( "clientuimodel", "zmhud.swordState", VERSION_SHIP, 4, "int" ); // state: 0 = hidden, 1 = charging, 2 = ready, 3 = inuse, 4 = unavailable (grey), 5 = ele-charging, 6 = ele-ready, 7 = ele-inuse,
	clientfield::register( "clientuimodel", "zmhud.swordChargeUpdate", VERSION_SHIP, 1, "counter" );
}

function show_custom_hud_elements()
{
	host = GetPlayers()[0];

	thread zombie_counter::init();
	thread zombie_timer::init();
	thread rocket_test_timer::main();
}
