
	/* 
		#2 ВЫПОЛНЯЕТСЯ СЕРВЕРОМ, ПРИ ЗАПУСКЕ МИССИИ
	*/

// Подгружаем серверные переменные 
	#include "Functions\sVAR.sqf"

	[] execVM "Functions\server\ConnectDB.sqf";			// Подключаем БД
	
	["Initialize"] call BIS_fnc_dynamicGroups;			// Запуск динамических групп

// Хендлер при выход в лобби
	addMissionEventHandler ["HandleDisconnect",{ 
		private _player = _this # 0;
		private _pUID = _this # 2; 
		private _pName = _this # 3; 

		private _pLvl = _player getVariable ["pLvl",-1]; 
		private _pExp = _player getVariable ["pExp",-1]; 
		private _pCYP = _player getVariable ["pCYP",-1]; 
		private _pBTV = _player getVariable ["pBTV",-1];
		private _pRP = _player getVariable ["pRP",-1];
		private _pKMB = _player getVariable ["pKMB",-1];
		private _pSkill = _player getVariable ["pSkill",-1];
		private _pBoss = _player getVariable ["pBoss",-1];
		private _pKarma = _player getVariable ["pKarma",-1];
		private _pTime = _player getVariable ["pTime",-1];
		private _pTitle = _player getVariable ["pTitle",-1];
		if!(-1 in [_pLvl,_pExp,_pCYP,_pBTV,_pRP,_pKMB,_pSkill,_pBoss,_pKarma,_pTime,_pTitle])then{"Extdb3" callExtension format ["0:%1:SavePlayer:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14",s_DB_PROTOCOL,_pName,_pLvl,_pExp,_pCYP,_pBTV,_pRP,_pKMB,_pSkill,_pBoss,_pKarma,_pTime,_pTitle,_pUID];};
		
		deleteVehicle _player;
		false 
	}];
// Хендлеры прочие (пока тест)
	addMissionEventHandler ["OnUserConnected", {  }];
	addMissionEventHandler ["OnUserDisconnected", {  }];
	addMissionEventHandler ["OnUserKicked", {  }];