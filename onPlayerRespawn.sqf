
	/*
		#4: СПАВН и РЕСПАВН ИГРОКА
	*/

	private _Slot = player getVariable ["Slot","Rifleman"];

// Ждем загрузки игрока (оно же в onPlayerRespawn.sqf)	
	"INTRO" cutText ["", "BLACK", 0.001]; [0, 0, false] call BIS_fnc_cinemaBorder; // Ставим черный экран
	waitUntil {!isNull player && player == player};		// Ждем готовности игрока
	waitUntil {!(isNull (findDisplay 46))};				// Ждем загрузки экрана (игрового)
	waitUntil {(player getVariable ["pLvl",-1]) >= 0};	// Ждем загрузки БД

// Устанавливаем переменные
	player setVariable ["is300",false,true];	 	// Состояние 300
	hintsilent "";

// Убираем все снаряжение
	removeAllWeapons player; 
	removeAllItems player; 
	removeAllAssignedItems player; 
	removeUniform player; 
	removeVest player; 
	removeBackpack player; 
	removeHeadgear player; 
	removeGoggles player;

// Добавляем снаряжение
	player forceAddUniform "U_O_T_Officer_F";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";

// Устанавливаем настройки
	player enableStamina false; 
	player enableFatigue false;
	player setCustomAimCoef 0;

// Ставим игрока в мед.палатку, если он возрадился
	if(p_INGAME)then{
		if(_Slot != "CYP")then{player setPos [14608.4,16791.5,0];};
		if(_Slot == "CYP")then{player setPos [14207.4,16296.4,0];};
		[] spawn {waitUntil {!(isNil "BIS_fnc_titlecard_finished")};sleep 0.2; "INTRO" cutFadeOut 400; sleep 0.4; [1, 1, false] call BIS_fnc_cinemaBorder;};
	};
	if!(p_INGAME)then{
		p_INGAME = true;
	};

// На всяк случай удаляем все хендлеры
	(_this # 0) connectTerminalToUAV objNull;		// Отключаем от БПА
	(_this # 1) connectTerminalToUAV objNull;		// Отключаем от БПА
	(_this # 1) removeAllEventHandlers "Fired"; 
	(_this # 1) removeAllEventHandlers "GetInMan"; 
	(_this # 1) removeAllEventHandlers "SeatSwitchedMan"; 
	(_this # 1) removeAllEventHandlers "GetOutMan"; 
	(_this # 1) removeAllEventHandlers "HandleScore"; 
	(_this # 1) removeAllEventHandlers "HandleDamage"; 
	removeAllActions (_this # 1); 

	if (alive (_this # 1) || (_this # 1) inArea "CSAT_BASE")then{deleteVehicle (_this # 1);};	// Удаляем старое тело, если оно осталось на базе или осталось живое
	if !(isPlayer (_this # 0))then{deleteVehicle (_this # 0);};									// Удаляем новое тело, если оно оказалось ботом

	private _id1 = player addAction ["", {["Open", [false,CSAT_ARSENAL,player]] call BIS_fnc_arsenal;},[],11,true,true,"",COND_ARS]; player setUserActionText [ _id1, "<t color='#ffffff'>Открыть</t> <t color='#ec872d'>Арсенал</t>", "<t align='left' color='#ffffff'>Открыть</t> <t align='center' color='#ec872d'>Арсенал</t><br/><br/><img image='a3\weapons_f\ammoboxes\data\ui\icomap_ammo_ca.paa' size='3' shadow='0' align='center' valign='top'/>" ]; 
	[player, "<t color='#ff0000'>Оказать мед.помощь</t>", 			MD_IMG # 1, MD_IMG # 1, COND_REVIVE, COND_REVIVE, {}, {}, {[cursorTarget] call fnc_MED_REVIVE}, {}, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;
	[player, "<t color='#ff0000'>Перевязать</t> бойца", 			MD_IMG # 0, MD_IMG # 0, COND_BANDAGE, COND_BANDAGE, {}, {}, {[cursorTarget] call fnc_MED_BANDAGE}, {}, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;



/*

	private _pLvl = player getVariable ["pLvl",-1]; 
	if(_pLvl >= 0)then{{ _x enableChannel true; } forEach CHAN_START;};
	
	//["KillBots",[player]] remoteExec ["F_fnc_H",2];			// Обработка убийств

	

	*/