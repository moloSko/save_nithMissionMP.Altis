private["_unit","_name","_nObject"];
_unit = _this select 0;
_uid = getPlayerUID _unit;
_score = score _unit;


sleep 120;
_nObject = nearestObjects [_unit, ["Pistol_Base_F","Rifle_Base_F","LauncherCore","Default","HandGrenade","CA_Magazine"], 10];
if((count _nObject)>0) then {{deleteVehicle _x} forEach _nObject};

deletevehicle (player getVariable "SRV_AMMO0");

//----------
_IgrokVIgre  = missionNamespace getVariable ["IgrokVIgre",[]];
_IgrokVIgre deleteAt (_IgrokVIgre find _uid);
missionNamespace setVariable ["IgrokVIgre",_IgrokVIgre,true];

if(!isNull (player getVariable ["Naduvlodka",objNull])) then {
	(player getVariable ["Naduvlodka",objNull]) removeAllMPEventHandlers "mpkilled";
    (player getVariable ["Naduvlodka",objNull]) remoteexec ["deletevehicle",2];
};

//-----------
_unit removeAllMPEventHandlers "mpkilled";
_unit removeAllEventHandlers "Respawn";
_unit removeAllEventHandlers "killed";
_unit removeAllEventHandlers "HandleRating";
_unit removeAllEventHandlers "Fired";
_unit removeAllEventHandlers "getInMan";
_unit removeAllEventHandlers "getOutMan";
removeAllActions _unit;
deleteVehicle _unit;

private _veh =_unit getvariable "komanduyuVertom";
if(!isNull _veh && {alive _veh}) then {
	private _paracommander = _veh getVariable "paracommander";
	if(_unit == _paracommander) then {
		if!(_veh getVariable "VzyatUpravlenie") then {_veh setVariable ["VzyatUpravlenie",true,true]};
		_veh setVariable ["paracommander",objNull,true];
		_unit setvariable ["komanduyuVertom",objNull,true];
	};
};
//---------------------
//база данных

private _sc = score _unit;
private _PlayersArray = missionnamespace getvariable "PlayersArray";


_PlayersArray =+ _PlayersArray;

private ["_infa"];
{
    _infa = _x;
	_infa params ["_uidpl","","_stata"]; 
	if(_uid == _uidpl) then {_stata set [0,_sc]};
} forEach _PlayersArray;

missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
