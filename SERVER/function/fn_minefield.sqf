params [
"_posP",//позиция минного поля
"_minesType",//класс мины. Например: "rhs_mine_pmn2"
"_minesCnt",//Количество мин. Например: 50 
"_axisA",//размер по оси х. Например: 50 
"_axisB",//размер по оси у. Например: 50 
"_dir",//направление  в котором мины будут направленны. Например: random 360
"_shape",//форма. может быть "rectangle" (прямоугольник) или "ellipse" (круг)  
"_side",//сторона которой мины будут видны
"_mark"//создавать маккеры на минах (для теста).false/true
];
private _getPos = {};
private _next = false;

if (_shape == "rectangle") then {
	_getPos = {
	    private _pos = [0,0,0];
		private _coef = 1; if (random 1 >= 0.5) then {_coef = -1};
		private _hpos = [_posP, (random _axisA) * _coef, _dir] call BIS_fnc_relPos;
		private _coef = 1; if (random 1 >= 0.5) then {_coef = -1};
		_pos = [_hpos, (random _axisA) * _coef, _dir + 90] call BIS_fnc_relPos;
		[_pos select 0, _pos select 1]
	};
} else {
	_getPos = {
	    private _dir2 = random 360;
		private _dir3 = _dir2 - _dir;
		private _line1 = sqrt (((_axisA^2) * (_axisB^2)) / ((_axisB^2) + ((_axisA^2) * ((1/(tan _dir3))^2))));
		private _line2 = _line1 * (1/(tan _dir3));
		private _line = sqrt ((_line1^2) + (_line2)^2);
		_pos = [_pos, random _line, _dir2] call BIS_fnc_relPos;
		[_pos select 0, _pos select 1]
	};
};

for [{_x = 0}, {_x < _minesCnt}, {_x = _x + 1}] do {
	_pos = call _getPos;
	private _overLand = !(_pos isFlatEmpty [-1,-1, 1,-1,0,false] isEqualTo []);
	private _overWater = !(_pos isFlatEmpty [-1,-1,-1,-1,2,false] isEqualTo []);
	switch (true) do {
	    case _overLand:{_pos = [_pos select 0,_pos select 1,0];_next = true;};
	    case _overWater:{
		    private _seadepth = abs (getTerrainHeightASL _pos);
		    if(_seadepth > 1.4) then {
			    _minesType = "UnderwaterMine";
				_pos = [_pos select 0,_pos select 1,-1];
				_next = true;
		    };
		};
	};

	if(_next) then {
	    _mine = createMine [_minesType, _pos, [], 0];
	    _mine setDir _dir;
	    _side revealMine _mine;
        if(_mark) then {
	        _numberMine = missionNameSpace getVariable ["numberMine",0];
            _marker = createmarker [format ["mine_%1",_numberMine],_pos];
            _marker setMarkerType "mil_dot";
            _marker setMarkerSize [1,1];
            _marker setMarkerColor "ColorRed",
		    _numberMine = _numberMine + 1;
		    missionNameSpace setVariable ["numberMine",_numberMine,true];
        };	
    };
};
