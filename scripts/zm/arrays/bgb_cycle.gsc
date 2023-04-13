#using scripts\shared\array_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\arrays\bgb_common;
#insert scripts\zm\bgb_cycle.gsh;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace bgb_cycle;

#define SYSTEM_NAME "bgb_cycle"

function init()
{
	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE,&randomize_override);
	thread main();
}

function randomize_override(array)
{
	if (array.size == 5 && IsInArray(GetEntArray("bgb_machine_use", "targetname"),self))
	{
		bgb = true;

		if (!IsString(array[0])) bgb = false;

		if (bgb) 
		{
			fixed = true;

			pl = ArraySort(level.activeplayers, self.unitrigger_stub.origin)[0];

			id = pl bgb_common::get_lobby_index();

			if (!isdefined(level.bgb_array)) level.bgb_array = array;

			if (!isdefined(level.bgb_fixed_cycles[id][level.cycle_index[id]]))
			{
				fixed = false;
			}

			if (fixed)
			{
				//level flag::wait_till("bgb_megas_done");
				for (i = 0; i < 5; i++)
				{
					a_ret[i] = level.bgb_fixed_cycles[id][level.cycle_index[id]][i];
				}

				if (a_ret.size != array.size || !isdefined(a_ret) || IsInArray(a_ret,undefined) || !IsSubStr(a_ret[0],"zm_bgb"))
				{
					return array;
				}
				else
				{
					level notify("fresh_gum_cycle",id);
					return a_ret;
				}
			}
		}
	}
}

function main()
{
	level flag::wait_till("initial_players_connected");

	bgb_cycles_list();

	level.bgb_fixed_cycles = level.bgb_cycles;

	level.cycle_index = array(0,0,0,0);

	level.bgb_cycles_done = ArrayCopy(level.cycle_index);

	while (!bgb_cycles_done())
	{
		level waittill("fresh_gum_cycle",id);

		level.cycle_index[id]++;

		if (!isdefined(level.bgb_fixed_cycles[id][level.cycle_index[id]]))
			level.bgb_cycles_done[id] = 1;
	}

	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE);
}

function bgb_cycles_done()
{
	foreach (pl in level.bgb_cycles_done)
	{
		if (!pl) return 0;
	}
	return 1;
}

function bgb_cycles_list()
{
	level.bgb_cycles = undefined;

	if(GetPlayers().size == 1)
	{
		level.bgb_cycles = SOLO_BGB_CYCLES;
	}
	else if(GetPlayers().size == 2)
	{
		level.bgb_cycles = DUO_BGB_CYCLES;
	}
	else if(GetPlayers().size == 3)
	{
		level.bgb_cycles = TRIO_BGB_CYCLES;
	}
	else if(GetPlayers().size == 4)
	{
		level.bgb_cycles = QUAD_BGB_CYCLES;
	}
	
	
}