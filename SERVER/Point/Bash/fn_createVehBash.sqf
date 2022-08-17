if(!isServer) exitWith {};
params ["_typeGunBash","_pos","_val","_dir","_typebash"];
private ["_fifepoint","_type1","_dbgunbash"];
_type1 = "";
_dbgunbash = "";
if(_typeGunBash == "Land_PowerGenerator_F") then {
    _type1 = _typeGunBash;
} else {
    switch (true) do {
	    case (_typebash isEqualTo "Land_Cargo_HQ_V1_F"):{_dbgunbash = "GunBash1"};
	    case (_typebash isEqualTo "Land_TTowerBig_2_F"):{_dbgunbash = "GunBash2"};
	    case (_typebash isEqualTo "Land_TBox_F"):{_dbgunbash = "GunBash3"};
    };
    if(!nachinaem_zonovo && {!DatabasePointRead}) then {
        private _dbtypegunbash = ["read", ["Bash",_dbgunbash]];
        if(_dbtypegunbash isEqualTo "") exitWith {objNull};
       _type1 = _dbtypegunbash;
    };

    if(nachinaem_zonovo) then {
       _type1 = _typeGunBash;
    };
};
_fifepoint = _type1 createVehicle _pos;
_fifepoint  setPosATL _pos;
_fifepoint setdir (_dir+_val);

if(_typeGunBash in ["RHS_TOW_TriPod_D","RHS_MK19_TriPod_USMC_D","RHS_Stinger_AA_pod_D","B_GMG_01_high_F"]) then {
    _fifepoint setvariable ["typebash",_typebash];
	private _weapon = "";
	switch (true) do {
		case (_typeGunBash isEqualTo "RHS_Stinger_AA_pod_D"):{_weapon = "Rhs_weap_stinger_Launcher_static"};
		case (_typeGunBash isEqualTo "RHS_TOW_TriPod_D"):{_weapon = "Rhs_weap_TOW_Launcher_static"};
		case (_typeGunBash isEqualTo "RHS_MK19_TriPod_USMC_D"):{_weapon = "RHS_MK19"};			
	};
	_fifepoint addEventHandler ["FiredNear",{
		if(param [0] ammo param [3] == 0) then {
			param [0] setVehicleAmmoDef 1;
			param [0] addWeaponGlobal _weapon;
			reload param [0];
	    }
	}];
	_fifepoint addEventhandler ["killed",{
	    _this spawn {
		    private _veh = param [0];
	        private _dbgunbash = "";
		    private _typebash = _veh getvariable "typebash";
		    switch (true) do {
			    case (_typebash isEqualTo "Land_Cargo_HQ_V1_F"):{_dbgunbash = "GunBash1"};
				case (_typebash isEqualTo "Land_TTowerBig_2_F"):{_dbgunbash = "GunBash2"};
				case (_typebash isEqualTo "Land_TBox_F"):{_dbgunbash = "GunBash3"};
			};		
	    	sleep 150;
		    _veh removeAllEventHandlers "killed";
		    _veh removeAllEventHandlers "FiredNear";
		    deleteVehicle _veh;
		};
	}];
};
_fifepoint

