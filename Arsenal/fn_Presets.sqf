
	/*
		ПРЕСЕТЫ СНАРЯЖЕНИЯ
	*/
	
	private _type = _this # 0;
	
	removeAllWeapons player; removeAllItems player; removeAllAssignedItems player; removeUniform player; removeVest player; removeBackpack player; removeHeadgear player; removeGoggles player;

	switch (_type) do {
		case "NLS",
		case "NCYP",
		case "NBTV",
		case "NSH" : {
			player addHandgunItem "10Rnd_9x21_Mag";
			player forceAddUniform "U_O_T_Officer_F";
			player addVest "V_Rangemaster_belt";
			player addWeapon "Binocular";
			for "_i" from 1 to 5 do {player addItemToVest "FirstAidKit";};
			player addHeadgear "H_MilCap_ghex_F";
			player addGoggles "G_Aviator";
		};
		case "Rifleman" : {
			player addWeapon "arifle_AK12U_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "30rnd_762x39_AK12_Lush_Mag_F";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Binocular";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "30rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			player addHeadgear "H_HelmetIA";
		};
		case "Gunner1" : {
			player addWeapon "arifle_RPK12_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "75rnd_762x39_AK12_Lush_Mag_F";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Binocular";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 4 do {player addItemToVest "75rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			player addItemToBackpack "75rnd_762x39_AK12_Lush_Mag_F";
			player addHeadgear "H_HelmetIA";
		};
		case "AT" : {
			player addWeapon "arifle_AK12U_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "30rnd_762x39_AK12_Lush_Mag_F";
			player addWeapon "launch_MRAWS_olive_F";
			player addSecondaryWeaponItem "MRAWS_HEAT_F";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Rangefinder";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "30rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			for "_i" from 1 to 2 do {player addItemToBackpack "MRAWS_HEAT_F";};
			player addHeadgear "H_HelmetIA";
		};
		case "AA" : {
			player addWeapon "arifle_AK12U_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "30rnd_762x39_AK12_Lush_Mag_F";
			player addWeapon "launch_I_Titan_F";
			player addSecondaryWeaponItem "Titan_AA";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Rangefinder";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "30rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			player addItemToBackpack "Titan_AA";
			player addHeadgear "H_HelmetIA";
		};
		case "Marksman" : {
			player addWeapon "srifle_DMR_01_F";
			player addPrimaryWeaponItem "optic_DMS_ghex_F";
			player addPrimaryWeaponItem "10Rnd_762x54_Mag";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Binocular";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 10 do {player addItemToVest "10Rnd_762x54_Mag";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			player addHeadgear "H_HelmetIA";
		};
		case "Medic" : {
			player addWeapon "arifle_AK12U_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "30rnd_762x39_AK12_Lush_Mag_F";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Binocular";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "30rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 20 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
			player addItemToBackpack "Medikit";
			player addHeadgear "H_HelmetIA";
		};
		case "Engineer" : {
			player addWeapon "arifle_AK12U_lush_F";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player addPrimaryWeaponItem "30rnd_762x39_AK12_Lush_Mag_F";
			player forceAddUniform "U_I_CombatUniform";
			player addVest "V_TacVest_oli";
			player addBackpack "B_AssaultPack_dgtl";
			player addWeapon "Binocular";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "30rnd_762x39_AK12_Lush_Mag_F";};
			for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
			for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
			player addItemToBackpack "ToolKit";
			for "_i" from 1 to 2 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
			player addHeadgear "H_HelmetIA";
		};
		case "Sniper" : {
			player addWeapon "srifle_GM6_camo_F";
			player addPrimaryWeaponItem "optic_KHS_hex";
			player addPrimaryWeaponItem "5Rnd_127x108_Mag";
			player forceAddUniform "U_O_FullGhillie_ard";
			player addVest "V_PlateCarrier1_rgr_noflag_F";
			player addBackpack "B_LegStrapBag_olive_F";
			player addMagazine "Laserbatteries";
			player addWeapon "Laserdesignator";
			for "_i" from 1 to 5 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToVest "5Rnd_127x108_Mag";};
			for "_i" from 1 to 3 do {player addItemToVest "5Rnd_127x108_APDS_Mag";};
			for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShell";};
		};
		case "Heli" : {
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "11Rnd_45ACP_Mag";
			player forceAddUniform "U_I_pilotCoveralls";
			player addWeapon "Binocular";
			for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 2 do {player addItemToUniform "SmokeShell";};
			player addItemToUniform "11Rnd_45ACP_Mag";
			player addHeadgear "H_PilotHelmetHeli_O";
		};
		case "Plane" : {
			player addWeapon "hgun_Pistol_heavy_01_F";
			player addHandgunItem "11Rnd_45ACP_Mag";
			player forceAddUniform "U_O_PilotCoveralls";
			player addWeapon "Binocular";
			for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
			for "_i" from 1 to 2 do {player addItemToUniform "SmokeShell";};
			player addItemToUniform "11Rnd_45ACP_Mag";
			player addHeadgear "H_PilotHelmetFighter_O";
		};
		case "BTV" : {
			player addWeapon "arifle_AKS_F";
			player addPrimaryWeaponItem "30Rnd_545x39_Mag_F";
			player forceAddUniform "U_Tank_green_F";
			player addItemToUniform "30Rnd_545x39_Mag_F";
			player addHeadgear "H_Tank_black_F";
		};
	};

	player addItemToUniform "MineDetector";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
	player linkItem "ItemGPS";