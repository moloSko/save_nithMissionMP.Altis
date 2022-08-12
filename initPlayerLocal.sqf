
	/*
		#3: ИНИЦИАЛИЗАЦИЯ. ЗАПУСК ИГРОКА
	*/
	
	["TermSUB"] call F_fnc_S;								// Отключение субтитров
	["TermChannel"] call F_fnc_S;							// Отключение каналов кроме прямого
	["TermEGS",[_this # 1]] call F_fnc_S;					// Отключение спектатора
	["TermNVG"] spawn F_fnc_S;								// Отключение тепловизоров
	
	waitUntil {player == player};
	
	["InitWelcome"] call F_fnc_S;							// Запуск приветствия
	
	['LoadPlayer',[player]] remoteExec ["HP_fnc_ToQu",2];	// Загрузка с БД
	
	waitUntil {((player getVariable ["pLvl",-1]) >= 0)};	// Ждем загрузки игрока
	waitUntil {((player getVariable ["Slot",""]) != "")};	// Ждем слота
	
	["CheckSlot"] call F_fnc_S;								// Проверка слота
	["CheckNick"] call F_fnc_S;								// Проверка ника
	["CheckMod"] call F_fnc_S;								// Проверка модов
	["CheckSeat"] call F_fnc_S;								// Проверка доступа в технику
	
	if(player getVariable ["CHECKSLOTNOT",false])exitWith{};
	
	["InitGroup"] call F_fnc_S;								// Запуск групп
	["InitZones"] spawn F_fnc_S;							// Запуск зон
	["InitTimeInGame"] spawn F_fnc_S;						// Запуск времени в игре
	["InitChannelPlayer"] spawn F_fnc_S;					// Запуск каналов
	["InitMarkersPlayer"] spawn F_fnc_S;					// Запуск маркеров для игрока
	["InitFlags"] call F_fnc_S;								// Запуск флагов
	["InitKeys"] call F_fnc_S;								// Запуск keyDown & keyUp
	["InitBlock"] call F_fnc_S;								// Запуск блокировки определенных действий
	["InitMedicine"] call F_fnc_MED;						// Запуск медицины
	
	[] call F_fnc_SIM;										// Иконки игроков на карте
	[] call F_fnc_SIM3D;									// Ники игроков
	[] call A_fnc_Init;										// Инициализация арсенала
	[] call F_fnc_Diary;									// Меню на карте (правила, контакты, история)


	[] spawn {_this call compile preProcessFileLineNumbers "SCRIPTS\TOW\tow.sqf";};	// Троссы техники 
