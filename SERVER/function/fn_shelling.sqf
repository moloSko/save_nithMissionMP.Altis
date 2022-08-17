params ["_pos","_cnt","_range","_ammo"];
_pos params ["_px","_py"];
private ["_shell"];
for "_i" from 1 to _cnt step 1 do
{
  _shell = createVehicle [_ammo,[_px + (random _range),_py + (random _range),150],[],0,""];
  _shell setVectorUp [0, -90,-1];
  _shell setVelocity [0,0,-200];
  sleep 1;
};
