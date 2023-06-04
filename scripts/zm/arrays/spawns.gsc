#using scripts\codescripts\struct;
#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;
#using scripts\zm\arrays\bgb_common;
#using scripts\zm\_zm_zonemgr;

#namespace spawns;

#define ROUND(num) array(&round_func,array(num))

#define ENTRY_START_1 (475,1277,152)
#define ENTRY_START_2 (864,834,-8)
#define ENTRY_HALL_BACK (-1074,3955,664)
#define ENTRY_LCOURTYARD (1730,2679,383)
#define ENTRY_UNDER_DRAGON (-1130,1850,200)
#define ENTRY_CLOCKTOWER (-1364,1504,808)
#define ENTRY_GATEHOUSE (1832,1514,400)
// #define ENTRY_VOID (-660,1290,505)
#define ENTRY_VOID (-538, 1069, 504)
#define ENTRY_CRACKLE (-77,1885,912)
#define ENTRY_OPP_CRACKLE (498,1885,912)
#define ENTRY_DT_CIRCLE (1050,896,144)
#define ENTRY_YARD_SIMON (-509,1970,608)
#define ENTRY_ROCKET (5531,2430,-2292)
#define ENTRY_CLOCK_TOWER (-1440,1707,680)
#define ENTRY_POWER (-57,3496,808)

#define REF_POINT_INDEX 0
#define NUM_Z_INDEX 1
#define FUNC_INDEX 2

//Solo spawns with megas 
#define SOLOSPAWN_0 array(ENTRY_HALL_BACK,5,array(ROUND(2)))
#define SOLOSPAWN_1 array(ENTRY_LCOURTYARD,5,array(ROUND(3)))
#define SOLOSPAWN_2 array(ENTRY_UNDER_DRAGON,6,array(ROUND(4)))
#define SOLOSPAWN_3 array(ENTRY_GATEHOUSE,5,array(ROUND(6)))
#define SOLOSPAWN_4 array(ENTRY_CLOCKTOWER,5,array(ROUND(6)))
#define SOLOSPAWN_5 array(ENTRY_UNDER_DRAGON,8,array(ROUND(7)))

//Duo spawns with megas 
#define DUOSPAWN_0 array(ENTRY_LCOURTYARD,6,array(ROUND(2)))
#define DUOSPAWN_1 array(ENTRY_LCOURTYARD,5,array(ROUND(3)))
#define DUOSPAWN_2 array(ENTRY_HALL_BACK,5,array(ROUND(3)))
#define DUOSPAWN_3 array(ENTRY_HALL_BACK,6,array(ROUND(4)))
#define DUOSPAWN_4 array(ENTRY_UNDER_DRAGON,6,array(ROUND(4)))
#define DUOSPAWN_5 array(ENTRY_GATEHOUSE,7,array(ROUND(6)))
#define DUOSPAWN_6 array(ENTRY_VOID,2,array(ROUND(6)))
#define DUOSPAWN_7 array(ENTRY_CLOCKTOWER,15,array(ROUND(6)))
//#define DUOSPAWN_8 array(ENTRY_CRACKLE,6,array(ROUND(7)))
//#define DUOSPAWN_9 array(ENTRY_OPP_CRACKLE,6,array(ROUND(7)))
#define DUOSPAWN_8 array(ENTRY_UNDER_DRAGON,20,array(ROUND(7)))
#define DUOSPAWN_9 array(ENTRY_UNDER_DRAGON,20,array(ROUND(8)))
#define DUOSPAWN_10 array(ENTRY_UNDER_DRAGON,20,array(ROUND(9)))

//Trio spawns with round robbin
#define TRIOSPAWN_0 array(ENTRY_HALL_BACK,5,array(ROUND(3)))
#define TRIOSPAWN_1 array(ENTRY_UNDER_DRAGON,5,array(ROUND(3)))
#define TRIOSPAWN_2 array(ENTRY_LCOURTYARD,5,array(ROUND(3)))
#define TRIOSPAWN_3 array(ENTRY_UNDER_DRAGON,6,array(ROUND(4)))
#define TRIOSPAWN_4 array(ENTRY_HALL_BACK,6,array(ROUND(4)))
#define TRIOSPAWN_5 array(ENTRY_LCOURTYARD,6,array(ROUND(4)))
//#define TRIOSPAWN_6 array(ENTRY_DT_CIRCLE,7,array(ROUND(7)))
#define TRIOSPAWN_6 array(ENTRY_GATEHOUSE,7,array(ROUND(7)))
#define TRIOSPAWN_7 array(ENTRY_VOID,3,array(ROUND(7)))
#define TRIOSPAWN_8 array(ENTRY_CLOCKTOWER,6,array(ROUND(7)))
#define TRIOSPAWN_9 array(ENTRY_CRACKLE,7,array(ROUND(7)))
#define TRIOSPAWN_10 array(ENTRY_OPP_CRACKLE, 7, array(ROUND(7)))
#define TRIOSPAWN_11 array(ENTRY_DT_CIRCLE,8,array(ROUND(8)))
#define TRIOSPAWN_12 array(ENTRY_UNDER_DRAGON,20,array(ROUND(9)))

//Quad spawns with round robbin
#define QUADSPAWN_0 array(ENTRY_POWER,2,array(ROUND(3)))
#define QUADSPAWN_1 array(ENTRY_UNDER_DRAGON,5,array(ROUND(3)))
#define QUADSPAWN_2 array(ENTRY_HALL_BACK,5,array(ROUND(3)))
#define QUADSPAWN_3 array(ENTRY_LCOURTYARD,6,array(ROUND(3)))
#define QUADSPAWN_4 array(ENTRY_UNDER_DRAGON,7,array(ROUND(4)))
#define QUADSPAWN_5 array(ENTRY_HALL_BACK,6,array(ROUND(4)))
#define QUADSPAWN_6 array(ENTRY_LCOURTYARD,7,array(ROUND(4)))
#define QUADSPAWN_7 array(ENTRY_VOID,2,array(ROUND(6)))
#define QUADSPAWN_8 array(ENTRY_DT_CIRCLE,10,array(ROUND(7)))
#define QUADSPAWN_9 array(ENTRY_GATEHOUSE,8,array(ROUND(7)))
#define QUADSPAWN_10 array(ENTRY_CRACKLE,10,array(ROUND(8)))
#define QUADSPAWN_11 array(ENTRY_UNDER_DRAGON,20,array(ROUND(8)))
#define QUADSPAWN_12 array(ENTRY_CRACKLE,16,array(ROUND(8)))
#define QUADSPAWN_13 array(ENTRY_DT_CIRCLE,10,array(ROUND(8)))
#define QUADSPAWN_14 array(ENTRY_UNDER_DRAGON,20,array(ROUND(9)))
#define QUADSPAWN_15 array(ENTRY_UNDER_DRAGON,8,array(ROUND(9)))


#define SOLO_FIXED_SPAWNS array(SOLOSPAWN_0,SOLOSPAWN_1,SOLOSPAWN_2,SOLOSPAWN_3,SOLOSPAWN_4,SOLOSPAWN_5)
#define DUO_FIXED_SPAWNS array(DUOSPAWN_0,DUOSPAWN_1,DUOSPAWN_2,DUOSPAWN_3,DUOSPAWN_4,DUOSPAWN_5,DUOSPAWN_6,DUOSPAWN_7,DUOSPAWN_8,DUOSPAWN_9,DUOSPAWN_10)
#define TRIO_FIXED_SPAWNS array(TRIOSPAWN_0,TRIOSPAWN_1,TRIOSPAWN_2,TRIOSPAWN_3,TRIOSPAWN_4,TRIOSPAWN_5,TRIOSPAWN_6,TRIOSPAWN_7,TRIOSPAWN_8,TRIOSPAWN_9,TRIOSPAWN_10, TRIOSPAWN_11, TRIOSPAWN_12)
#define QUAD_FIXED_SPAWNS array(QUADSPAWN_0,QUADSPAWN_1,QUADSPAWN_2,QUADSPAWN_3,QUADSPAWN_4,QUADSPAWN_5,QUADSPAWN_6,QUADSPAWN_7,QUADSPAWN_8,QUADSPAWN_9,QUADSPAWN_10,QUADSPAWN_11,QUADSPAWN_12,QUADSPAWN_13,QUADSPAWN_14,QUADSPAWN_15)

#define SYSTEM_NAME "fixed_z_spawns"

function init()
{
	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM,&random_override);
	thread main();
}

function random_override(array)
{
	if (IsInArray(level.zm_loc_types["zombie_location"],array[0]) && !level.fixed_spawns_done)
	{
		if ([[level.next_fixed_spawn.can_spawn_func]](array))
		{
			should_spawn = 1;
			foreach (f in level.next_fixed_spawn.condition_func)
			{
				if (![[f.func]](f.arg))
				{
					should_spawn = 0;
					break;
				}
			}
			if (should_spawn)
			{
				desired = [[level.next_fixed_spawn.loc_func]](array);
				level notify("next_fixed_spawn");
				if (isdefined(desired))
				{
					return desired;
				}
			}
		}
		
	}
}

function main()
{
	map = GetDvarString("mapname");
	switch(map)
	{
		case "zm_castle":
			if (GetPlayers().size == 1)	level.fixed_spawns = SOLO_FIXED_SPAWNS;
			else if(GetPlayers().size == 2) level.fixed_spawns = DUO_FIXED_SPAWNS;
			else if(GetPlayers().size == 3) level.fixed_spawns = TRIO_FIXED_SPAWNS;
			else if(GetPlayers().size == 4) level.fixed_spawns = QUAD_FIXED_SPAWNS;
			break;
	}

	level.fixed_spawns_done = 0;
	level.fixed_spawns_index = 0;
	level.next_fixed_spawn = SpawnStruct();
	level.next_fixed_spawn.can_spawn_func = &can_do_fixed_spawn;
	level.next_fixed_spawn.loc_func = &get_spawn_loc;

	while (isdefined(level.fixed_spawns[level.fixed_spawns_index]))
	{
		level.next_fixed_spawn.ref_point = level.fixed_spawns[level.fixed_spawns_index][REF_POINT_INDEX];
		level.next_fixed_spawn.zone = get_zone_from_ref_point(level.next_fixed_spawn.ref_point);
		level.next_fixed_spawn.n_zombie_total = level.fixed_spawns[level.fixed_spawns_index][NUM_Z_INDEX];
		level.next_fixed_spawn.n_zombies = 0;
		level.next_fixed_spawn.condition_func = array();

		for (i = 0; i < level.fixed_spawns[level.fixed_spawns_index][FUNC_INDEX].size; i++)
		{
			func_data = level.fixed_spawns[level.fixed_spawns_index][FUNC_INDEX][i];
			array::add(level.next_fixed_spawn.condition_func, SpawnStruct());
			level.next_fixed_spawn.condition_func[i].func = func_data[0];
			level.next_fixed_spawn.condition_func[i].arg = func_data[1];
		}

		while (level.next_fixed_spawn.n_zombies < level.next_fixed_spawn.n_zombie_total)
		{
			level waittill("next_fixed_spawn");
			level.next_fixed_spawn.n_zombies++;
		}

		level.fixed_spawns_index++;
	}
	level.fixed_spawns_done = 1;
	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM);
}

function can_do_fixed_spawn(a_points)
{	
	zone = level.next_fixed_spawn.zone;
	zone_spawners = zone + "_spawners";
	if (!isdefined(zone)) return 1;
	b_ret = 0;
	id = 0;
	for (i = 0; i < a_points.size; i++)
	{
		if (a_points[i].targetname == zone_spawners)
		{
			id = i;
			b_ret = 1;
			break;
		}
	}
	return b_ret;
}

function get_spawn_loc(a_points)
{
	return ArrayGetClosest(level.next_fixed_spawn.ref_point,a_points);
}

function round_func(a_args)
{
	if (!IsArray(a_args)) a_args = array(a_args);
	n_rnd = a_args[0];
	return (level.round_number >= n_rnd);
}

function get_zone_from_ref_point(ref_point)
{
	zone = zm_zonemgr::get_zone_from_position(ref_point + VectorScale((0, 0, 1), 32), 0);
	if (!isdefined(zone)) 
	{
		playable_area = GetEntArray("player_volume","script_noteworthy");
		zone = ArrayGetClosest(ref_point,playable_area).targetname;
	}
	return zone;
}