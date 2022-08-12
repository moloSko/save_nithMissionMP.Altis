if(!isServer) exitWith {};
if(Stage == 5) exitWith {};
params ["_posPoint","_arrayrecon"];

private _spawnrecongroup = missionNameSpace getVariable ["spawnrecongroup",true];
if(!_spawnrecongroup) exitWith {};
missionNameSpace setVariable ["spawnrecongroup",false,true];

_posPoint params ["_posx","_posy"];
private _dir = random 360;
private _shagDir = 360/8;
private _arraypos = [];
private _pos = [];
private _dist = (srv_sizepoint param [0]) + 400;

for "_i" from 1 to 8 do {
  _dir = _dir + _shagDir; 
  if(_dir > 360) then {_dir = _dir - 360}; 
  _pos = [_posx + ((sin _dir) * _dist),_posy + ((cos _dir) * _dist)];
  _arraypos pushback _pos;
};

private ["_ptrpos","_sppos","_nopldist","_overWater","_grp","_recongrouparry","_SP","_SupportArray","_testsppos","_list"];
{
    if(_forEachIndex mod 2 == 0) then {
        _ptrpos = _x;
        _overWater = !(_ptrpos isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []);
        if(_overWater && {_ptrpos distance (getMarkerPos "respawn_east") > 300}) then {
            _grp  = creategroup west;
	        _testsppos = [];
			while {true} do {
			    _testsppos = [_posPoint, 1,400, 1, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
			    _list = _testsppos nearEntities [["Man","Car","Tank"],200];
				if((EAST countSide _list) == 0) exitWith {_sppos =+ _testsppos};
			};
			
			{
		        _unit = [_grp,_sppos,_x,5,1] call srv_fnc_createenemyunit;
				_unit addEventhandler ["killed",{
					params ["_unit", "_killer", "_instigator", "_useEffects"];
					//[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
				}];
	            [_unit] join _grp;
		        _recongrouparry = missionNameSpace getVariable ["recongrouparry",[]];
		        _recongrouparry pushback _unit;
		        missionNameSpace setVariable ["recongrouparry",_recongrouparry];
		        _unit setVariable ["deadunit",false];
		        _unit addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deadreconunit}];
		    } forEach _arrayrecon;
		    _grp selectleader (units _grp select 0);
		    _grp setCombatMode "RED";
		    _grp setBehaviour "AWARE";
		    _grp setSpeedMode "FULL";
		    [_grp,_ptrpos,_arraypos] call srv_fnc_reconPatrol;		
        };
    };		
} forEach _arraypos;