
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_azi 	= _this select 0;
_pos 	= _this select 1;
_objs = _this select 2;
_CP = _this # 3;

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;
_newObjs = [];
private ["_multiplyMatrixFunc"];
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
_handledObj = objNull;
_turrets = ["B_GMG_01_high_F", "B_HMG_01_high_F", "B_HMG_01_F", "B_HMG_01_A_F", "B_static_AT_F", "B_GMG_01_F", "B_static_AA_F", "B_GMG_01_A_F"];
for "_i" from 0 to ((count _objs) - 1) do
{
	private ["_obj", "_type", "_relPos", "_azimuth", "_fuel", "_damage", "_newObj", "_newUnit", "_vehicleinit"];
	_obj = _objs select _i;
	_type = _obj select 0;
	_relPos = _obj select 1;
	_azimuth = _obj select 2;
	_fuel = _obj select 3;
	_damage = _obj select 4;
	_vehicleinit = _obj select 6;
	private ["_rotMatrix", "_newRelPos", "_newPos"];
	_rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
	_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
	private ["_z"];
	if ((count _relPos) > 2) then {_z = _relPos select 2} else {_z = 0};
	_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
	if (_turrets findIf { _x == _type } != -1) then { _veh = [[0,0,random (1000)], 0, _type, blufor] call BIS_fnc_spawnVehicle; _newObj = _veh # 0;} 
	else {_newObj = _type createVehicle [0,0,random (1000)]; };
	if !((typeOf _newObj) in ALL_OBJ_SIMULATION)then{_newObj enableSimulationGlobal false;};
	_newObj allowDamage false;
	//_newObj setPosWorld [_newPos#0, _newPos#1, (getPosWorld _newPos)#2];
	//if (_type == "Land_Cargo_House_V1_F") then {_newObj setPosWorld [(_newPos#0),(_newPos#1),((getPosWorld _newObj)#2)]};
	_newObj setDir (_azi + _azimuth);
	
	if (_type == "Land_TTowerBig_2_F") then {_newObj setPosATL _newPos;} 
	else {_newObj setPos _newPos; _newObj setVectorUp [0,0,1];};
	

	if (!isNil "_fuel") then {_newObj setFuel _fuel};
	if (!isNil "_damage") then {_newObj setDamage 0};
	_newObjs pushBack _newObj;
	if ((count _obj) == 11) then 
	{ 
		_handledObj = _newObj;
		_handledObj setVariable ["chargesToUse", _obj # 10, true];
	};
	_newObj allowDamage true;
};
_objects = [ _newObjs, _handledObj ];
_objects;
