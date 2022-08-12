params ["_gr","_v","_cmmin","_ost","_n"];

private _cm = 0;

private _next = false;

if(_gr isEqualTo _v) then {
	if(_cmmin) then {
	    switch true do {
		    case (_ost > 0):{_cm = _ost};
		    case (_ost == 0):{_cm = _n};
		};
	    _next = true;
	} else {
	    _cm = _n;
		_next = true;
	};
} else {
    _cm = _n;
	_next = true;
};
if(_next) exitWith {_cm};
