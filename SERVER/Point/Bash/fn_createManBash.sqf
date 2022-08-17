/*
params ["_radioBashnya","_pos","_dir"];
private _grp = createGroup west;

//private _typeunit = "";
//_typeunit = "B_soldier_M_F";

private _radius = 50;
private _list = [
         "B_Soldier_SL_F",
         "B_soldier_AR_F",
         "B_HeavyGunner_F",
         "B_soldier_AAR_F",
         "B_soldier_M_F",
         "B_Sharpshooter_F",
         "B_soldier_LAT_F",
         "B_medic_F"
         ];

switch (typeof _radioBashnya) do {
    case "Land_Cargo_HQ_V1_F":{_BashN = 1;};
    case "Land_TTowerBig_2_F":{_BashN = 2;};
    case "Land_TBox_F":{_BashN = 3;};
};

private _Upos = getPosATL _radioBashnya;

//private _man = _grp createUnit [_typeunit,getPosATL _radioBashnya,[],10,"FORM"];

//=====================

_houseList = nearestObjects [_Upos, ["building"], _radius];
_safePos = [];
{
    _c = 0;
    while { format ["%1", _x buildingPos _c] != "[0,0,0]" } do {
        _safePos set [(count _safePos), [_x, _x buildingPos _c]];
        _c = _c + 1;
    };
} forEach _houseList;
_ind = (floor ((count _safePos) / 5));
_safePos = _safePos call BIS_fnc_arrayShuffle;

for "_i" from 1 to _ind do {
    _point = selectRandom _safePos;
	_safePos deleteAt (_safePos find _point);
    _house = _point # 0;
    _Upos = _point # 1;
    _man = _grp createUnit [selectRandom _list, _Upos, [], 0, "CAN_COLLIDE"];
	_watchDir = ((_man getDir _house) + 180);
    _man setDir _watchDir;
	_man setFormDir _watchDir;
    _man setUnitPos (selectRandom ["UP", "MIDDLE"]);
	_man disableAI "PATH";
	doStop _man;

    _man addEventhandler ["killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	//[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;

    _man addMPEventHandler ["mpkilled",{
  	_this spawn Srv_fnc_deletedeadman;
}];
[_man] call srv_fnc_rearmbot;	
}];
};

//=====================
_man setposatl _pos;
_man setdir _dir;
_man disableAI "MOVE";
[_man] call srv_fnc_fset_AISkill;
 [_man] join _grp;
_man allowFleeing 0;
_man setvariable ["BashN",_BashN,true];
_man setvariable ["Bash_N",true,true];
_gunmam = _radioBashnya getVariable "gunmam";
_gunmam pushback _man;
_radioBashnya setVariable ["gunmam",_gunmam,true];
[_grp,0] setWaypointType "HOLD";
_grp setBehaviour "AWARE";
_grp setCombatMode "RED";

_grp setVariable ["Vcm_Disable",true];
_man setVariable ["killed",true,true]; 
_man
*/