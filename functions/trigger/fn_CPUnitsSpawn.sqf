
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_dir = _this # 0;
_pos = _this # 1;
_units = _this # 2;

_multiplyMatrixFunc =
{
private ["_array1", "_array2", "_result"];
_array1 = _this select 0;
_array2 = _this select 1;
_result =
	[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];
_result
};

_grp = createGroup West;
{	
	private "_newDir";
	if (((_x # 2) + _dir) > 360) then 
	{
		_newDir = ((_x # 2) + _dir) - 360;
	} else 
	{
		if (((_x # 2) + _dir) < 0) then {_newDir = ((_x # 2) + _dir) + 360;} else {_newDir = ((_x # 2) + _dir);};
	};
	private ["_rotMatrix", "_newRelPos", "_newPos"];
	_rotMatrix =[[cos _dir, sin _dir],[-(sin _dir), cos _dir]];
	_newRelPos = [_rotMatrix, _x # 1] call _multiplyMatrixFunc;
	private "_z";
	if (_x # 1 # 2 == 0) then {_z = 0} else {_z = (_x # 1 # 2 + _pos # 2)};
    _unit = _grp createUnit [_x # 0,[0,0, random 1000], [], 0, "CAN_COLLIDE"];
	_unit setDir _newDir;
	_unit setFormDir _newDir;
	_unit setPos [(_newRelPos # 0 + _pos # 0), (_newRelPos # 1 + _pos # 1), _z];
    _unit disableAI "PATH";
    _unit setUnitPos selectRandom ["UP","UP","MIDDLE"];
} forEach _units;