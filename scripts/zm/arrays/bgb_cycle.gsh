#define AFTERTASTE "zm_bgb_aftertaste"
#define ALCHEMICAL "zm_bgb_alchemical_antithesis"
#define ALWAYS_DONE_SWIFTLY "zm_bgb_always_done_swiftly"
#define ABH "zm_bgb_anywhere_but_here"
#define ARMAMENTAL "zm_bgb_armamental_accomplishment"
#define ARMS_GRACE "zm_bgb_arms_grace"
#define ARSENAL "zm_bgb_arsenal_accelerator"
#define BOARD_GAMES "zm_bgb_board_games"
#define BOARD_TO_DEATH "zm_bgb_board_to_death"
#define BULLET_BOOST "zm_bgb_bullet_boost"
#define BURNED_OUT "zm_bgb_burned_out"
#define CACHE_BACK "zm_bgb_cache_back"
#define COAGULANT "zm_bgb_coagulant"
#define CRATE_POWER "zm_bgb_crate_power"
#define CRAWL_SPACE "zm_bgb_crawl_space"
#define DANGER_CLOSEST "zm_bgb_danger_closest"
#define NUKES "zm_bgb_dead_of_nuclear_winter"
#define DISORDERLY_COMBAT "zm_bgb_disorderly_combat"
#define EPHEMERAL "zm_bgb_ephemeral_enhancement"
#define EXTRA_CREDIT "zm_bgb_extra_credit"
#define EYE_CANDY "zm_bgb_eye_candy"
#define DEATH_MACHINES "zm_bgb_fatal_contraption"
#define FEAR_IN_HEADLIGHTS "zm_bgb_fear_in_headlights"
#define FIRING_ON_ALL_CYLINDERS "zm_bgb_firing_on_all_cylinders"
#define FLAVOR_HEXED "zm_bgb_flavor_hexed"
#define HEAD_DRAMA "zm_bgb_head_drama"
#define IDLE_EYES "zm_bgb_idles_eyes"
#define IM_FEELIN_LUCKY "zm_bgb_im_feeling_lucky"
#define FIRESALES "zm_bgb_immolation_liquidation"
#define IMPATIENT "zm_bgb_impatient"
#define IPS "zm_bgb_in_plain_sight"
#define KILL_JOY "zm_bgb_kill_joy"
#define KILLING_TIME "zm_bgb_killing_time"
#define LICENSED_CONTRACTOR "zm_bgb_licensed_contractor"
#define LUCKY_CRIT "zm_bgb_lucky_crit"
#define MIND_BLOWN "zm_bgb_mind_blown"
#define NEAR_DEATH_EXPERIENCE "zm_bgb_near_death_experience"
#define NEWTONIAN_NEGATION "zm_bgb_newtonian_negation"
#define NOW_YOU_SEE_ME "zm_bgb_now_you_see_me"
#define ON_THE_HOUSE "zm_bgb_on_the_house"
#define PERKS "zm_bgb_perkaholic"
#define PHOENIX_UP "zm_bgb_phoenix_up"
#define POP_SHOCKS "zm_bgb_pop_shocks"
#define POWER_VACUUM "zm_bgb_power_vacuum"
#define PROFIT_SHARING "zm_bgb_profit_sharing"
#define PROJECTILE_VOMITING "zm_bgb_projectile_vomiting"
#define REIGN "zm_bgb_reign_drops"
#define RESPIN_CYCLE "zm_bgb_respin_cycle"
#define ROUND_ROBBIN "zm_bgb_round_robbin"
#define SECRET_SHOPPER "zm_bgb_secret_shopper"
#define SELF_MEDICATION "zm_bgb_self_medication"
#define SHOPPING_FREE "zm_bgb_shopping_free"
#define SLAUGHTER_SLIDE "zm_bgb_slaughter_slide"
#define SODA_FOUNTAIN "zm_bgb_soda_fountain"
#define STOCK_OPTION "zm_bgb_stock_option"
#define SWORD_FLAY "zm_bgb_sword_flay"
#define TEMPORAL_GIFT "zm_bgb_temporal_gift"
#define TONE_DEATH "zm_bgb_tone_death"
#define UNBEARABLE "zm_bgb_unbearable"
#define UNDEAD_MAN_WALKING "zm_bgb_undead_man_walking"
#define UNQENCHABLE "zm_bgb_unquenchable"
#define WALL_POWER "zm_bgb_wall_power"
#define WHOS_KEEPING_SCORE "zm_bgb_whos_keeping_score"

//CASTLE BGB CYCLES

//SOLO GUM CYCLES, DUO GUM CYCLES - QUAD

//SOLO GUMS
#define CASTLE_P0_BGB_CYCLE_1_M array( EXTRA_CREDIT , PERKS , NUKES , REIGN , ABH )
#define CASTLE_P0_BGB_CYCLE_2_M array( NUKES , PERKS , ABH , EXTRA_CREDIT , REIGN )
#define CASTLE_P0_BGB_CYCLE_3_M array( ABH , NUKES , REIGN , PERKS , EXTRA_CREDIT )
#define CASTLE_P0_BGB_CYCLE_4_M array (REIGN , NUKES , PERKS , EXTRA_CREDIT , ABH )

#define CASTLE_P1_BGB_CYCLE_1_M array( REIGN , PERKS , NUKES , CRAWL_SPACE , ABH )
#define CASTLE_P1_BGB_CYCLE_2_M array( NUKES , CRAWL_SPACE , REIGN , ABH , PERKS )
#define CASTLE_P1_BGB_CYCLE_3_M CASTLE_P1_BGB_CYCLE_1_M
#define CASTLE_P1_BGB_CYCLE_4_M CASTLE_P1_BGB_CYCLE_1_M
#define CASTLE_P1_BGB_CYCLE_5_M CASTLE_P1_BGB_CYCLE_1_M

#define CASTLE_P2_BGB_CYCLE_1_M array( ABH , NUKES , WALL_POWER , PERKS , REIGN )
#define CASTLE_P2_BGB_CYCLE_2_M array( REIGN , ABH , NUKES , WALL_POWER , PERKS )
#define CASTLE_P2_BGB_CYCLE_3_M CASTLE_P2_BGB_CYCLE_1_M
#define CASTLE_P2_BGB_CYCLE_4_M CASTLE_P2_BGB_CYCLE_1_M
#define CASTLE_P2_BGB_CYCLE_5_M CASTLE_P2_BGB_CYCLE_1_M

#define CASTLE_P3_BGB_CYCLE_1_M array( ABH , NUKES , WALL_POWER , PERKS , REIGN )
#define CASTLE_P3_BGB_CYCLE_2_M array( REIGN , ABH , NUKES , WALL_POWER , PERKS )
#define CASTLE_P3_BGB_CYCLE_3_M CASTLE_P3_BGB_CYCLE_1_M
#define CASTLE_P3_BGB_CYCLE_4_M CASTLE_P3_BGB_CYCLE_1_M
#define CASTLE_P3_BGB_CYCLE_5_M CASTLE_P3_BGB_CYCLE_1_M

#define CASTLE_P0_BGB_CYCLES_M array(CASTLE_P0_BGB_CYCLE_1_M,CASTLE_P0_BGB_CYCLE_2_M,CASTLE_P0_BGB_CYCLE_3_M,CASTLE_P0_BGB_CYCLE_4_M,CASTLE_P0_BGB_CYCLE_5_M)

#define CASTLE_P1_BGB_CYCLES_M array(CASTLE_P1_BGB_CYCLE_1_M,CASTLE_P1_BGB_CYCLE_2_M,CASTLE_P1_BGB_CYCLE_3_M,CASTLE_P1_BGB_CYCLE_4_M,CASTLE_P1_BGB_CYCLE_5_M)

#define CASTLE_P2_BGB_CYCLES_M array(CASTLE_P2_BGB_CYCLE_1_M,CASTLE_P2_BGB_CYCLE_2_M,CASTLE_P2_BGB_CYCLE_3_M,CASTLE_P2_BGB_CYCLE_4_M,CASTLE_P2_BGB_CYCLE_5_M)

#define CASTLE_P3_BGB_CYCLES_M array(CASTLE_P3_BGB_CYCLE_1_M,CASTLE_P3_BGB_CYCLE_2_M,CASTLE_P3_BGB_CYCLE_3_M,CASTLE_P3_BGB_CYCLE_4_M,CASTLE_P3_BGB_CYCLE_5_M)

#define SOLO_BGB_CYCLES array(CASTLE_P0_BGB_CYCLES_M,CASTLE_P1_BGB_CYCLES_M,CASTLE_P2_BGB_CYCLES_M,CASTLE_P3_BGB_CYCLES_M)

#define DUO_BGB_CYCLES array()

#define TRIO_BGB_CYCLES array()

#define QUAD_BGB_CYCLES array()


