if(!local player) exitWith {};
if!("SatchelCharge_Remote_Mag" in (magazines player)) then {
   hint "В снаряжении отсутстует взрывчатка"
} else {
  params ["_gen","_caller","_id"];
  //_gen removeAction _id;
  [_gen,_id] remoteexeccall ["removeAction",0,_gen];
  private ["_xy","_pos","_pos1_setupObjectClass","_exp","_n","_RBT","_text"];

[] spawn {player playMove "PutDown"};
  
  _xy = ((random 0.5)-(random 1));
  _pos = getposATL _gen;
  _pos1 = [(_pos param [0])+_xy,(_pos param [1])+_xy,_pos param [2]];

  _setupObjectClass = getText(ConfigFile >> "CfgMagazines" >> "SatchelCharge_Remote_Mag" >> "ace_explosives_SetupObject");

  _exp = _setupObjectClass createVehicle _pos1;
  _exp setPosATL _pos1;
  _exp setDir (random 360);
  _gen setvariable ["expRT",[_exp,"SatchelCharge_Remote_Mag"],true];
  player removeMagazine "SatchelCharge_Remote_Mag";
  
  [_gen,[localize "STR_CONF_BASH4",srv_fnc_placeEXPBash,[],1000, false, true,"","((player distance _target)<5)"]] remoteexeccall ["addaction",[0, -2] select isDedicated,_gen];
    if(System == 1 || {System == 2}) then {  
        //[player,3] remoteexec ["addscore",2];
		
		private _uidpl = getPlayerUID player;
		private _sc = score player;
        private _PlayersArray = missionnamespace getvariable ["PlayersArray",[]];
            
        _PlayersArray =+ _PlayersArray;
 
        private ["_infa"];
        {
            _infa = _x;
	        _infa params ["_uidplayer","","_stata"]; 
	        if(_uidpl == _uidplayer) then {_sc = _sc + 3;_stata set [0,_sc];};
        } forEach _PlayersArray;
        missionnamespace setvariable ["PlayersArray",_PlayersArray,true];	
	};
   
    _n = 0;
	_RBT = _gen getVariable "RBT";
    switch (typeof _RBT) do {
      case "Land_Cargo_HQ_V1_F":{_n = 1};
      case "Land_TTowerBig_2_F":{_n = 2};
      case "Land_TBox_F":{_n = 3};
	};
    _text = format [localize "STR_CONF_BASH5",_n];
   
    [[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];
    _text remoteexec ["hint",[0,-2] select isDedicated];					
};




