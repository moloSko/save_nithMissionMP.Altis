//create ENEMY units
private["_group","_location","_type","_radius","_unit"];

_group=_this select 0;	
_spawnpos=_this select 1;	
_type=_this select 2;	
_radius=_this select 3;


_unit =_group createUnit [_type,_spawnpos,[],_radius,"FORM"];

[_unit] call srv_fnc_fset_AISkill;
_unit setVariable ["killed",true,true];

_unit addMPEventHandler ["mpkilled",{_this spawn Srv_fnc_deletedeadman;}];
if(HardReinfor == 1) then {_unit setVariable ["CountDMan",1,true]};
[_unit] call srv_fnc_rearmbot;
_unit
