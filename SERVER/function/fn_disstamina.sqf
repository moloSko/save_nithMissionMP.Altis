//{_x enableStamina false;}forEach (units group player);
//{_x enableFatigue false;}forEach (units group player);

if (missionNamespace getVariable "MapNV") then {
	disableMapIndicators [true,true,false,true];
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "draw";
    } else {
		[] spawn {
			sleep 0.1;
			waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
			clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",bt_medicine_fnc_iconDrawMap];
		};
};