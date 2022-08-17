	




	p_INGAME = false;		// Загрузился ли игрок

	BADNICK = ["ASUS", "ACER", "HP", "AMD", "RADEON", "MSI", "Intel", "Admin", "Админ", "User", "Пользователь", "PC", "ПС", "Kiosk", "Player", "Игрок", "Gamer", "Лох"];

//Массивы, слоты и опыт
	Rifleman = [2,1,1,2,3,10,2,2,3,5,1,3,5,10,10,50,10,1];
	AT_AA = [2,2,5,10,15,20,10,15,4,20,1,3,5,10,10,50,10,1];
	BTV = [1,5,5,10,15,10,0,0,10,10,1,15,15,25,15,50,3,0];
	CYP = [1,3,3,5,10,10,10,15,20,20,1,15,15,25,15,50,0,0];
	Engineer = [2,2,3,5,10,10,2,2,5,5,1,3,5,10,10,50,100,5];
	Gunner1 = [2,1,1,2,3,10,2,2,3,5,1,3,5,10,10,50,10,1];
	Marksman = [3,1,1,2,3,10,2,2,2,3,1,3,5,10,10,50,10,1];
	Medic = [2,1,1,1,1,10,1,1,1,1,5,10,20,50,10,50,0,0];
	Sniper = [5,1,1,1,1,10,1,1,1,1,3,3,10,20,25,50,0,0];
	NSH = [2,1,1,1,1,1,1,1,1,1,1,1,100,100,100,100,0,0];
	NLS = [2,1,1,2,3,10,2,2,3,5,1,3,100,100,100,100,10,1];
	NCYP = [2,1,1,2,3,10,2,2,3,5,1,3,100,100,100,100,10,1];
	NBTV = [2,1,1,2,3,10,2,2,3,5,1,3,100,100,100,100,10,1];

// Звания и опыт
	iLVL = [
		["Новобранец",0,"Дух"],
		["Рядовой",0,"Ряд."],
		["Ефрейтор",100,"Ефр."],
		["Младший Сержант",200,"Мл.Серж."],
		["Сержант",300,"Серж."],
		["Старший Сержант",400,"Ст.Серж."],
		["Старшина",500,"Старшина"],
		["Прапорщик",600,"Прапор"],
		["Старший Прапорщик",700,"Ст.Прапор"],
		["Младший Лейтенант",800,"Мл.Лейт."],
		["Лейтенант",900,"Лейт."],
		["Старший Лейтенант",1000,"Ст.Лейт."],
		["Капитан",1100,"Капитан"],
		["Майор",1200,"Майор"],
		["Подполковник",1300,"Подполк."],
		["Полковник",1400,"Полков."],
		["Генерал-майор",1500,"Ген.Майор"],
		["Генерал-лейтенант",1600,"Ген.Лейт."],
		["Генерал-полковник",1700,"Ген.Полков."],
		["Генерал-армии",1800,"Гер.Армии"],
		["Маршал ВС РФ",1900,"Маршал"]
	];

// Допуски слотов
	SLOTS_ACCESS = [
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
	SLOTS_N = ["NSH","NLS","NCYP","NBTV"];	// Слоты НАЧАЛЬНИКОВ
	
// Каналы, которые нужно открыть
	CHAN_START = [3,4,5,8,9,10,11,12,13,14,15];
	
// Делитель урона для игрока
	HDAMAGE = 1.5;

// Медицина
	MD_CLASS = ["Land_MedicalTent_01_white_generic_open_F","O_Truck_02_medical_F","Land_Medevac_house_V1_F","Land_Pod_Heli_Transport_04_medevac_F"];	// Обьекты от которых можно поднять бойца (не являясь медиком)
	MD_IMG = ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa"];
	
// Цвета
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

// Массивы с зонами
	CSAT_Z_ARS = ["CSAT_ARS_1","CSAT_ARS_2"];
	CSAT_Z_REP = ["CSAT_REP_1","CSAT_REP_2"];
	CSAT_Z_SZ = ["CSAT_SZ_1","CSAT_SZ_2"];
	CSAT_Z_BASE = ["CSAT_BASE","CSAT_PIRS"];
	
// Условия
	COND_ARS = 	"({(player inArea _x)}count CSAT_Z_ARS > 0) && !(player getVariable ['isDrag',false]) && ((vehicle player) == player)";	// Открыть арсенал
	COND_TP = 	"(player distance2D _target < 5) && ((vehicle player) == player)";				// Телепорт-машина
	COND_F3 = 	{!(_target getVariable ['is300',false]) && (_target isKindOf 'Man') && player distance2D _target < 10 && ((faction _target) find "OPF" >= 0) && (player getVariable ["pLvl",-1] > 0) && isPlayer _target};	// Просмотр статистики F3
	// Медицина 	
	COND_BANDAGE = 	"(cursorTarget != player) && (cursorTarget getVariable ['is300',false] && (cursorTarget isKindOf 'Man') && (player isKindOf 'Man') && (alive cursorTarget) && !(player getVariable ['isDrag',false]) && cursorTarget distance2D player < 2 && !(cursorTarget getVariable ['isDragged',false]) && !(cursorTarget getVariable ['isCarryed',false]) && cursorTarget getVariable ['isBlood',false] && ((items player) find 'FirstAidKit' != -1))";
	COND_REVIVE =	"(cursorTarget != player) && (cursorTarget getVariable ['is300',false] && (cursorTarget isKindOf 'Man') && (player isKindOf 'Man') && (alive cursorTarget) && !(player getVariable ['isDrag',false]) && cursorTarget distance2D player < 2 && !(cursorTarget getVariable ['isDragged',false]) && !(cursorTarget getVariable ['isCarryed',false]) && !(cursorTarget getVariable ['isBlood',false]) && (((getNumber(configFile >> 'CfgVehicles' >> typeOf player >> 'attendant') == 1) && (items player) find 'Medikit' != -1) || ({(alive _x)}count nearestObjects [cursorTarget, MD_CLASS, 8] > 0)))";

// ВклВыкл сейфзона
	CSAT_SZ = true;

// ТЕХНИКА
	#include "vVAR.sqf"