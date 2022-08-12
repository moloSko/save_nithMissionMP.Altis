if(!local player) exitWith {};
params ["_gen","_caller","_id"];
//_gen removeAction _id;
[_gen,_id] remoteexeccall ["removeAction",0,_gen];
private ["_posammo","_pos","_magazineClass","_ammo","_n","_RBT","_text","_gunmam","_arrayMine"];

player playActionNow "PutDown";

_posammo = [];
_pos = getPosATL ((_gen getVariable "expRT") param [0]);
_posammo append _pos;

_magazineClass = (_gen getVariable "expRT") param [1];

_ammo = "Bomb_04_F";

if(System == 1 || {System == 2}) then {
    //[[player],{param [0] addscore 3}] remoteexec ["call",2];
	
	private _uidpl = getPlayerUID player;
	private _sc = score player;
    private _PlayersArray = missionnamespace getvariable "PlayersArray";
        
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
_text = format [localize "STR_CONF_BASH6",_n];

[[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];
_text remoteexec ["hint",[0,-2] select isDedicated];	
//private _time = time + 40;
//waituntil{sleep 0.1;time >= _time;};
for "_i" from 0 to 40 do {
    _text = format [localize "STR_CONF_BASH7",_n,40 - _i];
    [[_text],{hint param [0]}] remoteexec ["call"];    
    sleep 1;
}; 

[[(_RBT getVariable "expRT") param [0]],{deleteVehicle param [0]}] remoteExec ["call",2];

[[_ammo,_posammo],{param [0] createvehicle param [1]}] remoteExec ["call",2];
 
_gunmam = _RBT getVariable ["gunmam",[]];

[[_gunmam],{{if(!(isNull _x) && {alive _x}) then {_x setDamage 1}} forEach param [0]}] remoteExec ["call",2];


[[_gen],{param [0] removeAllEventHandlers "HandleDamage"}] remoteExec ["call",2];

[[_gen],{deleteVehicle param [0]}] remoteExec ["call",2];

[[_RBT getVariable "Mine"],{{deleteVehicle _x} forEach param [0]}] remoteExec ["call",2];


[[_RBT],{param [0] removeAllEventHandlers "HandleDamage"}] remoteExec ["call",2];

[[_RBT],{param [0] setDamage 1}] remoteExec ["call",2]; 


