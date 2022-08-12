	
	/*
		СБРОС ДЕСАНТА
	*/
	
	private _player = _this # 0;
	private _type = _this # 1;

	switch (_type) do {
		case "crew" : {	
			player setVariable ['AirDrop',false,true]; 
			[] spawn {
				_crew = fullCrew [vehicle player, 'cargo']; 
				{
					_unit = _x # 0;
					if (_unit != player && isPlayer _unit && alive _unit) then {
						[_unit,"solo"] remoteExec ["F_fnc_AirDrop"]; 
						sleep 0.5; 
					}; 
				} foreach _crew;
				player setVariable ['AirDrop',true,true]; 
			};
		};
		case "solo" : {
			if(_player getVariable ['isUnconscious',false])exitWith{};
			_player allowDamage false; 
			moveOut _player; 
			waitUntil {(position _player # 2) <= 70}; 
			private _chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "NONE"]; 
			_chute setDir (getDir _player); 
			_player moveInDriver _chute; 
			_player allowDamage true; 
			waitUntil {(position _player # 2) < 1};
			deleteVehicle _chute; 
		};
	};
	
	