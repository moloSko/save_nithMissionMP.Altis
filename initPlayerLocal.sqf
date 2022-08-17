	
	/*
		#3 ВЫПОЛНЯЕТСЯ ЛОКАЛЬНО, ПРИ ЗАХОДЕ ИГРОКА
	*/

// Подгружаем общие переменные (локально для игрока)
	#include "Functions\cVAR.sqf"
	#include "Functions\cFNC.sqf"

// Убираем все каналы кроме прямого 
	for "_i" from 0 to 15 do { _i enableChannel false; };5 enableChannel true; setCurrentChannel 5;

// Блокируем все звуки и интерфейс
	player enableSimulation false;
	0 fadeSound 0;
	0 fadeMusic 0;
	0 fadeRadio 0;
	enableRadio false;
	enableSentences false;
	enableEnvironment false;
	showHud false;
	showChat false;
	showCommandingMenu "";

// Ждем загрузки игрока (оно же в onPlayerRespawn.sqf)
	"INTRO" cutText ["", "BLACK", 0.001]; [0, 0, false] call BIS_fnc_cinemaBorder; // Ставим черный экран
	waitUntil {!isNull player && player == player};		// Ждем готовности игрока
	waitUntil {!(isNull (findDisplay 46))};				// Ждем загрузки экрана (игрового)
	waitUntil {(player getVariable ["pLvl",-1]) >= 0};	// Ждем загрузки БД
	
// Переменные на ЭТОТ блок кода	
	private _text = ""; // Текст для черного фона
	private _pName = name player; 
	private _pLvl = player getVariable ["pLvl",-1]; 
	private _Slot = player getVariable ["Slot","Rifleman"]; 
	private _pCYP = player getVariable ["pCYP",[0,0,0,0]]; 
	private _pBTV = player getVariable ["pBTV",[0,0,0,0]]; 

// Кнопки	
	(findDisplay 46) displayAddEventHandler ["keyUp", "call fnc_EH_KU"]; 
	(findDisplay 46) displayAddEventHandler ["keyDown", "call fnc_EH_KD"]; 

// Проверка слота
	if(!(1 in _pCYP) && _Slot == "CYP")then{_text = "У вас нет допусков на слот «Пилота»!";}; 
	if(!(1 in _pBTV) && _Slot == "BTV")then{ _text = "У вас нет допусков на слот «Танкиста»!";}; 
	{
		if((_Slot == _x # 0) && (_pLvl < _x # 1))exitWith{ 
			_text = format["Слот «%1» доступен со звания «%2»",(_x # 2),iLVL # (_x # 1) # 0]; 
			if(_pLvl <= 0)then{_text = _text + "\nДля новобранцев доступен слот «Стрелок»";}; 
		}; 
	} forEach SLOTS_ACCESS; 
	if(_text != "")exitWith{"BLOCK" cutText [format["%1\n\nПожалуйста перезайдите на другой слот!",_text], "BLACK", 0.001];sleep 10; ["end1",false,true,false] call BIS_fnc_endMission;};

// Проверка ника на запрещенные символы
	forceUnicode 0;
	private _string = _pName;
	private _filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮйцукенгшщзхъфывапролджэячсмитьбюёЁ[]{}()«»-_.,$#@!?&№1234567890 "; 
	_string = toArray _string; 
	_filter = toArray _filter;
	{ if !(_x in _filter)exitWith{_text = "Ваш позывной содержит недопустимые символы!";}; } foreach _string;
	if(_text != "")exitWith{"BLOCK" cutText [format["%1\n\nПожалуйста смените ник и возвращайтесь!",_text], "BLACK", 0.001];sleep 10; ["end1",false,true,false] call BIS_fnc_endMission;};

// Проверка ника на запретные слова в нике
	forceUnicode 0;
 	{ if(_pName regexFind [_x] isNotEqualTo [])exitWith{_text = "Твой позывной (ник) не подходит для игры на нашем сервере!";};}forEach BADNICK;
	if(_text != "")exitWith{"BLOCK" cutText [format["%1\n\nПожалуйста смените ник и возвращайтесь!",_text], "BLACK", 0.001];sleep 10; ["end1",false,true,false] call BIS_fnc_endMission;};


// Приветствие
	["misc\intro.ogv",""] call BIS_fnc_titlecard; 
	[] spawn {
		waitUntil {!(isNil "BIS_fnc_titlecard_finished")};
		sleep 0.2; 
		"INTRO" cutFadeOut 400;
		sleep 0.4; 
		[1, 1, false] call BIS_fnc_cinemaBorder;
		sleep 0.3;
		["taskExp", "ASSIGNED"] call BIS_fnc_taskHint;
		["ParentTask", "ASSIGNED"] call BIS_fnc_taskHint;
	};

// Включаем звуки и интерфейс
	player enableSimulation true;
	player addRating 99999999;
	5 fadeSound 1;
	0 fadeMusic 1;
	0 fadeRadio 1;
	enableRadio false;
	enableSentences false;
	enableEnvironment true;
	showHud true;
	showChat true;
	showCommandingMenu "";

// Включаем каналы
	{ _x enableChannel true; } forEach CHAN_START;
	if(_pLvl >= 3)then{1 enableChannel [true,true];
	}else{1 enableChannel [true,false];};


// Проверка модов

// Инициализация зон
// Инициализация групп
	["InitializePlayer",[player]] call BIS_fnc_dynamicGroups; 

// Инициализация маркеров
// Инициализация меню-карта
// Инициализация флагов
// Блокировка действий и кнопок
// Запуск каналов

// Хендлеры на игрока
	inGameUISetEventHandler ["Action", "call fnc_EH_UI"];		// Фиксация меню-действий
	player addEventHandler ["Fired", { call fnc_EH_Fired }];	// Фиксация стрельбы (Запрет стрельбы в СЗ. Закладка С4)
	player addEventHandler ["GetInMan", {  }];					// Фиксация входа в машину
	player addEventHandler ["SeatSwitchedMan", {  }];			// Фиксация пересадки игрока в машине
	player addEventHandler ["GetOutMan", {  }];					// Фиксация выхода из машины
	player addEventHandler ["HandleScore", { call fnc_EH_Score }];				// Фиксация убийств (начисление очков) СЕРВЕР
	player addEventHandler ["HandleDamage", { call fnc_EH_Damage }];				// Фиксация урона (медицина)

// Хендлеры для миссии
	addMissionEventHandler ["Draw3D", { call fnc_EH_SIM3D }];				// Метки над головами игроков
	addMissionEventHandler ["HandleChatMessage", { }];	// Фильтр чата

// Хендлеры арсенала
	[missionNamespace, "arsenalOpened"] call BIS_fnc_removeAllScriptedEventHandlers; 
	[missionNamespace, "arsenalOpened", { call fnc_EH_OA }] call BIS_fnc_addScriptedEventHandler;
	[missionNamespace, "arsenalClosed", { call fnc_EH_CA }] call BIS_fnc_addScriptedEventHandler;

// Метки на карте
	disableMapIndicators [true,true,false,true]; 
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "Draw";
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_EH_SIM]; 

// Телепорты
	private _TPAction = [ 
		[TP_CSAT_BTV,"e2e84c","На базу «Девятка»","misc\TP\BASE.paa",[14582.3,16743.3,0]],
		[TP_CSAT_CYP,"e2e84c","На базу «Девятка»","misc\TP\BASE.paa",[14582.3,16743.3,0]],
		[TP_CSAT_TIR,"e2e84c","На базу «Девятка»","misc\TP\BASE.paa",[14582.3,16743.3,0]],
		[TP_CSAT_PIRS,"e2e84c","На базу «Девятка»","misc\TP\BASE.paa",[14582.3,16743.3,0]],
		[TP_CSAT_BASE,"78ffa1","На базу БТВ","misc\TP\BTV.paa",[15173,17362.3,0]],
		[TP_CSAT_BASE,"78ceff","На авиабазу","misc\TP\CYP.paa",[14196.3,16274,0]],
		[TP_CSAT_BASE,"ffce78","На стрельбище","misc\TP\TIR.paa",[15618.2,17084.6,0]],
		[TP_CSAT_BASE,"d736be","На пирс","misc\TP\PIRS.paa",[15389.8,15884.7,0]]
	];
	{private _id2 = (_x # 0) addAction ["", {player setPos (_this # 3 # 0);},[_x # 4],1,true,true,"",COND_TP];  (_x # 0) setUserActionText [ _id2, format["<t color='#%1'>%2</t>",_x # 1,_x # 2], format["<t color='#%1'>%2</t><br/><br/><img image='%3' size='3' shadow='0' align='center' valign='top'/>",_x # 1,_x # 2,_x # 3] ]; (_x # 0) lockInventory true; } forEach _TPAction;
	

// Устанавливаем переменные игрока по медицине
	player setVariable ["isBlood", false, true]; 
	player setVariable ["Blood", 900]; 
	player setVariable ["KHP", 1000]; 
	//player setVariable ["isDragged", false, true];
	//player setVariable ["isCarryed", false, true]; 
	//player setVariable ["isDrag",false,true]; 

// Устанавливаем арсенал в зависимости от слота
	#include "i\CSAT.sqf"
	switch (_Slot) do {
		case "Gunner1" : { 
			#include "i\CSAT_Gunner1.sqf"
		};
		case "AT_AA" : { 
			#include "i\CSAT_AT_AA.sqf"
		};
		case "Marksman" : { 
			#include "i\CSAT_Marksman.sqf"
		};
		case "Medic" : { 
			#include "i\CSAT_Medic.sqf"
		};
		case "Engineer" : { 
			#include "i\CSAT_Engineer.sqf"
		};
		case "Sniper" : { 
			#include "i\CSAT_Sniper.sqf"
		};
		case "CYP" : { 
			#include "i\CSAT_CYP.sqf"
		};
		case "BTV" : { 
			#include "i\CSAT_BTV.sqf"
		};
	};
	[CSAT_ARSENAL, true, false] call BIS_fnc_removeVirtualWeaponCargo;
	[CSAT_ARSENAL, true, false] call BIS_fnc_removeVirtualItemCargo;
	[CSAT_ARSENAL, true, false] call BIS_fnc_removeVirtualBackpackCargo;
	[CSAT_ARSENAL, true, false] call BIS_fnc_removeVirtualMagazineCargo;
	[CSAT_ARSENAL, _backpack, false, false] call BIS_fnc_addVirtualBackpackCargo;
	[CSAT_ARSENAL, _vest, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _headgear, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _optics, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _items, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _muzzles, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _pointers, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _bipods, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _googles, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _uniform, false, false] call BIS_fnc_addVirtualItemCargo;
	[CSAT_ARSENAL, _handgunWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
	[CSAT_ARSENAL, _primaryWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
	[CSAT_ARSENAL, _secondaryWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
	[CSAT_ARSENAL, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;
	