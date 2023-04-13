#using scripts\shared\flag_shared;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;

#namespace fireplace;

#define SYSTEM_NAME "fireplace"

function init()
{
	if(GetDvarString("mapname") == "zm_castle")
	{
		thread main();
	}
}

#define living_quarters 1
#define lower_courtyard 3
#define hall 2
#define desired lower_courtyard

function random_override(array)
{
	if(array[0].targetname == "aq_rp_fireplace_struct")
	{
		foreach(fireplace in array)
		{
			if(fireplace.script_int == desired)
			{
				return fireplace;
			}
		}
	}
}

function main()
{
	level flag::wait_till("rune_prison_magma_ball");

	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM,&random_override);
	level flag::wait_till("rune_prison_golf");
	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOM);
}