if(!local player) exitWith {};
private _task = missionnamespace getVariable "task";
private _datapoint = Gamer getVariable ["datapoint",[]];
_datapoint params ["","_NamePoint"];
_task setTaskState "Succeeded";

["TaskSucceeded",["",format [localize "STR_CONF_TASKDONE",_NamePoint]]]call BIS_fnc_showNotification;

TRIGGEREND = false;
