params ["_radioBashnya"];
private ["_result","_pos","_bpos","_dir"];

_result = [];
_pos = _radioBashnya buildingpos 0;

if ( _pos select 0 != 0 ) then {
    _bpos = 1;
    while { _pos select 0 != 0 } do {
        _dir = (getPos _radioBashnya) getDir _pos;
		 _pos set [2, (_pos select 2) + 0.1];
        _result set [count _result, [_pos, floor _dir]];
        _bpos = _bpos + 1;
        _pos = _radioBashnya buildingpos _bpos;
    };
};

_result



