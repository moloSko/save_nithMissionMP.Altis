params ["_unit"];
_unit setskill ["aimingspeed",[aimingspeedvalue] call srv_fnc_getValue];
_unit setskill ["aimingaccuracy",[aimingaccuracyvalue] call srv_fnc_getValue];
_unit setskill ["aimingshake",[aimingshakevalue] call srv_fnc_getValue];
_unit setskill ["spotdistance",[spotdistancevalue] call srv_fnc_getValue];
_unit setskill ["spottime",[spottimevalue] call srv_fnc_getValue];
_unit setskill ["commanding",[commandingvalue] call srv_fnc_getValue];
_unit setskill ["courage",[couragevalue] call srv_fnc_getValue];
_unit setskill ["reloadSpeed",[reloadSpeedvalue] call srv_fnc_getValue];
_unit setskill ["general",[generalvalue] call srv_fnc_getValue]