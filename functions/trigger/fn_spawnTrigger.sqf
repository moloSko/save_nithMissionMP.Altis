if (true) then
{
	_triggers = [
	["Селакано",[20785.9,6712.67,0],[300, 300, 0],0], // Массив триггеров в формате ["Название", [Координаты x, y, z],[Размеры по x, y, угол наклона]]
	["Ферес",[21678.6,7569.89,0],[300, 300, 0],0],
	["Панагия",[20450.2,8887.12,0],[310, 310, 0],0],
	["Экали",[17059.7,9992.37,0],[300, 300, 0],0],
	["Халкея",[20194.6,11660.7,0],[300, 300, 0],0],
	["Пиргос",[16820.6,12647.5,0],[350, 430, 0],1],
	["Дорида",[19400.9,13300.3,0],[300, 300, 0],0],
	["Харкия",[18114.1,15222.8,0], [540, 390, 0],2],
	["Нифи",[19441.1,15378.7,0],[300, 300, 0],0],
	["Калохори",[21369,16356,0],[300, 300, 0],0],
	["Парос",[20947.6,16971.8,0],[360, 400, 0],1],
	["Альмира",[23599.6,18401.1,0],[610, 620, 0],2],
	["Иоаннина",[23199.7,19984.6, 0],[300, 300, 0],0],
	["Дельфинаки",[23932.2,20169.4,0],[300, 300, 0],0],
	["София",[25680.5,21365.1,0],[350, 350, 0],1],
	["Аликампос",[11112.6,14573.7,0],[300, 300, 0],0],
	["Тополия",[7390.81,15400.5,0],[300, 300, 0],0],
	["Коре",[7095.42,16450.1,0],[300, 300, 0],0],
	["Каталаки",[11745.1,13699.1,0],[300, 300, 0],0],
	["Кавала",[3568.95,12940.4,0],[400, 320, 80],1],
	["Аггелохори",[3795.78,13706.1,0],[300, 320, 0],1],
	["Териса",[10618.9,12237.3,0],[300, 300, 0],0],
	["Негадес",[4885.98,16171.3,0],[390, 350, 0],1],
	["Полиакко",[10966.5,13435.3,0],[300, 300, 0],0],
	["Лакка",[12402,15702.3,0],[300, 300, 0],0],
	["Нери",[4116.11,11706.1,0],[300, 300, 0],0],
	["Ставрос",[12950.1,15041.6,0],[300, 300, 0],0],
	["Абдера",[9425.42,20284,0],[300, 300, 0],0],
	["Фрини",[14612.5,20786.7,0],[300, 300, 0],0],
	["Зарос",[9200.81,11900.9,0],[350, 550, -45],2],
	["Неохори",[12502,14387,0],[300, 400, 70],1],
	["Корони",[11786.7,18302.4,0],[300, 300, 0],0],
	["Айос-Дионисиос",[9357.95,15887.8,0],[450, 300, -20],1],
	["Айя-Триада",[16668.5,20477,0],[300, 300, 0],0],
	["Панохори",[5083.31,11245.2,0],[350, 350, 0],1],
	["Айос-Константинос",[3988.77,17407.8,0],[300, 350, -25],1],
	["Орино",[10440.4,17273.1,0],[300, 300, 0],0],
	["Ифестиона",[12837,19679.3,0],[300, 300, 0],0],
	["Галати",[10330.3,19086,0],[350, 350, 0],1],
	["Ореокастро",[4600.45,21430.6,0],[300, 300, 0],0],
	["Калитея",[17906.5,18129.4,0],[300, 300, 0],0],
	["Айос-Петрос",[19319.4,17641.6,0],[300, 300, 0],0],
	["Сирта",[8625.13,18301.6,0],[300, 300, 0],0],
	["Атира",[14053,18739.4,0],[300, 450, 45],1],
	["Родополи",[18833.4,16597.1,0],[300, 300, 0],0]
	];

	_onTrigger = 1; 

	if (count _triggers == 51 ) then 
	{
		sleep 30;
	};

	if (count _triggers == 0) then 
	{
		return;
	};

	_randomTrigger = [];
	_triggerClass = 0;
	while { _onTrigger == 1 } do 
	{
		_randomTrigger = selectRandom _triggers;     // Выбираем рандомный триггер
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
	_trgControlPoints = [ _randomTriggerPosition, _randomTriggerParams ] call trg_fnc_pointSpawn;   // Спавн КТ	
	trgParams = [_triggerOnMap, _randomTrigger, _randomTriggerParams, _randomTriggerPosition, _markerOnMap, _triggers, _onTrigger, _explosionsCount];

	{
		(_x # 1) setVariable ["chargesUsed", 0, true];
		(_x # 1) addEventHandler ["HandleDamage", 
		{
			if ((_this # 4) == "DemoCharge_Remote_Ammo") then
			{
				if ((_this # 0) getVariable "chargesUsed" == 0) then 
				{
					(_this # 0) setVariable ["chargesUsed", 1, true];
					_this # 0 setDamage 0;
				} else 
				{
					if ((_this # 0) getVariable "chargesUsed" == 1) then 
					{
						_this # 0 removeAllEventHandlers "HandleDamage";
						_this # 0 setDamage 1;
						[] spawn trg_fnc_endCheck;
					};
				};
			}
			else {_this # 0 setDamage 0;};
		}];
	} forEach (_trgControlPoints);

	for [{private _i = 0;},{_i < count _trgControlPoints},{ _i = _i + 1}] do 
	{
		{
			_x allowDamage true;
		} forEach ((_trgControlPoints # _i) # 0);
	};

	[ _randomTriggerPosition, _randomTriggerParams, _triggerOnMap ] call trg_fnc_spawnVehicles;   // Прописываем спавн техники, в коллбеке группы
	[ _randomTriggerPosition, _randomTriggerParams, _triggerClass, _triggerOnMap ] call trg_fnc_patrolGroups;		// Спавн пехов
	[ _randomTriggerPosition, _randomTriggerParams, _triggerClass ] call trg_fnc_inHouseSpawn;		// Спавн пехов в домах
	_unitsCount =  count (( units BLUFOR ) inAreaArray _triggerOnMap );		// Фиксируем число юнитов на начало тригга
	// Проверяем на кол-во убитых юнитов в триггере, если 40% убито, спавним подкреп
	[ [_randomTrigger # 0, _randomTrigger # 1, _randomTriggerParams # 2], _unitsCount, _triggerOnMap, _randomTriggerPosition ] spawn trg_fnc_reinfCheck;  // Спросить у варсома, нахуя ему имя триггера
	
	_spawnPatrol = {
		_trgPos = _this # 0;
		_onTrigger = _this # 1;
		while { _onTrigger == 1 } do 
		{
			_veh = [ _trgPos ] call trg_fnc_patrolHeli;
			waitUntil { sleep 5; !(alive ( driver _veh ) || alive _veh) };
			sleep selectRandom [ 5, 8, 10 ];
		};
	};

	if ((playersNumber east) > 10) then
	{
		[ _randomTriggerPosition, _onTrigger ] spawn _spawnPatrol;
	} 
	else 
	{
		sleep 5; 
		[ _randomTriggerPosition, _onTrigger ] spawn _spawnPatrol;
	};
};
	
	// TODO
	// Прикрутить создание/удаление миссии
	// Прикрутить спавн пехоты на КТ
	// Если долго не происходит действий - подкреп (зависит от кол-ва игроков) и игроков > 15 - спавн блекфут и/или А-10/Wasp (потом)
	// Сделать проверку на живой патруль (на СПН)
	// Сделать спавн СПН (по окраине триггера)
	// Сделать минные поля (потом)
	// При подкрепе фаер над триггером (потом)