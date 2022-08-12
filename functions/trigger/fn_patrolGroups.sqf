_trgPos = _this # 0;	// Параметр позиции триггера
_trgParams = _this # 1;		// Параметры триггера
_triggerClass = _this # 2;		// Класс триггера
_triggerPoint = _this # 3;		// Сам триггер
_grpCount = 0;

switch (_triggerClass) do {
	case 0: { _grpCount = 5; };
	case 1: { _grpCount = 8; };
	case 2: { _grpCount = 12; };
};

_types = [(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad"),
(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfTeam")
]; 		// Массив групп для спавна, поменять

_i = 0;		// Счётчик
while { _i < _grpCount } do 	// Выполняется пока не заспавнит нужное кол-во групп
{
	_pos = [ _trgPos, _trgParams ] call trg_fnc_findTrgRandPos;		// Находим пустую область для спавна
	if !(_pos isFlatEmpty [4, -1, 60 * (pi / 180), 5, 0, false, objNull] isEqualTo [] && (surfaceIsWater _pos)) then 		// Проверка, нашлась ли такая область
	{
		_NewGroup = [_pos, BLUFOR, _types select (floor (random (count _types)))] call BIS_fnc_spawnGroup;	// Если да, спавним группу
		{ [ _x, random [0.2, 0.75, 1] ] call trg_fnc_setSkill; } forEach (units _NewGroup);	// Установка скилла
		[_NewGroup, _trgPos, triggerArea _triggerPoint # 0] call BIS_fnc_taskPatrol;	// Прописываем группе вейпоинты
		_i = _i + 1;	// След. итерация
	};
};