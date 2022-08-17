params [
    "_group",
    "_position",
    ["_radius", 0, [0]],
    ["_type", "MOVE", [""]],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_compRadius", 0, [0]],
    ["_onComplete", "", [""]],
	["_timeout", [0,0,0], [[]], 3],
	["_formation", "NO CHANGE", [""]]
];


private ["_waypoint"];
_waypoint = _group addWaypoint [_position, _radius];

_waypoint setWaypointType _type;
_waypoint setWaypointBehaviour _behaviour;
_waypoint setWaypointCombatMode _combat;
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointCompletionRadius _compRadius;
_waypoint setWaypointStatements ["TRUE", _onComplete];
_waypoint setWaypointTimeout _timeout;
_waypoint setWaypointFormation _formation;

_waypoint
