if(!isServer) exitWith {};
params ["_leader"];
private _grp = group _leader;
(_leader getVariable ["data",[]]) params ["_ptrpos","_nextpos1","_nextpos2"];
_grp setBehaviour "STEALTH";
_grp setSpeedMode "LIMITED";

{deleteWaypoint [_grp,0]} forEach (waypoints _grp);

private _next1 = !(_nextpos1 isEqualTo []);
private _next2 = !(_nextpos2 isEqualTo []);

switch (true) do {
    case (_next1 && {_next2}):{ 
	    [_grp,_nextpos1,20,"MOVE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
        [_grp,_ptrpos,20,"MOVE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
        [_grp,_nextpos2,20,"MOVE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
        [_grp,_ptrpos,20,"CYCLE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
    };
    case (_next1 && {!_next2}):{
	    [_grp,_nextpos1,20,"MOVE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
		[_grp,_ptrpos,20,"CYCLE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
	};
    case (!_next1 && {_next2}):{
	    [_grp,_nextpos2,20,"MOVE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
		[_grp,_ptrpos,20,"CYCLE","STEALTH","RED","LIMITED",20] call srv_fnc_addWaypoint;
	};
    case (!_next1 && {!_next2}):{
	    [_grp,_ptrpos,150,5] call srv_fnc_taskPatrol;
	};	
};   
