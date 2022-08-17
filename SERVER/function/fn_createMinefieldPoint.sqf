params ["_Centr","_countMF","_distUdaleniya","_type","_cntM","_axisA","_axisB","_dir","_forma","_side"];
_posCentr = getMarkerPos _Centr;
_posCentr params ["_posx","_posy"];
private _dir = random 360;
private _shagDir = 360/_countMF;
private _arraypos = [];
for "_i" from 1 to _countMF do {
  _dir = _dir + _shagDir; 
  if(_dir > 360) then {_dir = _dir - 360}; 
  _pos = [_posx + ((sin _dir) * _distUdaleniya),_posy + ((cos _dir) * _distUdaleniya)];
  _arraypos pushback _pos;
};

{
   [_x,_type,_cntM,_axisA,_axisB,_dir,_forma,_side,false] call srv_fnc_minefield;
} forEach _arraypos;