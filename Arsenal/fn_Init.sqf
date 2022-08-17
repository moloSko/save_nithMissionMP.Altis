	
	/*
		ИНИЦАЛИЗАЦИЯ АРСЕНАЛА ДЛЯ ИГРОКА
	*/
	
	private _Slot = player getVariable ["Slot","Rifleman"];
	
	#include "i\CSAT.sqf"
	
	if((getPlayerUID player) == "76561199193215585")then{ _vest = _vest + ["V_PlateCarrierH_CTRG","V_PlateCarrierL_CTRG"]; _unitform = _unitform + ["U_B_CTRG_1","U_B_CTRG_3","U_B_CTRG_2","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_CTRG_Soldier_urb_2_F","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_3_Arid_F","U_B_CTRG_Soldier_Arid_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_2_Arid_F"]; };
	
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
	
	