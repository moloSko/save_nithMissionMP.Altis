
	/* 
		#4 ВЫПОЛНЯЕТСЯ СЕРВЕРОМ, ПРИ ЗАХОДЕ ИГРОКА
	*/

	private _player = _this # 0;
	
// Ожидаем подключения к БД (на всяк случай)
	waitUntil {s_DB};

// Загружаем или создаем аккаунт игрока
	private _pUID = getPlayerUID _player; 
	private _gd = ((call compile ("Extdb3" callExtension format ["0:%1:LoadPlayer:%2",s_DB_PROTOCOL,_pUID])) # 1) # 0; 
	if!(isNil {_gd}) then { {_player setVariable [_x,_gd # _forEachIndex,true]; }forEach p_DATA; };
	if(isNil {_gd})then{
		private _pRegName = name _player; 
		"Extdb3" callExtension format ["0:%1:NewPlayer:%2:%3",s_DB_PROTOCOL,_pUID,_pRegName]; 
		{_player setVariable [_x,p_DATA_SET # _forEachIndex,true];}forEach p_DATA; 
	};

// Запускаем цикл, каждую минуту сохраняем данные игрока в БД
	[_player] spawn {
		private _player = _this # 0;
		private _pUID = getPlayerUID _player; 
		private _pName = name _player;
		while {isPlayer _player} do { 
			sleep 62; 
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
			private _pAdmin = _player getVariable ["pAdmin",-1];
			if!(-1 in [_pLvl,_pExp,_pCYP,_pBTV,_pRP,_pKMB,_pSkill,_pBoss,_pKarma,_pTime,_pTitle,_pAdmin])then{"Extdb3" callExtension format ["0:%1:SavePlayer:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15",s_DB_PROTOCOL,_pName,_pLvl,_pExp,_pCYP,_pBTV,_pRP,_pKMB,_pSkill,_pBoss,_pKarma,_pTime,_pTitle,_pAdmin,_pUID];};
		}; 
	};

	