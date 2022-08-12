if(!isServer) exitWith {};
params ["_veh"];
private _posPoint = getMarkerPos ((Gamer getVariable "datapoint") param [0]);
if(Stage != 5 && {alive _veh && {_veh distance _posPoint < 500}) then {
    sleep 60;
	if(!isNull _veh && {alive _veh}) then {
        _veh removeAllEventHandlers "GetOut";
        _veh removeAllMPEventHandlers "mpkilled";
        [_veh,1] remoteExecCall ["setDamage",2];
        [_veh] remoteExec ["srv_fnc_DeleteAttachedObjCargo",2];
	    private _side = _veh getVariable "vertSide";
        private _basaVert = "basaVert";
        private _arrvert = Gamer getVariable [_basaVert,[]];
	    _arrvert deleteAt (_arrvert find _veh);
        Gamer setVariable [_basaVert,_arrvert,true];
        sleep 30;
        _veh remoteexeccall ["DeleteVehicle",2];
	};
};