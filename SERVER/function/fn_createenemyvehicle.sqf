//create ENEMY vehicles	

params ["_group","_spawnpos","_type","_radius"];	


 private _veh=createVehicle [_type, _spawnpos, [], _radius, "FLY"];
_veh setVariable ["UIDPlayerDam",[],true];
_veh setVariable ["NumberOneDamage",[],true];
_veh setVariable ["killed",true,true];
_veh addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2}];
_veh addEventhandler ["killed",{_this spawn srv_fnc_DeleteWreckVehicle;}];
_veh addItemCargoGlobal ["toolkit",5];
_veh setVariable ["dnt_remove_me",true];
[_veh,""] call srv_fnc_setVehicleName;
createVehicleCrew _veh;
private _crew = crew _veh;
_crew joinsilent _group;
_group addVehicle _veh;

{
  [_x] call srv_fnc_fset_AISkill;
  _x setVariable ["killed",true,true];
  _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
  _x addEventhandler ["killed",{
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    //[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
  }];
} forEach _crew;

if((getDammage _veh)>0.1) then {_veh setDamage 0};
 
switch true do {
    case (_type in Car):{
		  _veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	//[_unit,_killer,_instigator,2] spawn bt_fnc_addScore;
}];
    };
    case (_type in Tank):{
		  _veh addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	//[_unit,_killer,_instigator,3] spawn bt_fnc_addScore;
}];
    };			
};

["SetTexture",[_veh]] call F_fnc_Veh;

_veh