
	s_DB = false;	// Подключилась ли БД

	p_DATA = ["pLvl","pExp","pCYP","pBTV","pRP","pKMB","pSkill","pBoss","pKarma","pTime","pTitle","pAdmin","pRegDate","pRegName","pDiscord"];
	p_DATA_SET = [5,50,[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0],[0,0,0,0],0,[0,0,0,0],0,[0,0,0,0],"","",0];

	// Объекты триггера (которым нужно вкл. симуляцию)
	ALL_OBJ_SIMULATION = ["Land_Cargo_Tower_V3_F", "Land_Cargo_House_V3_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_HQ_V3_F","B_static_AA_F","B_static_AT_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F"];

	CSAT_Z_ARS = ["CSAT_ARS_1","CSAT_ARS_2"];
	CSAT_Z_REP = ["CSAT_REP_1","CSAT_REP_2"];
	CSAT_Z_SZ = ["CSAT_SZ_1","CSAT_SZ_2"];
	CSAT_Z_BASE = ["CSAT_BASE","CSAT_PIRS"];

// ТЕХНИКА
	#include "vVAR.sqf"