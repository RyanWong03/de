#using scripts\shared\flag_shared;
#using scripts\zm\arrays\array_override;
#insert scripts\zm\arrays\array_override.gsh;
#insert scripts\shared\shared.gsh;

#namespace simon_says;

#define LIGHTNING 1
#define CIRCLE 2
#define ROCKET 3
#define DOOR 4

#define SYMBOLS array(LIGHTNING,LIGHTNING,LIGHTNING,LIGHTNING)

#define SYSTEM_NAME "simon_says"

function init()
{
	REGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE,&randomize_override)
	thread main();
}

function randomize_override(array)
{
	if(level flag::get("simon_terminal_activated") && !level.fixed_symbols_done)
	{
		if (array.size == 4)
		{
			cont = false;
			if (array[0] == "1")
			{
				cont = true;
			}
			if(cont)
			{
				switch (GetPlayers().size)
				{
					case 1:
						a_temp = Array("1", "1", "1", "1");
						break;
					case 2:
						a_temp = Array("1", "1", "1", "1");
						break;
					case 3:
						a_temp = Array("1", "1", "1", "1");
						break;
					case 4:
						a_temp = Array("1", "1", "1", "1");
						break;
					default:
						a_temp = Array("1", "1", "1", "1");
						break;
				}
				level notify("simon_done");
				return a_temp;
			}
		}
	}
}

function main()
{
	level.fixed_symbols_done = 0;
	level waittill("simon_done");
	level.fixed_symbols_done = 1;
	UNREGISTER_OVERRIDE(SYSTEM_NAME,ARRAY_RANDOMIZE);
}