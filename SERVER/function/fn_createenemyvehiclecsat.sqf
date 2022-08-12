//create ENEMY vehicles	

params ["_group","_spawnpos","_type","_radius"];	


 private _veh=createVehicle [_type, _spawnpos, [], _radius, "FLY"];
_veh setVariable ["UIDPlayerDam",[],true];
_veh setVariable ["NumberOneDamage",[],true];
_veh setVariable ["killed",true,true];
_veh addItemCargoGlobal ["toolkit",5];
_veh setVariable ["dnt_remove_me",true];
[_veh,""] call srv_fnc_setVehicleName;
createVehicleCrew _veh;
private _crew = crew _veh;
_crew joinsilent _group;
_group addVehicle _veh;

{
  [_x] call srv_fnc_fset_AISkill;
} forEach _crew;

if((getDammage _veh)>0.1) then {_veh setDamage 0};


_veh