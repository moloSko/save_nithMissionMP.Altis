_trgPos = _this # 0;
_type = [ "B_Heli_Light_01_armed_F", "B_Heli_Attack_01_F", "B_Heli_Transport_01_camo_F", "B_Plane_CAS_01_F", "B_Plane_Fighter_01_F" ];
_pos = [];
while { true } do {
	_rndDir = (random 360);
	
	_cosX = cos _rndDir * 5000;
	_sinY = sin _rndDir * 5000;
	_pos = [_cosX, _sinY, 500] vectorAdd _trgPos;
	if !( _pos inArea "CSAT_BASE" ) then 
	{
		break;
	};
};

_veh = [_pos, random 360, selectRandom _type, blufor] call BIS_fnc_spawnVehicle;
{ [ _x, random [0.2, 0.75, 1] ] call trg_fnc_setSkill; } forEach (units ( _veh # 2 ));
for "_i" from 1 to (5 + (random 5)) step 1 do {
	if(_i==1) then { 
		_wp = (_veh # 2) addWaypoint [_trgPos,0];
		_wp setWaypointCompletionRadius 50
	} else {			
		_randir = floor(random 360);
		_randis = floor(random 500);
		_wppos = [(_trgPos select 0) + ((sin _randir) * _randis), (_trgPos select 1) + ((cos _randir) * _randis)];

		_wp = (_veh # 2) addWaypoint [_wppos, 0, _i];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointCompletionRadius 50;
	};
};
private "_wp";
_wp = (_veh # 2) addWaypoint [_trgPos,0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 50;
_veh # 0;

		 