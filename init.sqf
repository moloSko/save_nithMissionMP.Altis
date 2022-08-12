
	/*
		#1: ИНИЦИАЛИЗАЦИЯ. ЗАПУСК МИССИИ
	*/
	
	#include "VAR\Var.sqf"
	
	west setFriend [resistance, 0];							// HATO vs IND
	if(isServer)then{setDate [1992,7,22,0,0];};				// Установить дату
	
	['LoadLVL'] remoteExec ["HP_fnc_ToQu",2];				// Загрузка званий
	['LoadSlots'] remoteExec ["HP_fnc_ToQu",2];				// Загрузка слотов
	
	[] call F_fnc_Init;										// Запуск основных функций
	
	["InitZeus"] call F_fnc_S;								// Запуск зевсов
	["InitTimeFast"] spawn F_fnc_S;							// Запуск ускоренного время ночью
	["InitClean"] spawn F_fnc_S;							// Запуск очистки вне базы =HC (Просчет обьектов)
	["InitCleanBase"] spawn F_fnc_S;						// Запуск очистки базы =HC (Просчет обьектов)
	["InitMarkers"] call F_fnc_S;							// Запуск маркеров-информации на карте
	["InitWeather"] call F_fnc_S;							// Запуск погоды
	["InitOptions"] call F_fnc_S;							// Запуск настроек усложнений
	["InitCreateChannel"] call F_fnc_S;						// Запуск создания каналов
	
	if (isServer)then{
		// Запуск триггера
		if(PointSelectionMethod == 0) then {
			[] spawn srv_fnc_createPoint;
		} else {
		if(!_NoPoints) then {[] spawn srv_fnc_createPoint};
		};
		sleep 1;
		switch AirPatrol do {
			case 1:{};
			case 2:{[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle};
			case 3:{[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle};
			case 4:{
				if((random 10)>5) then {
					[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle;
				} else {
					[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle;
				};
			};
		};
	};
	
// Проверка открытия и закрытия арсенала	
	[missionNamespace, "arsenalOpened", {disableSerialization; _display = _this # 0; _display displayAddEventHandler ["KeyDown", "if ((_this # 1) in [19,24,29,31,46,47]) then {true}"]; {( _display displayCtrl _x ) ctrlSetText ""; ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick"; ( _display displayCtrl _x ) ctrlSetTooltip ""; } forEach [44150, 44148, 44149]; }] call BIS_fnc_addScriptedEventHandler;
	[missionNamespace, "arsenalClosed", {[] call A_fnc_Check; }] call BIS_fnc_addScriptedEventHandler;




