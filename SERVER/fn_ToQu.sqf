	
	/*
		ОТПРАВКА ЗАПРОСОВ В БД
	*/
	
	waitUntil {missionNamespace getVariable ["DBCONNECT",false]};
	
	private _type = _this # 0;
	private _info = _this param [1,""];
	private _packet = [_type,_info];

	HPAwesomeQuery pushBack _packet;

	if(count HPAwesomeQuery >= 1) then {
		_packet = HPAwesomeQuery deleteAt 0;
		if!(isNil {_packet}) then {
			private _act = _packet # 0;
			_info = _packet # 1;
			switch _act do {
			// PLAYER'S	
				case "SavePlayer" : { _pUID = _info param [1,""]; _player = _info # 0; _pLastTime = ["GetDate"] call F_fnc_S; _pName = name _player; _pLvl = _player getVariable "pLvl"; _pExp = _player getVariable "pExp"; _pKarma = _player getVariable "pKarma"; _pHours = _player getVariable "pHours"; _pPanels = _player getVariable "pPanels";_pTitle = _player getVariable "pTitle"; if(_pUID == "")then{_pUID = getPlayerUID _player;}; "Extdb3" callExtension format ["0:%1:SavePlayer:%2:%3:%4:%5:%6:%7:%8:%9:%10",DBPROTOCOL,_pLastTime,_pName,_pLvl,_pExp,_pKarma,_pHours,_pPanels,_pTitle,_pUID]; };
				case "LoadPlayer" : { _player = _info # 0; _pUID = getPlayerUID _player; _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadPlayer:%2",DBPROTOCOL,_pUID])) # 1) # 0; if!(isNil {_getData}) then { _set = [ _getData # 0, _getData # 1, _getData # 2, _getData # 3, _getData # 4, _getData # 5 ]; {_player setVariable [_x,_set # _forEachIndex,true]; }forEach PDATA; } else { _pRegName = name _player; "Extdb3" callExtension format ["0:%1:NewPlayer:%2:%3",DBPROTOCOL,_pUID,_pRegName]; {_player setVariable [_x,PDATA_SET # _forEachIndex,true];}forEach PDATA; }; };
				
			// LOAD'S	
				case "LoadLVL" : {iLVL = [];for "_i" from 0 to 20 do { _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadLVL:%2", DBPROTOCOL, _i])) # 1) # 0; if!(isNil {_getData}) then {iLVL pushBack _getData;}; }; publicVariable "iLVL"; };
				case "LoadSlots" : { for "_i" from 0 to (count SLOTS_ACCESS) do { _getData = ((call compile ("Extdb3" callExtension format ["0:%1:LoadSlots:%2", DBPROTOCOL, (SLOTS_ACCESS # _i # 0)])) # 1) # 0; if!(isNil {_getData}) then {missionNamespace setVariable [(SLOTS_ACCESS # _i # 0),_getData # 0,true];}; }; };
				
			// LOG'S	
				case "LogJoin" : {"Extdb3" callExtension format ["0:%1:LogJoin:%2:%3:%4",DBPROTOCOL,_info # 0,_info # 1,_info # 2];};
				case "LogKMB" : {"Extdb3" callExtension format ["0:%1:LogKMB:%2:%3:%4",DBPROTOCOL,_info # 0,_info # 1,_info # 2];};
				case "LogLVL" : {"Extdb3" callExtension format ["0:%1:LogLVL:%2:%3:%4:%5",DBPROTOCOL,_info # 0,_info # 1,_info # 2,_info # 3];};
				//case "LogKICKBAN" : {"Extdb3" callExtension format ["0:%1:LogKICKBAN:%2:%3:%4:%5",DBPROTOCOL,_info # 0,getPlayerUID (_info # 1),name (_info # 2),_info # 3];};
			
			};
		};
	};
