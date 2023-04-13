#using scripts\shared\flag_shared;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace initial_spawn_points;

#define SYSTEM_NAME "initial_spawn_points"

function init()
{
	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE,&randomize_override);
	thread main();
}

function randomize_override(array)
{
	if(!level flag::get("initial_blackscreen_passed"))
	{
		if(isdefined(level.fixed_player_spawn_points))
		{
			if(array[0].targetname == "initial_spawn_points")
			{
				a_ret = array();
				for (i = 0; i < array.size; i++)
				{
					index = level.fixed_player_spawn_points[i];
					if (!isdefined(index)) index = i;
					a_ret[i] = array[index];
				}
				return a_ret;
			}
		}
	}
}

function main()
{
	level.fixed_player_spawn_points = spawn_points_for_map();
	level flag::wait_till("initial_blackscreen_passed");
	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE);
}

#define CASTLE array(0,1,2,3)

function spawn_points_for_map()
{
	switch (GetDvarString("mapname"))
	{
		case "zm_castle":
			return CASTLE;
	}
}


