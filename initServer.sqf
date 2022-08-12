	
	/*
		#2: ИНИЦИАЛИЗАЦИЯ. ЗАПУСК СЕРВЕРА
	*/

	#include "VAR\Var.sqf"

	[] execVM "SERVER\HPAwesomeQuery.sqf";				// Подключение к БД
	
	["Initialize"] call BIS_fnc_dynamicGroups;			// Запуск групп


// Удаляем тело при отключении
	addMissionEventHandler ["HandleDisconnect",{ _unit = _this # 0; _uid = _this # 2; ['SavePlayer',[_unit,_uid]] call HP_fnc_ToQu; ["TermHandlers",[_unit]] call F_fnc_S; if (alive _unit || (_unit) inArea "CSAT_BASE") then{deleteVehicle _unit;}; false }];
// Пользователь подключился
	addMissionEventHandler ["OnUserConnected", { params ["_networkId", "_clientStateNumber", "_clientState"];private _uid = (getUserInfo _networkId) # 2;private _name = (getUserInfo _networkId) # 3; ["LogJoin",["JOIN",_uid,_name]] call HP_fnc_ToQu;}];
// Пользователь отключился
	addMissionEventHandler ["OnUserDisconnected", { params ["_networkId", "_clientStateNumber", "_clientState"];private _unit = (getUserInfo _networkId) # 10;["TermHandlers",[_unit]] call F_fnc_S;if (alive _unit || (_unit) inArea "CSAT_BASE") then{deleteVehicle _unit;};private _uid = (getUserInfo _networkId) # 2;private _name = (getUserInfo _networkId) # 3; ["LogJoin",["LEAVE",_uid,_name]] call HP_fnc_ToQu;}];