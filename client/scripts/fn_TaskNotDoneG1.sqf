if(!local player) exitWith {};
if (side (group player) != EAST) then
{
private _task = missionnamespace getVariable "taskG1";
private _datapoint = Gamer getVariable ["datapoint",[]];
_datapoint params ["","_NamePoint"];
_task setTaskState "Failed";

["TaskFailed",["",format [localize "STR_CONF_TASKNOTDONEG1",_NamePoint]]]call BIS_fnc_showNotification;
};
