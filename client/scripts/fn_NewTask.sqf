if(!local player) exitWith {};

private _datapoint = Gamer getVariable ["datapoint",[]];

if(_datapoint isEqualTo []) exitWith {};

_bash1 = missionNamespace getVariable "Bash111";
_bash2 = missionNamespace getVariable "Bash222";
_bash3 = missionNamespace getVariable "Bash333";

_localb1 = missionNamespace getVariable "LocalB1";
_localb2 = missionNamespace getVariable "LocalB2";
_localb3 = missionNamespace getVariable "LocalB3";
_datapoint params ["_Point","_NamePoint"];
private ["_task","_task1","_task2","_task3","_taskG1"]; 

if (side (group player) == EAST) then
{
_task = player createSimpleTask [_Point];
_task setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1",_NamePoint],format[localize "STR_CONF_NEWTASK2",_NamePoint],localize "STR_CONF_NEWTASK3"];
_task setSimpleTaskDestination getMarkerPos _Point;
_task setTaskState "Assigned";
_task setSimpleTaskType "attack";

if (_bash1 == 0) then {
_task1 = player createSimpleTask ["MarkerBash1",_task];
_task1 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_1",_NamePoint],format[localize "STR_CONF_NEWTASK2_1",_NamePoint],localize "STR_CONF_NEWTASK3_1"];
_task1 setSimpleTaskDestination getMarkerPos _Point;
//_task1 setTaskState "Assigned";
_task1 setSimpleTaskType "destroy";
};

if (_bash2 == 0) then {
_task2 = player createSimpleTask ["MarkerBash2",_task];
_task2 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_2",_NamePoint],format[localize "STR_CONF_NEWTASK2_2",_NamePoint],localize "STR_CONF_NEWTASK3_2"];
_task2 setSimpleTaskDestination getMarkerPos _Point;
//_task2 setTaskState "Assigned";
_task2 setSimpleTaskType "destroy";
};

if (_bash3 == 0) then {
_task3 = player createSimpleTask ["MarkerBash3",_task];
_task3 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_3",_NamePoint],format[localize "STR_CONF_NEWTASK2_3",_NamePoint],localize "STR_CONF_NEWTASK3_3"];
_task3 setSimpleTaskDestination getMarkerPos _Point;
//_task3 setTaskState "Assigned";
_task3 setSimpleTaskType "destroy";
};

player setCurrentTask _task;
["TaskAssigned",["",format [localize "STR_CONF_NEWTASK4",_NamePoint]]]call BIS_fnc_showNotification;

missionnamespace setVariable ["task",_task];
missionnamespace setVariable ["task1",_task1];
missionnamespace setVariable ["task2",_task2];
missionnamespace setVariable ["task3",_task3];
}
else
{
_taskG1 = player createSimpleTask ["MarkerBash4"];
_taskG1 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_G1",_NamePoint],format[localize "STR_CONF_NEWTASK2_G1",_NamePoint],localize "STR_CONF_NEWTASK3_G1"];
_taskG1 setSimpleTaskDestination getMarkerPos _Point;
_taskG1 setTaskState "Assigned";
_taskG1 setSimpleTaskType "download";

player setCurrentTask _taskG1;
["TaskAssigned",["",format [localize "STR_CONF_NEWTASK4_G1",_NamePoint]]]call BIS_fnc_showNotification;

missionnamespace setVariable ["taskG1",_taskG1];
};






  
