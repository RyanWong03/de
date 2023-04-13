#using scripts\shared\flag_shared;


#namespace bgb_common;

function get_lobby_index()
{
	players = GetPlayers();
	for (i=0;i<players.size;i++)
	{
		if (players[i] == self)
			return i;
	}
}

