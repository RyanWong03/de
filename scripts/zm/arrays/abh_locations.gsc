#using scripts\codescripts\struct;
#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\arrays\bgb_common;
#using scripts\zm\_zm_zonemgr;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace abh_locations;

#define LOBBY_INDEX bgb_common::get_lobby_index()
#define COOP_CASTLE_ABH_ZONES array("zone_v10_pad_exterior","zone_undercroft","zone_v10_pad","zone_gatehouse","zone_rooftop","zone_clocktower","zone_clocktower","zone_clocktower")
#define SOLO_CASTLE_ABH_ZONES array("zone_rooftop","zone_gatehouse","zone_undercroft","zone_rooftop","zone_clocktower")
#define DUO_CASTLE_ABH_ZONES array("zone_gatehouse","zone_undercroft","zone_rooftop","zone_clocktower")
#define SYSTEM_NAME "abh_locations"

function init()
{
	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM,&random_override);
	thread main();
}

function random_override(array)
{
	if (level flag::get("initial_blackscreen_passed") && !level.abh_done)
	{
		if (array[0].targetname == "player_respawn_point")
		{
			foreach (sp in array)
			{
				zone = zm_zonemgr::get_zone_from_position(sp.origin + VectorScale((0, 0, 1), 32), 0);
				if (zone == level.next_abh)
				{
					level notify("next_abh_zone_reached");
					return sp;
				}
			}
		}
	}
}

function main()
{
	abh_zones_lists();
	level.abh_done = false;
	level.desired_zones = level.abh_zones;
	level.abh_index = 0;

	while (1)
	{
		level.next_abh = level.desired_zones[level.abh_index];
		level waittill("next_abh_zone_reached");
		wait 2;
		level.abh_index++;
		if (level.abh_index >= level.desired_zones.size) break;
	}
	level.abh_done = true;
	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM);
}

function abh_zones_lists()
{
	level.abh_zones = undefined;
	switch (GetDvarString("mapname"))
	{
		case "zm_castle":
			if(GetPlayers().size == 1) level.abh_zones = SOLO_CASTLE_ABH_ZONES;
			else if(GetPlayers().size == 2) level.abh_zones = DUO_CASTLE_ABH_ZONES;
			else level.abh_zones = COOP_CASTLE_ABH_ZONES;
			break;
	}
}