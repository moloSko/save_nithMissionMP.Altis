
	/*
		ВСЕ ФУНКЦИИ МЕДИЦИНЫ
	*/
	
	private _mode   = _this param [0, "", [""]];
	private _params = _this param [1, [], [[]]];
	private _ret = "";

	switch (_mode) do {		// _? = _params param [0, 0];
		case "InitMedicine" : {
			player addEventHandler["HandleDamage", {	// 300 и 200
				params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
				
				_damage = _damage / HDAMAGE;
				if((_unit inArea "CSAT_SAFE_ZONE_1" || _unit inArea "CSAT_SAFE_ZONE_2") && SAFEZONE_CSAT)exitWith{_unit setDamage 0;_damage = 0;_damage};
				if(_instigator getVariable ["pLvl",-1] == 0 || _instigator getVariable ["pKarma",0] > 0)exitWith{_unit setDamage 0;_damage = 0;_damage};
				if ((vehicle _unit) != _unit) then {_damage = _damage * 0.1;};
				if ((vehicle _unit) != _unit && !(alive (vehicle _unit))) then {moveOut _unit;_damage = 1;};
				private _totalDamage = _damage + (damage _unit);
				if (_totalDamage >= 0.9) then {_damage = 0;};
				
				if !(_unit getVariable ["isUnconscious", false]) then {
					if (_totalDamage >= 0.9) then {
						_damage = 0;
						
						["DeadPlayer",[_unit,_instigator,0]] call F_fnc_H;
						
						_unit setUnconscious true;
						_unit setCaptive 1;	
						_unit setDamage 0;
						_unit setVariable ["isUnconscious",true,true];
						_unit setVariable ["isBleeding",true,true];
						
						["SetLeader",[_unit]] call F_fnc_S;	// Переключаем на другого лидера
						["TermChannel"] call F_fnc_S;		// Отключение всех каналов кроме прямого
						["Set300",[_unit]] spawn F_fnc_MED;	// Установить состояние 300
						["SetView",[_unit]] call F_fnc_MED;	// Переключить вид
					};	
				} else {	// Убийство
					if (isPlayer _instigator && alive _unit && _selection == "head") then {
						_KHP = _unit getVariable ["KHP",0];
						_KHP = _KHP - 100;
						_unit setVariable ["KHP", _KHP, true];
						if (_KHP <= 0) then {
							_unit setDamage 1;
							["DeadPlayer",[_unit,_instigator,1]] call F_fnc_H;
						};
					};
				};
				_damage;
			}];
		};
		case "Drag": {
			private _medic = _params param [0, objNull];
			private _patient = _params param [1, objNull];
			if(objNull == _medic)exitWith{};if(objNull == _patient)exitWith{};
			
			if !(_patient getVariable ["isUnconscious",false]) exitWith {};

			_patient setVariable ["isDragged", true, true];
			_medic setVariable ["isDrag",true,true];
			
			_patient attachTo [_medic, [0, 1.1, 0.092]];
			[[_patient],{_this # 0 setDir 180;}] remoteExec ["BIS_fnc_spawn"];
			[_medic, "AcinPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow"];
			[_patient, "AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
			
			_relese_id = player addAction [ "<t color='#ff0000'>Отпустить</t>",{_this # 3 setVariable ["isDragged", false, true];player setVariable ["isDrag",false,true];},_patient , 1, false, true, "", ""];
			_drag_temp = true;
			while {_drag_temp} do {
				if (!(_patient getVariable ["IsDragged",false]) || (_medic getVariable ["isUnconscious",false]) || !alive _medic || !alive _patient || (vehicle _medic != _medic)) exitWith {
					[_medic, "AmovPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow"];
					_patient setVariable ["IsDragged",false,true];
					_medic setVariable ["isDrag",false,true];
					detach _patient;
					[_patient, "UnconsciousReviveDefault_A"] remoteExec ["switchMove"];
					[_patient, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
					
					_medic removeAction _relese_id;
					_drag_temp = false;
				};
				sleep 0.3;
			};
		};
		case "Carry" : {
			private _medic = _params param [0, objNull];
			private _patient = _params param [1, objNull];
			if(objNull == _medic)exitWith{};if(objNull == _patient)exitWith{};
			
			if !(_patient getVariable ["isUnconscious",false]) exitWith {};

			_patient setVariable ["isCarryed", true, true];
			_medic setVariable ["isDrag",true,true];
			
			_patient attachTo [_medic, [0.50, 0.50, 0]];
			[_medic, "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon"] remoteExec ["playMoveNow", _medic];
			[_patient, "AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExec ["SwitchMove"];
			[_patient, "AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExec ["playMoveNow"];
			[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["playMove"];
			_patient attachTo [_medic, [0.1, -0.1, -1.25], "RightShoulder"];
			[[_patient],{_this # 0 setDir 0;}] remoteExec ["BIS_fnc_spawn"];
			
			_relese_id = player addAction [ "<t color='#ff0000'>Отпустить</t>",{_this # 3 setVariable ["isCarryed", false, true];player setVariable ["isDrag",false,true];},_patient , 1, false, true, "", ""];
			
			_carry_temp = true;
			while {_carry_temp} do {
				if (!(_patient getVariable ["isCarryed",false]) || (_medic getVariable ["isUnconscious",false]) || !alive _medic || !alive _patient || (vehicle _medic != _medic)) exitWith {
					[_medic, "AmovPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow"];
					_patient setVariable ["isCarryed",false,true];
					_medic setVariable ["isDrag",false,true];
					detach _patient;
					[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["switchMove"];
					[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["playMove"];
					[_patient, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
					_medic removeAction _relese_id;
					_carry_temp = false;
				};
				sleep 0.3;
			};
		};
		case "Load" : {
			private _target = _params param [0, objNull];
			if(objNull == _target)exitWith{};
			
			private _near_veh = nearestObjects [_target, ["Air","LandVehicle"], 5];
			if (count _near_veh > 0) then {
				_target setVariable ["IsDragged",false,true];
				_target setVariable ["isCarryed",false,true];
				[_target, (_near_veh # 0)] remoteExec ["moveInCargo", _target];
			};
			waitUntil {vehicle _target != _target};
			_anim_unit = (((configfile >> 'CfgMovesMaleSdr' >> 'States' >> animationState _target >> 'interpolateTo') call BIS_fnc_getCfgData) # 0);
			sleep 0.3;
			[_target, _anim_unit] remoteExec ["switchMove"];
		};
		case "UnLoad" : {
			private _vehicle = _params param [0, objNull];
			if(objNull == _vehicle)exitWith{};
			
			{
				if (_x getVariable ["isUnconscious",false]) then {
					unAssignVehicle _x;
					moveOut _x;
					sleep 0.3;
					[_x, "UnconsciousReviveDefault_A"] remoteExec ["SwitchMove"];
					[_x, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
				};
			}foreach crew _vehicle;
		};
		case "CanLoad" : {
			private _target = _params param [0, objNull];
			if(objNull == _target)exitWith{};
			
			private _near_veh = nearestObjects [_target, ["Air","LandVehicle"], 5];
			_ret = false;
			if (vehicle _target == _target && (alive _target) && (alive (_near_veh # 0)) && !((_near_veh # 0) in VEH_TP) && _target getVariable ["isUnconscious",false] && count (_near_veh) > 0 && _target distance player < 4) then {
				_crewCount = [typeof (_near_veh # 0),false] call BIS_fnc_crewCount;
				_full_crewCount = [typeof (_near_veh # 0),true] call BIS_fnc_crewCount;
				if ((_full_crewCount - _crewCount) - (count crew (_near_veh # 0)) > 0) then {
					_ret = true;
				};
			};
		};
	
		case "Bandage" : {
			private _medic = _params param [0, objNull];
			private _patient = _params param [1, objNull];
			if(objNull == _medic)exitWith{};if(objNull == _patient)exitWith{};
			
			if (call compile CONDITION_BANDAGE) then {
				_medic removeItem "FirstAidKit";
				_patient setVariable ["isBleeding", false, true];
				["Revive",[_medic,_patient,0]] call F_fnc_H;
			};
		};
		case "Revive" : {
			private _medic = _params param [0, objNull];
			private _patient = _params param [1, objNull];
			if(objNull == _medic)exitWith{};if(objNull == _patient)exitWith{};
			
			if(call compile CONDITION_REVIVE) then {
				private _grpLeader = (group _patient) getVariable ["LeaderGroup",objNull]; 
				if(_grpLeader == _patient)then{ [group _patient, _patient] remoteExec ["selectLeader", groupOwner group _patient]; (group _patient) setVariable ["LeaderGroup",objNull,true]; };

				["InitSpawn"] remoteExec ["F_fnc_S",_patient];
				["SetChannel"] remoteExec ["F_fnc_S",_patient];
				[_patient, "UnconsciousOutProne"] remoteExec ["playMoveNow"];
				if (isPlayer _medic) then {["Revive",[_medic,_patient,1]] call F_fnc_H;
				}else{[_patient,[RadioChannel_ODKB, format["Силы ОДКБ оказали мед.помощь %1",name _patient]]] remoteExec ["customChat"];};
			};
		};
	
		case "SetView" : { private _unit = _params param [0, objNull]; _unit switchCamera "INTERNAL"; };
		case "Set300" : {
			private _unit = _params param [0, objNull];
			if(objNull == _unit)exitWith{};
			
			while {alive _unit && _unit getVariable ["isUnconscious",false]} do {
				
				_msg = "";_msg = "Кровотечение:\n\n";
				
				if (_unit getVariable ["isBleeding",false]) then {
					_Blood = _unit getVariable ["Blood",0];
					_Blood = _Blood - 1;
					_unit setVariable ["Blood", _Blood, true];
					if (_unit getVariable ["Blood",0] <= 0 ) then {
						_unit setDamage 1;
						["DeadPlayer",[_unit,objNull,2]] call F_fnc_H;	// ИСТЕК КРОВЬЮ
					};
					_msg = _msg + format ["%1 cек.",_Blood];
				}else{_msg = _msg + "Остановлено";};

				hintsilent _msg;
				sleep 1;
			};
			hintsilent "";
		};
	};
	
	_ret