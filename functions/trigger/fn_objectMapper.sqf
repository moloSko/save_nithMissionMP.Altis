_azi 	= _this select 0;
_pos 	= _this select 1;
_objs = _this select 2;

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
	_newObj = _type createVehicle [0,0,1000];
	_newObj allowDamage false;
	_newObj enableSimulationGlobal false;
	_newObj setDir (_azi + _azimuth);
	_newObj setVectorUp [0,0,1];
	_newObj setPos _newPos;
	//_newObj call BIS_fnc_replaceWithSimpleObject;
	if (!isNil "_fuel") then {_newObj setFuel _fuel};
	if (!isNil "_damage") then {_newObj setDamage 0};
	_newObjs pushBack _newObj;
	if ((count _obj) == 11) then { _handledObj = _newObj };
};
_objects = [ _newObjs, _handledObj ];
_objects;