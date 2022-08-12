params ["_uid","_name"];

private _unit = objNull;

while {isNull _unit} do {{if((getPlayerUID _x) == _uid) then {_unit= _x}} ForEach playableUnits};

sleep 1;
//база данных

private _sovp = 0;
private _score = 0;
private _PlayersArray = missionnamespace getvariable "PlayersArray";

_PlayersArray =+ _PlayersArray;
if!(_PlayersArray IsEqualTo []) then {
	{
		_x params ["_uidpl","","_stata"]; 
		_stata params ["_sc","","","","",""];
		//if(_uid == _uidpl) then {_sovp = _sovp + 1;_score = _score + _sc;};
	} forEach _PlayersArray;
    if(_sovp > 0) then {
		//_unit addScore _score;
		diag_log ("fn_PlayerConnected ------ " + str _PlayersArray);
	} else {
	    _PlayersArray pushback [_uid,_name,[0,0,0,0,0,0]];
		missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
	};
} else {
	_PlayersArray pushback [_uid,_name,[0,0,0,0,0,0]];
    missionnamespace setvariable ["PlayersArray",_PlayersArray,true];
};

// -------для теста 
//_unit addScore 200;
//----------------------------------
private _IgrokVIgre = missionNamespace getVariable ["IgrokVIgre",[]];
_IgrokVIgre pushback _uid;
missionNamespace setVariable ["IgrokVIgre",_IgrokVIgre,true];
