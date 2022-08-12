
/*
	File: taskPatrol.sqf
	Author: Joris-Jan van 't Land

	Description:
	Create a random patrol of several waypoints around a given position.

	Parameter(s):
	_this select 0: the group to which to assign the waypoints (Group)
	_this select 1: the position on which to base the patrol (Array)
	_this select 2: the maximum distance between waypoints (Number)
	_this select 3:количество путей
	_this select 4: (optional) blacklist of areas (Array)
	
	Returns:
	Boolean - success flag
*/

//Validate parameter count
if ((count _this) < 4) exitWith {debugLog "Log: [taskPatrol] Function requires at least 4 parameters!"; false};

private ["_grp", "_pos", "_maxDist", "_count", "_blacklist"];
_grp = _this select 0;
_pos = _this select 1;
_maxDist = _this select 2;
_count = _this select 3;

_blacklist = [];
if ((count _this) > 4) then {_blacklist = _this select 4};

//Validate parameters

if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Журнал: [taskPatrol] групп нет(0) должна быть Группа!"; false};
if ((typeName _pos) != (typeName [])) exitWith {debugLog "Журнал: [taskPatrol] позиция (1) должен быть массивом!"; false};
if ((typeName _maxDist) != (typeName 0)) exitWith {debugLog "Журнал: [taskPatrol] Максимальное расстояние (2) должно быть числом!"; false};
if ((typeName _count) != (typeName 0)) exitWith {debugLog "Журнал: [taskPatrol] Количество путей (3) должно быть числом!"; false};
if ((typeName _blacklist) != (typeName [])) exitWith {debugLog "Журнал: [taskPatrol] черный список (4) должен быть массивом!"; false};

//_grp setBehaviour "SAFE";
_grp setBehaviour "STEALTH";
//Create a string of randomly placed waypoints.
private ["_prevPos"];
_prevPos = _pos;
for "_i" from 1 to _count do
{
	private ["_wp", "_newPos"];
	_newPos = [_prevPos, 50, _maxDist, 1, 0, 60 * (pi / 180), 0, _blacklist] call Srv_fnc_findSafePos;
	_prevPos = _newPos;

	_wp = _grp addWaypoint [_newPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;

	//Set the group's speed and formation at the first waypoint.
	if (_i == 1) then
	{
		_wp setWaypointSpeed "LIMITED";
		_wp setWaypointFormation "STAG COLUMN";
	};
};

//Cycle back to the first position.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;

true
