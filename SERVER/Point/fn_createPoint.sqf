if(!isServer) exitWith {};
missionNameSpace setVariable ["Bash111",0,true];
missionNameSpace setVariable ["Bash222",0,true];
missionNameSpace setVariable ["Bash333",0,true];
private ["_text","_PointArray","_PointArray1","_yespl","_v","_Point","_plcsh","_NamePoint","_SelectPoint","_SelectPoint1","_testPosPoint","_posPoint","_pos","_rem"];

//waituntil {FirstInitStart == 3};

if(PointSelectionMethod == 1) then {
    if(!NoPoints) exitWith {};
    missionNameSpace setVariable ["NoPoints",false,true];
};
_PosPoint = [];
_NamePoint = "";
private _CurrentPointFind = false;
//[_posPoint,_namePoint]
if(!nachinaem_zonovo && {!DatabasePointRead}) then {
    private _ArrayPointDone = ["read", ["Point", "ArrayPointDone"]];
	private ["_markerDone"];

  
	if!(_ArrayPointDone IsEqualTo []) then {
	    {
		    _x params ["_mrkPos","_color"];
	       _markerDone = createMarker[format ["x_%1",_foreachindex],_mrkPos];
           _markerDone setMarkerShape "ELLIPSE";
           _markerDone setMarkerBrush "SolidBorder";
           _markerDone setMarkerColor _color;
           _markerDonet setMarkerSize srv_newsizep;			
		} forEach _ArrayPointDone;
	};
    private _CurrentPoint = ["read", ["Point","CurrentPoint"]];
	_CurrentPoint params ["_PosPoint_1","_NamePoint_1"];
	_PosPoint = _PosPoint_1;
	_NamePoint = _NamePoint_1;
};
if(nachinaem_zonovo) then { 
    //создаем точку 
    if(Stage != 1) exitWith {};
    if(Rezhim == 2 || {Rezhim == 3}) then {if(Stage == 2) exitWith {}};
	if(PointSelectionMethod == 0) then {
        _yespl = false;
        _v = 0;
        _PointArray = missionNamespace getVariable "PointArray";
	    if(_PointArray isEqualTo []) then {"end1" call BIS_fnc_endMission};
	    _PointArray1 = _PointArray call BIS_fnc_arrayShuffle;
        _SelectPoint = selectRandom _PointArray1;
		_SelectPoint1 =+ _SelectPoint;
        _PosPoint append (_SelectPoint1 param [0]); 
	    _NamePoint = _SelectPoint1 param [1];
        _rem = _PointArray deleteAt (_PointArray find _SelectPoint);
        missionNamespace setVariable ["PointArray",_PointArray,false];
		
	} else {
	    _PosPoint  = missionnamespace getvariable ["ManualPoint",[]];
        _localtypes = [ "NameCityCapital","NameCity","NameVillage","Airport"];
        private _arraylocation = nearestLocations [_PosPoint,_localtypes,400];
		if!(_arraylocation isEqualTo []) then {
		    _NamePoint = text (_arraylocation select 0);
		} else {
		    _NamePoint = str _PosPoint;
		};
	};
};

_Point = createMarker [format ["x_%1",_NamePoint],_posPoint];
_Point setMarkerShape "ELLIPSE";

Gamer setVariable ["datapoint",[_Point,_NamePoint],true];

_plcsh = "Land_HelipadEmpty_F" createVehicle getMarkerPos _Point;
[_plcsh,"plcsh"] call srv_fnc_setVehicleName;

missionNamespace setVariable ["defenceBash1",0];
missionNamespace setVariable ["defenceBash2",0];
missionNamespace setVariable ["defenceBash3",0];
switch true do {
    case (Rezhim == 2 || {Rezhim == 3}):{
        switch true do {
            case (Rezhim == 3):{ 
			    if(HardReinfor == 1) then {
                    missionNamespace setVariable ["CountDMan",0,true];
                };				
	            //башни
				_bash1 = ["Land_Cargo_HQ_V1_F",_Point,0,300] call srv_fnc_createBash;
				_bash2 = ["Land_TTowerBig_2_F",_Point,1,300] call srv_fnc_createBash2;
				_bash3 = ["Land_TBox_F",_Point,2,300] call srv_fnc_createBash3;
            };
		    case (Rezhim == 2):{ 
              [_Point,350] spawn srv_fnc_DefencePoint;
			}; 
        };
		if(!PodkrepCobra) then {
            missionNamespace setVariable ["PodkrepCobra",true,true];
		};			
      //----------------------точки спавна подкреплений-----------------------------------
      [_Point] spawn Srv_fnc_reinforcementsSpawnPoint;
    };
	case (Rezhim == 1):{
      //----------------------спавн охрана города----------------------------------------
      [_Point,350] spawn srv_fnc_DefencePoint;
	};
};

private _typemine = "";

switch (true) do {
	case (VANILAPODKL):{_typemine = "APERSMine"};
};	
[_Point,6,((srv_sizepoint param [0]) + 50),_typemine,50,50,50,random 360,"rectangle",west] call srv_fnc_createMinefieldPoint;

if(PointSelectionMethod == 0) then {
    if!(FNT) then {[] remoteexeccall ["srv_fnc_NewTask"]}else{missionNamespace setVariable ["FNT",false,true];};
} else {
    if(nachinaem_zonovo) then {[] remoteexeccall ["srv_fnc_NewTask"]};
};

missionNamespace setVariable ["therePoint",2,true];
missionNameSpace setVariable ["ReinforPointprocces",false,true];

TRIGGEREND = true;