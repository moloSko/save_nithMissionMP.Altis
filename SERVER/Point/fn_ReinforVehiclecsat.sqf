if(!isServer) exitWith {};
params ["_Point","_REINFORCEMENT","_veharray"];

if(_REINFORCEMENT isEqualTo []) exitWith {};

private _markpos = getMarkerPos _Point;

private _SpawnPosVeh = selectRandom  _REINFORCEMENT;
private _group = creategroup east;
 private _newveharray = _veharray call BIS_fnc_arrayShuffle;
private _typeveh = selectRandom  _newveharray;

private _veh=[_group,_SpawnPosVeh,_typeveh,0] call Srv_fnc_createenemyvehiclecsat;
private _dir = [_SpawnPosVeh,_markpos] call BIS_fnc_dirTo;
_veh setDir _dir;

_group setBehaviour "AWARE";
_group setCombatMode "Red";
_w1=_group addWaypoint [_markpos,150];
_w1 setWaypointType "MOVE";
_w1 setWaypointCompletionRadius 200;
_w1 setWaypointStatements ["true", "[this] spawn srv_fnc_ReinforcePatrol"];

_veh