
	/*
		ОБРАБОТКА ОПЫТА ПОСЛЕ УБИЙСТВА
	*/
	
	private _mode   = _this param [0, "", [""]];
	private _params = _this param [1, [], [[]]];

//0			1			2		3	4		5		6			7		8		9		10			11			12	13	14		15		16		17
//Пехота	Грузовик	Машина	БТР	Танк	Арта	Вертолет	Самолет	Лодка	БПЛА	Перевязка	Поднятие	300	200	ТК 300	ТК 200	Подрыв	Минирование
//2			1			1		2	3		10		2			2		3		5		1			3			5	10	10		50		10		1

	switch (_mode) do {
		case "KillBots" : {				// Убийство ботов
			private _player = _params param [0, objNull];if(_player == objNull)exitWith{};
			_player addEventHandler ["HandleScore", {
				params ["_player", "_dead", "_score"];
				if(count (crew vehicle _dead) <= 0) exitWith {};
				
				private _facPlayer = ["GetFaction",[_player]] call F_fnc_S;
				private _facDead = ["GetFaction",[_dead]] call F_fnc_S;
				private _isPlayer = isPlayer _player;
				private _isPlayer1 = isPlayer _dead;
				
				if(_isPlayer && !_isPlayer1 && _facPlayer == "CSAT" && _facDead != "CSAT")then{			// Игрок CSAT, убил НЕ CSAT
					if(_facDead == "NATO")exitWith{														// Убил НАТО
						private _Slot = _player getVariable ["Slot","Rifleman"];
						private _Points = missionNamespace getVariable _Slot;
						
						private _score = _Points # 0;
						private _distance = 0;

						if(_Slot == (SLOTS_UNI # 0 # 0)) then { _distance = _dead distance _player; if(_distance < (SLOTS_UNI # 0 # 1)) then {_score = 2; } else {_score = (_Points # 0) * (_distance / (SLOTS_UNI # 0 # 1));}; };
						if(_Slot == (SLOTS_UNI # 1 # 0)) then { _distance = _dead distance _player; if(_distance < (SLOTS_UNI # 1 # 1)) then {_score = 2; } else {_score = (_Points # 0) * (_distance / (SLOTS_UNI # 1 # 1));}; };
						
						private _type = typeOf _dead; {if(_type in _x) exitWith {_score = _Points # ( _forEachIndex + 1);};} forEach VEH_TYPE;
						
						[_player,_score] call F_fnc_AddExp;
					};
					if(_facDead == "CIV")exitWith{														// Убил ГРАЖДАНСКОГО
						[_player,-(SCORE_KILLCIV)] call F_fnc_AddExp;
						//[_player,[RadioChannel_ODKB, format["%1 убил гражданского!",name _player]]] remoteExec ["customChat"];
						format["%1 убил гражданского!",name _player] remoteExec ["systemChat"];
					};
				};
				
			}]; 
		};
		case "Revive" : {				// Перевязка и поднятие бойцов
			private _medic = _params param [0, objNull];
			private _patient = _params param [1, objNull];	
			private _type = _params param [2, 0];
			if(objNull == _medic)exitWith{};if(objNull == _patient)exitWith{};
			
			private _Slot = _medic getVariable ["Slot","Rifleman"];
			private _arr = missionNamespace getVariable _Slot;

			if(_type == 0) then {[_medic,_arr # 10] call F_fnc_AddExp;};
			if(_type == 1) then {[_medic,_arr # 11] call F_fnc_AddExp;
				//[_medic,[RadioChannel_ODKB, format["%1 оказал мед.помощь %2",name _medic,name _patient]]] remoteExec ["customChat"];
				format["%1 оказал мед.помощь %2",name _medic,name _patient] remoteExec ["systemChat"];
			};
		};
		case "Respawn" : {				// Респавн игроков
			private _type = _params param [0, 0];
			
			private _Slot = player getVariable ["Slot","Rifleman"];
			private _arr = missionNamespace getVariable _Slot;
			
			[player,-(_arr # 13)] call F_fnc_AddExp;
			if(_type == 0)then{
				//[player,[RadioChannel_SYSTEM, format["%1 вынуждено возродился",name player]]] remoteExec ["customChat"];
				format["%1 вынуждено возродился",name player] remoteExec ["systemChat"];
			};
			if(_type == 1)then{
				//[player,[RadioChannel_ODKB, format["%1 был доставлен на базу силами ОДКБ",name player]]] remoteExec ["customChat"];
				format["%1 был доставлен на базу силами ОДКБ",name player] remoteExec ["systemChat"];
			};
		};
			
		case "DeadPlayer" : {			// Игрок 300 или 200
			private _dead = _params param [0, objNull];
			private _player = _params param [1, objNull];
			private _type = _params param [2, 0];
			
			private _facPlayer = ["GetFaction",[_player]] call F_fnc_S;
			private _facDead = ["GetFaction",[_dead]] call F_fnc_S;
			private _IPP = isPlayer _player;	// Убийца - игрок?
			
			private _slot1 = _player getVariable ["Slot","Rifleman"];
			private _arr1 = missionNamespace getVariable _slot1;
			
			private _slot2 = _dead getVariable ["Slot","Rifleman"];
			private _arr2 = missionNamespace getVariable _slot2;
			/*
				private _group = [];
				if((groupId group _player) == (groupId group _dead))then{ _group = units group _player; }else{ _group = (units group _player) +  (units group _dead); };
			*/
			if(_type == 0) then {	// 300
				if(_IPP && _dead != _player)then{
					if(_facPlayer == _facDead) then {	// 300 ТК
						[_dead,-(_arr2 # 12)] call F_fnc_AddExp;
						[_player,-(_arr1 # 14)] call F_fnc_AddExp;
						["SetTK",[_player]] call F_fnc_S;
						//[_dead,[RadioChannel_ODKB, format["%1 ранил %2",name _player,name _dead]]] remoteExec ["customChat"];
						format["%1 ранил %2",name _player,name _dead] remoteExec ["systemChat"];
					};
				}else{
					[_dead,-(_arr2 # 12)] call F_fnc_AddExp;
					//[_dead,[RadioChannel_ODKB, format["%1 был ранен",name _dead]]] remoteExec ["customChat"];
					format["%1 был ранен",name _dead] remoteExec ["systemChat"];
				};
			};	
			
			if(_type == 1) then {	// 200
				if(_IPP && _dead != _player)then{
					if(_facPlayer == _facDead) then {	// 200 ТК
						[_dead,-(_arr2 # 13)] call F_fnc_AddExp;
						[_player,-(_arr1 # 15)] call F_fnc_AddExp;
						["SetTK",[_player]] call F_fnc_S;
						//[_dead,[RadioChannel_ODKB, format["%1 убил %2",name _player,name _dead]]] remoteExec ["customChat"];
						format["%1 убил %2",name _player,name _dead] remoteExec ["systemChat"];
					};
				}else{
					[_dead,-(_arr2 # 13)] call F_fnc_AddExp;
					//[_dead,[RadioChannel_ODKB, format["%1 был убит",name _dead]]] remoteExec ["customChat"];
					format["%1 был убит",name _dead] remoteExec ["systemChat"];
				};
			};
			
			if(_type == 2) then {	// 200 истек кровью
				[_dead,-(_arr2 # 13)] call F_fnc_AddExp;
				//[_dead,[RadioChannel_ODKB, format["%1 истёк кровью",name _dead]]] remoteExec ["customChat"];
				format["%1 истёк кровью",name _dead] remoteExec ["systemChat"];
			};	
		};
		
		case "KT" : {					// Уничтожена ключевая точка
			private _player = _params param [0, objNull];
			
			private _Slot = _player getVariable ["Slot","Rifleman"];
			private _arr = missionNamespace getVariable _Slot;
			
			[_player,_arr # 16] call F_fnc_AddExp;
			//[_player,[RadioChannel_ODKB, format["%1 подорвал ключевую точку",name _player]]] remoteExec ["customChat"];
			format["%1 подорвал ключевую точку",name _player] remoteExec ["systemChat"];
		};

	};