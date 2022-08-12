
_veh = _this select 0;
_blok =_this select 1;
_uron = _this select 2;
_unit = _this select 3;

if(isPlayer _unit) then {
    _getPlayerUID = getplayerUID _unit;
    _UIDPlayerDam = _veh getVariable "UIDPlayerDam";
 
    if(_getPlayerUID in _UIDPlayerDam) exitWith {};
    _NumberOneDamage = _veh getVariable "NumberOneDamage";
    _arrayAllHitPointsDamage = getAllHitPointsDamage _veh ;
    _arrayDamage = _arrayAllHitPointsDamage select 2;
  
    _cntD = count _arrayDamage;
	
	for "_i" from 0 to (_cntD-1) do {
	    _number = _arrayDamage select _i;
	    if((_number == 1) && {!(_i in _NumberOneDamage)}) exitWith {
		    _UIDPlayerDam PushBack _getPlayerUID;
		    _NumberOneDamage PushBack _i;
	        _veh setVariable ["UIDPlayerDam",_UIDPlayerDam,true];
		    _veh setVariable ["NumberOneDamage",_NumberOneDamage,true];
           // [[_unit,1]] remoteexec ["addscore",2];
			
            private _sc = score _unit;
            private _PlayersArray = missionnamespace getvariable "PlayersArray";
            
            _PlayersArray =+ _PlayersArray;
 
            private ["_infa"];
            {
                _infa = _x;
	            _infa params ["_uidpl","","_stata"];  
	            if(_getPlayerUID == _uidpl) then {_sc = _sc + 1;_stata set [0,_sc];};
            } forEach _PlayersArray;
            missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
			[[_PlayersArray],{
			    params ["_PlayersArray"];
			}] remoteexec ["spawn",2];
        };		  
    };
};