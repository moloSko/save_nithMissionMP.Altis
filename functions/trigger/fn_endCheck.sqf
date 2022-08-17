
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

//params ["_triggerOnMap", "_randomTrigger", "_randomTriggerParams", "_randomTriggerPosition", "_markerOnMap", "triggers", "onTrigger", "_explosionsCount"];
_triggerOnMap = trgParams # 0;
_randomTrigger = trgParams # 1;
_randomTriggerParams = trgParams # 2;
_randomTriggerPosition = trgParams # 3;
_markerOnMap = trgParams # 4;
_explosionsCount = trgParams # 5;
_trgControlPoints = trgParams # 6;

[ _triggerOnMap, [_randomTrigger # 0, _randomTrigger # 1, _randomTriggerParams # 2], _randomTriggerPosition ] spawn trg_fnc_reinfSpawn;
		if (_explosionsCount == 2) then
		{
			trgParams set [5, _explosionsCount + 1];publicVariable "trgParams";
			[] remoteExec ["trg_fnc_taskUpdate"];
			sleep 5;
			if (( count (( units BLUFOR ) inAreaArray _triggerOnMap )) < 5 ) then 
			{
				_markerOnMap setMarkerShape "ELLIPSE";      // Задаём форму маркера
				_markerOnMap setMarkerSize [_randomTriggerParams # 0, _randomTriggerParams # 1];       // Задаём размеры маркера
				_markerOnMap setMarkerDir _randomTriggerParams # 2;    // Задаём угол поворота маркера
				_markerOnMap setMarkerColor "ColorGreen";	// Задаем зеленый цвет
				triggers deleteAt (triggers find _randomTrigger);
				["ParentTask", "SUCCEEDED"] call BIS_fnc_taskSetState;
				[_trgControlPoints] spawn trg_fnc_endMission;
			}
			else 
			{
				_markerOnMap setMarkerShape "ELLIPSE";      // Задаём форму маркера
				_markerOnMap setMarkerColor "ColorBlack";
				_markerOnMap setMarkerSize [_randomTriggerParams # 0, _randomTriggerParams # 1];       // Задаём размеры маркера
				_markerOnMap setMarkerDir _randomTriggerParams # 2;    // Задаём угол поворота маркера

				while { onTrigger == 1 } do 
				{
					sleep 5;
					if (( count (( units BLUFOR ) inAreaArray _triggerOnMap )) < 5 ) then 
					{
						_markerOnMap setMarkerColor "ColorGreen";
						triggers deleteAt (triggers find _randomTrigger);
						["ParentTask", "SUCCEEDED"] call BIS_fnc_taskSetState;
						[_trgControlPoints] spawn trg_fnc_endMission;
						break;
					};
				};
			};
		} else 
		{
			trgParams set [5, _explosionsCount + 1];publicVariable "trgParams";
			[] remoteExec ["trg_fnc_taskUpdate"];
		};