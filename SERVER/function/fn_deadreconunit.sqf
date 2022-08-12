if(!isServer) exitWith {};
private _unit = _this select 0;
private _deadunit = _unit getVariable ["deadunit",false];
if(_deadunit) exitWith {};
_unit setVariable ["deadunit",true];
private _recongrouparry = missionNameSpace getVariable ["recongrouparry",[]];
private _RTST = missionNameSpace getVariable "RTST";

_recongrouparry deleteAt (_recongrouparry find _unit);

missionNameSpace setVariable ["recongrouparry",_recongrouparry,true];

if((_recongrouparry isEqualTo []) && {_RTST != 0}) then {
    private _posPoint = getMarkerPos ((Gamer getVariable "datapoint") param [0]);
    private _arrayrecon = missionNameSpace getVariable "arrayrecon";
    missionNameSpace setVariable ["spawnrecongroup",true];
    [_posPoint,_arrayrecon] spawn srv_fnc_spawnrecongroup;
};