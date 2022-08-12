params ["_pos", "_params"];
private _pos1 = _pos findEmptyPosition [0, _params select 0];
if (_pos1 isEqualTo []) exitWith {_pos};
_params =+ _params;
_params set [0, -1];
private _pos2 = _pos1 isFlatEmpty _params;
if (_pos isEqualTo []) exitWith {_pos1};
_pos2
