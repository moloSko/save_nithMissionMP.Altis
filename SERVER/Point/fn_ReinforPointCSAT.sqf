params ["_Point"];

private _REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";
private _SpawnPosVeh = selectRandom  _REINFORCEMENT;
switch (true) do {
	//хамеры/бронемашины
    for "_i" from 1 to 3 do {
        [_Point,_REINFORCEMENT,carcsat] call srv_fnc_ReinforVehiclecsat;
		sleep 1;
    };
    sleep 1;		
	//броня
    for "_c" from 1 to 3 do {
        [_Point,_REINFORCEMENT,tankcsat] call srv_fnc_ReinforVehiclecsat;
		sleep 1;
    };
	// десант на точку
    [_Point,3000,random 360,100 + (random 30),usmc_csat] spawn srv_fnc_Parascsat;
    [_Point,3000,random 360,100 + (random 30),usmc_csat] spawn srv_fnc_Parasgostacsat;

};