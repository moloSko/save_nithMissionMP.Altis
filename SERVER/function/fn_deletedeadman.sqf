if(!isServer) exitWith {};
params ["_unit", "_killer", "_instigator", "_useEffects"];

_killed = _unit getVariable "killed";

if(!_killed) exitWith {};

_unit setVariable ["killed",false,true];

private["_nObject","_killed","_score"];

[_unit,_killer] remoteExec ["srv_fnc_enemydeadstata",2];

[_unit] spawn {
    params ["_unit"];

    private _BashN = _unit getvariable ["BashN",0];
	private _Bash_N = _unit getvariable "Bash_N";
    if(_BashN > 0 && {!isNil "_Bash_N" && {_Bash_N}}) then {
		_unit setvariable ["Bash_N",false,true]; 
	    private _defenceBash = "";
	    switch (_unit getvariable "BashN") do {
		    case 1:{_defenceBash = "defenceBash1"};
			case 2:{_defenceBash = "defenceBash2"};
			case 3:{_defenceBash = "defenceBash3"};
		};
		private _countDefBash = missionNamespace getVariable _defenceBash;
		if(_countDefBash != 0) then {
		    _countDefBash = _countDefBash - 1;
		    missionNamespace setVariable [_defenceBash,_countDefBash];
        };			
	};
};
[_unit] spawn {
    params ["_unit"];
	private _srv_cme = _unit getVariable "srv_cme";
	if(isNil "_srv_cme") exitWith {};
	if(_srv_cme) then {
	    _unit setVariable ["srv_cme",false,true];
        private _countEnemyMan = missionnamespace getvariable "countEnemyMan";
	    _countEnemyMan = _countEnemyMan - 1;
	    missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];
    };		
};

    if(Rezhim == 3 && {HardReinfor == 1 && {Stage != 4 && {(RTST == 3 || {RTST == 2 || {RTST == 1}}) && {!PerehodPoint}}}}) then {
        if(!isNil {_unit getVariable "CountDMan"}) then {
            private _cnt = missionNamespace getVariable "CountDMan";
	        if(_cnt >= 8) then {
                missionNamespace setVariable ["CountDMan",0,true];			
	            private _datapoint = Gamer getVariable ["datapoint",[]];
	            _datapoint params ["_Point",""];
	            [_Point,3000,random 360,100 + (random 30),usmc_infantry,ai_skill] remoteExec ["srv_fnc_Paras",2];
				 [_Point,3000,random 360,100 + (random 30),usmc_infantry,ai_skill] remoteExec ["srv_fnc_Parasgosta",2];
		    } else {		
                _cnt = _cnt  + 1;
		        missionNamespace setVariable ["CountDMan",_cnt,true];
            };
	    };
    };


sleep 300;



_nObject = nearestObjects [_unit, ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","TimeBombCore","Default"], 50];
if((count _nObject)>0) then
{
    {
     deleteVehicle _x
    } forEach _nObject;
};
_unit removeAllMPEventHandlers "mpkilled";
deleteVehicle _unit;

{if((count units _x)==0)then{deleteGroup _x;}}forEach allGroups;





