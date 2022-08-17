if(!isServer) exitWith {};
if(_BoxArray isEqualTo []) exitWith {};

private ["_box","_arrayPlayerBox"];

{
    _x params ["_uid","_nameplayer","_namebox","_posbox"];
	_box = createvehicle ["Box_NATO_Wps_F",_posbox, [], 0, "NONE"];
	clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    _box addEventHandler ["HandleDamage", {0}];
	_box setVariable ["owner",_nameplayer,true];
	_box setVariable ["srv_getPlayerUid",_uid,true];
	[_box,_namebox] call srv_fnc_setVehicleName;
	_arrayPlayerBox = missionnamespace getvariable ["arrayPlayerBox",[]];
	_arrayPlayerBox pushback _box;
	missionnamespace setvariable ["arrayPlayerBox",_arrayPlayerBox,true];
	if(_check_db_addons) then {[_box,_uid] call srv_fnc_loadContentsOfbox};	
} forEach _BoxArray;