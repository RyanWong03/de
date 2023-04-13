#using scripts\shared\ai\zombie_utility;
#using scripts\shared\array_shared;
#using scripts\zm\_zm_ai_dogs;
#using scripts\codescripts\struct;
#using scripts\zm\_zm_hero_weapon;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_powerups;


#namespace castle_var_overrides;

function main(){
	thread gravity_spikes();
	thread boss();
	thread keeper();
	thread function_71130ea();
	thread function_1466b3f1();
}

function boss()
{
	while(1)
	{
		s_spawn_point = self function_7e9f0faf(0, 0);
		wait 1;
		if(level.round_number < 5)
		{
			var_588c918c = zombie_utility::spawn_zombie(self.var_cbe1d929[0], "spell_stage_direwolf", s_spawn_point, 5);
		}
		else 
		{
			var_588c918c = zombie_utility::spawn_zombie(self.var_cbe1d929[0], "spell_stage_direwolf", s_spawn_point, 7);
		}
		wait 1;

		if(isdefined(var_588c918c))
		{
			wait 1;
			Array::add(self.var_77e69b0f, var_588c918c, 0);
			s_spawn_point thread zm_ai_dogs::dog_spawn_fx(var_588c918c, s_spawn_point);
			var_588c918c teleport(s_spawn_point.origin, s_spawn_point.angles);
			//var_eabad55++;
		}
		wait(3);
	}
}

function function_7e9f0faf(var_4a032429, var_f759b439, var_610499ec)
{
	if(!isdefined(var_4a032429))
	{
		var_4a032429 = 0;
	}
	if(!isdefined(var_f759b439))
	{
		var_f759b439 = 0;
	}
	if(!isdefined(var_610499ec))
	{
		var_610499ec = 0;
	}
	a_valid_spawn_points = [];
	var_a55896c4 = [];
	b_all_points_used = 0;
	if(var_4a032429)
	{
		var_a55896c4 = self.var_f7afb996;
		//continue;
	}
	if(var_f759b439)
	{
		var_a55896c4 = self.var_9680b225;
		//continue;
	}
	if(var_610499ec)
	{
		var_a55896c4 = self.var_772c4512;
		//continue;
	}
	var_a55896c4 = self.var_828cb4c9;
	while(!a_valid_spawn_points.size)
	{
		foreach(s_spawn_point in var_a55896c4)
		{
			if(!isdefined(s_spawn_point.spawned_zombie) || b_all_points_used)
			{
				s_spawn_point.spawned_zombie = 0;
			}
			if(!s_spawn_point.spawned_zombie)
			{
				Array::add(a_valid_spawn_points, s_spawn_point, 0);
			}
		}
		if(!a_valid_spawn_points.size)
		{
			b_all_points_used = 1;
		}
		wait(0.05);
	}
	s_spawn_point = Array::random(a_valid_spawn_points);
	s_spawn_point.spawned_zombie = 1;
	return s_spawn_point;
}

function function_71130ea()
{
	while(level flag::get("boss_fight_begin"))
	{
		level.var_2b421938 = level.players.size;
		wait 1;
		self.n_health = 2500 * level.var_2b421938;
		self.var_cbe1d929 = GetEntArray("special_dog_spawner", "targetname");
		self.var_9680b225 = struct::get_array("boss_direwolf_spawn_point", "targetname");
		wait 1;
		self.var_9680b225 = Array::sort_by_script_int(self.var_9680b225, 0);
		self.var_772c4512 = function_1466b3f1();
	}
}



function function_1466b3f1()
{
	var_df15467c = struct::get_array("boss_mech_spawn_point", "targetname");
	for(i = 0; i < var_df15467c.size; i++)
	{
		wait 1;
		switch(i)
		{
			case 0:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2940, 7476, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			case 1:
			{
				var_df15467c[i].origin = GetClosestPointOnNavMesh((-2789, 7578, -255), 128);
				var_df15467c[i].origin = var_df15467c[i].origin + VectorScale((0, 0, 1), 7);
				break;
			}
			default:
			{
				break;
			}
		}
	}
	return var_df15467c;
}

function gravity_spikes()
{
	zm_hero_weapon::register_hero_recharge_event(GetWeapon("hero_gravityspikes_melee"), &gravityspikes_power_override);
}

function gravityspikes_power_override(e_player, ai_enemy)
{
	while(1)
	{
	if(e_player laststand::player_is_in_laststand())
	{
		return;
	}
	wait 1;
	if(ai_enemy.damageWeapon === GetWeapon("hero_gravityspikes_melee"))
	{
		return;
	}
	wait 1;
	if(isdefined(e_player.disable_hero_power_charging) && e_player.disable_hero_power_charging)
	{
		return;
	}
	wait 1;
	if(isdefined(e_player) && isdefined(e_player.hero_power))
	{
		w_gravityspike = GetWeapon("hero_gravityspikes_melee");
		if(isdefined(ai_enemy.heroweapon_kill_power))
		{
			wait 1;
			n_perk_factor = 1;
			if(e_player hasPerk("specialty_overcharge"))
			{
				n_perk_factor = GetDvarFloat("gadgetPowerOverchargePerkScoreFactor");
			}
			wait 1;
			if(isdefined(ai_enemy.damageWeapon) && (IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_demongate") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_run_prison") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_storm") || IsSubStr(ai_enemy.damageWeapon.name, "elemental_bow_wolf_howl")))
			{
				n_perk_factor = 1;
			}
			wait 1;
			e_player.hero_power = e_player.hero_power + n_perk_factor * ai_enemy.heroweapon_kill_power;
			e_player.hero_power = math::clamp(e_player.hero_power, 0, 100);
			wait 1;
			if(e_player.hero_power >= e_player.hero_power_prev)
			{
				e_player GadgetPowerSet(e_player GadgetGetSlot(w_gravityspike), e_player.hero_power);
				wait 1;
				e_player clientfield::set_player_uimodel("zmhud.swordEnergy", e_player.hero_power / 30);
				e_player clientfield::increment_uimodel("zmhud.swordChargeUpdate");
			}
			wait 1;
			if(e_player.hero_power >= 30)
			{
				e_player update_gravityspikes_state(2);
			}
			wait 1;
		}
	}
	}
}

function update_gravityspikes_state(n_gravityspikes_state)
{
	self.gravityspikes_state = n_gravityspikes_state;
}

function keeper()
{
	self endon("hash_ed87af95");
	self.var_40b46e43 endon("death");
	wait(randomIntRange(1, 4));
	while(1)
	{
		self.var_40b46e43 playsound("vox_keeper_amb");
		wait(randomIntRange(1, 4));
	}
}