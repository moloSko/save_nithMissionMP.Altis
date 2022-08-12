scopeName "srv_main";
params ["_ptrpos","_waterPos"];

private _newPos = [];
_ptrpos params ["_ptrposX","_ptrposY"];
private _dir = [_ptrpos,_waterPos] call bis_fnc_dirTo;
private _dist = _ptrpos distance _waterPos;
while {_dist > 0} do
{
   _dist = _dist - 50;
   private _testPos = [_ptrposX + ((sin _dir) * _dist),_ptrposY + ((cos _dir) * _dist)];
    if!(_testPos isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []) then {
		_newPos = _testPos;
		breakTo "srv_main";
	};
};

_newPos
