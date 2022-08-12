 
	
params ["_ps","_spwndir","_type","_pos"];
private _grp = createGroup west;
private _v = random 100 - (random 200);
private _ps1 = [(_ps select 0) + _v,(_ps select 1) + _v, 300];

private _arair1 = [_ps1,_spwndir,_type,_grp] call BIS_fnc_spawnVehicle;
private _ve = _arair1 select 0; 
private _crew = _arair1 # 1;
{
  _x addEventhandler ["killed",{
    params ["_unit", "_killer", "_instigator", "_useEffects"];
   // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
  }];
} forEach _crew;
_ve setVariable ["UIDPlayerDam",[],true];
_ve setVariable ["NumberOneDamage",[],true];
_ve setVariable ["DeadAir",1,true];
_veh setVariable ["dnt_remove_me",true];
_ve setVariable ["killed",true,true];
_ve addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2;}];
_ve addEventhandler ["killed",{
  params ["_unit", "_killer", "_instigator", "_useEffects"];
  _this spawn srv_fnc_DeleteWreckVehicle;
  (_this select 0) setVariable ["DeadAir",nil,true];
 // [_unit,_killer,_instigator,3] spawn bt_fnc_addScore;
}];

{
  [_x] call srv_fnc_fset_AISkill;
  _x setVariable ["killed",true,true];
  _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
} forEach (crew _ve);

_ve setVelocity [0, 150,1];


private ["_wp","_randir","_randis","_wppos"];

for "_i" from 1 to (5 + (random 5)) step 1 do {
  if(_i==1) then {
    _wp = _grp addWaypoint [_pos,0];
    _wp setWaypointCompletionRadius 50
  } else {			
    _randir = floor(random 360);
    _randis = floor(random 500);
    _wppos = [(_pos select 0) + ((sin _randir) * _randis), (_pos select 1) + ((cos _randir) * _randis)];

    _wp = _grp addWaypoint [_wppos, 0, _i];
    [_grp, _i] setWaypointType "SAD";
    [_grp, _i] setWaypointBehaviour "AWARE";
    [_grp, _i] setWaypointCombatMode "RED";
    [_grp, _i] setWaypointCompletionRadius 50;
	};
};
private "_wp";
_wp = _grp addWaypoint [_pos,0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 50;				 
        