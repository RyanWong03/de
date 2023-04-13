#using scripts\shared\flag_shared;

#namespace zombie_timer;

function init()
{
	thread bow();
	thread rocket();
	thread first_tp();
	thread dempsey();
	thread boss_enter();
	thread outro();
	thread coop_splits();
	thread timer_hud();
}

function bow()
{	
	level flag::wait_till("soul_catchers_charged");
	print_bow(GetTime());
	level flag::wait_till_clear("soul_catchers_charged");	
}

function rocket()
{
	level flag::wait_till("rocket_firing");
	print_rocket(GetTime());
	level flag::wait_till_clear("rocket_firing");
}

function first_tp()
{
	//check if wisps are done then check if tp is bought then split
	/*if(level.round_number < 11)
	{
		level flag::wait_till("time_travel_teleporter_ready");
		print_tp(GetTime());
		level flag::wait_till_clear("stop_time_travel");
	}*/

	level flag::wait_till("mpd_canister_replacement");
	print_tp(GetTime());
	level flag::wait_till_clear("mpd_canister_replacement");
}

function dempsey()
{
	level flag::wait_till("start_channeling_stone_step");
	print_dempsey(GetTime());
	level flag::wait_till_clear("start_channeling_stone_step");
}

function boss_enter()
{
	level flag::wait_till("boss_fight_begin");
	print_boss(GetTime());
	level flag::wait_till_clear("boss_fight_begin");
}

function outro()
{
	level flag::wait_till("ee_outro");
	print_done(GetTime());
	level flag::wait_till_clear("ee_outro");
}

function print_bow(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 0;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);
	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;
	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function print_rocket(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 25;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);

	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;

	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function print_tp(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 50;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);

	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;
	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function print_dempsey(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 75;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);

	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;
	
	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function print_boss(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 100;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);

	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;

	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function print_done(time)
{
	level endon("end_game");

	clock = NewHudElem();
	clock.alignX = "left";
	clock.alignY = "top";
	clock.horzAlign = "user_left";
	clock.vertAlign = "user_top";
	clock.foreground = 1;
	clock.hidewheninmenu = 0;
	clock.x = 80;
	clock.y = 125;
	clock.alpha = 1;
	clock.font = "default";
	clock.fontScale = 1.7;
	clock.color = (0,1,0);

	start_time = level.n_gameplay_start_time;
	
	time = time - start_time - 0.1;
	
	time_ms = modulo_by_base(time, 1000);
	time = Floor(time / 1000);

	time_s = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_m = modulo_by_base(time, 60);
	time = Floor(time / 60);

	time_h = Floor(time);

	s_time_h = get_string_hours(time_h);
	s_time_m = get_string_minutes(time_m, time_h);
	s_time_s = get_string_seconds(time_s, time_m);
	s_time_ms = get_string_milliseconds(time_ms);
	s_time = "";

	if(time_h > 0) s_time += s_time_h + ":";
	if(time_m > 0) s_time += s_time_m + ":";
	if(time_s > 0) s_time += s_time_s + ".";
	if(time_ms > 0) s_time += s_time_ms;

	clock SetText(s_time);
}

function modulo_by_base(time, base)
{
	if(Floor(time) == 0) return 0;
	divided = time / base;
 	return Ceil((divided - Floor(divided)) * base);
}

function get_string_hours(time)
{
	if(time == 0) s_time_h = "";
	else if(time < 10) s_time_h = "0" + time;
	else s_time_h = time;
	return s_time_h;
}

function get_string_minutes(time, time_h)
{
	if(time == 0) s_time_m = "";
	else if(time_h > 0 && time < 10) s_time_m = "0" + time;
	else s_time_m = time;
	return s_time_m;
}

function get_string_seconds(time, time_m)
{
	if(time == 0) s_time_s = "";
	else if(time_m > 0 && time < 10) s_time_s = "0" + time;
	else s_time_s = time;
	return s_time_s;
}

function get_string_milliseconds(time)
{
	if(time == 0) s_time_ms = "";
	else if(time < 10) s_time_ms = "00" + time;
	else if(time < 100) s_time_ms = "0" + time;
	else s_time_ms = time;
	return s_time_ms;
}

function timer_hud()
{
	self endon("disconnect");
	self endon("end_game");

	level waittill("all_players_spawned");
	wait 5.25;

	level.isTimedGameplay = true;

	level.timer = NewHudElem();
	level.timer.horzAlign = "user_left";
	level.timer.vertAlign = "user_top";
	level.timer.alignX = "left";
	level.timer.alignY = "top";
	level.timer.y = 150;
	level.timer.x = 80;
	level.timer.foreground = 1;
	level.timer.hideWhenInMenu = 0;
	level.timer.fontScale = 2.0;
	level.timer.font = "default";
	level.timer.alpha = 1;
	level.timer.color = (0,1,0);
	level.timer SetTimerUp(0);
	level.total_time = 0;
	start_time = int((getTime() / 1000));
	level thread destroy_timer();
}

function destroy_timer()
{	
	level flag::wait_till("ee_outro");

	level.timer FadeOverTime( 0.5 );
	level.timer.alpha = 0;
	wait 0.5;
	level.timer destroy();
}

function coop_splits()
{
	thread splits_on_hud( " Bow ", 0, 0, 1.6 );
    thread splits_on_hud( " Rocket ", 0, -25, 1.6 );
    thread splits_on_hud( " First TP ", 0, -50, 1.6 );
    thread splits_on_hud( " Dempsey ", 0, -75, 1.6 );
    thread splits_on_hud( " Boss Enter ", 0, -100, 1.6 );
    thread splits_on_hud( " Finish ", 0, -125, 1.6 );
}

function splits_on_hud( text, align_x, align_y, font_scale )
{
	self endon("disconnect");
	self endon("end_game");
	level waittill("all_players_spawned");
	wait 5.25;
    hud = NewHudElem();
    hud.foreground = true;
    hud.fontScale = font_scale;
    hud.sort = 1;
    hud.hidewheninmenu = 0;
    hud.alignX = "left";
    hud.alignY = "top";
    hud.horzAlign = "left";
    hud.vertAlign = "top";
    hud.x = align_x;
    hud.y = hud.y - align_y;
    //hud.y = align_y;
    hud.alpha = 1;
    hud SetText( text );
}
