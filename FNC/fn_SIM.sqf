
	/*
		ИКОНКИ ИГРОКОВ НА КАРТЕ
	*/
	
	SIM = {
		if !(visibleMap) exitWith{};
		private _shadow = 1;
		private _textSize = 0.04;
		private _textFont = "RobotoCondensed";
		private _textOffset = 'right'; 
		{
			private _unit = vehicle _x;
			if (side(group _x) == playerSide && (_x getVariable["pLvl", -1] >= 0 || isUavConnected _x)) then {
				private _iconType = [_unit] call SIM_Icon;
				private _color = [_x] call SIM_Color;
				private _pos = getPosASL _unit;
				private _iconSize = [_unit] call SIM_Size;
				private _dir = getDir _unit;
				private _text = [_x] call SIM_Text;
				private _pos_lead = position(leader _unit);
				if (_x distance2D player < worldSize && ((!IconMap && _x inArea "CSAT_BASE") || (IconMap))) then {
					(_this # 0) drawIcon[_iconType, _color, _pos, _iconSize, _iconSize, _dir, _text, _shadow, _textSize, _textFont, _textOffset];
					(_this # 0) drawLine[_pos, _pos_lead, _color]; 
				};
			};
		}count(playableUnits + allUnitsUav);
	};
	
	SIM_Icon = {
		private _unit = _this # 0;
		private _Slot = _unit getVariable["Slot", "Rifleman"];
		private _icon = _unit getVariable["icontype", ""];
		
		if (_unit isKindOf "Man") then { if (leader (group _unit) == _unit && !(_Slot in SLOTS_N) && (count units (group _unit) > 1)) then { _icon = "a3\ui_f\data\map\vehicleicons\iconManCommander_ca.paa"; }else{ _icon = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "icon"); }; if (_Slot == "Sniper") then {_icon = "a3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa";}; };
		if (_icon == "") then {_icon = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "icon");};
		
		_unit setVariable["icontype", _icon, true];
		_icon;
	};
	
	SIM_Color = {
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
		
		if (_unit getVariable ["isUnconscious",false] && (_unit getVariable ["isBleeding",false])) then { _color = COLORS # 6; };
		if (_unit getVariable ["isUnconscious",false] && !(_unit getVariable ["isBleeding",false])) then { _color = COLORS # 7; };
		
		if (unitIsUAV _unit) then {_color = [1,1,1,1];};
		
		_color;
	};
	
	SIM_Size = {
		private["_unit", "_size"];_unit = _this # 0;
		if (_unit isKindOf "Man" && leader (group _unit) == _unit) exitWith { _size = 26; _size; };
		if (_unit isKindOf "Man") exitWith { _size = 22; _size; };
		if (_unit isKindOf "LandVehicle") exitWith { _size = 28; _size; };
		if (_unit isKindOf "Air") exitWith { _size = 28; _size; };
		if (_unit isKindOf "Ship") exitWith { _size = 26; _size; };
	};
	
	SIM_Text = {
		private _unit = _this # 0;
		private _text = "";
		
		if((unitIsUAV vehicle _unit) && isPlayer _unit)exitWith{};
		
		if((ctrlMapScale((findDisplay 12) displayCtrl 51)) < 0.08) then {
			private _uName = name _unit;
			private _pLvl = _unit getVariable["pLvl", 0];
			private _pKarma = _unit getVariable["pKarma", 0];
			private _pLvlName = (iLVL # _pLvl # 3);
			
			if(_pKarma > 0) then {_pLvlName = "Штрафник";};
			
			if((ctrlMapScale((findDisplay 12) displayCtrl 51)) < 0.02) then {_text = format["%1 - %2",_pLvlName,_uName];};
			
			if (vehicle _unit != _unit) then {
				private _unit = vehicle _unit;
				_uName = name _unit;
				private _count_crew = (count fullCrew _unit) - 1;
				if !(isNull assignedGunner _unit) then {_uName = name (assignedGunner _unit);}; 
				if !(isNull assignedCommander _unit) then {_uName = name (assignedCommander _unit);}; 
				if !(isNull assignedDriver _unit) then {_uName = name (assignedDriver _unit);};
				if (_count_crew > 0) then {_text = format["%1 + [%2]", _uName, _count_crew];} else {_text = format["%1", _uName];};
			};
			
			
			if (leader (group _unit) == _unit) then {_text = _text + " (" + groupId(group _unit) + ")";};
			
			if (!isPlayer _unit && unitIsUAV _unit) then {
				if (isUavConnected _unit) then {
					private _unit_uav = (UAVControl _unit) # 0;
					_text = format[" БПА - %1", name _unit_uav];
				};
			};
		};
		_text;
	};
	
	disableMapIndicators [true,true,false,true]; 
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "draw";
	[] spawn { sleep 0.1; waitUntil { sleep 0.1;!(isNull(findDisplay 12))}; ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",SIM]; };