#define IS_MAP(map) (!level flag::get("initial_blackscreen_passed") && GetDvarString("mapname") == map)

#define PRE_SPAWN_RANDOM \

#define PRE_SPAWN_RANDOMIZE \
CHARACTERS \
WOLF_PAINTINGS \

//CHARACTERS
#define CASTLE_CHARACTERS array(2,3,1,0)

#define MAPS_APPLIED array("zm_castle")
#define CHARACTER_SETS array(CASTLE_CHARACTERS)

#define CHARACTERS if (IsInArray(MAPS_APPLIED,GetDvarString("mapname")) && !level flag::get("initial_blackscreen_passed")){\
	chars = 1;\
	if (array.size == 4){\
		for (i = 0; i < 4; i++){if (array[i] != i) chars = 0;break;}\
		if (chars){map_id = 0;maps = MAPS_APPLIED;\
			for (i = 0; i < maps.size; i++){\
				if (GetDvarString("mapname") == maps[i]){map_id = i;break;}}\
				return CHARACTER_SETS[map_id];}}}


//SAMS 1,VOID 3, CLOCKTOWER 2, CHURCH 4
#define UPPER_HALL 0
#define LIVING_QUARTERS 1
#define TOWER 2
#define SUB_TOWER 3

#define PAINTING_ORDER array(LIVING_QUARTERS,TOWER,UPPER_HALL,SUB_TOWER)

#define WOLF_PAINTINGS if IS_MAP("zm_castle"){\
	if (array[0].script_noteworthy == "aq_wh_painting_struct"){\
		ret = ArrayCopy(array);\
		for (i = 0; i < array.size; i++){ret[i] = array[PAINTING_ORDER[i]];}\
		return ret;}}