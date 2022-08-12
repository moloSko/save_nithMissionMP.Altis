params ["_ps","_spwndir","_type","_markpos","_val"];
		  
private _grp = createGroup west;
private _v = random 100 - (random 200);

private _height = 0;
private _height1 = 0;

switch _val do {
    case 2:{
	    _height =300;
	    _height1 = 150;
    };
    case 3:{
	   _height = 150;
	   _height1 = 100;
    };	
};
private _ps1 = [(_ps select 0) + _v,(_ps select 1) + _v, _height];

private _arair1 = [_ps1,_spwndir,_type,_grp] call BIS_fnc_spawnVehicle;
private _ve = _arair1 select 0;
private _crew = _arair1 # 1;
{
  _x addEventhandler ["killed",{
    params ["_unit", "_killer", "_instigator", "_useEffects"];
   // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
  }];
} forEach _crew;

[_ve,"srv_air"] call srv_fnc_setVehicleName; 



{
    [_x] call srv_fnc_fset_AISkill;
	_x setVariable ["killed",true,true];
    _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
	[_x] call srv_fnc_rearmbot;
} forEach (crew _ve);

_ve flyInHeight _height1;

_grp setCombatMode "RED";
_grp setBehaviour "COMBAT";
_grp setSpeedMode "FULL";
_ve setVariable ["UIDPlayerDam",[],true];
_ve setVariable ["NumberOneDamage",[],true];
_ve setVariable ["DeadAir",1,true];
_ve setVariable ["killed",true,true];	
_ve addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2}];
_ve addEventhandler ["killed",{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
  	//[_unit,_killer,_instigator,3] spawn bt_fnc_addScore;
    _this spawn {
		switch AirPatrol do {
            case 2:{[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle};
	        case 3:{[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle};
	        case 4:{
		        if((random 10)>5) then {
			       [selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle;
			    } else {
			       [selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle;
			    };
		    };
        };
	};
	_this spawn srv_fnc_DeleteWreckVehicle;
}];

private _CIRCLE = "";
switch _val do {
    case 2:{
        for "_i" from 1 to 10 do {
	        if(_i==1) then  {
	            _wp = _grp addWaypoint [_markpos,0];
                _wp setWaypointType "SAD";
                _wp setWaypointSpeed "FULL";
                _wp setWaypointBehaviour "COMBAT";
                _wp setWaypointCombatMode "RED";			
                _wp setWaypointCompletionRadius 200;
	        } else {	
		        _wp = _grp addWaypoint [_markpos,500, _i];
                [_grp, _i] setWaypointType "SAD";
			    [_grp, _i] setWaypointSpeed "FULL";
			    [_grp, _i] setWaypointBehaviour "COMBAT";
			    [_grp, _i] setWaypointCombatMode "RED";
                [_grp, _i] setWaypointCompletionRadius 200;
			    [_grp, _i] setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];
            };
        };
        _wp = _grp addWaypoint [_markpos,0];
        _wp setWaypointType "CYCLE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointBehaviour "COMBAT";
        _wp setWaypointCombatMode "RED";	
        _wp setWaypointCompletionRadius 200;
        _wp setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];
    }; 
    case 3:{
        for "_i" from 1 to 10 do  {
	        if(_i==1) then  {
	            _wp = _grp addWaypoint [_markpos,0];
                _wp setWaypointType "SAD";
			    _wp setWaypointSpeed "FULL";
			    _wp setWaypointBehaviour "COMBAT";
			    _wp setWaypointCombatMode "RED";			
	            _wp setWaypointCompletionRadius 200;
	        } else {	
		        if((_i mod 2) == 0) then {
			        //_CIRCLE = if(random 10 > 5) then {"CIRCLE"} else {"CIRCLE_L"};
					_CIRCLE = selectRandom ["CIRCLE","CIRCLE_L"];
				    _wp = _grp addWaypoint [_markpos, 0, _i];
			        [_grp, _i] setWaypointType "LOITER";
			        [_grp, _i] setWaypointLoiterType _CIRCLE;
			        [_grp, _i] setWaypointLoiterRadius (400 + (random 200));
			        [_grp, _i] setWaypointSpeed "FULL";
			        [_grp, _i] setWaypointBehaviour "COMBAT";
			        [_grp, _i] setWaypointCombatMode "RED";
			        [_grp, _i] setWaypointCompletionRadius 200;
					[_grp, _i] setWaypointTimeout [2,4,8];
				    //[_grp, _i] setWaypointTimeout [1,2,3];				
			    } else {
                    _wp = _grp addWaypoint [_markpos, 0, _i];
                    [_grp, _i] setWaypointType "SAD";
			        [_grp, _i] setWaypointSpeed "FULL";
			        [_grp, _i] setWaypointBehaviour "COMBAT";
			        [_grp, _i] setWaypointCombatMode "RED";
                    [_grp, _i] setWaypointCompletionRadius 200;
			        [_grp, _i] setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];
			    };			
		    };
		};
        _wp = _grp addWaypoint [_markpos,0];
        _wp setWaypointType "CYCLE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointBehaviour "COMBAT";
        _wp setWaypointCombatMode "RED";	
        _wp setWaypointCompletionRadius 200;
        _wp setWaypointStatements ["true","(vehicle this) spawn srv_fnc_checkfuel"];
    };
};
	
/*while {alive _ve} do {
   sleep 5;
   hint str (getPosVisual _ve select 2);
};*/