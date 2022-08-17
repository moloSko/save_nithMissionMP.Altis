if(!isServer) exitWith {};
params ["_Point","_Point","_veharray"];

//"ТЕХНИКА СПАВНИТСЯ" remoteexec ["hint",[0,-2] select isDedicated];

if(_REINFORCEMENT isEqualTo []) exitWith {};

private _markpos = getMarkerPos _Point;

private _SpawnPosVeh = [(_markpos select 0) + 300,(_markpos select 1) + 300,250];
private _group = creategroup west;
 private _newveharray = _veharray call BIS_fnc_arrayShuffle;
private _typeveh = selectRandom  _newveharray;

private _veh=[_group,_SpawnPosVeh,_typeveh,0] call Srv_fnc_createenemyvehicle;
private _dir = [[(_markpos select 0) + 300,(_markpos select 1) + 300,250],[(_markpos select 0) + 1000,(_markpos select 1) + 300,250]] call BIS_fnc_dirTo;
_veh setDir _dir;

_group setBehaviour "AWARE";
_group setCombatMode "Red";
_w1=_group addWaypoint [_markpos,150];
_w1 setWaypointType "MOVE";
_w1 setWaypointCompletionRadius 200;
_w1 setWaypointStatements ["true", "[this] spawn srv_fnc_ReinforcePatrol"];

switch true do {
    case (_typeveh in Car):{
		private _countcar =  missionnamespace getvariable "countcar";   
		_countcar = _countcar + 1;
        missionnamespace setvariable ["countcar",_countcar,true];		
    };
    case (_typeveh in Tank):{
		private _counttank = missionnamespace getvariable "counttank";
		_counttank = _counttank + 1;
		missionnamespace setvariable ["counttank",_counttank,true];
    };			
};

_veh

 