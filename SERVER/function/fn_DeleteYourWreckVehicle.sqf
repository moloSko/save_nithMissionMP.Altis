if(!isServer) exitWith {};
private["_veh"];
_veh = _this select 0;
[_veh] remoteExec ["srv_fnc_DeleteAttachedObjCargo",2];
private _uid = _veh getVariable "srv_owner";
private _myVeh = Gamer getVariable [format ["MyVeh_%1",_uid],[]];
_myVeh deleteAt (_myVeh find _veh);
Gamer setVariable [format ["MyVeh_%1",_uid],_myVeh,true];

sleep 150;

_veh removeAllMPEventHandlers "mpkilled";
_veh removeAllEventHandlers "GetIn";

deleteVehicle _veh;
