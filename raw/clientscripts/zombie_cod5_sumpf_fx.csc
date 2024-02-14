//
// description: clientside fx script for mak: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_fx;
#include clientscripts\_music;

main()
{
	clientscripts\createfx\zombie_cod5_sumpf_fx::main();
	clientscripts\_fx::reportNumEffects();

	footsteps();
	precache_scripted_fx();
	precache_createfx_fx();
	
	level thread trap_fx_monitor("north_west_tgt", "north_west_elec_light");
	level thread trap_fx_monitor("south_west_tgt", "south_west_elec_light");
	level thread trap_fx_monitor("north_east_tgt", "north_east_elec_light");
	level thread trap_fx_monitor("south_east_tgt", "south_east_elec_light");
	
	level thread dog_start_monitor();
	level thread dog_stop_monitor();
	level thread level_fog_init();
	
}

footsteps()
{
	clientscripts\_utility::setFootstepEffect( "asphalt",    LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "brick",      LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "carpet",     LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "cloth",      LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "concrete",   LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "dirt",       LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "foliage",    LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "gravel",     LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "grass",      LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "metal",      LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "mud",        LoadFx( "bio/player/fx_footstep_mud" ) );
	clientscripts\_utility::setFootstepEffect( "paper",      LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "plaster",    LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "rock",       LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "sand",       LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "water",      LoadFx( "bio/player/fx_footstep_water" ) );
	clientscripts\_utility::setFootstepEffect( "wood",       LoadFx( "bio/player/fx_footstep_dust" ) );
}

precache_scripted_fx()
{
	level._effect["eye_glow"]			 	= LoadFx( "misc/fx_zombie_eye_single" ); 	

	level._effect["headshot"] 					= LoadFX( "impacts/fx_flesh_hit" );
	level._effect["headshot_nochunks"] 			= LoadFX( "misc/fx_zombie_bloodsplat" );
	level._effect["bloodspurt"] 				= LoadFX( "misc/fx_zombie_bloodspurt" );
	level._effect["animscript_gib_fx"] 		 = LoadFx( "weapon/bullet/fx_flesh_gib_fatal_01" ); 
	level._effect["animscript_gibtrail_fx"] 	 = LoadFx( "trail/fx_trail_blood_streak" ); 	
}

precache_createfx_fx()
{
	level._effect["mp_fire_small_detail"]						    = loadfx("maps/mp_maps/fx_mp_fire_small_detail");	
	level._effect["mp_fire_small"]							        = loadfx("maps/mp_maps/fx_mp_fire_small");
	level._effect["mp_fire_medium"]							        = loadfx("maps/mp_maps/fx_mp_fire_medium");	
	level._effect["mp_fire_large"]							        = loadfx("maps/mp_maps/fx_mp_fire_large");
	level._effect["mp_light_glow_lantern"]		          = loadfx("maps/mp_maps/fx_mp_light_glow_lantern");
	level._effect["mp_smoke_ambiance_indoor"]					  = loadfx("maps/mp_maps/fx_mp_smoke_ambiance_indoor");
	level._effect["mp_smoke_ambiance_indoor_misty"]	    = loadfx("maps/mp_maps/fx_mp_smoke_ambiance_indoor_misty");
	level._effect["mp_smoke_ambiance_indoor_sm"]	      = loadfx("maps/mp_maps/fx_mp_smoke_ambiance_indoor_sm");
	level._effect["fx_fog_low_floor_sm"]			          = loadfx("env/smoke/fx_fog_low_floor_sm");			
	level._effect["mp_smoke_column_tall"]					      = loadfx("maps/mp_maps/fx_mp_smoke_column_tall");	
	level._effect["mp_smoke_column_short"]						  = loadfx("maps/mp_maps/fx_mp_smoke_column_short");	
	level._effect["mp_fog_rolling_large"]					      = loadfx("maps/mp_maps/fx_mp_fog_rolling_thick_large_area");	
	level._effect["mp_fog_rolling_small"]					      = loadfx("maps/mp_maps/fx_mp_fog_rolling_thick_small_area");
	level._effect["mp_flies_carcass"]                   = loadfx("maps/mp_maps/fx_mp_flies_carcass");	
	level._effect["mp_insects_swarm"]							      = loadfx("maps/mp_maps/fx_mp_insect_swarm");
	level._effect["mp_insects_lantern"]							    = loadfx("maps/mp_maps/fx_mp_insects_lantern");
	level._effect["mp_firefly_ambient"]							    = loadfx("maps/mp_maps/fx_mp_firefly_ambient");
	level._effect["mp_firefly_swarm"]						  	    = loadfx("maps/mp_maps/fx_mp_firefly_swarm");
	level._effect["mp_maggots"]						  	          = loadfx("maps/mp_maps/fx_mp_maggots");
	level._effect["mp_falling_leaves_elm"]				      = loadfx("maps/mp_maps/fx_mp_falling_leaves_elm");
  level._effect["god_rays_dust_motes"]			          = loadfx("env/light/fx_light_god_rays_dust_motes");
  level._effect["light_ceiling_dspot"]			          = loadfx("env/light/fx_ray_ceiling_amber_dim_sm");
  level._effect["fx_bats_circling"]			              = loadfx("bio/animals/fx_bats_circling");
  level._effect["fx_bats_ambient"]							      = loadfx("maps/mp_maps/fx_bats_ambient");
	level._effect["mp_fire_torch"]							        = loadfx("maps/mp_maps/fx_mp_fire_torch");  
	level._effect["mp_dragonflies"]                     = loadfx("bio/insects/fx_insects_dragonflies_ambient");	  
	level._effect["fx_mp_ray_moon_xsm_near"]            = loadfx("maps/mp_maps/fx_mp_ray_moon_xsm_near");  
	level._effect["fx_meteor_ambient"]							    = loadfx("maps/zombie/fx_meteor_ambient");	
	level._effect["fx_meteor_flash"]							      = loadfx("maps/zombie/fx_meteor_flash");
	level._effect["fx_meteor_flash_spawn"]							= loadfx("maps/zombie/fx_meteor_flash_spawn");
	level._effect["fx_meteor_hotspot"]						    	= loadfx("maps/zombie/fx_meteor_hotspot");

  
  level._effect["zapper"]							= loadfx("misc/fx_zombie_electric_trap");
	level._effect["switch_sparks"]			= loadfx("env/electrical/fx_elec_wire_spark_burst");
	level._effect["betty_explode"]			= loadfx("weapon/bouncing_betty/fx_explosion_betty_generic");
	level._effect["betty_trail"]				= loadfx("weapon/bouncing_betty/fx_betty_trail");
	
	//broken
	level._effect["fx_light_god_ray_sm_sumpf_warm_v1"] 		= loadfx("env/light/fx_light_god_ray_sm_sumpf_warm_v1");
}

trap_fx_monitor(name,side)
{
	
	while(1)
	{
		level waittill(name);

		fire_points = getstructarray(name,"targetname");

		for(i=0;i<fire_points.size;i++)
		{
			fire_points[i] thread electric_trap_fx(name,side);		
		}

	}
	
}

electric_trap_fx(name,side)
{
	
	ang = self.angles;
	forward = anglestoforward(ang);
	up = anglestoup(ang);
	
	if ( isdefined( self.loopFX ) )
	{
		for(i = 0; i < self.loopFX.size; i ++)
		{
			self.loopFX[i] delete();
		}
		
		self.loopFX = [];
	}

	if(!isdefined(self.loopFX))
	{
		self.loopFX = [];
	}	
	
	players = getlocalplayers();
	
	for(i = 0; i < players.size; i++)
	{
		self.loopFX[i] = SpawnFx( i, level._effect["zapper"], self.origin, 0,forward,up);
		triggerfx(self.loopFX[i]);
	}
	
	level waittill(side + "off");
	//wait(30 );

	for(i = 0; i < self.loopFX.size; i ++)
	{
		self.loopFX[i] delete();
	}
	
	self.loopFX = [];

/*	if(isDefined(self.script_sound))
	{
		self.tag_origin playsound("elec_start");
		self.tag_origin playloopsound("elec_loop");
		self thread play_electrical_sound();
	}
	wait(30);
	wait(randomfloat(2));
	if(isDefined(self.script_sound))
	{
		self.tag_origin stoploopsound();
	}
	self.tag_origin delete();
	wait(2);
	notify_ent notify("elec_done");
	level notify ("arc_done"); */
		
}

/*------------------------------------
handles playing the zapper switch FX 
as well as the fx aroudn the zapper machine too
------------------------------------*/
zapper_switch_fx(ent)
{
	switchfx = getstruct("zapper_switch_fx_" + ent,"targetname");
	zapperfx = getstruct ("zapper_fx_" + ent,"targetname");
	
	switch_forward = anglestoforward(switchfx.angles);
	switch_up = anglestoup(switchfx.angles);
	
	zapper_forward = anglestoforward(zapperfx.angles);	
	zapper_up = anglestoup(zapperfx.angles);	

		
	while(1)
	{
		level waittill(ent);
		if ( isdefined( switchfx.loopFX ) )
		{
			for(i = 0; i < switchfx.loopFX.size; i ++)
			{
				switchfx.loopFX[i] delete();
				zapperfx.loopFX[i] delete();
			}		
			switchfx.loopFX = [];
			zapperfx.loopFX = [];
		}

		if(!isdefined(switchfx.loopFX))
		{
			switchfx.loopFX = [];
			zapperfx.loopFX = [];
		}	
	
		players = getlocalplayers();
		
		//zapper wall switch fx
		for(i = 0; i < players.size; i++)
		{
			switchfx.loopFX[i] = SpawnFx( i, level._effect["zapper_wall"], switchfx.origin, 0,switch_forward,switch_up);
			triggerfx(switchfx.loopFX[i]);
			
			zapperfx.loopFX[i] = SpawnFx( i, level._effect["zapper_fx"], zapperfx.origin, 0,zapper_forward,zapper_up);
			triggerfx(zapperfx.loopFX[i]);	
		}
		
		realwait(30 );

		for(i = 0; i < switchfx.loopFX.size; i ++)
		{
			switchfx.loopFX[i] delete();
			zapperfx.loopFX[i] delete();
		}
	
		switchfx.loopFX = [];
		zapperfx.loopFX = [];
	}	
}

// Pulls the fog in
dog_start_monitor()
{
	while( 1 )
	{
	level waittill( "dog_start" );


/*
   start_dist = 729.34;
   half_dist = 971.99;
   half_height = 338.336;
   base_height = 398.623;
	fog_r = 0.58;
	fog_g = 0.60;
	fog_b = 0.56;
	fog_scale = 1;
	sun_col_r = 0.58;
	sun_col_g = 0.60;
	sun_col_b = 0.56;
	sun_dir_x = 0;
	sun_dir_y = 0;
	sun_dir_z = 0;
	sun_start_ang = 0;
	sun_stop_ang = 0;
		time = 7;
		max_fog_opacity = 1;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);
*/

	start_dist = 1622.47;
	half_dist = 2126.6;
	half_height = 288.118;
	base_height = 399.766;
	fog_r = 0.478431;
	fog_g = 0.623529;
	fog_b = 0.572549;
	fog_scale = 1.25;
	sun_col_r = 0.827451;
	sun_col_g = 0.839216;
	sun_col_b = 0.827451;
	sun_dir_x = -0.114925;
	sun_dir_y = -0.322134;
	sun_dir_z = 0.939693;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 7;
	max_fog_opacity = 1;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);

	}
}


//
// Pushes fog out
dog_stop_monitor()
{
	while( 1 )
	{
		level waittill( "dog_stop" );

		start_dist = 452.915;
	half_dist = 161.557;
	half_height = 426.143;
	base_height = -675.164;
	fog_r = 0.419608;
	fog_g = 0.564706;
	fog_b = 0.513726;
	fog_scale = 1;
	sun_col_r = 0.827451;
	sun_col_g = 0.839216;
	sun_col_b = 0.827451;
	sun_dir_x = -0.114925;
	sun_dir_y = -0.322134;
	sun_dir_z = 0.939693;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 7;
	max_fog_opacity = 1;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);

	}
}

level_fog_init()
{
	/*
	//new cull distance needs new fog
	start_dist = 404.39;
	half_dist = 1543.52;
	half_height = 460.33;
	base_height = -244.014;
	fog_r = .65;
	fog_g = .84;
	fog_b = .79;
	fog_scale = 1;
	sun_col_r = .65;
	sun_col_g = .84;
	sun_col_b = .79;
	sun_dir_x = 1;
	sun_dir_y = 0;
	sun_dir_z = 0;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 0.1;
	max_fog_opacity = 1;
	

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
	sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
	sun_stop_ang, time, max_fog_opacity);
	*/

	start_dist = 452.915;
	half_dist = 161.557;
	half_height = 426.143;
	base_height = -675.164;
	fog_r = 0.419608;
	fog_g = 0.564706;
	fog_b = 0.513726;
	fog_scale = 1;
	sun_col_r = 0.827451;
	sun_col_g = 0.839216;
	sun_col_b = 0.827451;
	sun_dir_x = -0.114925;
	sun_dir_y = -0.322134;
	sun_dir_z = 0.939693;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 0;
	max_fog_opacity = 1;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);
	
}	