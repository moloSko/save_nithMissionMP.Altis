// ТЕХНИКА
	VEH_CSAT_TEXTURE = ["texture\CSAT\VEH_CSAT.paa","texture\black.paa"];
	VEH_NATO_TEXTURE = ["texture\NATO\VEH_NATO.paa","texture\black.paa","texture\NATO\PLANE_NATO.paa"];

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

		["O_UGV_01_F","O_UGV_01_rcws_F"],							// БПА Саиф
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

		["B_UGV_01_F","B_UGV_01_rcws_F"],							// БПА Стампер
		["B_UAV_02_dynamicLoadout_F"] 								// БПЛА
	];

	VEH_FLAG_RUS = (VEH_CSAT # 0) + (VEH_CSAT # 1) + (VEH_CSAT # 2) + (VEH_CSAT # 3) + (VEH_CSAT # 10) + (VEH_CSAT # 18);	// Техника с русским флагом
	VEH_CAMO = (VEH_CSAT # 4) + (VEH_CSAT # 5) + (VEH_CSAT # 6) + (VEH_CSAT # 7);		// Техника с "покрывалом"

	VEH_LAND_ACCESS = [		// Доступ во всю наземную технику
		//(VEH_CSAT # 0) + (VEH_CSAT # 1) + (VEH_CSAT # 2) + (VEH_CSAT # 3) + (VEH_CSAT # 9) + (VEH_CSAT # 10) + (VEH_NATO # 0) + (VEH_NATO # 1) + (VEH_NATO # 2) + (VEH_NATO # 3) + (VEH_NATO # 9) + (VEH_NATO # 10),	// 0
		(VEH_CSAT # 4) + (VEH_NATO # 4),	// 1
		(VEH_CSAT # 5) + (VEH_NATO # 5),	// 2
		(VEH_CSAT # 6) + (VEH_CSAT # 7) + (VEH_NATO # 6) + (VEH_NATO # 7),	// 3
		(VEH_CSAT # 8) + (VEH_NATO # 8)		// 4
	];
	VEH_AIR_ACCESS = [		// Доступ во всю воздушную технику
		(VEH_CSAT # 11) + [(VEH_CSAT # 12 # 0)] + (VEH_NATO # 11) + [(VEH_NATO # 12 # 0)] + ["C_Heli_Light_01_civil_F"],	// 1
		[(VEH_CSAT # 12 # 1)] + (VEH_CSAT # 13) + [(VEH_NATO # 12 # 1)] + (VEH_NATO # 13) + (VEH_NATO # 14),				// 2
		(VEH_CSAT # 14) + (VEH_NATO # 15),		// 3
		(VEH_CSAT # 15) + (VEH_NATO # 16)		// 4
	];
	VEH_TYPE = [			// Вся техника и её классы (для опыта)
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
	
	// Подвесные модули
	VEH_MODULE = ["Land_Pod_Heli_Transport_04_fuel_F", "Land_Pod_Heli_Transport_04_box_F", "Land_Pod_Heli_Transport_04_ammo_F", "Land_Pod_Heli_Transport_04_repair_F", "Land_Pod_Heli_Transport_04_medevac_F"];
	VEH_CSAT_GROUZ = ["O_G_Van_02_transport_F"];	// Грузовкики
	VEH_TP = ["B_GEN_Offroad_01_covered_F"];		// Телепорт-машины
	
	VEH_ALL = VEH_TP + (VEH_TYPE # 0) + (VEH_TYPE # 1) + (VEH_TYPE # 2) + (VEH_TYPE # 3) + (VEH_TYPE # 4) + (VEH_TYPE # 5) + (VEH_TYPE # 6) + (VEH_TYPE # 7) + (VEH_TYPE # 8) + VEH_CSAT_GROUZ + VEH_MODULE;
	
	// Техника, которая не должна респавниться
	VEH_NOTRESP = (VEH_TYPE # 8) + (VEH_LAND_ACCESS # 0) + (VEH_LAND_ACCESS # 1) + (VEH_LAND_ACCESS # 2) + (VEH_LAND_ACCESS # 3) + (VEH_AIR_ACCESS # 0) + (VEH_AIR_ACCESS # 1) + (VEH_AIR_ACCESS # 2) + (VEH_AIR_ACCESS # 3);
