
	/*
		НАЧИСЛЕНИЕ ОПЫТА
	*/
	
	forceUnicode 0;
	
	private _player = _this # 0;
	private _score = _this # 1;

	private _Slot = _player getVariable ["Slot","Rifleman"];
	private _pLvl = _player getVariable ["pLvl",-1];
	private _pExp = _player getVariable ["pExp",0];
	private _pKarma = _player getVariable ["pKarma",0];
	private _pPanels = _player getVariable "pPanels";
	
	private _leader = leader (group _player);
	private _lSlot = _leader getVariable ["Slot","Rifleman"];
	private _isLeader = (_leader == _player);
	
	private _gcond = (_score >= 0 && !(_Slot in SLOTS_N) && SAFEZONE_CSAT);
	

// УСЛОВИЯ ПОЛУЧЕНИЯ ОПЫТА
	if(_pLvl <= 0)exitWith{}; 																// Не получаем опыт если Новобранец
	if(_gcond && (_player inArea "CSAT_BASE"))exitWith{};									// Не получаем опыт на базе, КРОМЕ начальников
	if(_gcond && (groupId (group _player) regexFind ["ШТАБ"] isNotEqualTo []))exitWith{};	// Не получаем опыт в группе ШТАБ, КРОМЕ начальников
	if(_gcond && !(_Slot in ["CYP","BTV"]) && count units (group _player) <= 1)exitWith{};	// Не получаем опыт в соло, КРОМЕ БТВ, ЦУП, начальников
	if(_score >= 0 && _player getVariable ["isUnconscious", false])exitWith{};				// Не получаем опыт будучи 300

// БОНУСЫ
	if(_score >= 0)then{
		private _bonus = 1;
		
		{if(call compile (_x # 0) != (_x # 1)) then {_bonus = _bonus + (_x # 2);};} forEach OPTIONS;	// Бонус за усложнения
		if(count playableUnits <= MIN_PLAYERS) then {_bonus = _bonus + 0.3;};							// Бонус за малое кол-во игроков на сервере
		
		if(((_Slot in SLOTS_N) || (_isLeader)) && (_pPanels # 3 # 0) == 1)then{_bonus = _bonus + (SCORE_COURCE # 0);};	// Бонус за НШ,НЛС,НЦУП,НБТВ,КНГ
		if(_Slot == "Engineer" && (_pPanels # 3 # 1) == 1)then{_bonus = _bonus + (SCORE_COURCE # 1);};	// Бонус за Инженера
		if(_Slot == "Sniper" && (_pPanels # 3 # 2) == 1)then{_bonus = _bonus + (SCORE_COURCE # 2);};	// Бонус за Снайпера
		if(_Slot == "Medic" && (_pPanels # 3 # 3) == 1)then{_bonus = _bonus + (SCORE_COURCE # 3);};		// Бонус за Медика
		
		_score = _score * _bonus;
	};
	
// ШТРАФНИК
	if(_pKarma > 0) exitWith {			
		if(_score >= 0) exitWith {
			_pKarma = _pKarma - _score;if(_pKarma <= 0) then {_pKarma = 0;["LVLUP", ["Вы восстановили звание!"]] remoteExec ["BIS_fnc_showNotification",_player];};
			_player setVariable ["pKarma",_pKarma,true];
		};
	};
	
// ПРИБАВЛЯЕМ ОПЫТ	
	["AddExp",[_player,_score]] call F_fnc_S;

// ОПЫТ ЛИДЕРАМ
	if !(_Slot in SLOTS_N)then{
		if (!_isLeader && !(_lSlot in SLOTS_N))then {["AddExp",[_leader,_score]] call F_fnc_S;};
		private _pNSH = objNull; 
		
		{
			if(_x getVariable ["Slot","Rifleman"] == "NSH" && !(_x getVariable ["isUnconscious", false])) exitWith{
				_pNSH = _x;
			};
		} forEach playableUnits; 
		
		if(_pNSH != objNull) then {["AddExp",[_pNSH,_score]] call F_fnc_S;}; 
	};
	