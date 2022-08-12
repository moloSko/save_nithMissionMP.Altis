params ["_markpos","_spawnpos","_dir"];

private _grp = createGroup west; //группа экипажа вер

private _height = 150 + (random 50);
private _ps1 = [(_spawnpos select 0),(_spawnpos select 1) + 200, _height];
private _type = selectRandom  EnemyHelli;
private _arveh = [_ps1,_dir,_type,_grp] call BIS_fnc_spawnVehicle;
private _ve = _arveh select 0;
[_ve,""] call srv_fnc_setVehicleName; 
{
    [_x] call srv_fnc_fset_AISkill;
	_x setVariable ["killed",true,true];
    _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
	[_x] call srv_fnc_rearmbot;
} forEach (crew _ve);

_ve flyInHeight 100;    
_ve setVariable ["UIDPlayerDam",[],true];
_ve setVariable ["NumberOneDamage",[],true];
_ve setVariable ["DeadAir",1,true];
_ve setVariable ["dnt_remove_me",true];
_ve setVariable ["killed",true,true];
_ve setVariable ["PodkrepCobraApach",1,true];

_ve addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2;}];
_ve addEventhandler ["killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_this spawn srv_fnc_DeleteWreckVehicle;
	(_this select 0) setVariable ["DeadAir",nil,true];
	//[_unit,_killer,_instigator,3] spawn bt_fnc_addScore;
}];
_ve addItemCargoGlobal ["toolkit",5];
[_ve,""] call srv_fnc_setVehicleName; 
    
for "_i" from 1 to 2 do {
    if(_i==1) then {
    _wp1 = _grp addWaypoint [_markpos,0];
    _wp1 setWaypointType "SAD";
    _wp1 setWaypointSpeed "FULL";
    _wp1 setWaypointBehaviour "COMBAT";
    _wp1 setWaypointCombatMode "RED";			
    _wp1 setWaypointCompletionRadius 200;
    } else {	
    _wp1 = _grp addWaypoint [_markpos, 0, _i];
    [_grp, _i] setWaypointType "SAD";
    [_grp, _i] setWaypointSpeed "FULL";
    [_grp, _i] setWaypointBehaviour "COMBAT";
    [_grp, _i] setWaypointCombatMode "RED";
    [_grp, _i] setWaypointCompletionRadius 200;
    [_grp, _i] setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];			
    };
};
_wp1 = _grp addWaypoint [_markpos,0];
_wp1 setWaypointType "CYCLE";
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointBehaviour "COMBAT";
_wp1 setWaypointCombatMode "RED";	
_wp1 setWaypointCompletionRadius 200;
_wp1 setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];