_spawnLocation = _this select 0;
_triggerPoint = _this select 1;
_radiusSearch = 15;
_spawnPoint =[_spawnLocation#1,3000,5000,5,0,0.065,0,[],[]] call BIS_fnc_findSafePos;
private _supgroup = [_spawnPoint,West,(configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfSquad")] call BIS_fnc_spawnGroup;
private _unitsCargo = units _supgroup;
private _heli = createVehicle ["B_Heli_Transport_03_F",_spawnPoint, [], 0, "FLY"];
createVehicleCrew _heli;
private _flares = {
    while {alive driver _this && {!(isTouchingGround _this)}} do {
        sleep 2;
        _this action ["useWeapon", _this, driver _this, 0];
    };
};
private _group = group driver _heli;
_group addVehicle _heli;
{_x setSkill ["courage", 1]} forEach units _group;
_dir = _heli getDir _spawnLocation#1;
_heli setDir _dir;
{_x moveInCargo _heli} forEach _unitsCargo;
sleep 10;
_coords = _spawnLocation#1;

_heli domove _coords;
_waypointUpTrigger = _group addWaypoint [[_coords#0,_coords#1,_coords#2 + 50],0];
_waypointUpTrigger setWaypointType "MOVE";
_waypointExitTrigger = _group addWaypoint [[_coords#0 - (_spawnPoint#0 - _coords#0),_coords#1 - (_spawnPoint#1 - _coords#1),_coords#2],0];
_waypointExitTrigger setWaypointType "MOVE";
_heli flyinheight 200;
waitUntil {
sleep 1;
(_heli distance _spawnLocation#1) < 1700
};
_heli spawn _flares;
waitUntil {
(_heli distance _spawnLocation#1) < 500
};
_heli domove [_coords#0 - (_spawnPoint#0 - _coords#0),_coords#1 - (_spawnPoint#1 - _coords#1),_coords#2];
sleep 5;
{
    removeBackpack _x;
    _x addBackpack "B_Parachute";
    [_x] ordergetin false;
    [_x] allowGetIn false;
    unassignvehicle _x;
    moveout _x;
    sleep 0.3;
} forEach(units _supgroup);
sleep 10;
[_supgroup, _spawnLocation#1, triggerArea _triggerPoint # 0] call BIS_fnc_taskPatrol;
_heli flyinheight 150;
waitUntil {
(_heli distance _spawnLocation#1) > 1500
};
{deleteVehicle _x} forEach ((units group _heli) + [_heli]);