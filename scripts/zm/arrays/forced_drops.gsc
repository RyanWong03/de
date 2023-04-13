#using scripts\shared\array_shared;
#using scripts\zm\_zm_zonemgr;

#namespace forced_drops;

#define DROP_DEFAULT_FUNC &drop_default
#define DROP_IN_ZONE_FUNC &drop_powerup_in_zone
#define DROP_IN_ZONE(zone,inside) array(zone,inside)
#define DROP_INSIDE(zone) DROP_IN_ZONE(zone,true)
#define DROP_OUTSIDE(zone) DROP_IN_ZONE(zone,false)

#define CASTLE_FORCED_DROP_0 array("nuke",1,true)
#define CASTLE_FORCED_DROP_1 array("double_points",2,true)
#define CASTLE_FORCED_DROP_2 array("full_ammo",3,true,DROP_IN_ZONE_FUNC,DROP_INSIDE("zone_v10_pad"))
#define CASTLE_FORCED_DROP_3 array("insta_kill",4,true)

#define CASTLE_FORCED_DROPS array(CASTLE_FORCED_DROP_0,CASTLE_FORCED_DROP_1,CASTLE_FORCED_DROP_2,CASTLE_FORCED_DROP_3)


// index definitions for this script to use
#define DROP_NAME_INDEX 0
#define DROP_ROUND_INDEX 1
#define DROP_B_WAIT_INDEX 2
#define DROP_FUNC_INDEX 3
#define DROP_FUNC_ARG_INDEX 4

function init()
{
	forced_drops_list();
	level.forced_drop_functions = array();
	for (i = 0; i < level.forced_drops.size; i++)
	{
		level.forced_drop_functions[i] = SpawnStruct();
		level.forced_drop_functions[i].func = ( isdefined(level.forced_drops[i][DROP_FUNC_INDEX]) ? level.forced_drops[i][DROP_FUNC_INDEX] : DROP_DEFAULT_FUNC);
		level.forced_drop_functions[i].arg = (isdefined(level.forced_drops[i][DROP_FUNC_ARG_INDEX]) ? level.forced_drops[i][DROP_FUNC_ARG_INDEX] : array());
	}
}

function forced_drops_list()
{
 	switch (GetDvarString("mapname"))
 	{
 		case "zm_castle":
 			level.forced_drops = CASTLE_FORCED_DROPS;
 			break;
 	}
}


function drop_powerup_in_zone(a_zone)
{
	if (!IsArray(a_zone)) a_zone = array(a_zone);
	str_zone = (isdefined(a_zone[0]) ? a_zone[0] : "zone_start");
	b_drop_in_zone = (isdefined(a_zone[1]) ? a_zone[1] : true);
	p_id = (isdefined(a_zone[2]) ? a_zone[2] : 0);
	player = GetPlayers()[p_id];

	zone = player zm_zonemgr::get_player_zone();
	if (!IsArray(str_zone)) str_zone = array(str_zone);
	b_ret = false;
	foreach (z in str_zone)
	{
		if ( (zone != z && !b_drop_in_zone) || (zone == z && b_drop_in_zone) )
		{
			b_ret = true;
			break;
		}
	}
	return b_ret;
}


function drop_default(a_arg)
{
	return true;
}