
// Функция нажатия кнопки
	fnc_EH_KD = {
		private _key = _this # 1;

		//if((animationState player) in ["amovpercmstpsnonwnondnon_exercisepushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA"])exitWith{true};	// Блокируем
		
		if (_key in (actionKeys "tacticalView"))exitWith{true};	// Блокировка тактического вида
		if (_key in (actionKeys "AutoHover" + actionKeys "AutoHoverCancel") && typeOf (vehicle player) in (VEH_TYPE # 5))exitWith{true};					// Блокировка автозависания
		if (_key in (actionKeys "personView") && (player getVariable ["is300",false] || (!V3D && (isNull getConnectedUAVUnit player))))exitWith{true}; 		// Блокировка 3 вида	
		//if (_key in (actionKeys "toggleRaiseWeapon" + actionKeys "tempRaiseWeapon" + actionKeys "deployWeaponAuto" + [29]) && player getVariable ["isDrag",false])exitWith{true};	// Блокируем опускания бойца когда несешь
		
		
		if(_key == 1)exitWith{	// ESC
			[] spawn {
				waitUntil {!isNull (findDisplay 49)};
				private _resp = true;
				private _esc = true;
				if(player getVariable ["isBlood", false] && player getVariable ["Blood",0] > 800)then{_esc=false;};		// Запрет ESC-Отмена, если истекаешь кровью и не прошло 100 сек.
				if(player getVariable ["pLvl",-1] in [0,1] || player getVariable ["Blood",0] > 800)then{_resp=false;};	// Запрет ESC-Возрождение, если ты рядовой или новобранец или не прошло 100 сек.
				if(player getVariable ["is300",false] && player inArea "CSAT_BASE")then{_esc = true;};					// Разрешено ESC-Отмена и ESC-Возрождение, если на базе трехсотый
				(findDisplay 49)displayCtrl 1010 ctrlEnable _resp;	// Кнопка "Возродиться"
				(findDisplay 49)displayCtrl 104 ctrlEnable _esc;	// Кнопка "Отмена - выход в лобби"
			};
			false
		};
		
		// F1, F2, F3, F4
		if!(p_INGAME)exitWith{false};
		if(player getVariable ["is300",false])exitWith{false};
		if(_key == 59)exitWith{if(soundVolume == 1)then{1 fadeSound 0.1;}else{1 fadeSound 1;};true};
		if(_key == 60)exitWith{player action ["SWITCHWEAPON",player,player,-1];true};
		if(_key == 61)exitWith{if(!isNull (findDisplay 56000))exitWith{false};[] spawn F3Menu_fnc_OpenMenu;true};

		//case 62: { if (!(player getVariable ["MRKSET",false]) && (player getVariable ["pLvl",-1] >= BASE_LVL) && ({(player inArea _x)}count CSAT_Z_BASE <= 0)) exitWith { private _pID = getPlayerID player; private _cnt = player getVariable ["MRKCNT",0]; private _name = format["_USER_DEFINED #%1/%2u/1",_pID,_cnt]; private _marker = createMarker [_name, player,1,player]; _marker setMarkerType "hd_dot"; _cnt = _cnt + 1; player setVariable ["MRKCNT",_cnt]; player setVariable ["MRKSET",true]; [] spawn { uiSleep TIME_MRK; player setVariable ["MRKSET",false]; }; }; };
		false
	};

// Функция отпускания кнопки	
	fnc_EH_KU = {
		private _key = _this # 1;
		if(_key == 61)exitWith{if(isNull (findDisplay 56000)) exitWith {false}; [] call F3Menu_fnc_OpenMenu;true};
		false
	};

// Фунцкия меню-действий (колесико)	
	fnc_EH_UI = {
		if((_this # 3 == "AutoHover") && (typeOf (vehicle player) in (VEH_TYPE # 5)))exitWith{true};	// Блокируем автозависание
		if((_this # 3 == "UserType") && !(vehicle player isKindOf "Man") && (assignedDriver (vehicle player) != player))exitWith{true};	// Блокируем открывания рампы в вертолетах
		if((_this # 3 == "Land") && (typeOf (vehicle player) in (VEH_TYPE # 6)))exitWith{true};			// Блокировка автопосадки
		if(player getVariable ["pLvl",-1] <= 0)exitWith{
			if((_this # 3 == "GetInPilot"))exitWith{systemChat "Новобранцам не доступно место водителя!";true};			// Блокируем посадку за пилота
			if((_this # 3 == "GetInDriver"))exitWith{systemChat "Новобранцам не доступно место водителя!";true};		// Блокируем посадку за водителя
			if((_this # 3 == "MoveToDriver"))exitWith{systemChat "Новобранцам не доступно место водителя!";true};		// Блокируем пересадку за водителя
		};
		if((_this # 3 == "TakeVehicleControl") && (!(1 in (player getVariable ["pCYP",[0,0,0,0]]) || player getVariable ["Slot","Rifleman"] != "CYP")))exitWith{systemChat "У вас не допуска";true};	// Блокируем взятие "Управления" на втором пилоте
		false
	};

// Функция метки над головами
	fnc_EH_SIM3D = {
		if(player getVariable ["is300",false])exitWith{};	// Если ты 300, то не видишь ники
		private _clr = [0,1,0,1];
		
		{
			player reveal (vehicle _x);
			if (_x getVariable ["is300",false]) then {
				if ((_x distance player) < 200 && ("OPF" in (faction _x))) then {
					if (_x getVariable ["isBlood",false]) then { _clr = COLORS # 6; } else { _clr = COLORS # 7; };
					drawIcon3D [MD_IMG # 0,_clr,_x,1,1,0,format["%1 ( %2 м. )", name _x, floor (player distance _x)],1,0.04];
				};
			};
		}count playableUnits - [player];

		private _x = cursorTarget;
		if(isPlayer _x)then{
			if (!(_x getVariable ["is300",false]) && (("OPF" in (faction _x))) && alive _x && _x != player)then{
				_clr = [0,1,0,1];
				if(_x isKindOf "Man")then{
					private _plac = ((player inArea "CSAT_PLAC" && _x inArea "CSAT_PLAC" && (player distance _x < 30)) || (player distance _x < 10));
					if (_plac && _x getVariable["pLvl", -1] >= 0 && vehicle _x == _x)then{
						private _pos = _x modelToWorld (_x selectionPosition "camera");
						private _Slot = _x getVariable ["Slot","Rifleman"];
						private _pLvl = _x getVariable["pLvl", -1];
						//private _pKarma = _x getVariable["pKarma", 0];
						//private _pPanels = _x getVariable "pPanels";
						//private _pTitle = _x getVariable ["pTitle",0];
						private _pLvlName = (iLVL # _pLvl # 0);
						private _uName = name _x;
						private _text = format ["%1 %2",_pLvlName,_uName];
						drawIcon3D [ '', _clr, _pos, 0, 0, getdir player, _text, 2, 0.04, 'EtelkaMonospaceProBold'];
					};
				}else{
					if(player distance _x < 20)then{
						private _uName = name _x;
						private _text = "";
						private _pos = position _x;
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2) + 1];
						
						if(!isNull (driver _x) || !isNull (commander _x) || !isNull (gunner _x))then{
							_uName = "";
							if (isNull (driver _x) && isNull (commander _x) && _uName == "")then{_uName = name (gunner _x);};
							if (!isNull (commander _x) && _uName == "") then {_uName = name (commander _x);}; 
							if (!isNull (driver _x) && _uName == "") then {_uName = name (driver _x);}; 
						};
						if(_uName != "")then{
							private _count_crew = (count fullCrew _x) - 1;
							if (_count_crew > 0) then {_text = format["%1 + [%2]", _uName, _count_crew];} else {_text = format["%1", _uName];};
						}else{
							_text = "";
						};
						
						drawIcon3D [ '', _clr, _pos, 0, 0, getdir player, _text, 2, 0.04, 'EtelkaMonospaceProBold'];
					};
				};
			};
		};
	};

// Блок функций метки на карте
	fnc_EH_SIM = {
		{
			if (_x distance2D player < 30000) then {
				if ("OPF" in (faction player) && (_x getVariable["pLvl", -1] >= 0 || isUavConnected _x)) then {
					private _iconType = [vehicle _x] call fnc_SIM_Icon;
					private _color = [_x] call fnc_SIM_Color;
					private _pos = getPosWorld (vehicle _x);
					private _iconSize = [vehicle _x] call fnc_SIM_Size;
					private _dir = getDirVisual (vehicle _x);
					private _text = [_x] call fnc_SIM_Text;
					private _pos_lead = getPosWorld (leader (vehicle _x));
					//if ((!IconMap && ((vehicle _x) inArea "CSAT_BASE" || (vehicle _x) inArea "CSAT_PIRS")) || (IconMap)) then {
						(_this # 0) drawIcon[_iconType, _color, _pos, _iconSize, _iconSize, _dir, _text, 1, 0.04, "RobotoCondensed", "right"];
						(_this # 0) drawLine[_pos, _pos_lead, _color]; 
					//};
				};
			};
		}count(playableUnits + allUnitsUav);
	};
	fnc_SIM_Icon = {
		private _unit = _this # 0;
		private _Slot = _unit getVariable["Slot", "Rifleman"];
		private _icon = "";
		
		if (_unit isKindOf "Man")then{ 
			if (leader (group _unit) == _unit && !(_Slot in SLOTS_N) && (count units (group _unit) > 1)) then { 
				_icon = "a3\ui_f\data\map\vehicleicons\iconManCommander_ca.paa"; 
			};
			if (_Slot == "Sniper")then{_icon = "a3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa";}; 
		};
		if (_icon == "")then{_icon = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "icon");};
		
		_icon;
	};
	fnc_SIM_Color = {
		forceUnicode 0;
		private _unit = _this # 0;
		private _groupP = group _unit;
		private _color = _groupP getVariable ["groupColor", []];
		if (_color isEqualTo []) then {
			_color = [[0.3, 0.7] call BIS_fnc_randomNum, [0.3, 0.7] call BIS_fnc_randomNum, [0.3, 0.7] call BIS_fnc_randomNum, 1];
			_groupP setVariable ["groupColor", _color, true];
		};
		
		if (groupId _groupP regexFind ["ШТАБ"] isNotEqualTo []) then { _color = COLORS # 2; };
		if (groupId _groupP regexFind ["ЦУП"] isNotEqualTo []) then { _color = COLORS # 3; };
		if (groupId _groupP regexFind ["БТВ"] isNotEqualTo []) then { _color = COLORS # 4; };
		if (groupId _groupP regexFind ["КМБ"] isNotEqualTo [] || groupId _groupP regexFind ["Курс"] isNotEqualTo []) then { _color = COLORS # 8; };
		
		if (_unit getVariable ["is300",false] && (_unit getVariable ["isBlood",false])) then { _color = COLORS # 6; };
		if (_unit getVariable ["is300",false] && !(_unit getVariable ["isBlood",false])) then { _color = COLORS # 7; };
		
		if (unitIsUAV _unit) then {_color = [1,1,1,1];};
		
		_color;
	};
	fnc_SIM_Size = {
		private["_unit", "_size"];_unit = _this # 0;
		if (_unit isKindOf "Man" && leader (group _unit) == _unit) exitWith { _size = 26; _size; };
		if (_unit isKindOf "Man") exitWith { _size = 22; _size; };
		if (_unit isKindOf "LandVehicle") exitWith { _size = 28; _size; };
		if (_unit isKindOf "Air") exitWith { _size = 28; _size; };
		if (_unit isKindOf "Ship") exitWith { _size = 26; _size; };
	};
	fnc_SIM_Text = {
		private _unit = _this # 0;
		private _text = "";
		
		if((unitIsUAV vehicle _unit) && isPlayer _unit)exitWith{_text};
		
		if((ctrlMapScale((findDisplay 12) displayCtrl 51)) < 0.08) then {
			private _uName = name _unit;
			private _pLvl = _unit getVariable["pLvl", 0];
			private _pKarma = _unit getVariable["pKarma", 0];
			private _pLvlName = (iLVL # _pLvl # 2);
			
			if(_pKarma > 0) then {_pLvlName = "Штрафник";};
			
			if((ctrlMapScale((findDisplay 12) displayCtrl 51)) < 0.02) then {_text = format["%1 - %2",_pLvlName,_uName];};
			
			if (leader (group _unit) == _unit) then {_text = _text + " (" + groupId(group _unit) + ")";};
			
			if (vehicle _unit != _unit) then {
				private _unitV = vehicle _unit;
				_uName = name _unitV;
			
				if(!isNull (driver _unitV) || !isNull (commander _unitV) || !isNull (gunner _unitV))then{
					_uName = "";
					if (gunner _unitV == _unit && isNull (driver _unitV) && isNull (commander _unitV))then{_uName = name (gunner _unitV);};
					if (commander _unitV == _unit && isNull (driver _unitV)) then {_uName = name (commander _unitV);}; 
					if (driver _unitV == _unit) then {_uName = name (driver _unitV);}; 
				};
				if(_uName != "")then{
					private _count_crew = (count fullCrew _unitV) - 1;
					if (_count_crew > 0) then {_text = format["%1 + [%2]", _uName, _count_crew];} else {_text = format["%1", _uName];};
				}else{
					_text = "";
				};
			};
			
			
			
			if (!isPlayer _unit && unitIsUAV _unit) then {
				if (isUavConnected _unit) then {
					private _unit_uav = (UAVControl _unit) # 0;
					_text = format[" БПА - %1", name _unit_uav];
				};
			};
		};
		_text;
	};

// Блок функций урона по игроку (медицина)
	fnc_EH_Damage = {
		private _damage = (_this # 2) / HDAMAGE;
		private _killer = _this # 6;
		
		if((vehicle player) != player && !(alive (vehicle player)))then{moveOut player;};							// Если техника взорвалась - выкидываем
		if(({((vehicle player) inArea _x)}count CSAT_Z_SZ > 0))then{_damage = 0;};								// Нельзя нанести урон в Сейф-Зоне
		if(_killer getVariable ["pLvl",-1] in [0,1] || _killer getVariable ["pKarma",0] > 0)then{_damage = 0;};	// Новобранцы, рядовые, штрафники не могут наносить урон
				
		if(_damage > 0)then{
			if !(player getVariable ["is300", false]) then {	// Если не 300
				private _tDamage = _damage + (damage player);
				if(_tDamage > 0.9)then{	// усе, 300
					_tDamage = 0;
					
					[] call fnc_EH_Set300;			// Установить состояние 300
				};
				player setDamage _tDamage;
			}else{
				private _select = _this # 1;
				if (isPlayer _killer && alive player && _select == "head")then{	// Если игрок, стреляет в голову трехсотого
					private _KHP = player getVariable ["KHP",0];
					_KHP = _KHP - 100;
					player setVariable ["KHP", _KHP];
					if (_KHP <= 0)then{
						player setDamage 1;	// Убит 200
						//["DeadPlayer",[_unit,_instigator,1]] call F_fnc_H;
					};
				};
			};
		};	
		false
	};
	fnc_EH_Set300 = {
		//[0, 0.4, false,true] call BIS_fnc_cinemaBorder;
		
		if(player getVariable ["is300",false])exitWith{false};

		player setUnconscious true;					// Состояние 300 (RegDoll)
		player setCaptive 1;						// "Заложник", чтобы боты не стреляли
		player setVariable ["is300",true,true];	 	// Состояние 300
		player setVariable ["isBlood",true,true]; 	// Кровотечение 

		player switchCamera "INTERNAL";				// Переключаем вид от 1 лица
		for "_i" from 0 to 15 do { _i enableChannel false; };5 enableChannel true; setCurrentChannel 5;	// Отключаем все каналы кроме прямого
		player connectTerminalToUAV objNull;		// Отключаем от БПА
		
		// Переключить на другого лидера

		// Убираем кнопки (на всякий случай)
		private _resp = true;
		private _esc = true;
		if(player getVariable ["isBlood", false] && player getVariable ["Blood",0] > 800)then{_esc=false;};		// Запрет ESC-Отмена, если истекаешь кровью и не прошло 100 сек.
		if(player getVariable ["pLvl",-1] in [0,1] || player getVariable ["Blood",0] > 800)then{_resp=false;};	// Запрет ESC-Возрождение, если ты рядовой или новобранец или не прошло 100 сек.
		if(player getVariable ["is300",false] && player inArea "CSAT_BASE")then{_esc = true;};					// Разрешено ESC-Отмена и ESC-Возрождение, если на базе трехсотый
		(findDisplay 49)displayCtrl 1010 ctrlEnable _resp;	// Кнопка "Возродиться"
		(findDisplay 49)displayCtrl 104 ctrlEnable _esc;	// Кнопка "Отмена - выход в лобби"

		[] spawn {
			while {alive player && player getVariable ["is300", false]} do {
				private _msg = "";_msg = "Кровотечение:\n\n";
					
				if (player getVariable ["isBlood",false]) then {
					private _Blood = player getVariable ["Blood",0];
					_Blood = _Blood - 1;
					player setVariable ["Blood", _Blood];
					if (_Blood <= 0 ) then {
						player setDamage 1;	// Убит 200
						break;
						//["DeadPlayer",[_unit,objNull,2]] call F_fnc_H;	// ИСТЕК КРОВЬЮ
					};
					_msg = _msg + format ["%1 cек.",_Blood];
				}else{_msg = _msg + "Остановлено";};

				hintsilent _msg;
				sleep 1;

			};
			hintsilent "";
			//if()[1, 1, false] call BIS_fnc_cinemaBorder;

			player setUnconscious false;					// Состояние 300 (RegDoll)
			player setCaptive 0;							// "Заложник", чтобы боты не стреляли
			player setVariable ["is300",false,true];	 	// Состояние 300
			player setVariable ["isBlood",false,true];		// Кровотечение 
			player setVariable ["Blood", 900]; 
			player setVariable ["KHP", 1000]; 

			// Включаем каналы
			{ _x enableChannel true; } forEach CHAN_START;
			if(player getVariable ["pLvl",-1] >= 3)then{1 enableChannel [true,true];
			}else{1 enableChannel [true,false];};
		};
		true
	};

// Функция стрельбы
	fnc_EH_Fired = {
		if (({((vehicle player) inArea _x)}count CSAT_Z_SZ > 0))then{deleteVehicle (_this # 6);};	// Запрет стрельбы в СЗ
		if (_this # 4 == "DemoCharge_Remote_Ammo")then{ [_this # 0] call C4_Attach;};				// Закладка С4 туда куда смотришь
		false
	};
	// Ставка с4 куда смотришь
	C4_Attach = { _unit = _this select 0;if (alive _unit) then { _ins = lineIntersectsSurfaces [ AGLToASL positionCameraToWorld [0,0,0], AGLToASL positionCameraToWorld [0,0,3], _unit ]; if (count _ins > 0) then { _obj = _ins select 0 select 2; _objPos = _ins select 0 select 0; _objVectorUp = _ins select 0 select 1; if !(_obj isKindOf "Man") then { _explosive = nearestObject [_unit, "DemoCharge_Remote_Ammo"];_explosive setPosASL _objPos;_explosive setVectorUp _objVectorUp; _newPos = _obj worldToModel (position _explosive); [_explosive, _obj, _newPos, _objVectorUp] remoteExec ["TB_fnc_attachMP", 0, TRUE];_unit setVariable ["charges",(_unit getVariable ["charges",[]]) + [_explosive]]; }; }; }; };

// Арсенал
	fnc_EH_OA = {
		disableSerialization; private _display = _this # 0; _display displayAddEventHandler ["KeyDown", "if ((_this # 1) in [19,24,29,31,46,47]) then {true}"]; {( _display displayCtrl _x ) ctrlSetText ""; ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick"; ( _display displayCtrl _x ) ctrlSetTooltip ""; } forEach [44150, 44148, 44149];
		false
	};
	fnc_EH_CA = {
		["AmmoboxExit", player] call BIS_fnc_arsenal;["AmmoboxExit", CSAT_ARSENAL] call BIS_fnc_arsenal;
		// Проверка снаряжения
		private _Slot = player getVariable ["Slot","Rifleman"];	
		#include "..\i\CSAT.sqf"
		switch (_Slot) do {
			case "Gunner1" : { 
				#include "..\i\CSAT_Gunner1.sqf"
			};
			case "AT_AA" : { 
				#include "..\i\CSAT_AT_AA.sqf"
			};
			case "Marksman" : { 
				#include "..\i\CSAT_Marksman.sqf"
			};
			case "Medic" : { 
				#include "..\i\CSAT_Medic.sqf"
			};
			case "Engineer" : { 
				#include "..\i\CSAT_Engineer.sqf"
			};
			case "Sniper" : { 
				#include "..\i\CSAT_Sniper.sqf"
			};
			case "CYP" : { 
				#include "..\i\CSAT_CYP.sqf"
			};
			case "BTV" : { 
				#include "..\i\CSAT_BTV.sqf"
			};
		};
		_uni = format["%1", toLower(uniform player)]; if (_uni != "") then { _uniform = _uniform apply { toLower _x }; if !(_uni in _uniform) then { removeUniform player; }; }; _ve = format["%1", toLower(vest player)]; if (_ve != "") then { _vest = _vest apply { toLower _x }; if !(_ve in _vest) then { removeVest player; }; }; _back = format["%1", toLower(backpack player)]; if (_back != "" && _back != "b_parachute") then { _backpack = _backpack apply { toLower _x }; if !(_back in _backpack) then { removeBackpack player; }; }; _head = format["%1", toLower(headgear player)]; if (_head != "") then { _headgear = _headgear apply { toLower _x }; if !(_head in _headgear) then { removeHeadgear player; }; }; _pWeapon = format["%1", toLower(primaryWeapon player)]; if (_pWeapon != "") then { _primaryWeapon = _primaryWeapon apply { toLower _x }; if !(_pWeapon in _primaryWeapon) then { player removeWeapon(primaryWeapon player); }; }; _sWeapon = format["%1", toLower(secondaryWeapon player)]; if (_sWeapon != "") then { _secondaryWeapon = _secondaryWeapon apply { toLower _x }; if !(_sWeapon in _secondaryWeapon) then { player removeWeapon(secondaryWeapon player); }; }; _hWeapon = format["%1", toLower(handgunWeapon player)]; if (_hWeapon != "") then { _handgunWeapon = _handgunWeapon apply { toLower _x }; if !(_hWeapon in _handgunWeapon) then { player removeWeapon(handgunWeapon player); }; }; _attachments = primaryWeaponItems player; _silenser = format["%1", toLower(_attachments select 0)]; if (_silenser != '') then { _muzzles = _muzzles apply {toLower _x}; if !(_silenser in _muzzles) then { player removePrimaryWeaponItem(_attachments select 0); }; }; _laserpointer = format["%1", toLower(_attachments select 1)]; if (_laserpointer != '') then { _pointers = _pointers apply { toLower _x}; if !(_laserpointer in _pointers) then { player removePrimaryWeaponItem(_attachments select 1); }; }; _optic = format["%1", toLower(_attachments select 2)]; if (_optic != '') then { _optics = _optics apply { toLower _x}; if !(_optic in _optics) then { player removePrimaryWeaponItem(_attachments select 2); }; }; _bipod = format["%1", toLower(_attachments select 3)]; if (_bipod != '') then { _bipods = _bipods apply {toLower _x}; if !(_bipod in _bipods) then { player removePrimaryWeaponItem(_attachments select 3); }; }; _goggles = format["%1", toLower(goggles player)]; if (_goggles != "") then { _googles = _googles apply {toLower _x}; if !(_goggles in _googles) then { removeGoggles player; }; }; _assignedItems = assignedItems player; _items = _items apply { toLower _x}; { _currentItem = _x; if !((toLower _currentItem) in _items) then { player unassignItem _currentItem; player unlinkItem _currentItem; player removeItem _currentItem;  }; } forEach _assignedItems;
		false
	};

// Блок функций медицины
	fnc_MED_REVIVE = {
		private _medic = player;
		private _patient = _this # 0;
		if(_medic isEqualTo objNull)exitWith{false};if(_patient isEqualTo objNull)exitWith{false};if(_medic == _patient)exitWith{false};
		
		if(call compile COND_REVIVE) then {
			_patient setVariable ["is300", false, true]; 

			if (isPlayer _medic) then {
				//["Revive",[_medic,_patient,1]] call F_fnc_H;
			};
		};
		true
	};
	fnc_MED_BANDAGE = {
		private _medic = player;
		private _patient = _this # 0;
		if(_medic isEqualTo objNull)exitWith{false};if(_patient isEqualTo objNull)exitWith{false};if(_medic == _patient)exitWith{false};
		
		if (call compile COND_BANDAGE)then{
			_medic removeItem "FirstAidKit";
			_patient setVariable ["isBlood", false, true];
			//["Revive",[_medic,_patient,0]] call F_fnc_H;
		};
		true
	};

// Кол-во %
	fnc_GetPrc = {
		private _player = _this # 0;
		if!(isPlayer _player)exitWith{}; 
		private _pLvl = _player getVariable ["pLvl",-1]; 
		private _pExp = _player getVariable ["pExp",0]; 
		if(_pLvl <= 0)exitWith{ 0 }; 
		if(_pLvl == 20)exitWith{ 100 }; 
		private _NeedExp = iLVL # (_pLvl + 1) # 1; 
		floor (_pExp / _NeedExp * 100);
	};



/*
fnc_EH_SIM3D = {
		if(player getVariable ["is300",false])exitWith{};	// Если ты 300, то не видишь ники
		private _clr = [0,1,0,1];
		
		{
			player reveal (vehicle _x);
			if (_x getVariable ["is300",false]) then {
				if ((_x distance player) < 200 && group player == group _x && ("OPF" in (faction _x))) then {
					if (_x getVariable ["isBlood",false]) then { _clr = COLORS # 6; } else { _clr = COLORS # 7; };
					drawIcon3D [MD_IMG # 0,_clr,_x,1,1,0,format["%1 ( %2 м. )", name _x, floor (player distance _x)],1,0.04];
				};
			};
		}count playableUnits - [player];

		private _x = cursorTarget;
		if(isPlayer _x)then{
			if (!(_x getVariable ["is300",false]) && (("OPF" in (faction _x))) && alive _x && _x != player)then{
				_clr = [0,1,0,1];
				if(_x isKindOf "Man")then{
					private _plac = ((player inArea "CSAT_PLAC" && _x inArea "CSAT_PLAC" && (player distance _x < 30)) || (player distance _x < 10));
					if (_plac && _x getVariable["pLvl", -1] >= 0 && vehicle _x == _x)then{
						private _pos = _x modelToWorld (_x selectionPosition "camera");
						private _Slot = _x getVariable ["Slot","Rifleman"];
						private _pLvl = _x getVariable["pLvl", -1];
						//private _pKarma = _x getVariable["pKarma", 0];
						//private _pPanels = _x getVariable "pPanels";
						//private _pTitle = _x getVariable ["pTitle",0];
						private _pLvlName = (iLVL # _pLvl # 0);
						private _uName = name _x;
						private _text = format ["%1 %2",_pLvlName,_uName];
						drawIcon3D [ '', _clr, _pos, 0, 0, getdir player, _text, 2, 0.04, 'EtelkaMonospaceProBold'];
					};
				}else{
					if(player distance _x < 20)then{
						private _uName = name _x;
						private _text = "";
						private _pos = position _x;
						_pos set [2, ((_x modelToWorld [0,0,0]) select 2) + 1];
						
						if(!isNull (driver _x) || !isNull (commander _x) || !isNull (gunner _x))then{
							_uName = "";
							if (isNull (driver _x) && isNull (commander _x) && _uName == "")then{_uName = name (gunner _x);};
							if (!isNull (commander _x) && _uName == "") then {_uName = name (commander _x);}; 
							if (!isNull (driver _x) && _uName == "") then {_uName = name (driver _x);}; 
						};
						if(_uName != "")then{
							private _count_crew = (count fullCrew _x) - 1;
							if (_count_crew > 0) then {_text = format["%1 + [%2]", _uName, _count_crew];} else {_text = format["%1", _uName];};
						}else{
							_text = "";
						};
						
						drawIcon3D [ '', _clr, _pos, 0, 0, getdir player, _text, 2, 0.04, 'EtelkaMonospaceProBold'];
					};
				};
			};
		};
	};




	fnc_EH_SIM = {
		{
			if (_x distance2D player < 30000) then {
				if ("OPF" in (faction player) && group player == group _x && (_x getVariable["pLvl", -1] >= 0 || isUavConnected _x)) then {
					private _iconType = [vehicle _x] call fnc_SIM_Icon;
					private _color = [_x] call fnc_SIM_Color;
					private _pos = getPosWorld (vehicle _x);
					private _iconSize = [vehicle _x] call fnc_SIM_Size;
					private _dir = getDirVisual (vehicle _x);
					private _text = [_x] call fnc_SIM_Text;
					private _pos_lead = getPosWorld (leader (vehicle _x));
					//if ((!IconMap && ((vehicle _x) inArea "CSAT_BASE" || (vehicle _x) inArea "CSAT_PIRS")) || (IconMap)) then {
						(_this # 0) drawIcon[_iconType, _color, _pos, _iconSize, _iconSize, _dir, _text, 1, 0.04, "RobotoCondensed", "right"];
						(_this # 0) drawLine[_pos, _pos_lead, _color]; 
					//};
				};
			};
		}count(playableUnits + allUnitsUav);
	};

	fnc_SIM_Color = {
		forceUnicode 0;
		private _unit = _this # 0;
		private _groupP = group _unit;
		private _color = _groupP getVariable ["groupColor", []];
		if (_color isEqualTo []) then {
			_color = [[0.3, 0.7] call BIS_fnc_randomNum, [0.3, 0.7] call BIS_fnc_randomNum, [0.3, 0.7] call BIS_fnc_randomNum, 1];
			_groupP setVariable ["groupColor", _color, true];
		};
		
		if (groupId _groupP regexFind ["ЗЕЛ"] isNotEqualTo []) then { _color = COLORS # 4; };
		if (groupId _groupP regexFind ["СИН"] isNotEqualTo []) then { _color = COLORS # 8; };
		
		if (_unit getVariable ["is300",false] && (_unit getVariable ["isBlood",false])) then { _color = COLORS # 6; };
		if (_unit getVariable ["is300",false] && !(_unit getVariable ["isBlood",false])) then { _color = COLORS # 7; };
		
		if (unitIsUAV _unit) then {_color = [1,1,1,1];};
		
		_color;
	};
	publicVariable "fnc_SIM_Color";

	publicVariable "fnc_EH_SIM";
	publicVariable "fnc_EH_SIM3D";

	disableMapIndicators [true,true,false,true]; 
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "Draw";
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_EH_SIM]; 

	*/