

/* МОДЕРИРОВАНИЕ ЧАТА */
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];
		
		private _msg = "";
		
		if(_channel == 16)then{
			_msg = ["«Девятка»",_text];
		}else{
			{forceUnicode 0;_text = _text regexReplace [format["[^\s]*%1[^\s]*/gio",_x], "***"];} forEach CHAT_BADWORD; 
			
			private _leader = leader (group _person) == _person;
			private _pLvlName = (iLVL # (_person getVariable ["pLvl",-1]) # 3);
			private _Slot = _person getVariable ["Slot","Rifleman"];
			private _pNSH = _Slot == "NSH"; private _pNLS = _Slot == "NLS"; private _pNCYP = _Slot == "NCYP"; private _pNBTV = _Slot == "NBTV"; private _pCYP = _Slot == "CYP"; private _pBTV = _Slot == "BTV";
			
			
			if(_leader && _channel in [3,9,10])then{_msg = "Ком. "};
			if(_pNSH)then{_msg = "Нач.штаба "};
			if(_pNLS)then{_msg = "Нач.ЛС "};
			if(_pNCYP)then{_msg = "Нач.ЦУП "};
			if(_pNBTV)then{_msg = "Нач.БТВ "};
			if(_pCYP && !(_channel in [3,5]))then{_msg = "Пилот "};
			if(_pBTV && !(_channel in [3,5]))then{_msg = "Танкист "};
			if!(_channel in [8,9,10,11]) then {_msg = format["%1%2",_msg,_pLvlName];};
			
			_msg = format["%1 - %2",_msg,_name];
			_msg = [_msg,_text];
			
			if(_channel == 8) then {
				if(_pNSH) then {_msg = ["Нач.штаба",_text]
				}else{_msg = [format["ШТАБ - %1",_name],_text];};
			};
			
			if(_channel == 6) then {_msg = ["«Девятка»",_text];};
			if(_channel == 7) then {_msg = ["Силы «ОДКБ»",_text];};
			if(_channel == 0)then{_msg = ["«ШТАБ»",_text];};
		};
		_msg
	}];



/* ТЕЛЕПОРТЫ */
	TPAction = [ 
		[TP_CSAT_BTV,"e2e84c","На базу «Девятка»","a3\modules_f\data\iconhq_ca.paa",[14576.1,16731,0]],
		[TP_CSAT_CYP,"e2e84c","На базу «Девятка»","a3\modules_f\data\iconhq_ca.paa",[14576.1,16731,0]],
		[TP_CSAT_TIR,"e2e84c","На базу «Девятка»","a3\modules_f\data\iconhq_ca.paa",[14576.1,16731,0]],
		[TP_CSAT_PIRS,"e2e84c","На базу «Девятка»","a3\modules_f\data\iconhq_ca.paa",[14576.1,16731,0]],
		[TP_CSAT_BASE,"78ffa1","На базу БТВ","a3\data_f_tank\logos\arma3_tank_icon_ca.paa",[15312.1,17507.5,0]],
		[TP_CSAT_BASE,"78ceff","На авиабазу","a3\data_f_jets\logos\jets_icon_ca.paa",[14199.4,16248,0]],
		[TP_CSAT_BASE,"ffce78","На стрельбище","a3\data_f_mark\logos\arma3_mark_icon_ca.paa",[15617.4,17082.8,0]],
		[TP_CSAT_BASE,"d736be","На пирс","a3\ui_f\data\map\vehicleicons\iconship_ca.paa",[15369.8,15862.2,0]]
	];
	
	{ _id = (_x # 0) addAction ["", {player setPos (_this # 3 # 0);},[_x # 4],1,true,true,"",CONDITION_TP];  (_x # 0) setUserActionText [ _id, format["<t color='#%1'>%2</t>",_x # 1,_x # 2], format["<t color='#%1'>%2</t><br/><br/><img image='%3' size='3' shadow='0' align='center' valign='top'/>",_x # 1,_x # 2,_x # 3] ]; (_x # 0) lockInventory true; } forEach TPAction;
	

/* УСТАНОВКА ТЕКСТУР */
	Board_Start setObjectTextureGlobal [0, "texture\CSAT\welcome.paa"];	// WELCOME
	Board_AFK setObjectTextureGlobal [0, "texture\CSAT\afk.paa"];		// AFK
	Ars_mon setObjectTextureGlobal [0, "texture\CSAT\Ars_mon.paa"];		// Экран в арсенале

/* ИНИЦИАЛИЗАЦИЯ ТЕХНИКИ */
	if (isServer)then{
		MyAllVehicle = [];
		{
			if((typeOf _x) in VEH_TP)then{["SetTexture",[_x]] call F_fnc_Veh;};
			if((typeOf _x) in VEH_ALL && !((typeOf _x) in VEH_TP) && _x != StartHeli)then{
				_x setVariable ["DRM",true,true];
				["SetTexture",[_x]] call F_fnc_Veh;
				["LoadBK",[_x]] call F_fnc_Veh;
				["Respawn",[_x]] spawn F_fnc_Veh;
			}else{
				//if(_x inArea "CSAT_BASE" || _x inArea "CSAT_PIRS")then{	// TEST
					MyAllVehicle pushBack _x;
				//};
			};
		} foreach vehicles;
	
		[] spawn {while {true} do { { _x addCuratorEditableObjects [allUnits, true]; _x addCuratorEditableObjects [vehicles-MyAllVehicle, true]; } forEach allCurators;sleep 10; };};
	};