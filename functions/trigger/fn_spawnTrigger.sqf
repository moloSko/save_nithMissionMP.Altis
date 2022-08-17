
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

if (isServer) then
{
	if (count triggers == 45 ) then 
	{
		sleep 1;
	};

	if (count triggers == 0) then 
	{
		return;
	};

	_randomTrigger = [];
	_triggerClass = 0;
	while { true } do 
	{
		_randomTrigger = selectRandom triggers;     // Выбираем рандомный триггер
		_triggerClass = _randomTrigger # 3;		// Класс триггера
		if ((playersNumber east >= 10) && (playersNumber east < 15) && ( _triggerClass == 1 || _triggerClass == 0 )  ) then 
		{
			break;
		}
		else 
		{
			if ((playersNumber east >= 15) ) then 
			{
				break;
			}
			else 
			{
				if (((playersNumber east) < 10) && _triggerClass == 0 ) then 
				{ 
					break; 
				};
			};
		};
	};
	_explosionsCount = 0;
	_randomTriggerName = _randomTrigger # 0;      // Берём название триггера
	_randomTriggerPosition = _randomTrigger # 1;      // Берём позицию триггера
	_randomTriggerParams = _randomTrigger # 2;    // Берём параметры триггера
	_markerOnMap = createMarker [_randomTriggerName, _randomTriggerPosition];      // Создаём маркер
	_triggerOnMap = createTrigger ["EmptyDetector", _randomTriggerPosition, true];       // Создаём триггер
	_triggerOnMap setTriggerArea [ (_randomTriggerParams # 0 / 2), (_randomTriggerParams # 1) / 2, _randomTriggerParams # 2, false,-1];		// Задаём размеры триггера
	_triggerOnMap setTriggerActivation ["ANYPLAYER", "PRESENT", true];       // Вид активации триггера (переделать)
	[ _randomTriggerPosition, _randomTriggerParams, _triggerClass ] call trg_fnc_inHouseSpawn;		// Спавн пехов в домах
	_trgControlPoints = [ _randomTriggerPosition, _randomTriggerParams ] call trg_fnc_pointSpawn;   // Спавн КТ	
	trgParams = [_triggerOnMap, _randomTrigger, _randomTriggerParams, _randomTriggerPosition, _markerOnMap, _explosionsCount, _trgControlPoints];publicVariable "trgParams";
	onTrigger = 1;publicVariable "onTrigger";
	[] call trg_fnc_taskCreate;
	{
		(_x # 1) addEventHandler ["HandleDamage", 
		{
			_damage = 0;
			if ((_this # 4) == "DemoCharge_Remote_Ammo") then
			{	
				(_this # 0) setVariable ["chargesToUse", ((_this # 0) getVariable "chargesToUse") - 1, true];
				if ((_this # 0) getVariable "chargesToUse" != 0) then 
				{
					_damage = 0;
				} else 
				{
					if ((_this # 0) getVariable "chargesToUse" == 0) then 
					{
						_this # 0 removeAllEventHandlers "HandleDamage";
						(_this # 0) setVariable ["chargesToUse", 0, true];
						_this # 0 setDamage 1;
						
						["KT",[(_this # 6)]] call F_fnc_H;
						
						[] spawn trg_fnc_endCheck;
					};
				};
			}else{_damage = 0};
			_damage
		}];
		sleep 1;
	} forEach (_trgControlPoints);

	for [{private _i = 0},{_i < count _trgControlPoints},{ _i = _i + 1}] do 
	{
		{
			_x allowDamage true;
		} forEach ((_trgControlPoints # _i) # 0);
	};

	[ _randomTriggerPosition, _randomTriggerParams, _triggerOnMap ] call trg_fnc_spawnVehicles;   // Прописываем спавн техники, в коллбеке группы
	[ _randomTriggerPosition, _randomTriggerParams, _triggerClass, _triggerOnMap ] call trg_fnc_patrolGroups;		// Спавн пехов
	_unitsCount =  count (( units BLUFOR ) inAreaArray _triggerOnMap );		// Фиксируем число юнитов на начало тригга
	// Проверяем на кол-во убитых юнитов в триггере, если 40% убито, спавним подкреп
	[ [_randomTrigger # 0, _randomTrigger # 1, _randomTriggerParams # 2], _unitsCount, _triggerOnMap, _randomTriggerPosition ] spawn trg_fnc_reinfCheck;  // Спросить у варсома, нахуя ему имя триггера
	
	_spawnPatrol = {
		_trgPos = _this # 0;
		onTrigger = _this # 1;
		while { onTrigger == 1 } do 
		{
			_veh = [ _trgPos ] call trg_fnc_patrolHeli;
			waitUntil { sleep 5; !(alive ( driver _veh ) || alive _veh) };
			sleep selectRandom [ 900, 1800, 2700 ];
		};
	};
	_initPatrol = {
		_randomTriggerPosition = _this # 0;
		if ((playersNumber east) > 10) then
		{
			[ _randomTriggerPosition, onTrigger ] spawn _spawnPatrol;
		} 
		else 
		{
			sleep 1800; 
			[ _randomTriggerPosition, onTrigger ] spawn _spawnPatrol;
		};
	};
	[_randomTriggerPosition] spawn _initPatrol;
};
