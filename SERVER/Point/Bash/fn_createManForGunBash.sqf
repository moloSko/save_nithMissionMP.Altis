params ["_radioBashnya","_veh"];
private ["_grp","_man","_gunmam"];
if(!nachinaem_zonovo && {!DatabasePointRead}) then {if(isNull _veh) exitWith {}};
_grp = createGroup west;
 
private _typeunit = "";
switch true do {
	case (VANILAPODKL):{_typeunit = "B_soldier_M_F"};
};
  _man=_grp createUnit [_typeunit,getPosATL _radioBashnya,[],10,"FORM"];
  _man addEventhandler ["killed",{
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        //[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
    }];
  //_man setSkill 1;
  [_man] call srv_fnc_fset_AISkill;
  [_man] join _grp;
  _man allowFleeing 0;
  _man moveInGunner _veh;
  _gunmam = _radioBashnya getVariable "gunmam";
  _gunmam pushback _man;
  _radioBashnya setVariable ["gunmam",_gunmam,true];
  //[_man] call srv_fnc_exchangeFirstAidKid;
  _man setVariable ["Bashgun",_veh];
  _man setVariable ["killed",true,true];
    	
    _man addMPEventHandler ["mpkilled",{
       _this spawn {
          (param [0] getVariable "Bashgun") setDamage 1;
	    };	
      _this spawn Srv_fnc_deletedeadman;
	}];
	[_man] call srv_fnc_rearmbot;	
   _man  


