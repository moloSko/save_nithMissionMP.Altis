
	/*
		ВСЕ ПЕРЕМЕННЫЕ
	*/
	

	TRIGGEREND = true;		// Окончание миссии
	
// БАЗА ДАННЫХ
	HPAwesomeQuery = [];
	
// ПЕРЕМЕННЫЕ ИГРОКА
	PDATA = ["pLvl","pExp","pKarma","pHours","pPanels","pTitle"];
	PDATA_SET = [0,0,0,
		[0,0,0],				// Время
		[
			[0,0,0,0],			// Админ
			[0,0,0,0],			// Начальник
			[0,0,0,0,0,0,0,0],	// Инструктор
			[0,0,0,0],			// Курсы
			[
				[0,0,0,0],		// Допуски ЦУП
				[0,0,0,0],		// Допуски БТВ
				[0,0,0,0]		// Допуски РП
			]
		],
		0
	];
	PDATA_TEXT = ["Звание","Прогресс","Карма",
		["На сервере","В полете","В бронетехнике"],
		[
			["Админ","Тех.Поддержка","Заместитель","Разработчик"],
			["Начальник ЦУП","Начальник БТВ","Начальник РП","Начальник ЛС"],
			["Инструктор пилотов","Инструктор танкистов","Инструктор РП","Инструктор новобранцев","Инструктор Офицеров","Инструктор Снайперов","Инструктор Инженеров","Инструктор Санитаров"],
			["Офицер","Инженер","Снайпер","Санитар"],
			[
				["Транспортные вертолёты","Боевые вертолёты","Транспортные самолёты","Боевые самолёты"],
				["Гусеничная легкая техника","Гусеничная средняя техника","Гусеничная тяжелая техника","Артилерия"],
				["ЗЕВС","Патриоты","Стрингеры","Красный Крест"]
			]
		]
	];
	
	BADNICK = ["ASUS", "ACER", "HP", "AMD", "RADEON", "MSI", "Intel", "Admin", "Админ", "User", "Пользователь", "PC", "ПС", "Kiosk", "Player", "Игрок", "Gamer"];
	
// ТЕКСТА
	TEXT_DC = "discord.gg/GPfv3qAQFX";
	TEXT_VK = "vk.com/9pota.arma3";
	TEXT_IP = "185.186.143.195:2302";

// ТАЙМЕРЫ
	TIME_RESPVEH = 5;		// Время (с) респавн техники
	TIME_CLEAN = 60;		// Время (м) след. очистки
	TIME_CYP4 = 100;		// Сколько часов нужно налетать(ЦУП) для 4 допуска 
	TIME_BTV4 = 50;			// Сколько часов нужно наездить(БТВ) для 4 допуска 
	TIME_MRK = 10;			// Интервал для точки f4
	TIME_INVEH = 60;		// Через какое время добавить очки за нахождение в технике (БТВ,ЦУП)
	TIME_INGAME = 5;		// Сколько часов отыграть для добавления опыта
	TIME_BLOOD = 900;		// Время истекания кровью (15 мин)
	TIME_BANDAGE = 5;		// Время перевязки бойца
	TIME_REVIVE = 10;		// Время оказание медицинской помощи
	
// ОПЫТ
	SCORE_INVEH = 0.5;		// Добавить SCORE_VEH за каждые TIME_INVEH в технике
	SCORE_INGAME = 2;		// Добавить кол-во SCORE_INGAME (%) за каждые TIME_INGAME в игре
	SCORE_KARMA = 0.005;	// Сколько % от текущего звания
	SCORE_KILLCIV = 300;	// Сколько отнимать опыта за убийство гражданского
	SCORE_COURCE = [0.6,0.3,0.3,0.2];	// Множитель опыта для пройденного курса ["Офицер","Инженер","Снайпер","Санитар"]
	SCORE_LEADER = 0.1;		// Множитель опыта для лидера
	SCORE_KMB = 100;		// Кол-во очков опыта за обучение новобранца
	
// ЦВЕТА
	COLORS = [
		[1,0,0,0.7],			// Оповещалки
		[0.96, 0.34, 0.13, 1],	// ОДКБ
		[1,1,1,1],				// ШТАБ
		[0.7,0.6,1,1],			// ЦУП
		[0.1,1,0,1],			// БТВ
		[1,1,0,1],				// СМЕЖКИ
		[1,0,0,1],				// 300 не перевязан
		[1,0.4,0,1],			// 300 перевязан
		[0.1,0.3,1,1],			// Инструктора
		[0.9,0.2,0.2,1]			// Штрафник
	];

// ЧАТ и КАНАЛЫ
	CHAT_BADWORD = ["сука","пизд","уебок","бля","блат","мудак","долбае","ебал","пидар","пидор","пидр","utf","ютф","член","хуй","ебат"];
	CHAN_START = [3,4,5,8,9,10,11,12,13,14,15];
	
// ОБЩИЕ НАСТРОЙКИ 
	OPTIONS = [				// Настройки усложенний, их буст и название
		["Stamina",false,0.1,"Стамина"],
		["Shaking",false,0.07,"Тряска прицела"],
		["V3D",true,0.2,"3 лицо"],
		["IconMap",true,0.1,"Иконки на карте"],
		["UseGPS",true,0.06,"Использование GPS"],
		["UseMap",true,0.08,"Использование карты"],
		["UseOptic",true,0.1,"Использование оптики"]	// Чтоб у снайперов не отбиралось, но если на слоте то нет буста
		// Использование рации
		// Использование ПНВ
	];
	
	BASE_LVL = 3;			// Базовое основное звание (мл.Сержант)
	
	COUNT_KARMA = 3;		// Сколько нужно ТКшнуть, чтобы получить штрафника
	
	MIN_PLAYERS = 10;		// Минимальное кол-во игроков для исключения некоторых правил
	
	SAFEZONE_CSAT = true;	// Включены ли сейф-зоны ВС РФ
	
	HDAMAGE = 1.4;			// Делитель урона игроку

// СЛОТЫ
	SLOTS_N = ["NSH","NLS","NCYP","NBTV"];	// Особые слоты
	SLOTS_ACCESS = [		// Доступ к слотам
		["Rifleman",0,"Стрелок"],
		["Gunner1",1,"Пулеметчик"],
		["AT_AA",1,"ПТ/ПВО"],
		["Marksman",2,"Меткий стрелок"],
		["Medic",3,"Медик"],
		["Engineer",3,"Инженер"],
		["Sniper",4,"Снайпер"],
		["CYP",5,"Пилот"],
		["BTV",5,"Танкист"],
		["NSH",10,"Начальник Штаба"],
		["NLS",5,"Начальник Личного состава"],
		["NCYP",5,"Начальник ЦУП"],
		["NBTV",5,"Начальник БТВ"]
	];
	SLOTS_UNI = [			// Слоты для засчитывания с метража
		["Marksman",400],
		["Sniper",1000]
	];

// 	Арсенал
	ARS_TYPE = [			// Арсенал
		['Стрелка',"a3\ui_f_curator\data\rsccommon\rscattributeinventory\filter_1_ca.paa","Rifleman","Rifleman"],
		['ПТ',"a3\structures_f_bootcamp\vr\helpers\data\vr_symbol_launchers_ca.paa","AT_AA","AT"],
		['ПВО',"a3\ui_f\data\gui\cfg\communicationmenu\casheli_ca.paa","AT_AA","AA"],
		['Пулеметчика',"a3\ui_f_curator\data\rsccommon\rscattributeinventory\filter_2_ca.paa","Gunner1","Gunner1"],
		['Меткого Стрелка',"a3\ui_f\data\gui\cfg\respawnroles\recon_ca.paa","Marksman","Marksman"],
		['Медика',"a3\ui_f\data\map\vehicleicons\pictureheal_ca.paa","Medic","Medic"],
		['Инженера',"a3\ui_f\data\igui\cfg\actions\repair_ca.paa","Engineer","Engineer"],
		['Снайпера',"a3\data_f_mark\logos\arma3_mark_icon_ca.paa","Sniper","Sniper"],
		['Танкиста','a3\data_f_tank\logos\arma3_tank_icon_ca.paa',"BTV","BTV"],
		['Пилота вертолета',"a3\ui_f\data\gui\rsc\rscdisplaygarage\helicopter_ca.paa","CYP","Heli"],
		['Пилота самолета',"a3\data_f_jets\logos\jets_icon_ca.paa","CYP","Plane"],
		['Начальника штаба',"a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_host_ca.paa","NSH","NSH"],
		['Начальника ЛС',"a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_host_ca.paa","NLS","NSH"],
		['Начальника ЦУП',"a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_host_ca.paa","NCYP","NSH"],
		['Начальника БТВ',"a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_host_ca.paa","NBTV","NSH"]
	];

// УСЛОВИЯ
	CONDITION_ARSENAL = 	"!(player getVariable ['isUnconscious',false]) and ((vehicle player) == player) and ((player inArea 'CSAT_ARSENAL_1') or (player inArea 'CSAT_ARSENAL_2'))";		// Открыть арсенал
	CONDITION_PARACHUTE = 	"!(player getVariable ['isUnconscious',false]) and (getpos player # 2 > 70) and (assignedDriver (vehicle player) != player) and (typeOf (vehicle player) in ((VEH_TYPE # 5) + (VEH_TYPE # 6)))";			// Для выпрыгивания с парашютом
	CONDITION_OUTHELI = 	"!(player getVariable ['isUnconscious',false]) and (assignedDriver (vehicle player) == player) and (count (fullCrew [vehicle player, 'cargo']) != 0) and (getposATL (vehicle player) # 2 > 100) and (typeOf (vehicle player) in ((VEH_TYPE # 5) + (VEH_TYPE # 6))) and (player getVariable ['AirDrop',true])";	// Для выброски десанта 
	CONDITION_REPAIR = 		"!(player getVariable ['isUnconscious',false]) and (!(isEngineOn (vehicle player)) && (assignedDriver (vehicle player) == player) && speed (vehicle player) <= 2) && ((vehicle player inArea 'CSAT_REPAIR_1') || (vehicle player inArea 'CSAT_REPAIR_2'))";		// Для обслуживания техники
	CONDITION_VIEWSTAT = 	{!(_target getVariable ['isUnconscious',false]) && _target isKindOf "Man" && player distance2D _target < 5 && (side (group _target) == playerSide) && (player getVariable ["pLvl",-1] > 0) && isPlayer _target};	// Просмотр статистики F3
	CONDITION_KMB = 		"!(cursorTarget getVariable ['isUnconscious',false]) and (count ([player,cursorTarget] inAreaArray 'CSAT_BASE') == 2) and (groupId (group player) regexFind ['КМБ'] isNotEqualTo []) and (groupId (group cursorTarget) regexFind ['КМБ'] isNotEqualTo []) and (cursorTarget getVariable ['pLvl',-1] == 0) and (player distance2D cursorTarget < 5) and (((player getVariable 'pPanels') # 2 # 3) == 1) and isPlayer cursorTarget";		// Для присвоения рядового
	CONDITION_TP = 			"(player distance2D _target < 5) and (vehicle player == player)";
	// Медицина 	
	CONDITION_DRAG = 		"(cursorTarget getVariable ['isUnconscious',false] && !(player getVariable ['isUnconscious',false]) && (vehicle cursorTarget == cursorTarget) && (vehicle player == player) && (alive cursorTarget) && !(player getVariable ['isDrag',false]) && cursorTarget distance2D player < 2 && !(cursorTarget getVariable ['isDragged',false]) && !(cursorTarget getVariable ['isCarryed',false]))";
	CONDITION_BANDAGE = 	"(cursorTarget getVariable ['isUnconscious',false] && !(player getVariable ['isUnconscious',false]) && (vehicle cursorTarget == cursorTarget) && (vehicle player == player) && (alive cursorTarget) && !(player getVariable ['isDrag',false]) && cursorTarget distance2D player < 2 && !(cursorTarget getVariable ['isDragged',false]) && !(cursorTarget getVariable ['isCarryed',false]) && cursorTarget getVariable ['isBleeding',false] && ((items player) find 'FirstAidKit' != -1))";
	CONDITION_REVIVE =		"(cursorTarget getVariable ['isUnconscious',false] && !(player getVariable ['isUnconscious',false]) && (vehicle cursorTarget == cursorTarget) && (vehicle player == player) && (alive cursorTarget) && !(player getVariable ['isDrag',false]) && cursorTarget distance2D player < 2 && !(cursorTarget getVariable ['isDragged',false]) && !(cursorTarget getVariable ['isCarryed',false]) && !(cursorTarget getVariable ['isBleeding',false]) && (((getNumber(configFile >> 'CfgVehicles' >> typeOf player >> 'attendant') == 1) && (items player) find 'Medikit' != -1) || ({(alive _x)}count nearestObjects [cursorTarget, MD_CLASS, 8] > 0)))";
	CONDITION_LOAD = 		"['CanLoad',[cursorTarget]] call F_fnc_MED";
	CONDITION_UNLOAD = 		"((cursorTarget isKindOf 'LandVehicle' || cursorTarget isKindOf 'Air') && cursorTarget distance2D player < 6 && {(_x getVariable ['IsUnconscious',false]) && (alive _x)}count crew cursorTarget > 0)";
	
// Медицина
	MD_RAD_VIEW = 200;		// Дистанция визуализации трехсотых
	MD_CLASS = ["Land_MedicalTent_01_white_generic_open_F","O_Truck_02_medical_F","Land_Medevac_house_V1_F","Land_Pod_Heli_Transport_04_medevac_F"];	// Обьекты от которых можно поднять бойца (не медик)
	MD_IMG = ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa"];

	
// ЮНИТЫ ФРАКЦИИ
	UNITS_HATO = ["BLU_F","BLU_G_F","BLU_T_F","BLU_CTRG_F","BLU_GEN_F","BLU_GEN_F","BLU_W_F"];
	UNITS_CSAT = ["OPF_F","OPF_G_F","OPF_T_F","OPF_R_F"];
	UNITS_IND = ["IND_F","IND_G_F","IND_C_F","IND_E_F","IND_L_F"];
	UNITS_CIV = ["CIV_F","CIV_IDAP_F"];

/*
	
	//AWARDS = [];			// Все награды TEST


// Начисление доп.опыта
	
	// TEST не работает
	SCORE_KMB_CYP = 
	[100,100,100,100];		// Кол-во очков опыта за обучение допуск ЦУП TEST
	SCORE_KMB_BTV = 
	[100,100,100,100];		// Кол-во очков опыта за обучение допуск БТВ TEST
	SCORE_KMB_COURCE = 
	[100,100,100,100];		// Кол-во очков опыта за обучение курсов TEST
	
	
// ДОСТУПЫ
	ACCESS_RP = [			// Доступ РП стороны
		["ZEUS",6,"ЗЕВС"],
		["Patriots",6,"Патриот"],
		["Stringers",6,"Стрингер"],
		["RedCross",6,"Красный Крест"]
	];
	
	ACCESS_PANELS = [		// Доступ к панелям
		["KICK",-1,"Кик панель"],
		["ADMIN",-1,"Админ панель"]
	];
	
	ACCESS_HAT = [			// Разрешение носить береты
		["BlueBeret",4,"Голубой берет"],
		["RedBeret",6,"Краповый берет"]
	];
	
	ACCESS_KMB = [			// Доступ за инструкторов
		["KMB",7,"Инструктор по КМБ"],
		["CYP",7,"Инструктор по ЦУП"],
		["BTV",7,"Инструктор по БТВ"],
		["RP",7,"Инструктор по РП"]
	];
	
*/

// ТЕХНИКА
	VEH_RAD_RESP = 300;		// Дистанция респавна техники при отсутствии игроков в этом радиусе
	VEH_CSAT_TEXTURE = ["texture\CSAT\VEH_CSAT.paa","texture\black.paa"];
	VEH_NATO_TEXTURE = ["texture\NATO\VEH_NATO.paa","texture\NATO\PLANE_NATO.paa","texture\black.paa"];

	VEH_CSAT = [			// ТЕХНИКА ВС РФ
		["O_Truck_02_medical_F","O_Truck_02_box_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_transport_F","O_Truck_02_covered_F"],	// Камазы
		["O_LSV_02_AT_F","O_LSV_02_unarmed_F","O_LSV_02_armed_F","I_C_Offroad_02_unarmed_F"],	// Qilin + Jeep
		["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"],		// Ifrit
		["O_APC_Wheeled_02_rcws_v2_F"],								// Marid

		["O_APC_Tracked_02_cannon_F"],								// Камыш

		["O_MBT_02_cannon_F"],										// Варсук

		["O_MBT_04_command_F","O_MBT_04_cannon_F"],					// Ангара и 140К
		["O_APC_Tracked_02_AA_F"],									// ZSU Tigris

		["I_Truck_02_MRL_F"],										// Артилерия


		["O_Boat_Armed_01_hmg_F"],									// Боевой катер
		["O_Boat_Transport_01_F","O_SDV_01_F"],						// Шлюпка и Подлодка											

		["I_Heli_Transport_02_F","O_Heli_Transport_04_F"],		// Mohavk, Taru
		["O_Heli_Light_02_unarmed_F","O_Heli_Light_02_dynamicLoadout_F"],	// ORCA (NOWEAP), ORCF
		["O_Heli_Attack_02_dynamicLoadout_F"],						//Кайман

		["O_T_VTOL_02_vehicle_dynamicLoadout_F","O_T_VTOL_02_infantry_dynamicLoadout_F"],	// Ксиан

		["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","I_Plane_Fighter_04_F"], //  Неофрон Шкила Грифон

		["O_UGV_01_F","O_UGV_01_rcws_F"],							// Саиф
		["O_UAV_02_dynamicLoadout_F"],								// БПЛА

		["O_G_Van_02_transport_F"]									// Обычный грузовик
	];
	VEH_NATO = [			// ТЕХНИКА НАТО
		["B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_cargo_F","B_Truck_01_fuel_F","B_Truck_01_ammo_F","B_Truck_01_mover_F","B_Truck_01_medical_F","B_Truck_01_box_F","B_Truck_01_flatbed_F","B_Truck_01_Repair_F"],	// Грузовики	
		["B_LSV_01_unarmed_F","B_LSV_01_armed_F","B_LSV_01_AT_F"],	// Plower
		["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_MRAP_01_F"],		// Hunters
		["B_APC_Wheeled_01_cannon_F"],								// Marshal
		
		["B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_rcws_F"],		// Bob, Pathera
		
		["B_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_up_cannon_F"],// RIHO
			
		["B_MBT_01_TUSK_F","B_MBT_01_cannon_F"],					// Сламеры
		["B_APC_Tracked_01_AA_F"],									// ZSU
		
		["B_MBT_01_arty_F","B_MBT_01_mlrs_F"],						// Arta


		["B_Boat_Armed_01_minigun_F"],								// Боевой катер
		["B_Boat_Transport_01_F","B_SDV_01_F"],						// Подлодка и шлюпка

		["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Light_01_F"], 	// p900
		["B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_F"],	// Чинуки
		["B_Heli_Transport_01_F"],									// Ghost
		["B_Heli_Attack_01_dynamicLoadout_F"],						// BlackFoot
		
		["B_T_VTOL_01_vehicle_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_armed_F"], // Рыбы
		
		["B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_F"],	// A10 и Wasp

		["B_UGV_01_F","B_UGV_01_rcws_F"],							// Стампер
		["B_UAV_02_dynamicLoadout_F"] 								// Беспилотник
	];

	VEH_LAND_ACCESS = [		// Доступ в наземную технику
		//(VEH_CSAT # 0) + (VEH_CSAT # 1) + (VEH_CSAT # 2) + (VEH_CSAT # 3) + (VEH_CSAT # 9) + (VEH_CSAT # 10) + (VEH_NATO # 0) + (VEH_NATO # 1) + (VEH_NATO # 2) + (VEH_NATO # 3) + (VEH_NATO # 9) + (VEH_NATO # 10),	// 0
		(VEH_CSAT # 4) + (VEH_NATO # 4),	// 1
		(VEH_CSAT # 5) + (VEH_NATO # 5),	// 2
		(VEH_CSAT # 6) + (VEH_CSAT # 7) + (VEH_NATO # 6) + (VEH_NATO # 7),	// 3
		(VEH_CSAT # 8) + (VEH_NATO # 8)	// 4
	];
	VEH_AIR_ACCESS = [		// Доступ в воздушную технику
		(VEH_CSAT # 11) + [(VEH_CSAT # 12 # 0)] + (VEH_NATO # 11) + [(VEH_NATO # 12 # 0)] + ["C_Heli_Light_01_civil_F"],	// 1
		[(VEH_CSAT # 12 # 1)] + (VEH_CSAT # 13) + [(VEH_NATO # 12 # 1)] + (VEH_NATO # 13) + (VEH_NATO # 14),	// 2
		(VEH_CSAT # 14) + (VEH_NATO # 15),		// 3
		(VEH_CSAT # 15) + (VEH_NATO # 16)		// 4
	];
	VEH_TYPE = [			// Вся техника и её классы
		(VEH_CSAT # 0) + (VEH_NATO # 0),									// Truck
		(VEH_CSAT # 1) + (VEH_CSAT # 2) + (VEH_NATO # 1) + (VEH_NATO # 2),	// CAR
		(VEH_CSAT # 3) + (VEH_NATO # 3) + (VEH_NATO # 4) + (VEH_NATO # 5),	// BTR
		(VEH_CSAT # 4) + (VEH_CSAT # 5) + (VEH_CSAT # 6) + (VEH_CSAT # 7) + (VEH_NATO # 6) + (VEH_NATO # 7),	// TANK
		(VEH_CSAT # 8) + (VEH_NATO # 8),	// ARTA
		(VEH_CSAT # 11) + (VEH_CSAT # 12) + (VEH_CSAT # 13) + (VEH_NATO # 11) + (VEH_NATO # 12) + (VEH_NATO # 13) + (VEH_NATO # 14),	// HELI
		(VEH_CSAT # 14) + (VEH_CSAT # 15) + (VEH_NATO # 15) + (VEH_NATO # 16),	// PLANE
		(VEH_CSAT # 9) + (VEH_CSAT # 10) + (VEH_NATO # 9) + (VEH_NATO # 10),	// BOAT
		(VEH_CSAT # 16) + (VEH_CSAT # 17) + (VEH_NATO # 17) + (VEH_NATO # 18)	// UAV
	];
	VEH_MODULE = ["Land_Pod_Heli_Transport_04_fuel_F", "Land_Pod_Heli_Transport_04_box_F", "Land_Pod_Heli_Transport_04_ammo_F", "Land_Pod_Heli_Transport_04_repair_F", "Land_Pod_Heli_Transport_04_medevac_F"];
	VEH_CSAT_GROUZ = ["O_G_Van_02_transport_F"];
	VEH_TP = ["B_GEN_Offroad_01_covered_F"];
	
	VEH_ALL = VEH_TP + (VEH_TYPE # 0) + (VEH_TYPE # 1) + (VEH_TYPE # 2) + (VEH_TYPE # 3) + (VEH_TYPE # 4) + (VEH_TYPE # 5) + (VEH_TYPE # 6) + (VEH_TYPE # 7) + (VEH_TYPE # 8) + VEH_CSAT_GROUZ + VEH_MODULE;
	
	VEH_NOTRESP = (VEH_TYPE # 8) + (VEH_LAND_ACCESS # 0) + (VEH_LAND_ACCESS # 1) + (VEH_LAND_ACCESS # 2) + (VEH_LAND_ACCESS # 3) + (VEH_AIR_ACCESS # 0) + (VEH_AIR_ACCESS # 1) + (VEH_AIR_ACCESS # 2) + (VEH_AIR_ACCESS # 3);

