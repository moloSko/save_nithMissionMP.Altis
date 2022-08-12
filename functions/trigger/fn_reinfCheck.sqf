_location = _this # 0;
_unitsCount = _this # 1;
_triggerOnMap = _this # 2;
_trgPos = _this # 3;

while {true} do
{
	sleep 10;
	if ( count (( units BLUFOR ) inAreaArray _triggerOnMap ) <= (0.6 * _unitsCount) ) exitWith 
	{ [ _triggerOnMap, _location, _trgPos ] spawn trg_fnc_reinfSpawn; break; };
};