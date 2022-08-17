//=============стамина
if (missionNamespace getVariable "stamina") then {
	{
		_x enableStamina true;
		_x enableFatigue true;
	} forEach (playableUnits);
    } else {
    {
		_x enableStamina false;
		_x enableFatigue false;
	} forEach (playableUnits);
};

//=============Триаска
if (missionNamespace getVariable "traska") then {
	{
		_x setCustomAimCoef 1; 
	} forEach (playableUnits);
    } else {
        {
	    	_x setCustomAimCoef 0; 
	    } forEach (playableUnits);
};	


//=============Маркер на карте
if (missionNamespace getVariable "MapNV") then {
	disableMapIndicators [true,true,false,true];
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "draw";
    };


//=============первое лицо
while {missionNamespace getVariable "3pw"} do {
	waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};

	if  (((vehicle player) == player) && (speed ( player)) >= -20) then {
		player switchCamera "INTERNAL";
	};
	sleep 0.1;

	if (((vehicle player)isKindOf "LandVehicle") && (speed (vehicle player)) >= -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;
	if (( vehicle player) isKindOf "Helicopter" && (getPosVisual (vehicle player) select 2) > -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;

	if ((vehicle player) isKindOf "Plane" && (speed (vehicle player)) >= -20) then {
			(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;

	if (((vehicle player)isKindOf "Ship") && (speed (vehicle player)) >= -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;
};