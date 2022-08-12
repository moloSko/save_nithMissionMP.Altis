private["_unit","_name","_nObject"];
_unit = _this select 0;

sleep 120;
_nObject = nearestObjects [_unit, ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","TimeBombCore","Default"], 10];
if((count _nObject)>0) then
{
    {
     deleteVehicle _x
    } forEach _nObject;
};
removeAllActions _unit;
deleteVehicle _unit;