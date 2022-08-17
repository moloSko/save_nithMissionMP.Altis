
// Блок функций техники
	fnc_VEH_Init = {
		private _veh = _this # 0;
		[_veh] call fnc_VEH_SetTexture;
		[_veh] call fnc_VEH_LoadBK;
		[_veh] spawn fnc_VEH_Respawn;
		true
	};
	fnc_VEH_SetTexture = {
		private _veh = _this # 0;
		private _type = typeOf _veh;
		
		private _veh_CSAT = VEH_CSAT_TEXTURE;
		private _veh_NATO = VEH_NATO_TEXTURE;
		
		switch(true) do {
		// CSAT
			case (_type in VEH_MODULE) : {		// Модули для Мишки
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
			};
			case (_type in VEH_CSAT_GROUZ) : {	// Грузовики
				_veh setObjectTextureglobal [0,"a3\soft_f_orange\van_02\data\van_body_white_co.paa"];
				_veh setObjectTextureglobal [1,"a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa"];
				_veh setObjectTextureglobal [2,"a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa"];
				_veh setObjectTextureglobal [3,"a3\soft_f_orange\van_02\data\van_body_white_co.paa"];
			};
			case (_type in (VEH_CSAT # 0) || _type in (VEH_CSAT # 13) || _type in (VEH_CSAT # 15)) :{// TRUCK + Кайман + Самолеты
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
			};
			case (_type in (VEH_CSAT # 1) || _type in (VEH_CSAT # 2) || _type in (VEH_CSAT # 16) || (_type in VEH_TP)) :{// Квилин + Ifrit + САИФ + TP
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 3)) :{// Marid
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [3, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [4, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 4) || _type in (VEH_CSAT # 7)) :{// Kamis + ZSU
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [3, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [4, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 5)) :{// Varsuk
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [3, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 6)) :{// Angara
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 8)) :{// Arta
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [3, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [4, _veh_CSAT # 1];
			};
			case (_type in (VEH_CSAT # 9)) :{// Катер
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
			};
			case (_type in (VEH_CSAT # 10) || _type in (VEH_CSAT # 12) || _type in (VEH_CSAT # 17)) :{// Шлюпка + подлодка + ORCA + БПЛА
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
			};
			case (_type in (VEH_CSAT # 11 # 0)) :{// Mohawk
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
			};
			case (_type in (VEH_CSAT # 11 # 1)) :{// Taru
				_veh setObjectTextureGlobal [0, _veh_CSAT # 1];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
			};
			case (_type in (VEH_CSAT # 14)) :{// Ксианы
				_veh setObjectTextureGlobal [0, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [1, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [2, _veh_CSAT # 0];
				_veh setObjectTextureGlobal [3, _veh_CSAT # 0];
			};
				
				
		// NATO
			case (_type in (VEH_NATO # 0)) :{// TRUCK
				_veh setObjectTextureGlobal [0, _veh_NATO # 1];
				_veh setObjectTextureGlobal [1, _veh_NATO # 0];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
				_veh setObjectTextureGlobal [3, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 1)) :{// Plower
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 1];
				_veh setObjectTextureGlobal [2, _veh_NATO # 1];
				_veh setObjectTextureGlobal [3, _veh_NATO # 1];
			};
			case (_type in (VEH_NATO # 2)) :{// Hunter
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 3)) :{// Marshal
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 1];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
				_veh setObjectTextureGlobal [3, _veh_NATO # 0];
				_veh setObjectTextureGlobal [4, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 4) || _type in (VEH_NATO # 7)) :{// Бобка + пантера + ZSU
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 0];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
				_veh setObjectTextureGlobal [3, _veh_NATO # 0];
				_veh setObjectTextureGlobal [4, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 5)) :{// Рино
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 0];
				_veh setObjectTextureGlobal [2, _veh_NATO # 1];
				_veh setObjectTextureGlobal [3, _veh_NATO # 0];
				_veh setObjectTextureGlobal [4, _veh_NATO # 0];
				_veh setObjectTextureGlobal [5, _veh_NATO # 0];
				_veh setObjectTextureGlobal [6, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 6) || _type in (VEH_NATO # 8)) :{// Сламеры + Арта
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 0];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
				_veh setObjectTextureGlobal [3, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 9)) :{// Катер
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 1];
				_veh setObjectTextureGlobal [2, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 10) || _type in (VEH_NATO # 18)) :{// Шлюпка и подлодка БПЛА
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
			};
			case (_type in (VEH_NATO # 11) || _type in (VEH_NATO # 14)) :{// p900 || Blackfoot
				_veh setObjectTextureGlobal [0, _veh_NATO # 1];
			};
			case (_type in (VEH_NATO # 12) || _type in (VEH_NATO # 13)) :{// Ghost || Чинуки
				_veh setObjectTextureGlobal [0, _veh_NATO # 1];
				_veh setObjectTextureGlobal [1, _veh_NATO # 1];
			};
			case (_type in (VEH_NATO # 15)) :{// Рыбы
				_veh setObjectTextureGlobal [0, _veh_NATO # 2];
				_veh setObjectTextureGlobal [1, _veh_NATO # 2];
				_veh setObjectTextureGlobal [2, _veh_NATO # 2];
				_veh setObjectTextureGlobal [3, _veh_NATO # 2];
			};
			case (_type in (VEH_NATO # 16)) :{// Самолеты
				_veh setObjectTextureGlobal [0, _veh_NATO # 2];
				_veh setObjectTextureGlobal [1, _veh_NATO # 2];
			};
			case (_type in (VEH_NATO # 17)) :{// БПЛА
				_veh setObjectTextureGlobal [0, _veh_NATO # 0];
				_veh setObjectTextureGlobal [1, _veh_NATO # 1];
				_veh setObjectTextureGlobal [2, _veh_NATO # 1];
			};
		};
		true
	};
	fnc_VEH_LoadBK = {
		private _veh = _this # 0;
		private _type = typeOf _veh;
		
		clearWeaponCargoGlobal _veh;clearMagazineCargoGlobal _veh;clearBackpackCargoGlobal _veh;clearItemCargoGlobal _veh;
		
		switch (true) do { 
			case (_type in (VEH_CSAT # 3)) : {				// Marid
				_veh addItemCargoGlobal ["Medikit",1];
				_veh addItemCargoGlobal ["ToolKit",1];
				_veh addItemCargoGlobal ["FirstAidKit",5];
				_veh addItemCargoGlobal ["NVGoggles",3];
				_veh addItemCargoGlobal ["MineDetector",3];
				_veh addItemCargoGlobal ["SmokeShell",3];
				_veh addItemCargoGlobal ["MiniGrenade",3];
				_veh addItemCargoGlobal ["arifle_AK12_F",4];
				_veh addItemCargoGlobal ["arifle_AKM_F",4];
				_veh addItemCargoGlobal ["arifle_AKS_F",4];
				_veh addItemCargoGlobal ["arifle_AK12U_F",4];
				_veh addItemCargoGlobal ["launch_RPG32_green_F",2];
				_veh addItemCargoGlobal ["RPG32_F",5];
				_veh addItemCargoGlobal	["RPG32_HE_F",5];
				_veh addItemCargoGlobal ["MRAWS_HEAT_F",10];
				_veh addItemCargoGlobal ["Titan_AA",10];
				_veh addItemCargoGlobal ["DemoCharge_Remote_Mag",6];
				_veh addItemCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];
				_veh addItemCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",10];
				_veh addItemCargoGlobal ["UGL_FlareWhite_F",10];
				_veh addItemCargoGlobal ["1Rnd_HE_Grenade_shell",20];
				_veh addItemCargoGlobal ["UGL_FlareCIR_F",10];
				_veh addItemCargoGlobal ["30Rnd_762x39_Mag_F",10];
				_veh addItemCargoGlobal ["30Rnd_545x39_Mag_F",10];
				_veh addItemCargoGlobal ["30Rnd_556x45_Stanag",10];
				_veh addItemCargoGlobal ["75rnd_762x39_AK12_Mag_F",5];
				_veh addItemCargoGlobal ["launch_RPG7_F",4];
				_veh addItemCargoGlobal ["RPG7_F",10];
			};
			case (_type in (VEH_CSAT # 2)) : {				// Ifrit
				_veh addItemCargoGlobal ["Medikit",1];
				_veh addItemCargoGlobal ["ToolKit",1];
				_veh addItemCargoGlobal ["FirstAidKit",10];
				_veh addItemCargoGlobal ["NVGoggles",3];
				_veh addItemCargoGlobal ["MineDetector",3];
				_veh addItemCargoGlobal ["SmokeShell",10];
				_veh addItemCargoGlobal ["MiniGrenade",5];
				_veh addItemCargoGlobal ["launch_RPG7_F",1];
			};
			case (_type == "O_Truck_02_medical_F") : {		// Med.Kamaz
				_veh addItemCargoGlobal ["Medikit",2];
				_veh addItemCargoGlobal ["FirstAidKit",10];
				_veh addItemCargoGlobal ["SmokeShell",10];
			};
			case (_type in (VEH_CSAT # 0)) : {				// Грузовики
				_veh addItemCargoGlobal ["FirstAidKit",10];
				_veh addItemCargoGlobal ["NVGoggles",2];
				_veh addItemCargoGlobal ["MineDetector",2];
			};
			case (_type == "O_Truck_02_Ammo_F") : {		     // Ammo Zemak
				// Обязательный набор	
				_veh addItemCargoGlobal     ["MRAWS_HE_F",15];
				_veh addItemCargoGlobal     ["MRAWS_HEAT_F",15];
				_veh addItemCargoGlobal     ["MRAWS_HEAT55_F",15];
				_veh addItemCargoGlobal     ["RPG32_F",15];
				_veh addItemCargoGlobal     ["RPG7_F",15];
				_veh addItemCargoGlobal     ["Titan_AA",15];
				_veh addItemCargoGlobal	    ["RPG32_HE_F",15];
				_veh addMagazineCargoGlobal ["100Rnd_580x42_Mag_F",10];
				_veh addMagazineCargoGlobal ["10Rnd_762x54_Mag",35];
				_veh addMagazineCargoGlobal ["130Rnd_338_Mag",10],;
				_veh addMagazineCargoGlobal ["150Rnd_556x45_Drum_Mag_F",10];
				_veh addMagazineCargoGlobal ["150Rnd_762x54_Box",10];
				_veh addMagazineCargoGlobal ["150Rnd_93x64_Mag",10];
				_veh addMagazineCargoGlobal ["200Rnd_556x45_Box_F",10];
				_veh addMagazineCargoGlobal ["200Rnd_65x39_cased_Box",10];
				_veh addMagazineCargoGlobal ["20Rnd_762x51_Mag",35];
				_veh addMagazineCargoGlobal ["30Rnd_545x39_Mag_F",35];
				_veh addMagazineCargoGlobal ["30Rnd_556x45_Stanag",35];
				_veh addMagazineCargoGlobal ["30Rnd_580x42_Mag_F",35];
				_veh addMagazineCargoGlobal ["30Rnd_762x39_Mag_F",35];
				_veh addMagazineCargoGlobal ["75rnd_762x39_AK12_Mag_F",10];
				_veh addItemCargoGlobal     ["UGL_FlareCIR_F",30];
				_veh addItemCargoGlobal     ["UGL_FlareGreen_F",30];
				_veh addItemCargoGlobal     ["UGL_FlareWhite_F",30];
				_veh addItemCargoGlobal     ["SmokeShell",30];
				_veh addItemCargoGlobal     ["1Rnd_HE_Grenade_shell",20];
				_veh addItemCargoGlobal     ["MiniGrenade",20];
				_veh addItemCargoGlobal     ["DemoCharge_Remote_Mag",10];
				_veh addItemCargoGlobal     ["ToolKit",5];
				_veh addItemCargoGlobal     ["Medikit",5];
				_veh addItemCargoGlobal     ["acc_pointer_IR",12];
			};
			case (_type in (VEH_TYPE # 5)) : {				// Вертолеты
				_veh addBackpackCargoGlobal ["B_Parachute",8];
			};
			case (_type in (VEH_TYPE # 6)) : {				// Самолеты
				_veh addBackpackCargoGlobal ["B_Parachute",1];
			};
			case (_type in (VEH_TYPE # 3)) : {				// Танки
				_veh addItemCargoGlobal ["Medikit",1];
				_veh addItemCargoGlobal ["ToolKit",1];
				_veh addItemCargoGlobal ["FirstAidKit",10];
			};
			case (_type in (VEH_TYPE # 7)) : {				// Лодки
				_veh addItemCargoGlobal     ["Medikit",1];
				_veh addItemCargoGlobal     ["FirstAidKit",10];
				_veh addBackpackCargoGlobal ["B_SCBA_01_F",4];
				_veh addItemCargoGlobal     ["V_RebreatherIR",4];
				_veh addItemCargoGlobal     ["arifle_Katiba_F",4];
				_veh addItemCargoGlobal     ["30Rnd_65x39_caseless_green",10];
				_veh addItemCargoGlobal     ["30Rnd_65x39_caseless_green_mag_Tracer",10];
				_veh addItemCargoGlobal     ["G_O_Diving",4];
			};
		};
		true
	};
	fnc_VEH_SetCamo = {

		true
	};
	fnc_VEH_Respawn = {
		private _veh = _this # 0;
		private _vName = vehicleVarName _veh;
		private _vDir = getDir _veh;
		private _vPos = getPos _veh; 
		private _vType = typeOf _veh; 
		private _vPylon = GetPylonMagazines _veh;
		private _vAnim = animationNames _veh;
		private _vAnimArr = [];{ _phase = _veh animationPhase _x; _vAnimArr pushBack [_x,_phase]; } foreach _vAnim;

		sleep 3;
		_veh enableDynamicSimulation false;
		_veh enableSimulationGlobal true;

		
		private _while = true;
		private _type = 0;
		while {_while} do {

			sleep 180;
			
			// Целая техника и нету экипажа
			
			if (( alive _veh ) && { { ( alive _x ) } count ( crew _veh ) == 0 } && ({(_veh inArea _x)}count CSAT_Z_BASE <= 0) && ((position _veh) distance2D _vPos > 100) && ({_x distance2D _veh < 300}count playableUnits == 0))exitWith{_while=false;_type=0;};
			
			// Техника уничтожена
			
			if ( !( alive _veh ) && { { ( alive _x ) } count ( crew _veh ) == 0 } && ({(_veh inArea _x)}count CSAT_Z_BASE > 0)) exitWith {_while=false;_type=0;};
			if ( !( alive _veh ) && { { ( alive _x ) } count ( crew _veh ) == 0 } && ({(_veh inArea _x)}count CSAT_Z_BASE <= 0)) exitWith {_while=false;_type=1;};
		};

		if(_vType in VEH_NOTRESP && _type == 1)then{waitUntil{sleep 60; (onTrigger == 0)};};
			
		deleteVehicle _veh;
		sleep 3;
		
		_veh = createVehicle [ _vType, [0,0,(100 + random 700)], [], 0, "none" ];
		_veh setDir _vDir;
		_veh setPos [ ( _vPos # 0 ), ( _vPos # 1 ), 0 ];
		
		if (_vName != "") then { _veh setVehicleVarName _vName; missionNamespace setVariable [_vName, _veh]; publicVariable _vName; };
		
		{_veh animateSource [_x # 0, _x # 1,true]; }forEach _vAnimArr;
		
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veh;
		{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths # _forEachIndex] } forEach _vPylon;
		
		if (_vType in (VEH_TYPE # 8)) then {createVehicleCrew _veh;};
		
		[_veh] call fnc_VEH_Init;
		true
	};

// Фукция определения опыта
	fnc_EH_Score = {
		
	};