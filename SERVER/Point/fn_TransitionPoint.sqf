if(!isServer) exitWith {};
if(Stage != 5)  exitWith {};
params ["_Point"];
private _posmarker = getMarkerPos _Point;

missionnamespace setvariable ["srv_cycleworks",false,true];

if(Rezhim == 2 || {Rezhim == 3}) then {
    if(!PerehodPoint) exitWith {};
    missionNamespace setVariable ["PerehodPoint",false,true];	 
	missionNamespace setVariable ["ReinforPoint",false,true];			
	missionNamespace setVariable ["ReinforPoint1",false,true];
	
	if(ReinforPoint2) then {
        missionNamespace setVariable ["ReinforPoint2",false,true];	
	};	
};  
deleteVehicle (missionnamespace getVariable "plcsh");
	
if(System == 1 || {System == 2}) then {
    {
        if((_x distance _posmarker) < 401) then {
	        //[[_x],{param [0] addscore 5}] remoteexec ["call",2];
		    
			private _uidpl = getPlayerUID _x;
			private _sc = score _x;
            private _PlayersArray = missionnamespace getvariable "PlayersArray";
                
            _PlayersArray =+ _PlayersArray;
 
            private ["_infa"];
            {
                _infa = _x;
	            _infa params ["_uidplayer","","_stata"]; 
	            if(_uidpl == _uidplayer) then {_sc = _sc + 5;_stata set [0,_sc];};
            } forEach _PlayersArray;
            missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
			[[_PlayersArray],{
				params ["_PlayersArray"];
            }] remoteExec ["call",2];			
        };
    } forEach playableunits;
};

{if(_x isKindOf "man" && {side _x == west}) then {_x setDamage 1}} forEach allUnits;

{
    if((typeOf _x) in Car 
		|| 
	    {(typeOf _x) in Tank 
		|| 
		{(typeOf _x) in EnemyHelli 
		|| 
		{(typeOf _x) in EnemyHelliParadrop
		||
		{(typeOf _x) in EnemyAir
	}}}}) then {_x setDamage 1};
	
} forEach vehicles;
/*
{
	if((typeOf _x) in carcsat
	||
	{(typeOf _x) in tankcsat
	||
	{(typeOf _x) in csatheli
	||
	{(typeOf _x) in csatHelliParadrop
	||
	{(typeOf _x) in scatgosta
	}}}}) then {_x setDamage 1};

} foreach vehicles;
*/



private _trench = nearestObjects [_posmarker,[
  "RHS_M2_Gun_Bag","RHS_Mk19_Gun_Bag","B_supplyCrate_F","Land_Cargo_Tower_V1_ruins_F","ACE_envelope_big","ACE_envelope_small","WeaponHolder",
  "GroundWeaponHolder","WeaponHolderSimulated","TimeBombCore","Default","Land_BagFence_Round_F","Land_BagFence_Short_F"],3000];
if((count _trench) > 0) then {{deleteVehicle _x} forEach _trench};
{ deleteVehicle _x } forEach allMines;

missionNameSpace setVariable ["arrayMrkUkrep",[],true];


    {
		if (side _x == WEST) then {
        	deleteVehicle _x;
		};
    } forEach allUnits;

	
//-------------------
_Point setMarkerSize [300,300];
_Point setMarkerColor "ColorGreen";
//call to DB
_groups11 = 0;
_units11 = 0;
_liders11 = [];
{
	if (side _x == EAST) then {
		if ((leader _x) inArea [_posmarker,500,500,0,false]) then {
			_countUnits11 = count (units _x);
			_units11 = _units11 + _countUnits11;
			if (_countUnits11 > 0) then {
				_groups11 = _groups11 + 1;
				_liders11 pushBack (name (leader _x));
			};
		};
	};
} forEach allGroups;

missionNamespace setVariable ["STAT_GROUPS",_groups11,true];
missionNamespace setVariable ["STAT_UNITS",_units11,true];
missionNamespace setVariable ["STAT_LIDERS",_liders11,true];
missionNamespace setVariable ["numberOfArmy",0,true];
missionnamespace setvariable ["countEnemyMan",0,true];
missionnamespace setvariable ["countcar",0,true];
missionnamespace setvariable ["counttank",0,true];
missionNameSpace setVariable ["RTST",0,true];

private _ArrayPointDone  = missionNamespace getVariable ["ArrayPointDone",[]];
_ArrayPointDone pushback [getMarkerPos _Point,"ColorGreen"];
missionNamespace setVariable ["ArrayPointDone",_ArrayPointDone,true];
[] remoteExecCall ["srv_fnc_TaskDone"];
[] remoteExecCall ["srv_fnc_delgr"];
//sleep 30;
/*
[] spawn {
  { deleteVehicle _x } forEach allDead;
    {
        if(!isNil {_x getVariable "DeadAir"}) then {
          _x setVariable ["DeadAir",nil];
          _x setDamage 1;
        };
    } forEach vehicles;
};
*/
sleep 0.1;
pereh = true;
sleep 5;
pereh = false;
sleep 5;

_restart = missionNameSpace getVariable ["Restart",1];
sleep 0.1;
_restart = _restart + 1;
sleep 0.1;
missionNameSpace setVariable ["Restart",_restart,true];
if (_restart == 5) then
{	
	_text30 = "Рестарт сервера через 30 секунд!";
	_text20 = "Рестарт сервера через 20 секунд!";
	_text10 = "Рестарт сервера через 10 секунд!";
	sleep 5;
	_text30  remoteExec ["hint",[0,-2] select isDedicated];
    [[east,"HQ"],_text30] remoteExec ["sideChat",[0,-2] select isDedicated];
	sleep 10;
	_text20  remoteExec ["hint",[0,-2] select isDedicated];
    [[east,"HQ"],_text20] remoteExec ["sideChat",[0,-2] select isDedicated];
	sleep 10;
	_text10  remoteExec ["hint",[0,-2] select isDedicated];
    [[east,"HQ"],_text10] remoteExec ["sideChat",[0,-2] select isDedicated];
	sleep 10;
	"1233123" serverCommand "#restart";
};
sleep 300;
private _delbash = nearestObjects [_posmarker, 
	[
	"Land_Cargo_HQ_V1_ruins_F",
	"Land_Cargo_HQ_V1_F",
	"Land_TTowerBig_2_ruins_F",
	"Land_TTowerBig_2_F",
	"Land_TBox_ruins_F",
	"Land_TBox_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V1_ruins_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_House_V1_F",
	"Land_Cargo_House_V1_ruins_F",
	"Land_Cargo_Patrol_V1_ruins_F",
	"Land_HBarrier_5_F",
	"Land_BagBunker_Large_F",
	"Land_HBarrier_Big_F",
	"Land_BagBunker_Tower_F",
	"Land_HBarrierWall_corner_F",
	"Land_HBarrierWall6_F",
	"Land_CzechHedgehog_01_new_F",
	"B_GMG_01_high_F",
	"B_HMG_01_high_F"
	], 600];
if((count _delbash) > 0) then {{deleteVehicle _x} forEach _delbash};
sleep 200;
private _rem = nearestObjects [_posmarker, ["House"], 3000];
if((count _rem) > 0) then {
	{_x setDamage 0;
	sleep 0.0001;
} forEach _rem};

missionNamespace setVariable ["stamina", false,true];
missionNamespace setVariable ["traska", false,true];
missionNamespace setVariable ["MapNV", false,true];
missionNamespace setVariable ["3pw", false,true];
[] remoteExec ["srv_fnc_stamina"];

sleep 2;

missionNamespace setVariable ["Stage",1,true];
if(PointSelectionMethod == 0) then {
    [] spawn srv_fnc_createPoint;
} else {
    missionNameSpace setVariable ["NoPoints",true,true];
	missionnamespace setvariable ["ManualPoint",[],true];
};




















