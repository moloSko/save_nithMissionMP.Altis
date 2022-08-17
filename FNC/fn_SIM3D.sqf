	
	/*
		НИКИ НАД ГОЛОВАМИ ИГРОКОВ
	*/


	addMissionEventHandler ["Draw3D", {
		if(player getVariable ["isUnconscious",false])exitWith{};	// Если ты 300, то не видишь во круг ники
		{
			player reveal (vehicle _x);
			if !(_x getVariable ["isUnconscious",false]) then {
				if (alive cursorTarget && (cursorTarget == vehicle _x) && (player distance _x < 10) && (side (group _x) == playerSide) && _x getVariable["pLvl", -1] >= 0 && isPlayer _x) then {
					private _clr = [0,1,0,1];
					private _clr1 = [0,1,0,1];
					private _pos = vehicle _x modelToWorld (vehicle _x selectionPosition "camera");
					
					private _Slot = _x getVariable ["Slot","Rifleman"];
					private _pLvl = _x getVariable["pLvl", -1];
					private _pKarma = _x getVariable["pKarma", 0];
					private _pPanels = _x getVariable "pPanels";
					private _pTitle = _x getVariable ["pTitle",""];
					
					if(_Slot == "CYP") then {_pTitle = "Пилот";_clr1=COLORS # 3;};		// TEST
					if(_Slot == "BTV") then {_pTitle = "Танкист";_clr1=COLORS # 4;};	// TEST
					if((_pPanels # 0 # 0) == 1) then {_pTitle = "Главком ВС РФ";_clr1=[1,0.8,0,1];};		// TEST
					if(_pKarma > 0) then {_pTitle = "Штрафник";_clr1=COLORS # 9;};
					
					if(_Slot == "NLS") then {_pTitle = "Начальник личного состава";_clr1=[1,1,1,1];};	// TEST
					if(_Slot == "NCYP") then {_pTitle = "Начальник центрального управления полетов";_clr1=[1,1,1,1];};	// TEST
					if(_Slot == "NBTV") then {_pTitle = "Начальник Бронетанкового взвода";_clr1=[1,1,1,1];};	// TEST
					if(_Slot == "NSH") then {_pTitle = "Начальник штаба";_clr1=[1,1,1,1];};	// TEST
					
					if(getPlayerUID _x == "76561199193215585")then{_pTitle="-= Лт. Джеймс =-";_clr1=[0,1,0,1];};
					
					if((groupId (group _x) regexFind ["КМБ"] isNotEqualTo []) && (_pPanels # 2 # 3) == 1) then {_pTitle = "КМБ инструктор";_clr1=COLORS # 8;};	// TEST
					if((groupId (group _x) regexFind ["Курс"] isNotEqualTo []) && 1 in (_pPanels # 2)) then {_pTitle = "Инструктор";_clr1=COLORS # 8;};	// TEST
					
					if(_pLvl == 0) then {_pTitle = (iLVL # _pLvl # 3);};
					
					private _pLvlName = (iLVL # _pLvl # 1);
					private _uName = name _x;
					
					private _text = format ["%1 %2",_pLvlName,_uName];
					
					if (vehicle _x != _x && !(unitIsUAV vehicle _x)) then {
						private _unit = vehicle _x;
						_uName = name _unit;
						_pos = position (_unit);
						_pos set [2, (((_unit) modelToWorld [0,0,0]) select 2) + 1];
						private _count_crew = (count fullCrew _unit) - 1;
						if !(isNull assignedGunner _x) then {_uName = name (assignedGunner _x);};
						if !(isNull assignedCommander _x) then {_uName = name (assignedCommander _x);};
						if !(isNull assignedDriver _x) then {_uName = name (assignedDriver _x);};
						if (_count_crew > 0) then {_text = format["%1 + [%2]", _uName, _count_crew];} else {_text = format["%1", _uName];};
					};
					
					drawIcon3D [ '', _clr, _pos, 0, 0, getdir player, _text, 2, 0.04, 'EtelkaMonospaceProBold' ];
					if(_pTitle != "" && vehicle _x == _x) then {drawIcon3D [ '', _clr1, _pos, 0, 0, getdir player, _pTitle, 2, 0.03, 'EtelkaMonospaceProBold','center',false,0,-0.02 ];};
				};
			}else{
				if ((_x distance player) < MD_RAD_VIEW && (side (group _x) == playerSide)) then {
					private _clr = [1,1,1,1];
					if (_x getVariable ["isBleeding",false]) then { _clr = COLORS # 6; } else { _clr = COLORS # 7; };
					drawIcon3D [MD_IMG # 0,_clr,_x,1,1,0,format["%1 ( %2 м. )", name _x, floor (player distance _x)],1,0.04];
				};
			};
		}count playableUnits - [player];
	}];
