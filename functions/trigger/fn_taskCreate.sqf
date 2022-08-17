
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/


if (onTrigger == 1) then 
{
	//trgParams = [_triggerOnMap, _randomTrigger, _randomTriggerParams, _randomTriggerPosition, _markerOnMap, _explosionsCount];
	_title = format ["Зачистить населённый пункт: %1", trgParams # 1 # 0];
	_description = 
	format	["Вам была поставлена задача зачистить населённый пункт %1, освободить мирных жителей от гнёта НАТО и подорвать ключевые точки. Выполнять!", trgParams # 1 # 0];
	_waypoint = trgParams # 1 # 1;
	_titleExp = format ["Подорвать ключевые точки: %1", (3 - trgParams # 5)];
	_descriptionExp = 
	format	["Разведкой были обнаружены ключевые точки. От ШТАБА поступило указание сравнять их с землёй!", trgParams # 1 # 0];
	_task = [OPFOR, ["ParentTask"], [_description, _title, "_taskMarker"], _waypoint, "ASSIGNED", 1, true, "attack", false] call BIS_fnc_taskCreate;
	["ParentTask", true] call BIS_fnc_taskSetAlwaysVisible;
	if !( trgParams # 5 == 3) then 
	{
		_taskExp = [OPFOR, ["taskExp","ParentTask"], [_descriptionExp, _titleExp, "_taskMarker2"], _waypoint, "ASSIGNED", 1, true, "destroy", false] call BIS_fnc_taskCreate;
	} else 
	{
		_taskExp = [OPFOR, ["taskExp","ParentTask"], [_descriptionExp, _titleExp, "_taskMarker2"], _waypoint, "SUCCEEDED", 1, true, "destroy", false] call BIS_fnc_taskCreate;
	};
};