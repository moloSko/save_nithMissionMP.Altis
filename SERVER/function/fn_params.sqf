if(nachinaem_zonovo) then {
    private _PointSelectionMethod = "PointSelectionMethod" call BIS_fnc_getParamValue;
    missionNameSpace setVariable ["PointSelectionMethod",_PointSelectionMethod,true];
//---------------------------------------------------------------------------------------------	
    private _HaloJump = "HaloJump" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["HaloJump",_HaloJump,true];
//---------------------------------------------------------------------------------------------	
    private _MarkerDrawIcon3D = "MarkerDrawIcon3D" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["MarkerDrawIcon3D",_MarkerDrawIcon3D,true];
//---------------------------------------------------------------------------------------------	
    private _MapMarker = "MapMarker" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["MapMarker",_MapMarker,true];
//---------------------------------------------------------------------------------------------	
    private _GroupRecon = "GroupRecon" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["GroupRecon",_GroupRecon,true];
//---------------------------------------------------------------------------------------------	
    private _aimingspeedvalue = "aimingspeedvalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["aimingspeedvalue",_aimingspeedvalue,true];
//---------------------------------------------------------------------------------------------	
    private _aimingaccuracyvalue = "aimingaccuracyvalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["aimingaccuracyvalue",_aimingaccuracyvalue,true];
//---------------------------------------------------------------------------------------------	
    private _aimingshakevalue = "aimingshakevalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["aimingshakevalue",_aimingshakevalue,true];
//---------------------------------------------------------------------------------------------	
    private _spotdistancevalue = "spotdistancevalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["spotdistancevalue",_spotdistancevalue,true];
//---------------------------------------------------------------------------------------------	
    private _spottimevalue = "spottimevalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["spottimevalue",_spottimevalue,true];
//---------------------------------------------------------------------------------------------	
    private _commandingvalue = "commandingvalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["commandingvalue",_commandingvalue,true];
//---------------------------------------------------------------------------------------------	
    private _couragevalue = "couragevalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["couragevalue",_couragevalue,true];
//---------------------------------------------------------------------------------------------	
    private _reloadSpeedvalue = "reloadSpeedvalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["reloadSpeedvalue",_reloadSpeedvalue,true];
//---------------------------------------------------------------------------------------------	
    private _generalvalue = "generalvalue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["generalvalue",_generalvalue,true];
//---------------------------------------------------------------------------------------------	
    private _AirPatrol = "AirPatrol" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["AirPatrol",_AirPatrol,true];
//---------------------------------------------------------------------------------------------	
	private _Rezhim = "Rezhim" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["Rezhim",_Rezhim,true];
//---------------------------------------------------------------------------------------------
    private _MiningBash = "MiningBash" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["MiningBash",_MiningBash,true];
//---------------------------------------------------------------------------------------------------
    private _HardReinfor = "HardReinfor" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["HardReinfor",_HardReinfor,true];
//---------------------------------------------------------------------------------------------	
    private _System = "System" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["System",_System,true];
//---------------------------------------------------------------------------------------------	
    private _AccessSpawner = "AccessSpawner" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["AccessSpawner",_AccessSpawner,true];
//---------------------------------------------------------------------------------------------	
    private _Fatigue = "Fatigue" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["Fatigue",_Fatigue,true];
//---------------------------------------------------------------------------------------------	
    private _thermalImager = "thermalImager" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["thermalImager",_thermalImager,true];

//-----------------------------------------------------------------------------------------------------------	
    private _srv_movingBox = "srv_movingBox" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["srv_movingBox",_srv_movingBox,true];
//-------------------------------------------------------------------------------------------------------------
    private _srv_CountKillBots = "srv_CountKillBots" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["srv_CountKillBots",_srv_CountKillBots,true];	
//------------------------------------------------------------------------------------------------
    private _MoveBasePoint = "MoveBasePoint" call BIS_fnc_getParamValue;
	missionNameSpace setVariable ["MoveBasePoint",_MoveBasePoint,true];
//------------------------------------------------------------------------------------------------	
}else{
	
    private _PointSelectionMethod = ["read",["Params","PointSelectionMethod"]];
    missionNameSpace setVariable ["PointSelectionMethod",_PointSelectionMethod,true];

    private _HaloJump = ["read",["Params","HaloJump"]];
	missionNameSpace setVariable ["HaloJump",_HaloJump,true];
	
    private _MarkerDrawIcon3D = ["read",["Params","MarkerDrawIcon3D"]];
	missionNameSpace setVariable ["MarkerDrawIcon3D",_MarkerDrawIcon3D,true];
	
    private _MapMarker = ["read",["Params","MapMarker"]];
	missionNameSpace setVariable ["MapMarker",_MapMarker,true];
	
    private _GroupRecon = ["read",["Params","GroupRecon"]];
	missionNameSpace setVariable ["GroupRecon",_GroupRecon,true];
	
    private _aimingspeedvalue = ["read",["Params","aimingspeedvalue"]];
	missionNameSpace setVariable ["aimingspeedvalue",_aimingspeedvalue,true];
	
    private _aimingaccuracyvalue = ["read",["Params","aimingaccuracyvalue"]];
	missionNameSpace setVariable ["aimingaccuracyvalue",_aimingaccuracyvalue,true];
	
    private _aimingshakevalue = ["read",["Params","aimingshakevalue"]];
	missionNameSpace setVariable ["aimingshakevalue",_aimingshakevalue,true];
	
    private _spotdistancevalue = ["read",["Params","spotdistancevalue"]];
	missionNameSpace setVariable ["spotdistancevalue",_spotdistancevalue,true];
	
    private _spottimevalue = ["read",["Params","spottimevalue"]];
	missionNameSpace setVariable ["spottimevalue",_spottimevalue,true];
	
    private _commandingvalue = ["read",["Params","commandingvalue"]];
	missionNameSpace setVariable ["commandingvalue",_commandingvalue,true];
	
    private _couragevalue = ["read",["Params","couragevalue"]];
	missionNameSpace setVariable ["couragevalue",_couragevalue,true];
	
    private _reloadSpeedvalue = ["read",["Params","reloadSpeedvalue"]];
	missionNameSpace setVariable ["reloadSpeedvalue",_reloadSpeedvalue,true];
	
    private _generalvalue = ["read",["Params","generalvalue"]];
	missionNameSpace setVariable ["generalvalue",_generalvalue,true];
	
	private _AirPatrol = ["read",["Params","AirPatrol"]];
	missionNameSpace setVariable ["AirPatrol",_AirPatrol,true];
	
    private _Rezhim = ["read",["Params","Rezhim"]];
	missionNameSpace setVariable ["Rezhim",_Rezhim,true];
	
    private _MiningBash = ["read",["Params","MiningBash"]];
	missionNameSpace setVariable ["MiningBash",_MiningBash,true];
   
	private _HardReinfor = ["read",["Params","HardReinfor"]];
	missionNameSpace setVariable ["HardReinfor",_HardReinfor,true];
	
    private _System = ["read",["Params","System"]];
	missionNameSpace setVariable ["System",_System,true];
	
    private _AccessSpawner = ["read",["Params","AccessSpawner"]];
	missionNameSpace setVariable ["AccessSpawner",_AccessSpawner,true];
	
    private _ChernarusEdit = ["read",["Params","ChernarusEdit"]];
	missionNameSpace setVariable ["ChernarusEdit",_ChernarusEdit,true];
	
    private _Fatigue = ["read",["Params","Fatigue"]];
	missionNameSpace setVariable ["Fatigue",_Fatigue,true];
	
    private _thermalImager = ["read",["Params","thermalImager"]];
	missionNameSpace setVariable ["thermalImager",_thermalImager,true];
    
    private _srv_movingBox = ["read",["Params","srv_movingBox"]];
	missionNameSpace setVariable ["srv_movingBox",_srv_movingBox,true];
	
    private _srv_CountKillBots = ["read",["Params","srv_CountKillBots"]];
	missionNameSpace setVariable ["srv_CountKillBots",_srv_CountKillBots,true];
	
	private _MoveBasePoint = ["read",["Params","MoveBasePoint"]];
	missionNameSpace setVariable ["MoveBasePoint",_MoveBasePoint,true];
};
private _numKillBots = switch (srv_CountKillBots) do {
    case 1:{5};
    case 2:{6};
    case 3:{7};
	case 4:{8};
	case 5:{9};
    case 6:{10};
};
missionNameSpace setVariable ["numKillBots",_numKillBots,true];

mpar = true;


missionNameSpace setVariable ["srv_sizepoint",[400,400],true];

srv_sizepoint params ["_a","_b"];

missionNameSpace setVariable ["srv_newsizep",[_a - 150,_b - 150],true];

missionNameSpace setVariable ["srv_sizepointpara",[_a + 200,_b + 200],true];

private _hj = switch (HaloJump) do {
  case 1:{0};//без ограничений
  case 2:{120};//2 мин
  case 3:{240};//4 мин	
  case 4:{360};//6 мин	
  case 5:{480};//8 мин	
  case 6:{600};//10 мин			
};
missionNameSpace setVariable ["hj",_hj,true];