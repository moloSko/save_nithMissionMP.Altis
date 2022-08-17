
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_trgPos = _this # 0;    // Позиция триггера
_trgParams = _this # 1;     // Параметры триггера
_pointArray = [0, 1, 2];   // Типы точек 0, 1, 2 и т.д. по индексу в файле compositionsMap

_controlPoints = [];
_posCP = [];
objsDel = [];
for [{ private _i = 0 }, { _i < 3 }, { _i }] do {      // Спавним 3 точки
    _pos = [ _trgPos, _trgParams ] call trg_fnc_findTrgRandPos;     // Находим позицию в точке для спавна
    _pointType = selectRandom _pointArray;
    if (_pointType == 2) then 
    {
        if !( _pos isFlatEmpty [8, -1, 30 * (pi / 180), 2, 0, false, objNull] isEqualTo [] || ( isOnRoad _pos ) || (surfaceIsWater _pos) ) then 
        {
            _posEq = true;
            {
           if (_pos distance _x < 100) then 
           {
                _posEq = false;
           };
            } forEach _posCP;
            if (!_posEq) then {continue;};
            _posCP pushBack _pos;
            _pointArray deleteAt (_pointArray find _pointType);
            _controlPointMap = [_pointType] call trg_fnc_compositionsMap;
            _controlPointUnits = [_pointType] call trg_fnc_compositionsUnits;
            _dir = random 360;
            _objtmp = ([_dir, _pos,_controlPointMap, _i] call trg_fnc_objectMapper);
            [_dir, _pos, _controlPointUnits] call trg_fnc_CPUnitsSpawn;
            _controlPoints pushBack +_objtmp;
            _i = _i + 1;     // След. итерация
        };
    } else 
    {
        if !(_pos isFlatEmpty [20, -1, 30 * (pi / 180), 2, 0, false, objNull] isEqualTo [] || ( isOnRoad _pos ) || (surfaceIsWater _pos) ) then { // Условие проверки
            _posEq = true;
            {
            if (_pos distance _x < 100) then 
            {
                _posEq = false;
            };
            } forEach _posCP;
            if (!_posEq) then {continue;};
            _posCP pushBack _pos;
            _pointArray deleteAt (_pointArray find _pointType);
            _controlPointMap = [_pointType] call trg_fnc_compositionsMap;
            _controlPointUnits = [_pointType] call trg_fnc_compositionsUnits;
            _dir = random 360;
            _objtmp = ([_dir, _pos,_controlPointMap, _i] call trg_fnc_objectMapper);
            [_dir, _pos, _controlPointUnits] call trg_fnc_CPUnitsSpawn;
            _controlPoints pushBack +_objtmp;
            _i = _i + 1;     // След. итерация
        };
    };
};
_controlPoints;