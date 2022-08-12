if(!isServer) exitWith {};
params ["_radioBashnya"];
private _grp = createGroup west;


private _radius = 40;
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
_ind = (floor ((count _safePos) / 1.5));
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

createGuardedPoint [west,getPosATL _radioBashnya,-1,_radioBashnya];


/*
private _BashN = 0;
private _defenceBash = "";
switch (typeof _radioBashnya) do {
    case "Land_Cargo_HQ_V1_F":{_BashN = 1;_defenceBash = "defenceBash1";};
    case "Land_TTowerBig_2_F":{_BashN = 2;_defenceBash = "defenceBash2";};
    case "Land_TBox_F":{_BashN = 3;_defenceBash = "defenceBash3";};
};

private ["_arrayposBash","_unit","_dr"];
_arrayposBash = [_radioBashnya] call srv_fnc_naearPosBash;
if!(_arrayposBash isEqualTo []) then {
    switch true do {
	    case (!nachinaem_zonovo && {!DatabasePointRead}):{
		    _arrayposBash =+ _arrayposBash;
			private _posb = [];
			private _countDefBash = ["read", ["Bash",_defenceBash]];
		    if(_countDefBash > 0) then {
			missionNamespace setVariable [_defenceBash,_countDefBash];
			
			    for "_i" from 1 to _countDefBash do {
				    _posb = selectRandom _arrayposBash;
					_posb params ["_pos","_dir"];
				    [_radioBashnya,_pos,_dir] call srv_fnc_createManBash;
					_arrayposBash deleteAt (_arrayposBash find _posb);
				}; 
			};
		};
	    case (nachinaem_zonovo):{
		    private _num = 0;
		    {
	            _x params ["_pos","_dir"];
	            [_radioBashnya,_pos,_dir] call srv_fnc_createManBash;
				_num = _num + 1;
            } forEach _arrayposBash; 
			missionNamespace setVariable [_defenceBash,_num];			
		};
    };
};
*/