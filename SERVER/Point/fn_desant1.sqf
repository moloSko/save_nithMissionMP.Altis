if(!isServer) exitWith {};
params ["_type","_dirveh","_spawnpos","_height","_markpos","_paradist","_usmc_infantry"];
 
   private _grph = createGroup west;//группа экипажа вертов

   private _ygtr = -45;
   private _add_x = - 150;
   private _add_y = 150;

    private _sky1 = [(_markpos select 0) + ((sin (_dirveh + _ygtr)) * _paradist), (_markpos select 1) + ((cos (_dirveh + _ygtr)) * _paradist),_height];
   
   private _unitarray = [];
   private _grparray = [];
 
   private _ps1 = [(_spawnpos select 0)+_add_x,(_spawnpos select 1), _height];
    
   private _veharray = [_ps1,_dirveh,_type,_grph] call bis_fnc_spawnvehicle;
   private _veh = _veharray select 0;
   _veh setVariable ["UIDPlayerDam",[],true];
   _veh setVariable ["NumberOneDamage",[],true];
   _veh setVariable ["DeadAir",1,true];
   _veh setVariable ["dnt_remove_me",true];
   _veh setVariable ["killed",true,true];
   _veh addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2;}];
   _veh addEventhandler ["killed",{
     params ["_unit", "_killer", "_instigator", "_useEffects"];
     _this spawn srv_fnc_DeleteWreckVehicle;
     //[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
    }];
   
    {
      [_x] call srv_fnc_fset_AISkill;
	  _x setVariable ["killed",true,true];
      _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
	  [_x] call srv_fnc_rearmbot;
	} forEach (crew _veh);
  
  _veh flyInHeight _height;
   clearWeaponCargoGlobal _veh;
   clearMagazineCargoGlobal _veh;
   clearItemCargoGlobal _veh;
   clearBackpackCargoGlobal _veh;
   _veh addItemCargoGlobal ["toolkit",5];
   [_veh,""] call srv_fnc_setVehicleName;
   
  private _wp1 = _grph addWaypoint [_markpos,0];
	private _wp2 = _grph addWaypoint [_ps1,100];

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //позиция спавна десанта
  private _spposdes = [_spawnpos select 1,_spawnpos select 2,0];

  //------------------------------------------------------------------группы десанта------------------------------------------

  // количество групп
  
  private _Cfg = configFile >> "CfgVehicles" >> _type;
  private _transportSoldier = getNumber(_Cfg >> "transportSoldier");
  private _countgrp = floor(_transportSoldier/4);
  private ["_grpd","_typeunit","_unit","_indgr"];
  //создаем группы и садим в вертушку
    private ["_countEnemyMan"];
    for "_g" from 1 to _countgrp do {
        _grpd = createGroup west;
        for "_d" from 1 to 4 do
        {
            _typeunit = selectRandom _usmc_infantry;
            _unit=_grpd createUnit [_typeunit,_spposdes,[],20,"FORM"];
			_unit setVariable ["killed",true,true];
		    _unit setVariable ["srv_cme",true,true];
			_countEnemyMan = missionnamespace getvariable "countEnemyMan";
		    _countEnemyMan = _countEnemyMan + 1;
            missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];	
	        [_unit] call srv_fnc_fset_AISkill;
		    [_unit] call srv_fnc_rearmbot;
            _unit addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
            _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
	       //[_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
        }];
            [_unit] join _grpd ;
	        _unit allowFleeing 0;
            _unit MoveinCargo _veh;
            _unitarray pushback _unit;
            if(HardReinfor == 1) then {_unit setVariable ["CountDMan",1,true]};		  
	        sleep 0.5;
        };
	    _grparray pushback _grpd;
		sleep 0.1;
	};


  waituntil 
	{
	  ((_veh distance _markpos)<_paradist) || !(alive _veh);
	};
     
	{
	    [_veh,_x] spawn
	    {
	      private _veh = _this select 0;
	      private _unit = _this select 1;
          private _data = [backpack _unit,backpackitems _unit];
          removeBackpack _unit;
	      _unit addBackPack "B_parachute";	
          _unit  allowdamage false;
          _unit allowFleeing	0;	  
		  _unit disableCollisionWith _veh;   
 	       unassignvehicle _unit;
           moveout _unit;
		  _unit setVelocity [selectRandom [-15,15],-15,-15];
  		   sleep 5;
		   _unit allowdamage true;
               [_unit,_data] spawn
		    {
              private ["_unit","_data"];
	          _unit = _this select 0;
              _data = _this select 1;
	          waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
	          sleep 1;
	          removeBackpack _unit;
              _unit addbackpack (_data select 0);
              {_unit additemtobackpack _x;} foreach (_data select 1);
		    };
        };
      sleep 0.5;
	} forEach _unitarray;
    _unitarray orderGetIn false;
    
	
    //задаем машруты группам
    { 
        [_x,_markpos] spawn
        {
          private _grp = _this select 0;
          private _markpos = _this select 1;
          private _wp=_grp addWaypoint [_markpos,150];
          _wp setWaypointType "MOVE";
          _wp setWaypointFormation "LINE";
          _wp setWaypointCompletionRadius 50;
          _wp setWaypointStatements ["true", "null = [this] spawn srv_fnc_ReinforcePatrol"];
        };
    } forEach _grparray;

    WaitUntil 
    {
      ((_veh distance2D _ps1) < 700) || !(alive _veh);
    };
	if((_veh distance2D _ps1) < 700) then
	{
      {deleteVehicle _x;} forEach (units _grph);
      if((units _grph) isEqualTo []) then {deleteGroup _grph};
      _veh removeAllEventHandlers "killed";
      _veh removeAllEventHandlers "GetIn";
     _veh removeAllEventHandlers "HandleDamage";
      deleteVehicle _veh;
	};
	if!(alive _veh) then {};
