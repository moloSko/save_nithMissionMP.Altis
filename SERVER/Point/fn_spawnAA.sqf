param ["_pos","_height","_veh","_target","_side"];

private ["_grp","ps"];
_grp = createGroup west;
_ps = [_pos # 0,_pos # 1, _height];
_myveh = [_ps, _target, _veh, _grp] call BIS_fnc_spawnVehicle;
