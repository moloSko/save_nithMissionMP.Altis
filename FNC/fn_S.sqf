
	/*
		ВСЕ ФУНКЦИИ ВЫЗЫВАЕМЫЕ СЕРВЕРОМ И ИГРОКАМИ
	*/
	
	private _mode   = _this param [0, "", [""]];
	private _params = _this param [1, [], [[]]];
	private _ret = "";
	
	switch (_mode) do {		// _? = _params param [0, 0];
	// ИНИЦИАЛИЗАЦИЯ
		// Init.sqf
		case "InitZeus" : { { _x addEventHandler ["CuratorObjectPlaced", { params ["_curator", "_entity"]; if !(_entity isKindOf "Man") then { ["SetTexture",[_entity]] call F_fnc_Veh; ["LoadBK",[_entity]] call F_fnc_Veh; /*{[_x,1] call FNC_fnc_Unit_Skill;} forEach (crew _entity)*/ }else{ /*[_entity,1] call FNC_fnc_Unit_Skill;*/ }; }]; } forEach allCurators; };
		case "InitTimeFast" : { if (isServer) then { private _dayK = 1; private _nightK = 2; while {true} do { if ((dayTime >= 4 && dayTime <= 5) || (dayTime >= 19 && dayTime <= 20)) then { setTimeMultiplier _dayK; } else { if (dayTime > 20 || dayTime < 4) then { setTimeMultiplier _nightK;} else { setTimeMultiplier _dayK; }; };sleep 10; }; };};
		case "InitClean" : { 
			if (isServer)then{ 
				while {true} do { 
					if(true/* ["CheckAPIB"] call F_fnc_S */)then { 
						{
							if (isNil {_x getVariable "DRM"} && !(_x inArea "CSAT_BASE") && !(_x inArea "CSAT_PIRS"))then{ 
								deleteVehicle _x; 
							}; 
						} forEach (["GetObj"] call F_fnc_S); 
						Sleep (TIME_CLEAN * 60); 
						}else{ 
							Sleep 60; 
						};
					};
				}; 
			};
		case "InitCleanBase" : { 
			if (isServer)then{ 
				while {true} do { 
					{
						if (isNil {_x getVariable "DRM"} && ((_x inArea "CSAT_BASE") || (_x inArea "CSAT_PIRS")))then{ 
							deleteVehicle _x; 
						}; 
					} forEach (["GetObj"] call F_fnc_S); 
					Sleep (TIME_CLEAN * 60);
				};
			}; 
		};
		case "InitMarkers" : { private _marker1 = createMarker ["Markers1", [14240,28800]]; _marker1 setMarkerType "mil_box"; _marker1 setMarkerText format[" DISCORD:        %1",TEXT_DC]; private _marker2 = createMarker ["Markers2", [14240,28500]]; _marker2 setMarkerType "mil_box"; _marker2 setMarkerText format[" VK GROUP:      %1",TEXT_VK]; private _marker3 = createMarker ["Markers3", [14240,28200]]; _marker3 setMarkerType "mil_triangle"; _marker3 setMarkerText format[" IP SERVER:         %1",TEXT_IP]; _marker3 setMarkerColor "ColorBlue"; };
		case "InitWeather" : { private _Time = [6,8,10,12,14,16,18,20]; _Time = _Time call BIS_fnc_arrayShuffle; _Time = selectRandom _Time; skipTime ((_Time - dayTime + 24) % 24); private _nm = [0.05,0.1,0.15,0.2,0.25,0.3]; _nm = _nm call BIS_fnc_arrayShuffle; _set = selectRandom _nm; 15 setWindStr _set; _set = selectRandom _nm; 15 setWindForce _set; _set = selectRandom _nm; 15 setWindDir _set; _set = selectRandom _nm; 15 setWaves _set; _set = selectRandom _nm; 15 setRainbow _set; _set = selectRandom _nm; 15 setRain _set; _set = selectRandom _nm; 0 setFog 0; forceWeatherChange; };
		case "InitOptions" : { {missionNamespace setVariable [_x # 0, _x # 1,true];} forEach OPTIONS; };
		// InitServer.sqf
		case "InitCreateChannel" : { if (isServer)then{RadioChannel_SYSTEM = radioChannelCreate [COLORS # 0, "«Девятка»", "«Девятка»", [],true]; RadioChannel_ODKB = radioChannelCreate [COLORS # 1, "«Силы ОДКБ»", "«Силы ОДКБ»", [],true]; RadioChannel_SHTAB = radioChannelCreate [COLORS # 2, "«Девятка» {Штаб}", "ШТАБ", [],true]; RadioChannel_CYP = radioChannelCreate [COLORS # 3, "«Девятка» {ЦУП}", "Пилот %UNIT_NAME", [],true]; RadioChannel_BTV = radioChannelCreate [COLORS # 4, "«Девятка» {БТВ}", "Танкист %UNIT_NAME", [],true]; RadioChannel_COMMAND = radioChannelCreate [COLORS # 5, "«Девятка» {Смежные группы}", "%UNIT_NAME из ""%UNIT_GRP_NAME""", [],true]; publicVariable "RadioChannel_SYSTEM"; publicVariable "RadioChannel_ODKB"; publicVariable "RadioChannel_SHTAB"; publicVariable "RadioChannel_CYP"; publicVariable "RadioChannel_BTV"; publicVariable "RadioChannel_COMMAND";}; };
		// InitPlayerLocal.sqf
		case "InitWelcome" : { ["misc\intro.ogv","Бойцы! Поздравляю вас с прибытием в доблестную Девятую Роту!"] spawn BIS_fnc_titlecard; "intro" cutText ["", "BLACK", 0.001]; [0, 0, false] call BIS_fnc_cinemaBorder; [] spawn{ waitUntil {!(isNil "BIS_fnc_titlecard_finished")}; sleep 0.2; if !(player getVariable ["CHECKSLOTNOT",false])then{"intro" cutFadeOut 400;}else{["TermChannel"] call F_fnc_S;}; sleep 0.4;  [1, 1, true] call BIS_fnc_cinemaBorder;
		[] call srv_fnc_NewTask;	/////////////////////////// Обьявление миссии
		}; };
		case "InitGroup" : { forceUnicode 0; ["InitializePlayer",[player]] call BIS_fnc_dynamicGroups; if((groupId (group player) != "ШТАБ")) then {(group player) setGroupIdGlobal ["ШТАБ"];}; if !(["IsGroupRegistered", [group player]] call BIS_fnc_dynamicGroups) then { if((groupId (group player) == "ШТАБ")) then {["SendClientMessage", ["RegisterGroup", [group player, player]]] call BIS_fnc_dynamicGroups;};}; if(player getVariable "Slot" == "NSH") then {["SwitchLeader", [group player,player]] call BIS_fnc_dynamicGroups;}; };
		case "InitZones" : { waitUntil {!(isNil "BIS_fnc_titlecard_finished")}; sleep 1; while {true} do { if(vehicle player isKindOf "Man")then{ if ((player inArea "CSAT_SAFE_ZONE_1" || player inArea "CSAT_SAFE_ZONE_2") && SAFEZONE_CSAT) then { player allowDamage false; if !(player getVariable ["InfoTextSZ",false]) then { "Вы вошли в <t color='#57f546'>безопасную зону</t><br />Будьте на чиле, на расслабоне!" call BIS_fnc_titleText;player setVariable ["InfoTextSZ",true]; }; }else{player setVariable ["InfoTextSZ",false];player allowDamage true;}; if(player inArea "CSAT_PLAC") then { if !(player getVariable ["InfoTextPlac",false]) then { "В строю стоим с оружием за спину - <t color='#57f546'>F2</t><br />Ровно - два раза <t color='#ff8401'>ALT</t>" call BIS_fnc_titleText;player setVariable ["InfoTextPlac",true]; }; }else{player setVariable ["InfoTextPlac",false];}; if(player inArea "CSAT_SHTAB") then { if !(player getVariable ["InfoTextShtab",false]) then { "Садись на <t color='#57f546'>свободный стул</t><br />Сиди ровно, два раза <t color='#ff8401'>ALT</t>" call BIS_fnc_titleText;player setVariable ["InfoTextShtab",true]; }; }else{player setVariable ["InfoTextShtab",false];}; }; if((player inArea "CSAT_REPAIR_1" || player inArea "CSAT_REPAIR_2") && (assignedDriver (vehicle player) == player)) then { if !(player getVariable ["InfoTextRepair",false]) then { "<t color='#ff0000'>Выключи</t> двигатель<br />Зажми <t color='#ff8401'>Пробел</t> для обслуживания техники" call BIS_fnc_titleText;player setVariable ["InfoTextRepair",true]; }; }else{player setVariable ["InfoTextRepair",false];}; Sleep 2; }; };
		case "InitChannelPlayer" : { RadioChannel_SYSTEM radioChannelAdd [player]; RadioChannel_ODKB radioChannelAdd [player]; waitUntil {(player getVariable ["pLvl",-1] >= 1)}; ["SetChannel"] call F_fnc_S; while {true} do { forceUnicode 0; private _shtab = groupId (group player) regexFind ["ШТАБ"] isNotEqualTo []; private _cyp = groupId (group player) regexFind ["ЦУП"] isNotEqualTo []; private _btv = groupId (group player) regexFind ["БТВ"] isNotEqualTo []; private _kmb = groupId (group player) regexFind ["КМБ"] isNotEqualTo [] || groupId (group player) regexFind ["Курс"] isNotEqualTo []; private _leader = leader (group player) == player; private _pLvl = player getVariable ["pLvl",-1]; if !(player getVariable ["isUnconscious",false]) then { if(["CheckAPIB"] call F_fnc_S || count playableUnits <= MIN_PLAYERS || player getVariable ["pLvl",-1] >= 10) then {1 enableChannel [true,true]; }else{1 enableChannel [true,false];}; }; if(_leader && (_pLvl >= BASE_LVL || count playableUnits <= MIN_PLAYERS) && !(player getVariable ["isUnconscious",false])) then { RadioChannel_SHTAB radioChannelAdd [player]; RadioChannel_CYP radioChannelAdd [player]; RadioChannel_BTV radioChannelAdd [player];  RadioChannel_COMMAND radioChannelAdd [player]; if (_btv) then { RadioChannel_CYP radioChannelRemove [player]; RadioChannel_COMMAND radioChannelRemove [player]; }; if (_cyp) then { RadioChannel_BTV radioChannelRemove [player]; RadioChannel_COMMAND radioChannelRemove [player]; }; if(_shtab || _kmb) then { RadioChannel_CYP radioChannelRemove [player]; RadioChannel_BTV radioChannelRemove [player]; RadioChannel_COMMAND radioChannelRemove [player]; }; } else { RadioChannel_SHTAB radioChannelRemove [player]; RadioChannel_CYP radioChannelRemove [player]; RadioChannel_BTV radioChannelRemove [player];  RadioChannel_COMMAND radioChannelRemove [player];   }; sleep 2; }; };
		case "InitFlags" : { CSAT_Flag_1 forceFlagTexture "texture\banner\rus_banner2.paa"; CSAT_Flag_2 forceFlagTexture "texture\banner\imperial_banner2.paa"; CSAT_Flag_3 forceFlagTexture "texture\banner\9pota_banner2.paa"; CSAT_Flag_4 forceFlagTexture "texture\banner\sssr_banner2.paa"; CSAT_Flag_5 forceFlagTexture "texture\banner\vdv_banner2.paa"; CSAT_Flag_BTV forceFlagTexture "texture\banner\btv_banner2.paa"; CSAT_Flag_CYP forceFlagTexture "texture\banner\cyp_banner2.paa";};
		case "InitKeys" : { disableSerialization; waitUntil {!isNull(findDisplay 46)}; (findDisplay 46) displayAddEventHandler ["keyDown", "['KeyDown',_this] call F_fnc_S"]; (findDisplay 46) displayAddEventHandler ["keyUp", "['KeyUp',_this] call F_fnc_S"]; };
		case "InitBlock" : { player addEventHandler ["Fired", { if ((player inArea "CSAT_SAFE_ZONE_1" || player inArea "CSAT_SAFE_ZONE_2") && SAFEZONE_CSAT) exitWith { deleteVehicle (_this # 6);};}];inGameUISetEventHandler ["Action", 'if((_this # 3 == "AutoHover" and (typeOf (vehicle player) in (VEH_TYPE # 5))) or (_this # 3 == "UserType" and (assignedDriver (vehicle player) != player) and !(vehicle player isKindOf "Man"))) then {true};']; };
		case "InitSpawn" : { player addRating 99999; player setUnconscious false; player setCaptive 0; player setDamage 0; player setVariable ["isUnconscious", false, true]; player setVariable ["isBleeding", false, true]; player setVariable ["isDragged", false, true]; player setVariable ["isCarryed", false, true]; player setVariable ["isDrag",false,true]; player setVariable ["Blood", TIME_BLOOD, true]; player setVariable ["KHP", 1000, true]; player connectTerminalToUAV objNull; };
		case "InitTimeInVeh" : { private _type = _params param [0,""]; player setVariable ["INCYP",false]; player setVariable ["INBTV",false]; if(_type != "")then{ private _veh = format["IN%1",_type]; player setVariable [_veh,true]; while {player getVariable _veh} do { sleep TIME_INVEH; if (!(player inArea "CSAT_BASE") && !(player getVariable ["isUnconscious",false]))then{ private _pHours = player getVariable "pHours"; if(_type == "CYP" && (getpos player # 2 > 5)) then { _pHours set [1, ((_pHours # 1) + 1)]; }; if(_type == "BTV") then { _pHours set [2, ((_pHours # 2) + 1)]; }; player setVariable ["pHours",_pHours,true]; [player,SCORE_INVEH] call F_fnc_AddExp; }; }; }; };
		case "InitTimeInGame" : { while {true} do { Sleep 60; if(player inArea "CSAT_BASE_AFK")exitWith{}; private _pHours = player getVariable "pHours"; _pHours set [0, ((_pHours # 0) + 1)]; player setVariable ["pHours",_pHours,true]; if( (((_pHours # 0) + 1) / 60) % TIME_INGAME == 0) then{ ["AddPrc",[player,SCORE_INGAME]] call F_fnc_S; }; ['SavePlayer',[player]] remoteExec ["HP_fnc_ToQu",2];}; };
		case "InitMarkersPlayer" : { 
			private _Slot = player getVariable ["Slot","Rifleman"]; 
			if(_Slot != "CYP") then {for "_i" from 1 to 57 do { deleteMarkerLocal format["M_CYP_%1",_i];};}; 
			while {true} do {
				private _pLvl = player getVariable ["pLvl",-1]; 
				if(player inArea "CSAT_BASE")then{
					"CSAT_M_NAME_BASE" setMarkerTextLocal ' База ВС РФ "Девятка"';
					"CSAT_M_NAME_SHTAB" setMarkerTextLocal " Штаб";
					"CSAT_M_NAME_AFK" setMarkerTextLocal " Зона отдыха";
					"CSAT_M_NAME_ARS_1" setMarkerTextLocal " Арсенал";
					"CSAT_M_NAME_ARS_2" setMarkerTextLocal " Арсенал";
					"CSAT_M_NAME_CYP" setMarkerTextLocal " База ЦУП";
					"CSAT_M_NAME_BTV" setMarkerTextLocal " База БТВ";
					"CSAT_M_NAME_PIRS" setMarkerTextLocal " ПИРС";
					"CSAT_M_NAME_PLAC" setMarkerTextLocal " Плац";
					if(_pLvl < BASE_LVL) then {
						"CSAT_M_NAME_ZGRZ" setMarkerTextLocal " Загрузка"; 
						"CSAT_M_NAME_PGZ_1" setMarkerTextLocal " Погрузка # 1"; 
						"CSAT_M_NAME_PGZ_2" setMarkerTextLocal " Погрузка # 2"; 
						"CSAT_M_NAME_TIR" setMarkerTextLocal " Стрельбище";
					}else{ 
						"CSAT_M_NAME_ZGRZ" setMarkerTextLocal ""; 
						"CSAT_M_NAME_PGZ_1" setMarkerTextLocal " # 1"; 
						"CSAT_M_NAME_PGZ_2" setMarkerTextLocal " # 2"; 
						"CSAT_M_NAME_TIR" setMarkerTextLocal "";
					}; 
				}else{
					"CSAT_M_NAME_BASE" setMarkerTextLocal '';
					"CSAT_M_NAME_SHTAB" setMarkerTextLocal "";
					"CSAT_M_NAME_AFK" setMarkerTextLocal "";
					"CSAT_M_NAME_ARS_1" setMarkerTextLocal "";
					"CSAT_M_NAME_ARS_2" setMarkerTextLocal "";
					"CSAT_M_NAME_CYP" setMarkerTextLocal "";
					"CSAT_M_NAME_BTV" setMarkerTextLocal "";
					"CSAT_M_NAME_PIRS" setMarkerTextLocal "";
					"CSAT_M_NAME_PLAC" setMarkerTextLocal "";
					"CSAT_M_NAME_ZGRZ" setMarkerTextLocal ""; 
					"CSAT_M_NAME_PGZ_1" setMarkerTextLocal ""; 
					"CSAT_M_NAME_PGZ_2" setMarkerTextLocal ""; 
					"CSAT_M_NAME_TIR" setMarkerTextLocal "";
				};
				Sleep 3;
			};
		};
	// ОТКЛЮЧЕНИЕ или УНИЧТОЖЕНИЕ
		// InitPlayerLocal.sqf
		case "TermSUB" : { enableSaving [false,false];enableSentences false;showSubtitles false;enableRadio false;player setSpeaker "NoVoice"; };
		case "TermChannel" : { for "_i" from 0 to 15 do { _i enableChannel false; };5 enableChannel true; setCurrentChannel 5; };
		case "TermEGS" : { private _th = _params param [0, 0]; switch (_th) do { case 10: { ["Terminate"] call BIS_fnc_EGSpectator;};}; };
		case "TermNVG" : { while {true} do { waituntil {currentVisionMode player == 2}; vehicle player disableTIEquipment true; cutText ["Тепловизор не работает, нажмите N для перезагрузки.", "BLACK", 0.001]; playSound "FD_CP_Not_Clear_F"; waituntil {currentVisionMode player != 2}; 0 cutFadeOut 0; };};
		case "TermHandlers" : { private _player = _params param [0, objNull];if(_player == objNull)exitWith{}; _player removeAllEventHandlers "Respawn"; _player removeAllEventHandlers "killed"; _player removeAllEventHandlers "HandleRating"; _player removeAllEventHandlers "HandleScore"; _player removeAllEventHandlers "Fired"; _player removeAllEventHandlers "GetInMan"; _player removeAllEventHandlers "GetOutMan"; _player removeAllEventHandlers "SeatSwitchedMan"; _player removeAllEventHandlers "HandleDamage"; removeAllActions _player; _player connectTerminalToUAV objNull; };
	// ПРОВЕРКИ
		// InitPlayerLocal.sqf
		case "CheckSlot" : { private _text = ""; private _pLvl = player getVariable ["pLvl",-1]; private _Slot = player getVariable ["Slot","Rifleman"]; private _pPanels = player getVariable "pPanels"; private _pCYP = _pPanels # 4 # 0; private _pBTV = _pPanels # 4 # 1; private _pNCYP = _pPanels # 1 # 0; private _pNBTV = _pPanels # 1 # 1; private _pNLS = _pPanels # 1 # 3; if(!(1 in _pCYP) && _Slot == "CYP")then{_text = "У вас нет допусков на слот «Пилота»!";}; if(!(1 in _pBTV) && _Slot == "BTV")then{ _text = "У вас нет допусков на слот «Танкиста»!";}; {if((_Slot == _x # 0) && (_pLvl < _x # 1))exitWith{ _text = format["Слот «%1» доступен со звания «%2»",(_x # 2),iLVL # (_x # 1) # 1]; if(_pLvl <= 0)then{_text = _text + "\nДля новобранцев доступен слот «Стрелок»";}; }; } forEach SLOTS_ACCESS; if(_pNLS != 1 && _Slot == "NLS")then{_text = "Вы не «Начальник Личного состава»!";}; if(_pNCYP != 1 && _Slot == "NCYP")then{_text = "Вы не «Начальник ЦУП»!";}; if(_pNBTV != 1 && _Slot == "NBTV")then{_text = "Вы не «Начальник БТВ»!";}; if(_text != "")then{ player setVariable ["CHECKSLOTNOT",true]; player enableSimulation false; "intro" cutText [format["%1\n\nПожалуйста перезайдите на другой слот",_text], "BLACK", 0.001]; }; };
		case "CheckSeat" : { player addEventHandler ["GetInMan", { params ["_player","_role","_vehicle"]; if ((_role == "driver") || (_role == "gunner") || (_role == "commander")) exitWith { ["CheckSeat2"] call F_fnc_S; }; }]; player addEventHandler ["SeatSwitchedMan", { _role = assignedVehicleRole player; if (("driver" in _role) || ("turret" in _role) || ("turret path" in _role)) exitWith { ["CheckSeat2"] call F_fnc_S; }; }]; player addEventHandler ["GetOutMan", { ["InitTimeInVeh"] call F_fnc_S; }]; };
		case "CheckSeat2" : { private _vehicle = vehicle player; private _type = typeOf _vehicle; private _pLvl = player getVariable ["pLvl",-1]; private _Slot = player getVariable ["Slot","Rifleman"]; private _pPanels = player getVariable "pPanels"; private _pCYP = _pPanels # 4 # 0; private _pBTV = _pPanels # 4 # 1; if(_vehicle == CSAT_CAR_SHTAB && !(_Slot in SLOTS_N))exitWith{systemChat "Только для штабников!";moveOut player;}; if (_pLvl <= 0) exitWith {systemChat "Место не доступно Новобранцам!";moveOut player;}; for "_i" from 0 to (count _pCYP) do { if(_type in (VEH_AIR_ACCESS # _i)) exitWith { if(_Slot != "CYP") exitWith { systemChat "Вы не на слоте пилота!"; moveOut player; }; if ((_pCYP # _i) == 0) exitWith { systemChat format["%1: нет допуска!",PDATA_TEXT # 4 # 4 # 0 # _i]; moveOut player; }; ["InitTimeInVeh",["CYP"]] spawn F_fnc_S; }; }; for "_i" from 0 to (count _pBTV) do { if(_type in (VEH_LAND_ACCESS # _i)) exitWith { if(_Slot != "BTV") exitWith { systemChat "Вы не на слоте танкиста!"; moveOut player; };  if ((_pBTV # _i) == 0) exitWith { systemChat format["%1: нет допуска!",PDATA_TEXT # 4 # 4 # 1 # _i]; moveOut player; }; ["InitTimeInVeh",["BTV"]] spawn F_fnc_S; }; }; private _pHours = player getVariable "pHours"; if(_type in ([VEH_CSAT # 15 # 1] + [VEH_NATO # 17 # 1] + [VEH_NATO # 17 # 2]) && (_pHours # 1) < (60*TIME_CYP4))exitWith{ systemChat format["Вы налетали %1 из %2 часов!",floor ((_pHours # 1)/60),TIME_CYP4]; moveOut player; }; if(_type in (VEH_CSAT # 8 + VEH_NATO # 8) && (_pHours # 2) < (60*TIME_BTV4))exitWith{ systemChat format["Вы наездили %1 из %2 часов!",floor ((_pHours # 2)/60),TIME_BTV4]; moveOut player; }; };
		case "CheckNick" : { forceUnicode 0; if((player getVariable "pHours") # 0 < 20)exitWith{}; { if(name player regexFind [_x] isNotEqualTo [])exitWith{ player setVariable ["CHECKSLOTNOT",true]; player enableSimulation false; "intro" cutText ["Твой позывной (ник) не подходит для игры на нашем сервере\n\nПоменяй его пожалуйста и возвращайся!", "BLACK", 0.001]; }; }forEach BADNICK; };
		case "CheckAPIB" : { 
			private _CP = playableUnits inAreaArray "CSAT_BASE"; 
			if((count playableUnits) == (count _CP))then{
				_ret = true;
			}else{
				_ret = false;
			}; 
		};
	// GET
		case "GetObj" : { 
			private _obj = (allMissionObjects "WeaponHolder")+(allMissionObjects "GroundWeaponHolder")+(allMissionObjects "WeaponHolderSimulated")+(allMissionObjects "#crater")+(allDead); 
			_obj = _obj + (vehicles select { (damage _x > 0.8 || {!canMove _x}) && {(count (crew _x)) isEqualTo 0}}); 
			_ret = (_obj - MyAllVehicle); 
		};
		case "GetDate" : { private _DT = (systemTime apply {if (_x < 10) then {"0" + str _x} else {str _x}}); _ret = format["%1-%2-%3 %4.%5.%6",_DT # 0,_DT # 1,_DT # 2,_DT # 3,_DT # 4,_DT # 5]; };
		case "GetFaction" : { private _unit = _params param [0, objNull];if(_unit == objNull)exitWith{}; if((faction _unit) in UNITS_HATO) then {_ret = "NATO"}; if((faction _unit) in UNITS_CSAT) then {_ret = "CSAT"}; if((faction _unit) in UNITS_IND) then {_ret = "IND"}; if((faction _unit) in UNITS_CIV) then {_ret = "CIV"};};
		case "GetPrc" : { private _player = _params param [0, objNull];if(_player == objNull)exitWith{}; private _pLvl = _player getVariable ["pLvl",-1]; private _pExp = _player getVariable ["pExp",0]; if(_pLvl <= 0) exitWith {_ret = 0;}; if(_pLvl == 20) exitWith { _ret = 100; }; private _NeedExp = iLVL # (_pLvl + 1) # 2; _ret = floor (_pExp / _NeedExp * 100); };
	// УСТАНОВИТЬ	
		case "SetChannel" : { if(player getVariable ["pLvl",-1] >= 1 && !(player getVariable ["isMute",false]))then{{ _x enableChannel true; } forEach CHAN_START;}; };
		case "SetOptions" : { private _type = _params param [0, ""]; if(_type == "" || _type == "Stamina") then { if (Stamina) then { player enableStamina true; player enableFatigue true; }else{ player enableStamina false; player enableFatigue false; }; }; if(_type == "" || _type == "Shaking") then { if (Shaking) then { player setCustomAimCoef 1; }else{ player setCustomAimCoef 0; }; }; if(_type == "" || _type == "V3D") then { if !(V3D) then { [] spawn {while {(!V3D)} do { if(isNull getConnectedUAVUnit player) then {player switchCamera "INTERNAL"; sleep 0.1; waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};}; };}; }; }; if(_type == "" || _type == "UseGPS") then { if !(UseGPS) then { [] spawn {while {(!UseGPS)} do { player unassignItem "ItemGPS"; player unlinkItem "ItemGPS"; player removeItem "ItemGPS"; sleep 3; waitUntil {"ItemGPS" in (assignedItems player)}; };}; }; }; if(_type == "" || _type == "UseMap") then { if !(UseMap) then { [] spawn {while {(!UseMap)} do { player unassignItem "ItemMap"; player unlinkItem "ItemMap"; player removeItem "ItemMap"; sleep 3; waitUntil {"ItemMap" in (assignedItems player)}; };}; }; }; if(_type == "" || _type == "UseOptic") then { if !(UseOptic) then { [] spawn {while {(!UseOptic)} do { player removePrimaryWeaponItem ((primaryWeaponItems player) # 2); sleep 3; waitUntil {(primaryWeaponItems player) # 2 != ''}; };}; }; }; };
		case "SetActions" : {
			//[player, "<t color='#ffa200'>Выбросить десант</t>", "a3\missions_f_oldman\data\img\holdactions\holdaction_follow_start_ca.paa", "a3\missions_f_oldman\data\img\holdactions\holdaction_follow_start_ca.paa", CONDITION_OUTHELI, CONDITION_OUTHELI, {}, {}, {[player,"crew"] spawn F_fnc_AirDrop;}, {}, [], 1, nil, false, false ] call BIS_fnc_holdActionAdd;
			
			player addAction ["Выпрыгнуть <t color='#ffa200'>с парашютом</t>",{[player,"solo"] spawn F_fnc_AirDrop;}, 0, 100, false, true, "", CONDITION_PARACHUTE];
			[player, "<t color='#ffa200'>Обслужить</t> технику", "a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa", "a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa", CONDITION_REPAIR, CONDITION_REPAIR, {}, {["Repair",[vehicle player,_this # 4]] call F_fnc_Veh;}, {(vehicle player) vehicleChat "Поехали!";}, {}, [], 30, nil, false, false ] call BIS_fnc_holdActionAdd;
			
			[player, "Присвоить <t color='#ffa200'>Рядового</t>", "\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_access_fm_CA.paa", "\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_access_fm_CA.paa", CONDITION_KMB, CONDITION_KMB, {}, {}, {["AddLevel",[cursorTarget]] call F_fnc_S;}, {}, [], 2, nil, false, false ] call BIS_fnc_holdActionAdd;
		
		// Арсенал
			_id = player addAction ["", {["Open", [false,CSAT_ARSENAL]] call BIS_fnc_arsenal;},[],11,true,true,"",CONDITION_ARSENAL];  
			player setUserActionText [ _id, "<t color='#ffffff'>Открыть</t> <t color='#ec872d'>Арсенал</t>", "<t align='left' color='#ffffff'>Открыть</t> <t align='center' color='#ec872d'>Арсенал</t><br/><br/><img image='a3\weapons_f\ammoboxes\data\ui\icomap_ammo_ca.paa' size='3' shadow='0' align='center' valign='top'/>" ]; 
			{ if(player getVariable ["Slot","Rifleman"] == (_x # 2)) then { _id = player addAction ["", {params ["_target", "_caller", "_actionId", "_arguments"];[_arguments # 0] call A_fnc_Presets},[_x # 3],12,true,true,"","(player inArea 'CSAT_ARSENAL_1') or (player inArea 'CSAT_ARSENAL_2')"]; player setUserActionText [ _id, format["<t color='#ffffff'>Снаряжение</t> <t color='#ec872d'>%1</t>",_x # 0], format["<t align='left' color='#ffffff'>Снаряжение</t> <t align='center' color='#ec872d'>%1</t><br/><br/><img image='%2' size='3' shadow='0' align='center' valign='top'/>",_x # 0,_x # 1] ]; }; } forEach ARS_TYPE;
		// Медицина	
			[player, "<t color='#ff0000'>Оказать мед.помощь</t>", 			MD_IMG # 1, MD_IMG # 1, CONDITION_REVIVE, CONDITION_REVIVE, {}, {}, {["Revive",[player,cursorTarget]] call F_fnc_MED;}, {}, [], TIME_REVIVE, nil, false, false] call BIS_fnc_holdActionAdd;
			[player, "<t color='#ff0000'>Перевязать</t> бойца", 			MD_IMG # 0, MD_IMG # 0, CONDITION_BANDAGE, CONDITION_BANDAGE, {}, {}, {["Bandage",[player,cursorTarget]] call F_fnc_MED;}, {}, [], TIME_BANDAGE, nil, false, false] call BIS_fnc_holdActionAdd;
			player addAction [ "<t color='#ff0000'>Тащить</t> бойца",{["Drag",[player,cursorTarget]] spawn F_fnc_MED;}, nil, 1, false, true, "", CONDITION_DRAG];
			player addAction [ "<t color='#ff0000'>Нести</t> бойца",{["Carry",[player,cursorTarget]] spawn F_fnc_MED;}, nil, 1, false, true, "", CONDITION_DRAG];
			player addAction [ "<t color='#ff0000'>Погрузить ранненого</t>",{["Load",[cursorTarget]] spawn F_fnc_MED;}, nil, 1, false, true, "", CONDITION_LOAD];
			player addAction [ "<t color='#ff0000'>Вытащить ранненых</t>",{["UnLoad",[cursorTarget]] spawn F_fnc_MED;}, nil, 1, false, true, "", CONDITION_UNLOAD];
		};
		case "SetTK" : { private _player = _params param [0,objNull];if(_player == objNull)exitWith{};if(_player getVariable ["pLvl",-1] <= 0)exitWith{}; if(_player getVariable ["pKarma",0] <= 0)then{ private _TKcount = _player getVariable ["TKcount",0]; private _pLvl = _player getVariable ["pLvl",-1]; private _LvlExp = (iLVL # _pLvl # 2) + 100; if((_TKcount+1) >= COUNT_KARMA)then{ _player setVariable ["pKarma",_LvlExp*SCORE_KARMA,true]; _player setVariable ["TKcount",0,true]; ["CLOSER"] remoteExec ["BIS_fnc_showNotification",_player]; }else{ _player setVariable ["TKcount",(_TKcount+1),true]; }; }else{ private _pKarma = _player getVariable ["pKarma",0]; _player setVariable ["pKarma",(_pKarma + 100),true]; }; };
		case "SetLeader" : { private _unit = _params param [0, objNull]; if(_unit == objNull)exitWith{}; private _isLeader = leader (group _unit) == _unit; if(_isLeader)then{ private _grpLeader = (group _unit) getVariable ["LeaderGroup",objNull]; if(_grpLeader == objNull)then{ (group _unit) setVariable ["LeaderGroup",_unit,true]; }else{ if(group _grpLeader != group _unit)then{ (group _unit) setVariable ["LeaderGroup",_unit,true]; }; }; }; if(_isLeader)then{ private _NowLeader = objNull; {if(!(_x getVariable ["isUnconscious",false]) && (_x getVariable ["pLvl",0]) > (_NowLeader getVariable ["pLvl",0]))then{ _NowLeader = _x; }; } foreach (units group _unit) - [_unit]; [group _unit, _NowLeader] remoteExec ["selectLeader", groupOwner group _unit]}; };
		
		case "KeyDown" : {
			private _key = _params param [1];
			
			// Блокировка тактического вида, автозависания и переключение вида(если 300 и усложнение)
			if (_key in (actionKeys "tacticalView"))then{ _ret = true; };	// Блокировка тактического вида
			if (_key in (actionKeys "AutoHover" + actionKeys "AutoHoverCancel") && typeOf (vehicle player) in (VEH_TYPE # 5))then{ _ret = true; };	// Блокировка автозависания
			if (_key in (actionKeys "personView") && (player getVariable ["isUnconscious",false] || (!V3D && (isNull getConnectedUAVUnit player))))then{_ret = true;}; 		// Блокировка 3 вида	
			
			
			if(_key == 1)then{
				[] spawn{waitUntil{!isNull (findDisplay 49)};
					_resp = true;
					_esc = true;
					if(player getVariable ["isBleeding", false] && player getVariable ["Blood",0] > 800)then{_esc=false;};
					if(player getVariable ["pLvl",-1] <= BASE_LVL || player getVariable ["Blood",0] > 800)then{_resp=false;};
					(findDisplay 49)displayCtrl 1010 ctrlEnable _resp;
					(findDisplay 49)displayCtrl 104 ctrlEnable _esc;
				};
			};
			
			private _keys = [59,60,61,62]; if !(_key in _keys) exitWith {false};
			
			if(player getVariable ["isUnconscious",false])exitWith{_ret = true;};
			
			switch (_key) do {
				case 59: {if (soundVolume == 1) then {1 fadeSound 0.1;}else{1 fadeSound 1;};};
				case 60: {player action ["SWITCHWEAPON",player,player,-1];};
				case 61: { if(!isNull (findDisplay 56000)) exitWith {false}; [cursorTarget] spawn F3Menu_fnc_OpenMenu; };
				case 62 : { if (!(player getVariable ["MRKSET",false]) && (player getVariable ["pLvl",-1] >= BASE_LVL) && !(player inArea "CSAT_BASE") && !(player inArea "CSAT_PIRS")) exitWith { private _pID = getPlayerID player;private _cnt = player getVariable ["MRKCNT",0]; private _name = format["_USER_DEFINED #%1/%2u/1",_pID,_cnt]; private _marker = createMarker [_name, player,1,player]; _marker setMarkerType "hd_dot"; _cnt = _cnt + 1;player setVariable ["MRKCNT",_cnt]; player setVariable ["MRKSET",true]; [] spawn {Sleep TIME_MRK; player setVariable ["MRKSET",false]}; }; };
			};
			_ret = true;
		};
		case "KeyUp" : {
			private _key = _params param [1];
			private _keys = [61]; if !(_key in _keys) exitWith {false};
			switch (_key) do {case 61: { if(isNull (findDisplay 56000)) exitWith {false}; [] call F3Menu_fnc_OpenMenu; };};
			_ret = true;
		
		};
	// ОПЫТ	
		case "AddExp" : {
			private _player = _params param [0,objNull];if(_player == objNull)exitWith{};
			private _score = _params param [1,0];
			
			private _pLvl = _player getVariable ["pLvl",0];
			private _pExp = _player getVariable ["pExp",0];
			
			if(_pLvl <= 0)exitWith{};
			if(_score >= 0 && _player getVariable ["isUnconscious",false])exitWith{};
			if(_score >= 0 && _pLvl >= 20)exitWith{};
			
			_pExp = (_pExp + _score);
			
			if(_score >= 0) then {
				if(_pExp >= _NeedExp) then {
					private _NeedExp = iLVL # (_pLvl+1) # 2;
					_pLvl = _pLvl + 1;
					_pExp = (_pExp - _NeedExp);
					["LVLUP", [format["Вы повышены до<br/><t color='#ffab33'>%1</t>",iLVL # _pLvl # 1]]] remoteExec ["BIS_fnc_showNotification",_player];['LogLVL',["UP",getPlayerUID _player,name _player,_pLvl]] remoteExec ["HP_fnc_ToQu",2];
				};
			}else{
				if(_pExp < 0) then {
					private _preExp = iLVL # (_pLvl) # 2;
					if(_pLvl > 1) then {_pLvl = _pLvl - 1;["LVLDOWN", [format["Вы разжалованы до<br/><t color='#ffab33'>%1</t>",iLVL # _pLvl # 1]]] remoteExec ["BIS_fnc_showNotification",_player];['LogLVL',["DOWN",getPlayerUID _player,name _player,_pLvl]] remoteExec ["HP_fnc_ToQu",2];};
					_pExp = (_pExp + _preExp);
				};
			};
			if(_pExp < 0) then {_pExp=0;};
			if(_pExp > (iLVL # (count iLVL) # 2)) then {_pExp=iLVL # (count iLVL) # 2;};
			
			_player setVariable ["pLvl",_pLvl,true];
			_player setVariable ["pExp",_pExp,true];
		};
		
		
		
		
		
		
		case "AddPrc" : { private _player = _params param [0,objNull];if(_player == objNull)exitWith{}; private _prc = (_params param [1,0]) / 100; private _pLvl = _player getVariable ["pLvl",0]; private _NeedExp = iLVL # (_pLvl + 1) # 2; ["AddExp",[_player,_NeedExp * _prc]] call F_fnc_S; };
		
		case "AddLevel" : {
			if !(player inArea "CSAT_BASE")exitWith{systemChat "Для выдачи звания, нужно быть на базе!";};
			private _player = _params param [0,objNull];if(_player == objNull)exitWith{};
			private _pExp = 0;
			private _pLvl = _player getVariable ["pLvl",-1];
			private _nextExp = iLVL # (_pLvl + 2) # 2;
			private _prc = ["GetPrc",[_player]] call F_fnc_S;
			if(_player == player)exitWith{systemChat "Вы не можете повысить себя в звании!";};
		
			if(player getVariable ["pLvl",-1] <= (_pLvl + 1))exitWith{systemChat format["Вы не можете повысить выше %1!",(iLVL # _pLvl # 1)];};
			if(_pLvl >= (count iLVL - 2))exitWith{systemChat "Достигнуто высшее звание!";};
			if(_pLvl <= 0) then {["KMB", ["Пройден КМБ","Поздравляем! Вы прошли<br/><t color='#ffab33'>Курс Молодого Бойца</t>!"]] remoteExec ["BIS_fnc_showNotification",_player];["AddExp",[player,SCORE_KMB]] call F_fnc_S;['LogKMB',[format["%1 провел %2 КМБ и получил звание Рядовой",name player,name _player],getPlayerUID _player,getPlayerUID player]] remoteExec ["HP_fnc_ToQu",2];
			}else{["LVLUP", [format["Присвоено внеочередное звание<br/><t color='#ffab33'>%1</t>",(iLVL # (_pLvl + 1) # 1)]]] remoteExec ["BIS_fnc_showNotification",_player];['LogLVL',["UP",getPlayerUID _player,name _player,(_pLvl + 1)]] remoteExec ["HP_fnc_ToQu",2];};
			_pExp = _prc/100*_nextExp;
			_pLvl = _pLvl + 1;
			
			_player setVariable ["pLvl",_pLvl,true];
			_player setVariable ["pExp",_pExp,true];
			
			['SavePlayer',[_player]] remoteExec ["HP_fnc_ToQu",2];
		};
		case "DelLevel" : {
			private _player = _params param [0,objNull];if(_player == objNull)exitWith{};
			private _pExp = 0;
			private _pLvl = _player getVariable ["pLvl",-1];
			private _preExp = iLVL # (_pLvl) # 2;
			private _prc = ["GetPrc",[_player]] call F_fnc_S;
			if(_player == player)exitWith{systemChat "Вы не можете понизить себя в звании!";};
			
			if(player getVariable ["pLvl",-1] <= _pLvl)exitWith{systemChat "Вы не можете понизить старшего по званию!";};
			if(_pLvl == 0) exitWith {};
			_pExp = _prc/100*_preExp;
			_pLvl = _pLvl - 1;
			
			["LVLDOWN", [format["Вас разжаловали до звания<br/><t color='#ffab33'>%1</t>",(iLVL # _pLvl # 1)]]] remoteExec ["BIS_fnc_showNotification",_player];
			['LogLVL',["DOWN",getPlayerUID _player,name _player,_pLvl]] remoteExec ["HP_fnc_ToQu",2];
		
			_player setVariable ["pLvl",_pLvl,true];
			_player setVariable ["pExp",_pExp,true];
			
			['SavePlayer',[_player]] remoteExec ["HP_fnc_ToQu",2];
		};
	
	
	
	};
	
	_ret