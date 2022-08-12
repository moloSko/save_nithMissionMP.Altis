if(!isServer) exitWith {};
private ["_text","_firstPoint","_pos","_cpleast","_cplresi","_callside","_marksize","_HQ","_v","_grp","_SpawnPosGrp","_infantry","_type","_unit","_c","_group1","_Car","_typevehc","_SpawnPosVehc","_vehc","_t","_group2","_Tank","_typeveht","_SpawnPosVeht","_veht","_listArmy"];
//оборона города
params ["_marker","_radius"];
_pos =  getMarkerPos _marker;
//====================================================================пехота====================================================
private _countplayer = playersNumber east;
private _variantCount = "";

switch true do {
    case (Rezhim == 3 || {Rezhim != 3 && {_countplayer < 6}}):{_variantCount = "min"}; 
    case (Rezhim != 3 && {_countplayer > 5 && {_countplayer < 11}}):{_variantCount = "mind"};
	case (Rezhim != 3 && {_countplayer > 10}):{_variantCount = "max"};
};
missionnamespace setVariable ["variantCount",_variantCount,true];

_HQ = createCenter west;

private ["_countEnemyMan","_ost","_cmmin","_cm","_n","_vp"];
_cm = 0;
_n = 6;
_vp = 0;
_v = 0;
_countEnemyMan = 0;
_ost = 0;
_cmmin = false;


missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];	
_vp = floor(_countEnemyMan/_n);
_ost = _countEnemyMan - (_vp*_n);
if(_ost > 0) then {_v = _vp + 1} else {_v = _vp};
_cmmin = true;

if(nachinaem_zonovo) then { 
    switch (true) do {
        case (_variantCount == "min"):{_v = 9};
        case (_variantCount == "mind"):{_v = 10 + (floor(random 4))};
        case (_variantCount == "max"):{_v = 18};
	};
	_countEnemyMan = _v*_n;
    missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];
};
for "_gr" from 1 to _v do  
{
    _grp  = creategroup west;
    _SpawnPosGrp = [_pos, 1,100, 2, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
	_cm = [_gr,_v,_cmmin,_ost,_n] call srv_fnc_numberfor;
    for "_inf" from 1 to _cm do {
        _infantry = infantry call BIS_fnc_arrayShuffle;
        _type = selectRandom _infantry;
	    _unit = [_grp,_SpawnPosGrp,_type,50] call srv_fnc_createenemyunit;
	    _unit setVariable ["srv_cme",true,true];
	    [_unit] join _grp;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
	       // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
        }];
    }; 
    [_grp,_SpawnPosGrp,_pos,0,150,[-1,-1,-1,0,false],"path for group soldiers"] spawn srv_fnc_InfantryTasckPatrol;
	sleep 0.1;
};

BT_fnc_getPos = {
    params ["_pos","_dir","_dis","_alt"];
    if (count _this  == 3) then {
    };
    _r = [(_pos select 0) + sin _dir * _dis, (_pos select 1) + cos _dir * _dis, _alt];
    _r
};

BT_fnc_inHouse = {
	params ["_marker"];
    _arrunits = [];
	_pos = [];
	_houseList = nearestObjects [_marker, ["building"], 200];
	{
		_c = 0;
		while {(format ["%1",_x buildingPos _c] != "[0,0,0]") && (_C < 2)} do {
			_pos set [(count _pos),[_x,_x buildingPos _c]];
			_c = _c + 1;
		};
	} forEach _houseList;

    _grp = createGroup WEST;
    _units = ["B_Soldier_SL_F",
                "B_soldier_AR_F",
                "B_HeavyGunner_F",
                "B_soldier_AAR_F",
                "B_soldier_M_F",
                "B_Sharpshooter_F",
                "B_soldier_LAT_F",
                "B_medic_F"];
    _grp setVariable ["Vcm_Disable",true];
    _ind = (floor (random ((count _pos) / 4)));
    _pos = _pos call BIS_fnc_arrayShuffle;
	for "_i" from 1 to (_ind) step 1 do {
		_point = _pos # (_i - 1);
        _pos deleteAt (_i - 1);
		_house = _point # 0;
		_posH = _point # 1;
        _unit = _grp createUnit [(_units call BIS_fnc_selectRandom), [0, 0, 0], [], 0, "CAN_COLLIDE"];
		_unit setPosATL _posH;
		_watchDir = (([_unit, _house] call BIS_fnc_dirTo) + 180);
		_unit setDir _watchDir;
		_unit setUnitPos (["UP", "MIDDLE"] call BIS_fnc_selectRandom) ;
		_unit disableAI "PATH";
		_watchPos = [getPos _unit, _watchDir, ((round (random 30) + 30)), 1] call BT_fnc_getPos;
		_unit doWatch _watchPos;
        _arrunits pushBack _unit;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
           // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
        }];
	};

};

[_pos] spawn BT_fnc_inHouse;
sleep 0.1;
//======================================================================техника==================================================
//======================================================================Хамеры=====================================================
_c = 0;
if(nachinaem_zonovo) then { 
    switch(true) do {
        case (_variantCount == "min"):{_c = 3 + (round(random 2))};
	};	
};
missionnamespace setvariable ["countcar",_c,true];
for "_c" from 1 to _c do  
{
    _group1 = creategroup west;
    _Car = Car call BIS_fnc_arrayShuffle;
    _typevehc = selectRandom _Car;
    _SpawnPosVehc = [_pos,1,300,4,0,60 * (pi / 180),0] call srv_fnc_findSafePos;
    _vehc=[_group1,_SpawnPosVehc,_typevehc,0] call srv_fnc_createenemyvehicle;
    _vehc limitSpeed 10;
    [_group1,_SpawnPosVehc,_pos,0,150,[-1,-1,-1,0,false],"path for car"] spawn srv_fnc_InfantryTasckPatrol;
    sleep 0.1;	 
};
sleep 0.1;
//==================================================================Бронетехника====================================================
_t = 0;
if(nachinaem_zonovo) then { 
    switch(true) do {
        case (_variantCount == "min"):{_t = 4 + (round(random 2))};
	};		
};
missionnamespace setvariable ["counttank",_t,true];
for "_t" from 1 to _t do  
{
  _group2 = creategroup west;
  _Tank = Tank call BIS_fnc_arrayShuffle;
  _typeveht = selectRandom _Tank;
  _SpawnPosVeht = [_pos,1,300,4,0,60 * (pi / 180),0] call srv_fnc_findSafePos;
  _veht=[_group2,_SpawnPosVeht,_typeveht,0] call srv_fnc_createenemyvehicle;
  _veht limitSpeed 10;
  [_group2,_SpawnPosVeht,_pos,0,150,[-1,-1,-1,0,false],"path for tank"] spawn srv_fnc_InfantryTasckPatrol;
  sleep 0.1;	
   
};
if(nachinaem_zonovo) then {
    _listArmy = _pos nearEntities [["Man","Car","Tank"],400];
    missionNamespace setVariable ["numberOfArmy",(WEST countSide _listArmy),true];
} else {
    private _countSidelistArmy = ["read", ["Point","numberOfArmy"]];
	missionNamespace setVariable ["numberOfArmy",_countSidelistArmy,true];
};

if(GroupRecon == 1) then {
   [_pos] call srv_fnc_recongroup;
};

if(nachinaem_zonovo) then {
    if(Rezhim == 2 || {Rezhim == 3}) then {
	    missionNamespace setVariable ["ReinforPoint1",true,true];
	    
        missionNamespace setVariable ["PerehodPoint",false,true];  
        missionNamespace setVariable ["Stage",2,true];	
    };
};
missionnamespace setvariable ["srv_cycleworks",true,true];
[_marker] spawn srv_fnc_event;

if(!nachinaem_zonovo) then {missionNamespace setVariable ["nachinaem_zonovo",true,true]};