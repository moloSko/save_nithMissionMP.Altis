//params ["_triggerOnMap", "_randomTrigger", "_randomTriggerParams", "_randomTriggerPosition", "_markerOnMap", "_triggers", "_onTrigger", "_explosionsCount"];
_triggerOnMap = trgParams # 0;
_randomTrigger = trgParams # 1;
_randomTriggerParams = trgParams # 2;
_randomTriggerPosition = trgParams # 3;
_markerOnMap = trgParams # 4;
_triggers = trgParams # 5;
_onTrigger = trgParams # 6;
_explosionsCount = trgParams # 7;

[ _triggerOnMap, [_randomTrigger # 0, _randomTrigger # 1, _randomTriggerParams # 2], _randomTriggerPosition ] spawn trg_fnc_reinfSpawn;
		if (_explosionsCount == 1) then
		{	
			sleep 30;
			if (( count (( units BLUFOR ) inAreaArray _triggerOnMap )) < 5 ) then 
			{
				_markerOnMap setMarkerShape "ELLIPSE";      // Задаём форму маркера
				_markerOnMap setMarkerSize [_randomTriggerParams # 0, _randomTriggerParams # 1];       // Задаём размеры маркера
				_markerOnMap setMarkerDir _randomTriggerParams # 2;    // Задаём угол поворота маркера
				_markerOnMap setMarkerColor "ColorGreen";	// Задаем зеленый цвет
				_triggers deleteAt (_triggers find _randomTrigger);
				[ _randomTriggerPosition ] spawn trg_fnc_endMission;
			}
			else 
			{
				_markerOnMap setMarkerShape "ELLIPSE";      // Задаём форму маркера
				_markerOnMap setMarkerSize [_randomTriggerParams # 0, _randomTriggerParams # 1];       // Задаём размеры маркера
				_markerOnMap setMarkerDir _randomTriggerParams # 2;    // Задаём угол поворота маркера

				while { _onTrigger == 1 } do 
				{
					sleep 5;
					if (( count (( units BLUFOR ) inAreaArray _triggerOnMap )) < 5 ) then 
					{
						_markerOnMap setMarkerColor "ColorGreen";
						_triggers deleteAt (_triggers find _randomTrigger);
						[] spawn trg_fnc_endMission;
						break;
					};
				};
			};
		} else {trgParams set [7, _explosionsCount + 1]};