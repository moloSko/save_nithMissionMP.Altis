if(!isServer) exitWith {};
params ["_grp","_ptrpos","_arraypos"];
_arraypos params ["_ptrpos0","_ptrpos1","_ptrpos2","_ptrpos3","_ptrpos4","_ptrpos5","_ptrpos6","_ptrpos7"];

private _pt1 = [];
private _pt2 = [];
private _nextpos1 = [];
private _nextpos2 = [];
switch _ptrpos do {
    case _ptrpos0:{_pt1 = _ptrpos7;_pt2 = _ptrpos1;};
    case _ptrpos2:{_pt1 = _ptrpos1;_pt2 = _ptrpos3;};
    case _ptrpos4:{_pt1 = _ptrpos3;_pt2 = _ptrpos5;};
    case _ptrpos6:{_pt1 = _ptrpos5;_pt2 = _ptrpos7;};	
};

if!(_pt1 isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []) then {
    _nextpos1 = _pt1;
} else {
    _nextpos1  = [_ptrpos,_pt1] call srv_fnc_nearshore;
};
if!(_pt2 isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []) then {
    _nextpos2 = _pt2;
} else {
    _nextpos2 = [_ptrpos,_pt2] call srv_fnc_nearshore;
};
private _leader = leader _grp;
_leader setVariable ["data",[_ptrpos,_nextpos1,_nextpos2]];

[_grp,_ptrpos,20,"MOVE","STEALTH","RED","LIMITED",20,"this spawn srv_fnc_rptr"] call srv_fnc_addWaypoint;
