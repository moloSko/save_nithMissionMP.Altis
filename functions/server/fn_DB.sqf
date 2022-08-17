
	if(isNil "HPAwesomeQuery") then { HPAwesomeQuery = []; };
	
	private _type = _this # 0;
	private _info = _this param [1,""];
	private _packet = [_type,_info];

	HPAwesomeQuery pushBack _packet;
	
	[] spawn {
		waitUntil {missionNamespace getVariable ["DBCONNECT",false]};
		
		if(count HPAwesomeQuery >= 1) then {
			_packet = HPAwesomeQuery deleteAt 0;
			if!(isNil {_packet}) then {
				private _act = _packet # 0;
				_info = _packet # 1;
				switch _act do {
				// PLAYER'S	
				/*
					case "SavePlayer" : { _pUID = _info param [1,""]; _pName = _info param [2,""]; _player = _info # 0;
					if(_pName == "")then{_pName = name _player;}; 
					_pLvl = _player getVariable ["pLvl",-1]; 
					_pExp = _player getVariable ["pExp",-1]; 
					_pKarma = _player getVariable ["pKarma",-1]; 
					_pHours = _player getVariable ["pHours",0]; 
					_pPanels = _player getVariable ["pPanels",0]; 
					_pTitle = _player getVariable ["pTitle",-1]; 
					if(-1 in [_pLvl,_pExp,_pKarma,_pTitle])exitWith{};
					if(_pUID == "")then{_pUID = getPlayerUID _player;}; 
					"Extdb3" callExtension format ["0:%1:SavePlayer:%2:%3:%4:%5:%6:%7:%8:%9",DBPROTOCOL,_pName,_pLvl,_pExp,_pKarma,_pHours,_pPanels,_pTitle,_pUID]; };
					// TEST
					case "LoadPlayer" : { _player = _info # 0; _pUID = getPlayerUID _player; _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadPlayer:%2",DBPROTOCOL,_pUID])) # 1) # 0; if!(isNil {_getData}) then { _set = [ _getData # 0, _getData # 1, _getData # 2, _getData # 3, _getData # 4, _getData # 5, _getData # 6, _getData # 7, _getData # 8]; {_player setVariable [_x,_set # _forEachIndex,true]; }forEach PDATA; } else { _pRegName = name _player; "Extdb3" callExtension format ["0:%1:NewPlayer:%2:%3",DBPROTOCOL,_pUID,_pRegName]; {_player setVariable [_x,PDATA_SET # _forEachIndex,true];}forEach PDATA; }; };
					
				// LOAD'S	
					case "LoadLVL" : {iLVL = [];for "_i" from 0 to 20 do { _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadLVL:%2", DBPROTOCOL, _i])) # 1) # 0; if!(isNil {_getData}) then {iLVL pushBack _getData;}; }; publicVariable "iLVL"; };
					case "LoadSlots" : { for "_i" from 0 to (count SLOTS_ACCESS) do { _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadSlots:%2", DBPROTOCOL, (SLOTS_ACCESS # _i # 0)])) # 1) # 0; if!(isNil {_getData}) then {missionNamespace setVariable [(SLOTS_ACCESS # _i # 0),_getData # 0,true];}; }; };
					
				// LOG'S	
					case "LogJoin" : {"Extdb3" callExtension format ["0:%1:LogJoin:%2:%3:%4",DBPROTOCOL,_info # 0,_info # 1,_info # 2];};
					case "LogKMB" : {"Extdb3" callExtension format ["0:%1:LogKMB:%2:%3:%4",DBPROTOCOL,_info # 0,_info # 1,_info # 2];};
					case "LogLVL" : {"Extdb3" callExtension format ["0:%1:LogLVL:%2:%3:%4:%5",DBPROTOCOL,_info # 0,_info # 1,_info # 2,_info # 3];};
					case "LogKICKBAN" : {"Extdb3" callExtension format ["0:%1:LogKICKBAN:%2:%3:%4:%5",DBPROTOCOL,_info # 0,_info # 1,_info # 2,_info # 3];};
				*/
				};
			};
		};
	};