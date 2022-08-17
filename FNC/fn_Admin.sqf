
	/*
		АДМИН КОМАНДЫ
		
		сменить погоду убрать туман дождь и прочее
	*/
	
	private _mode   = _this param [0, "", [""]];
	private _params = _this param [1, [], [[]]];
	private _ret = "";
	
	private _Punish = ["AmovPercMstpSnonWnonDnon_exercisePushup","AmovPercMstpSnonWnonDnon_exercisekneeBendA"];
	
	switch (_mode) do {		// _? = _params param [0, 0];
		case "TermGroup" : {	// Почистить группы
			{deletegroup _x} forEach (allgroups select {(count (units _x )) == 0});
			_ret = true;
		};
		case "FreezePlayer" : {	// заморозить
			private _target = _params param [0, objNull];
			if(simulationEnabled _target)then{
				[_target,false] remoteExec ["enableSimulation",_target];
			}else{
				[_target,true] remoteExec ["enableSimulation",_target];
			};
		};
		case "Revive" : {	// оживить
			private _target = _params param [0, objNull];
			["InitSpawn"] remoteExec ["F_fnc_S",_target];
			["SetChannel"] remoteExec ["F_fnc_S",_target];
			[_target, "UnconsciousOutProne"] remoteExec ["playMoveNow"];
			format["Силы ОДКБ оказали мед.помощь %1",name _target] remoteExec ["systemChat"];
		};
		case "Punish" : {	// наказание игроку
			private _target = _params param [0, objNull];
			private _type = _params param [1, 0];
			[_target, _Punish # _type] remoteExec ["playMove"];
		};
		case "PunishAll" : {	// наказание всему плацу
			private _type = _params param [0, 0];
			{
				private _Slot = _x getVariable ["Slot","Rifleman"];
				private _is300 = _x getVariable ["isUnconscious",false];
				if ((_x inArea "CSAT_BASE_PLAC") && !(_Slot in SLOTS_N) && !_is300)then{
					[_x, _Punish # _type] remoteExec ["playMove"];
				};
			}foreach playableUnits - [player];
		};
		case "Mute" : {
			private _target = _params param [0, objNull];
			_target setVariable ["isMute",true,true];
			["TermChannel"] remoteExec ["F_fnc_S",_target];
		};
		case "unMute" : {
			private _target = _params param [0, objNull];
			_target setVariable ["isMute",false,true];
			["SetChannel"] remoteExec ["F_fnc_S",_target];
		};
	};
	
	_ret