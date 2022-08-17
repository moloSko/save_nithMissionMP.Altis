
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

	onTrigger = 0;publicVariable "onTrigger";
	
	waitUntil{((["ParentTask"] call BIS_fnc_taskState) == "SUCCEEDED")};

	sleep 7; 
	
	[] remoteExec ["trg_fnc_taskDone"];
	
	{
		_z = _x # 0;
		{
			deleteVehicle _x;
		} forEach _z;
	} forEach trgParams # 6;
	
	"Следующее задание через 8 минут!" remoteExec ["systemChat"];
	sleep (8*60);
	
	[] spawn trg_fnc_spawnTrigger;
	
	waitUntil{(onTrigger == 1)};
	
	["ParentTask", "ASSIGNED"] call BIS_fnc_taskHint;
	["taskExp", "ASSIGNED"] call BIS_fnc_taskHint;