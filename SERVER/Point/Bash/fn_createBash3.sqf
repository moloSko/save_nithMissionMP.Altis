if(!isServer) exitWith {};
missionNameSpace setVariable ["BashG",0,true];
missionNameSpace setVariable ["Bash333",0,true];
params ["_type","_marker","_index","_radius"];
private ["_markerPos","_radioBashnya","_DirBash","_veh","_mine","_spawnpos","_next"];
_spawnpos = [];
_next = false;
_markerPos = getmarkerpos _marker;
if(isNil {missionNameSpace getVariable "DirBash"}) then { missionNameSpace setVariable ["DirBash",[0,0,0],true]};
_DirBash = missionNameSpace getVariable "DirBash";

private _dbposbash = "";
switch (_type) do {
	case "Land_Cargo_HQ_V1_F":{_dbposbash = "PosBash1"};
	case "Land_TTowerBig_2_F":{_dbposbash = "PosBash2"};
	case "Land_TBox_F":{_dbposbash = "PosBash3"};
};
_spawnpos = ["read", ["Bash",_dbposbash]];
if!(_spawnpos IsEqualTo []) then {_next = true};

if(nachinaem_zonovo) then { 
    
    if(isNil {missionNameSpace getVariable "clearDeadBash"}) then {
        missionNameSpace setVariable ["clearDeadBash",true,true];
    };
    if(missionNameSpace getVariable "clearDeadBash") then {
        missionNameSpace setVariable ["clearDeadBash",false,true];
        _obj = nearestObjects [_markerPos,["Land_Cargo_Tower_V1_ruins_F"],700];
        if!(_obj isEqualTo []) then {{deletevehicle _x} forEach _obj};
    };
 
    
	scopeName "EPRST";
    
    while {true} do
    {
        _testpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
        _dir_TP = [_markerPos,_testpos] call BIS_fnc_dirTo;
	    _I = _DirBash select 0;
	    _II = _DirBash select 1;
	    _III = _DirBash select 2;
	    switch _index do {
		    case 0:{
		        _spawnpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
				_next = true;
		        breakTo "EPRST";
		    };
		    case 1:{
			    if((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
			    };
		    };
		    case 2:{
			    if(((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})})
			        &&
			        {((_dir_TP > _II && {(_dir_TP - _II) > 45}) || {(_II > _dir_TP && {(_II - _dir_TP) > 45})})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
                };
		    };			
	    };
    };
    
};

if(_next) then {
    _spawnpos = [_spawnpos select 0,_spawnpos select 1,0]; 
 
    _radioBashnya = _type createVehicle _spawnpos;
    _radioBashnya setPos _spawnpos;
    _radioBashnya setVectorUp [0,0,1];
	_bashG = missionNameSpace getVariable "BashG";
	if (_bashG == 0) then
	{
	[
		_radioBashnya, 
		"<t color='#ff0000'>Закачать данные</t>", 
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", 
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", 
		"playerSide != EAST; player distance _radioBashnya < 3; ", 
		"true", 
		{}, 
		{
			hint "Закачка";
		}, 
		{hint "Данные закачаны"; [] remoteexeccall ["srv_fnc_TaskDoneG1"]; missionNameSpace setVariable ["BashG",1,true]}, 
		{hint "Скачивание прервано"}, 
		[], 
		25, 
		nil, 
		true, 
		false
	] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
	};
	_actions = actionIDs _radioBashnya;
	if(MiningBash == 0) then {_radioBashnya addEventHandler ["HandleDamage", {
	_it = _this select 0; 
	if !(alive _it) then {diag_log _this;diag_log _this select 3;diag_log _this select 3};
	_bombs = _it nearEntities ["", 20];
	_bomb = "DemoCharge_Remote_Mag";
	if (_this select 4 == "") then
	{
		if (_bomb in _bombs) then 
			{
				_it setDamage 1;
			} 
			else 
			{
				_it setDamage 0;
			};
	}
	else
	{
		_it setDamage 0;
	};
}];};
    _radioBashnya setDir (random 360);
    _dir_bash = getDir _radioBashnya;
    _DirBash set [_index,([_markerPos,_spawnpos] call BIS_fnc_dirTo)];
    missionNameSpace setVariable ["DirBash",_DirBash,true];

    _radioBashnya setVariable ["gunmam",[],true];
    _radioBashnya setVariable ["Mine",[],true];
    _radioBashnya setVariable ["killed",true]; 
	_radioBashnya addEventHandler ["HandleDamage",
	{
		_it = _this # 0;
		_bomb = _this # 4;
		private _instigator = _this # 6;
		if (_bomb == "SatchelCharge_Remote_Ammo") then
		{
			_it removeAllEventHandlers "HandleDamage";
			_it setDamage [1,true];
			["KT",[_instigator]] call F_fnc_H;
			//[_instigator,3] spawn bt_fnc_addExp;
			_leader = leader (group _instigator);
            if (_leader != _instigator) then {
               // [_leader,0.1] spawn bt_fnc_addExp;
            };
			[] remoteexeccall ["srv_fnc_TaskDone3"];
			_this spawn {
	        private _radioBashnya = _this select 0;
	        if!(_radioBashnya getVariable "killed") exitWith {};
		    _radioBashnya setVariable ["killed",false,true];
            private _RTST = missionNameSpace getVariable "RTST";
            _RTST = _RTST - 1;
			missionNameSpace setVariable ["RTST",_RTST,true];	
            _radioBashnya removeAllMPEventHandlers "mpkilled";
		    //уничтожена

			_near = nearestObjects [_radioBashnya, [], 5];
            private _n = "";
	        switch (typeof _radioBashnya) do {
                case "Land_Cargo_HQ_V1_F":{_n = "Штаб"};
                case "Land_TTowerBig_2_F":{_n = "Радиовышка"};
                case "Land_TBox_F":{_n = "Передатчик"};
	        };
            [_n] spawn {
		        params ["_n"];
		        private _text = format [localize "STR_CONF_BASH1",_n];
				//hint _text;
            	//_text  remoteExec ["hint",[0,-2] select isDedicated];
                //[[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];
            };
			missionNameSpace setVariable ["Bash111",1,true];
			
		    private _dbbash = "";
		    switch (_n) do {
			    case 1:{_dbbash = "PosBash1"};
				case 2:{_dbbash = "PosBash2"};
				case 3:{_dbbash = "PosBash3"};
			};		

            switch (true) do {			
		        case (_RTST == 2 || {_RTST == 1}):{
                    if(HardReinfor != 1) then {
                        private _datapoint = Gamer getVariable ["datapoint",[]];
                        _datapoint params ["_marker",""];
						private _posPoint = getMarkerPos _marker;
						private _list = _posPoint nearEntities [["Man","Car","Tank"],400];
						if((WEST countSide _list) < (numberOfArmy/2)) then {
		                   [_marker] spawn srv_fnc_ReinforPointBash;
						};
			        };
		        };
		        case (_RTST == 0):{
                    missionNameSpace setVariable ["DirBash",nil];
		            missionNameSpace setVariable ["clearDeadBash",nil];
		            missionNameSpace setVariable ["StaticWeap",nil];
		            [] spawn {
			            sleep 3;
		                private _text = localize "STR_CONF_BASH2";
		                _text  remoteExec ["hint",[0,-2] select isDedicated];
                        [[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];	
                    };
			        if(HardReinfor == 1) then {
			            missionNameSpace setVariable ["Stage",4,true];					
			        };			
			        missionNameSpace setVariable ["PerehodPoint",true,true];					
                };
			};
	    };
		}
		else
		{
			if (_bomb == "DemoCharge_Remote_Ammo") then
			{
				_bombcheck = missionNameSpace getVariable ["demoChargesUsed",1];
				if (_bombcheck < 2) then 
				{
					missionNameSpace setVariable ["demoChargesUsed", _bombcheck + 1, true];
				} 
				else 
				{
					_it removeAllEventHandlers "HandleDamage";
					_it setDamage [1,true]; 
					//[_instigator,3] spawn bt_fnc_addExp;
					_leader = leader (group _instigator);
            if (_leader != _instigator) then {
                //[_leader,0.1] spawn bt_fnc_addExp;
            };
					[] remoteexeccall ["srv_fnc_TaskDone3"];
					_this spawn {
	        private _radioBashnya = _this select 0;
	        if!(_radioBashnya getVariable "killed") exitWith {};
		    _radioBashnya setVariable ["killed",false,true];
            private _RTST = missionNameSpace getVariable "RTST";
            _RTST = _RTST - 1;
			missionNameSpace setVariable ["RTST",_RTST,true];
			
            _radioBashnya removeAllMPEventHandlers "mpkilled";
		    //уничтожена

			_near = nearestObjects [_radioBashnya, [], 5];
            private _n = "";
	        switch (typeof _radioBashnya) do {
                case "Land_Cargo_HQ_V1_F":{_n = "Штаб"};
                case "Land_TTowerBig_2_F":{_n = "Радиовышка"};
                case "Land_TBox_F":{_n = "Передатчик"};
	        };
            [_n] spawn {
		        params ["_n"];
		        private _text = format [localize "STR_CONF_BASH1",_n];
				//hint _text;
            	//_text  remoteExec ["hint",[0,-2] select isDedicated];
                //[[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];
            };
			missionNameSpace setVariable ["Bash111",1,true];
			
		    private _dbbash = "";
		    switch (_n) do {
			    case 1:{_dbbash = "PosBash1"};
				case 2:{_dbbash = "PosBash2"};
				case 3:{_dbbash = "PosBash3"};
			};		

            switch (true) do {			
		        case (_RTST == 2 || {_RTST == 1}):{
                    if(HardReinfor != 1) then {
                        private _datapoint = Gamer getVariable ["datapoint",[]];
                        _datapoint params ["_marker",""];
						private _posPoint = getMarkerPos _marker;
						private _list = _posPoint nearEntities [["Man","Car","Tank"],400];
						if((WEST countSide _list) < (numberOfArmy/2)) then {
		                   [_marker] spawn srv_fnc_ReinforPointBash;
						};
			        };
		        };
		        case (_RTST == 0):{
                    missionNameSpace setVariable ["DirBash",nil];
		            missionNameSpace setVariable ["clearDeadBash",nil];
		            missionNameSpace setVariable ["StaticWeap",nil];
		            [] spawn {
			            sleep 3;
		                private _text = localize "STR_CONF_BASH2";
		                _text  remoteExec ["hint",[0,-2] select isDedicated];
                        [[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];	
                    };
			        if(HardReinfor == 1) then {
			            missionNameSpace setVariable ["Stage",4,true];						
			        };			
			        missionNameSpace setVariable ["PerehodPoint",true,true];						
                };
			};
	    };
				};
			}
			else
			{
				_it setDamage 0;
			};
		};
	}];

	_localb = getPosATL _radioBashnya;
	missionNamespace setVariable ["LocalB3", _localb, true];

    //--------------------------------укреп от БРАТА--------------------

_grp = createGroup west; 
 
_BRO_fnc_placing = {  
 params ["_class","_X","_Y","_angle","_offset"];  
 if (isNil "_offset") then {_offset = 0};  
 _az = getDir _radioBashnya;  
 _obj = _class createVehicle getPosWorld _radioBashnya;  
 _obj setDir _az+_angle;  
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]);  
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];   
};  
  
_BRO_fnc_placing_turret = {  
 params ["_class","_X","_Y","_angle","_offset"];  
 if (isNil "_offset") then {_offset = 0};  
 _az = getDir _radioBashnya;  
 _obj = _class createVehicle getPosWorld _radioBashnya;  
 _obj setDir _az+_angle;  
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]);  
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];  
 _man = _grp createUnit ["B_soldier_M_F", position _obj,[],10,"FORM"];  
 _man setSkill 1;  
 _man allowFleeing 0;  
 [_man] join _grp;  
 _man moveInGunner _obj;      
};  
  
_BRO_fnc_placing_trooper = {  
 params ["_class","_X","_Y","_angle","_offset"];  
 if (isNil "_offset") then {_offset = 0};  
 _az = getDir _radioBashnya;  
 _man = _grp createUnit [_class, getPosWorld _radioBashnya,[],0,"NONE"];  
 _man setDir _az+_angle;  
 _man setPos (_radioBashnya modelToWorld [_X,_Y]);  
 _man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"];  
 _man setSkill 0.75;  
 _man allowFleeing 0;  
 [_man] join _grp;  
 doStop _man;      
};  

    //----------------------------------------------------------------------------
    [_radioBashnya] spawn srv_fnc_defenceBash;
	private _RTST = missionNameSpace getVariable "RTST";
	_RTST = _RTST + 1;
	missionNameSpace setVariable ["RTST",_RTST,true];
	//---------------------------------------------------------------
};
	
if(_index == 2) then {
    //----------------------спавн охрана города----------------------------------------
    [_marker,_radius] spawn srv_fnc_DefencePoint;
};