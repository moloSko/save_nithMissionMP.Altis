_trgPos = _this # 0;    // Позиция триггера
_trgParams = _this # 1;     // Параметры триггера
_pointArray = [0, 1];   // Типы точек 0, 1, 2 и т.д. по индексу в файле compositionsMap

_controlPoints = [];
for [{ private _i = 0 }, { _i < 2 }, { _i }] do {      // Спавним 3 точки
    _pos = [ _trgPos, _trgParams ] call trg_fnc_findTrgRandPos;     // Находим позицию в точке для спавна
    if !( _pos isFlatEmpty [20, -1, 30 * (pi / 180), 2, 0, false, objNull] isEqualTo [] || ( isOnRoad _pos ) || (surfaceIsWater _pos) ) then { // Условие проверки
        _pointType = selectRandom _pointArray;
        _pointArray deleteAt (_pointArray find _pointType);
        _controlPointMap = [_pointType] call trg_fnc_compositionsMap;
        _objtmp = ([random 360, _pos,_controlPointMap] call trg_fnc_objectMapper); // Прикрутить спавн пехоты на КТ сюда
        _controlPoints pushBack +_objtmp;
        _i = _i + 1;     // След. итерация
    };
};
_controlPoints;