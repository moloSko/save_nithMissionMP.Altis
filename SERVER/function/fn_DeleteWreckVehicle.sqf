if(!isServer) exitWith {};

params ["_veh","_killer","_instigator","_useEffects"];

_killed = _veh getVariable "killed";

if(!_killed) exitWith {};

_veh setVariable ["killed",false,true];

private _type = typeOf _veh;

[_veh,_killer] remoteExec ["srv_fnc_enemydeadstata",2];

if(_type in EnemyHelli) then { 
    if(!isNil{_veh getVariable "PodkrepCobraApach"}) then {
        if(!PodkrepCobra) then {
		    missionNameSpace setVariable ["PodkrepCobra",true,true];		
	    };
	};
};

switch true do {
    case (_type in Car):{
		private _countcar =  missionnamespace getvariable "countcar";   
		_countcar = _countcar - 1;
        missionnamespace setvariable ["countcar",_countcar,true];		
    };
    case (_type in Tank):{
		private _counttank = missionnamespace getvariable "counttank";
		_counttank = _counttank - 1;
		missionnamespace setvariable ["counttank",_counttank,true];
    };			
};


[_veh] remoteExec ["srv_fnc_DeleteAttachedObjCargo",2];

sleep 150;

if(Rezhim == 3 && {HardReinfor == 1 && {Stage != 4 && {(RTST == 3 || {RTST == 2 || {RTST == 1}}) && {!PerehodPoint}}}}) then {
    private _REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";
	private _datapoint = Gamer getVariable ["datapoint",[]];
	_datapoint params ["_Point",""];
	switch true do {
	    case (_veh isKindOf "Car"):{
            [_Point,_REINFORCEMENT,Car,ai_skill] remoteExecCall ["srv_fnc_ReinforVehicle",2]; 
		};
	    case (_veh isKindOf "Tank"):{
            [_Point,_REINFORCEMENT,Tank,ai_skill] remoteExecCall ["srv_fnc_ReinforVehicle",2]; 
		};
	
	};
};

_veh removeAllEventHandlers "killed";
_veh removeAllEventHandlers "GetIn";
_veh removeAllEventHandlers "HandleDamage";

deleteVehicle _veh;
