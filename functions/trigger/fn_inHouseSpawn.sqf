
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_units = ["B_Soldier_TL_F", "B_Medic_F", "B_Soldier_TL_F", "B_HeavyGunner_F", "B_Soldier_AT_F", "B_soldier_TL_F", "B_soldier_AAR_F"];    // Массив пехов
_civs = ["C_man_1_2_F", "C_man_polo_1_F", "C_man_polo_4_F", "C_man_polo_6_F", "C_man_polo_5_F", "C_man_p_fugitive_F", "C_man_w_worker_F"];    // Массив гражданских
_trgPos = _this # 0;     // Позиция триггера
_trgParams = _this # 1;      // Параметры триггера (пока не используется)
_triggerClass = _this # 2;

_enemyInHouse = 0.6;
switch (_triggerClass) do {
	case 0: { _enemyInHouse = 0.45; };
	case 1: { _enemyInHouse = 0.35; };
	case 2: { _enemyInHouse = 0.20; };
};

_pos = [];
_houses = nearestObjects [[_trgPos # 0, _trgPos # 1], ["House"], 300];
if (count _houses <= 0) exitWith {};
{
    _c = 0;
    while {(format ["%1",_x buildingPos _c] != "[0,0,0]") && (_c < 2)} do {
        _pos set [(count _pos),[_x,_x buildingPos _c]];
        _c = _c + 1;
    };
} forEach _houses;     // Переделать под овальные триггеры

_unitsCount = 0;    // Счётчик юнитов
_housesCount = (count _houses)*_enemyInHouse;     // Кол-во домов в триггере, занятых пехами
_grp = createGroup West;
while {_unitsCount < _housesCount} do   // Проверка на кол-во заспавненных юнитов в домах
{
    _house = selectRandom _pos;      // Выбираем рандомный дом
    _pos deleteAt (_pos find _house);
    _unit = _grp createUnit [(selectRandom _units), _house # 1, [], 0, "CAN_COLLIDE"];
    //_unit = _unit setPos (selectRandom _house);     // Ставим пеха в рандомную доступную позицию внутри дома
    _unit disableAI "PATH";     // Вырубаем логику выбора пути
    _unit setUnitPos selectRandom ["UP","UP","MIDDLE"];     // Выбираем позицию пеха в пространстве (2 к 3 положение стоя, 1 к 3 сидя)
	[ _unit, random [0.65, 0.85, 1] ] call trg_fnc_setSkill;	// Задаем скилл
    _unitsCount = _unitsCount + 1;
};

_civsCount = 0;     // Счётчик гражданских
_housesCount = (count _houses) * 0.1;     // Кол-во домов в триггере, занятых гражданскими
_grpCivs = createGroup Civilian;
while { _civsCount < _housesCount } do 
{
    _house = selectRandom _pos;
    _pos deleteAt (_pos find _house);
    _unit = _grpCivs createUnit [(selectRandom _civs), _house # 1, [], 0, "CAN_COLLIDE"];
    _unit disableAI "PATH";
    _unit setUnitPos selectRandom ["UP","UP","MIDDLE"];
    _civsCount = _civsCount + 1;
};