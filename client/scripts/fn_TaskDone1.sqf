if(!local player) exitWith {};
if (side (group player) == EAST) then
{
private _task = missionnamespace getVariable "task1";
private _datapoint = Gamer getVariable ["datapoint",[]];
_datapoint params ["","_NamePoint"];
_task setTaskState "Succeeded";

["TaskSucceeded",["",format [localize "STR_CONF_TASKDONE1",_NamePoint]]]call BIS_fnc_showNotification;
};