#using scripts\shared\flag_shared;
#insert scripts\shared\shared.gsh;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace castle_bow_order;

#define DEMONGATE 1
#define STORM 2
#define RUNE_PRISON 3
#define WOLF_HOWL 4

#define SOLO_ORDER array(STORM)
#define DUO_ORDER array(STORM,RUNE_PRISON)
#define TRIO_ORDER array(STORM,RUNE_PRISON,DEMONGATE)
#define QUAD_ORDER array(STORM,RUNE_PRISON,WOLF_HOWL,DEMONGATE)

#define SYSTEM_NAME "bows"

function init()
{
	if (GetDvarString("mapname") == "zm_castle")
	{
		REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE,&randomize_override);
		thread main();
	}
}

function randomize_override(array)
{
	if (array.size >= GetPlayers().size && level flag::get("start_channeling_stone_step") && !level.bow_order_done)
	{
		bow_order = true;
		for(i = 1; i <= array.size; i++)
		{
			if(array[i - 1] != i)
			{
				bow_order = false;
				break;
			}
		}
		if (bow_order)
		{
			ret = level.fixed_bow_order;
			level notify("bow_order_done");
			if (ret.size >= array.size)
			{
				return ret;
			}
		}
	}
}

function main()
{
	level.bow_order_done = 0;

	if (GetPlayers().size == 1)
	{
		level.fixed_bow_order = SOLO_ORDER;
	}
	else if(GetPlayers().size == 2)
	{
		level.fixed_bow_order = DUO_ORDER;
	}
	else if(GetPlayers().size == 3)
	{
		level.fixed_bow_order = TRIO_ORDER;
	}
	else if(GetPlayers().size == 4)
	{
		level.fixed_bow_order = QUAD_ORDER;
	}

	level waittill("bow_order_done");
	level.bow_order_done = 1;

	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE);
}