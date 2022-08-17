params ["_veh",["_nameveh",""]];


if(_nameveh == "") then {
	_nameveh = [_veh] call srv_fnc_createname;
};
missionnamespace setvariable [_nameveh,_veh,true];
[_veh,_nameveh] remoteExec ["setVehicleVarName", [0, -2] select isDedicated, _veh];

_nameveh
