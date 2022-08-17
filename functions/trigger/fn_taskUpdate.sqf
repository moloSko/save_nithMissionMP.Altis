
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_titleExp = format ["Подорвать ключевые точки: %1", (3 - trgParams # 5)];
_descriptionExp = 
format	["Разведкой были обнаружены ключевые точки. От ШТАБА поступило указание сравнять их с землёй!", trgParams # 1 # 0];
["taskExp", [_descriptionExp, _titleExp, "_taskMarker2"]] call BIS_fnc_taskSetDescription;
if ( trgParams # 5 == 3) then {["taskExp", "SUCCEEDED"] call BIS_fnc_taskSetState;} else {["taskExp", "ASSIGNED"] call BIS_fnc_taskHint;};