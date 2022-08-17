if(!isServer) exitWith {};
private _vanila_podkl = true;
missionNameSpace setVariable ["VANILAPODKL",_vanila_podkl,true];
missionNameSpace setVariable ["nachinaem_zonovo",true,true];

call compile preprocessfilelinenumbers "server\function\fn_params.sqf";

PointArrayDone = false;
private ["_centrmap","_PointArray","_localtypes","_arraylocation",
        "_cntlocation","_point","_posPoint","_namePoint","_maker"];

if(PointSelectionMethod == 0) then {
    if(!nachinaem_zonovo) then {
        missionNamespace setVariable ["PointArray",_PointArray,false];
    }else{
	    _centrmap = [worldSize/2,worldSize/2];
        missionNamespace setVariable ["PointArray",[],false];
        _PointArray = missionNamespace getVariable "PointArray";
        _localtypes = [ "NameCityCapital","NameCity","NameVillage","Airport"];
        _arraylocation = nearestLocations [_centrmap,_localtypes,worldSize/2];
        _cntlocation = (count _arraylocation) -1;
        for "_i" from 0 to _cntlocation do {
            _point = _arraylocation select _i;
            _posPoint = position _point;
            _namePoint = text _point;
            if ((_NamePoint != "Gravia") && (_NamePoint != "Telos") && (_NamePoint != "Anthrakia") && (_NamePoint !="Ekali") && (_NamePoint !="Delfinaki") && (_NamePoint !="Agia Triada")) then {
                if(_namePoint != "") then {_PointArray pushBackUnique [_posPoint,_namePoint]};
            };
        };
        missionNamespace setVariable ["PointArray",_PointArray,false];
    };
};
//-------------------------------------------------------------------------------------------------------------

switch true do {
	case (VANILAPODKL):{call compile preprocessfilelinenumbers "server\arma3\nato.sqf";call compile preprocessfilelinenumbers "server\arma3\CSAT.sqf"};
};

if(nachinaem_zonovo) then {
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["therePoint",1,true];  
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["ReinforPoint",false,true];
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["ReinforPoint1",false,true];
    //----------------------------------------------------------------------------
    missionNameSpace setVariable ["ReinforPoint2",false,true];
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["PerehodPoint",false,true];
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["PodkrepCobra",true,true];
    //--------------------------------------------------------------------------
    missionNamespace setVariable ["DatabasePointRead",false,true];
    missionNamespace setVariable ["REINFORCEMENT",[]];
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["FNRT",true,true];
    //--------------------------------------------------------------------------
    missionNameSpace setVariable ["NoPoints",true,true];

    missionNameSpace setVariable ["Stage",1,true];
    missionNamespace setVariable ["ArrayPointDone",[],true];
	missionnamespace setvariable ["PlayersArray",[],true];

}else{
    //--------------------------------------------------------------------------
    private _therePoint = ["read",["GlobalVariables","therePoint"]];
    missionNamespace setVariable ["therePoint",_therePoint,true];
    //--------------------------------------------------------------------------
    private _ReinforPoint = ["read",["GlobalVariables","ReinforPoint"]];
    missionNamespace setVariable ["ReinforPoint",_ReinforPoint,true];
    //--------------------------------------------------------------------------
    private _ReinforPoint1 = ["read",["GlobalVariables","ReinforPoint1"]];
    missionNamespace setVariable ["ReinforPoint1",_ReinforPoint1,true];
    //--------------------------------------------------------------------------
    private _ReinforPoint2 = ["read",["GlobalVariables","ReinforPoint2"]];
    missionNamespace setVariable ["ReinforPoint2",_ReinforPoint2,true];
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    private _PerehodPoint = ["read",["GlobalVariables","PerehodPoint"]];
    missionNamespace setVariable ["PerehodPoint",_PerehodPoint,true];
    //--------------------------------------------------------------------------
    private _PodkrepCobra = ["read",["GlobalVariables","PodkrepCobra"]];
    missionNamespace setVariable ["PodkrepCobra",_PodkrepCobra,true];
    //----------------------------------------------------------------------------
    missionNamespace setVariable ["DatabasePointRead",false,true];
	//--------------------------------------------------------------------------
	private _FNRT = ["read",["GlobalVariables","FNRT"]];
    missionNamespace setVariable ["FNRT",_FNRT,true];
	//--------------------------------------------------------------------------
	private _datapoint = ["read",["GlobalVariables","datapoint"]];
	Gamer setVariable ["datapoint",_datapoint,true,true];
	//-------------------------------------------------------------------------
	private _NoPoints = ["read",["GlobalVariables","NoPoints"]];
    missionNameSpace setVariable ["NoPoints",_NoPoints,true];

    private _Stage = ["read",["GlobalVariables","Stage"]];
    missionNamespace setVariable ["Stage",_Stage,true];
    //------------------------------------------------------------
	
	private _PlayersArray = ["read",["Players","PlayersArray"]];
	if!(_PlayersArray isEqualTo []) then {
	    missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
	} else {
	    missionnamespace setvariable ["PlayersArray",[],true];
	};	
    //---------------------------------------------------------------	
	private _PlayerInventory = ["read", ["ArrayPlayers","PlayerInventory"]];
    if(typeName _PlayerInventory == "BOOL")then {
	    ["write",["ArrayPlayers","PlayerInventory",[]]];
    };

	private _BoxInventory = ["read",["Box","BoxInventory"]];
	if(typeName _BoxInventory == "BOOL") then {["write",["Box","BoxInventory",[]]]};
};  

//RTST = 3 (3 башни созданы) или RTST = 2 (2 башни созданы) или RTST = 1 (1 башня создана)/RTST = 0 (башни еще не существуют или уже уничтожены)
missionNameSpace setVariable ["RTST",0,true];
	
missionNameSpace setVariable ["FNT",true,true];

Gamer setVariable ["datapoint",[],true];

missionNamespace setVariable ["GameEnd",false,true];

missionnamespace setVariable ["actVPP",true,true];

missionNamespace setVariable ["VPP",objNull,true];

missionNamespace setVariable ["NumFlagVPP",1,true];
//количество ветушек базы
missionnamespace setVariable ["HelliBaseEast",0,true];

missionnamespace setVariable ["SupportArray",[],true];

missionNameSpace setVariable ["arrayMrkUkrep",[],true];

missionnamespace setvariable ["countEnemyMan",0,true];

missionnamespace setvariable ["countcar",0,true];

missionnamespace setvariable ["counttank",0,true];
    
//позиция в ручную выбранной точки
missionnamespace setvariable ["ManualPoint",[],true];

East setFriend [West, 0];
West setFriend [East, 0];

missionnamespace setvariable ["InitStartDone",true,true];
missionnamespace setvariable ["srv_cycleworks",false,true];