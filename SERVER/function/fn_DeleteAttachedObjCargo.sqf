if(!isServer) exitWith {};
params ["_veh"];
private _array =+ (_veh getVariable ["cargo_loaded",[]]);
if!(_array isEqualTo []) then {
    {
    detach _x;
    _x remoteexeccall ["DeleteVehicle",2];
    } forEach _array;
};