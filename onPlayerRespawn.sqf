
	/*
		#4: СПАВН и РЕСПАВН ИГРОКА
	*/
	
	params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
	
	if(player getVariable ["isUnconscious",false] && player getVariable ["Blood",0] > 0 && player getVariable ["KHP",0] > 0) then { ["Respawn",[1]] call F_fnc_H; };	// Будучи 300 возродился
	if(!(player getVariable ["isUnconscious",false]) && player getVariable ["Blood",0] > 0) then { ["Respawn",[0]] call F_fnc_H; };	// Не 300, нажал возродиться	

	["TermSUB"] call F_fnc_S;								// Отключение субтитров
	["TermHandlers",[_oldUnit]] call F_fnc_S;				// Отключаем все хендлеры
	if (alive _oldUnit || (_oldUnit) inArea "CSAT_BASE") then{deleteVehicle _oldUnit;};
	if !(isPlayer _newUnit)then{["TermHandlers",[_newUnit]] call F_fnc_S;deleteVehicle _newUnit;};
	
	waitUntil {alive player};
	
	["InitSpawn"] call F_fnc_S;								// Запуск переменных игрока при новом спавне
	
	removeAllWeapons player; removeAllItems player; removeAllAssignedItems player; removeUniform player; removeVest player; removeBackpack player; removeHeadgear player; removeGoggles player;
	
	if (side player == east)then{
		if(player getVariable "Slot" in SLOTS_N)then{player forceAddUniform "U_O_T_Officer_F";}else{player forceAddUniform "U_O_officer_noInsignia_hex_F";};
		if(UseMap)then{player linkItem "ItemMap";};
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		if(UseGPS)then{player linkItem "ItemGPS";};
	};
	
	["SetChannel"] call F_fnc_S;							// Установить стандартные каналы
	["SetOptions"] call F_fnc_S;							// Установить настройки усложнений
	["SetActions"] call F_fnc_S;							// Установить меню действий
	
	["InitTimeVeh"] call F_fnc_S;							// Запуск сброса цикла времени в технике
	
	["KillBots",[player]] remoteExec ["F_fnc_H",2];			// Обработка убийств
