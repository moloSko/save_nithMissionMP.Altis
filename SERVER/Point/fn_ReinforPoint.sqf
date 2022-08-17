if(!isServer) exitWith {};
//подкрепление
if!(ReinforPoint) exitWith {};
missionNamespace setVariable ["ReinforPoint",false,true];
[] spawn {
    switch (true) do {
        case(Stage == 2):{
            missionNamespace setVariable ["Stage",3,true];	  
	        missionNamespace setVariable ["ReinforPoint2",true,true];		  
        };

        case(Stage == 3):{
            missionNamespace setVariable ["Stage",4,true];  
            if(Rezhim == 2) then {
		        missionNamespace setVariable ["PerehodPoint",true,true];		  
	        };	  
        };
    };
};
missionNameSpace setVariable ["ReinforPointprocces",true,true];
params ["_Point"];

private _REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";
private _SpawnPosVeh = selectRandom  _REINFORCEMENT;
switch (true) do {
    case (variantCount == "min"):{
	  //хамеры/бронемашины
        for "_i" from 1 to 2 do {
          [_Point,_REINFORCEMENT,Car] call srv_fnc_ReinforVehicle;
		 sleep 1;
        };
        sleep 1;		
	    //броня
        for "_c" from 1 to 2 do {
          [_Point,_REINFORCEMENT,Tank] call srv_fnc_ReinforVehicle;
		  sleep 1;
        };
	   // десант на точку
       [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Paras;
       [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Parasgosta;
	};
    case (variantCount == "mind"):{
	   //хамеры/бронемашины
        for "_i" from 1 to 2 do {
            [_Point,_REINFORCEMENT,Car] call srv_fnc_ReinforVehicle;
		    sleep 1;
        };	
        sleep 1;		
	    //броня
        for "_c" from 1 to 2 do {
            [_Point,_REINFORCEMENT,Tank] call srv_fnc_ReinforVehicle;
		    sleep 1;
        };
	    sleep 1;
		// десант на точку
	    [] spawn {
	        [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Paras;
            [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Parasgosta;
		    sleep 180;
		    [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Paras;
            [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Parasgosta;
        };
	};
    case (variantCount == "max"):{
	  //хамеры/бронемашины
        for "_i" from 1 to 3 do {
            [_Point,_REINFORCEMENT,Car] call srv_fnc_ReinforVehicle;
		 sleep 1;
        };
        sleep 1;		
	    //броня
        for "_c" from 1 to 3 do {
            [_Point,_REINFORCEMENT,Tank] call srv_fnc_ReinforVehicle;
		    sleep 1;
        };
		sleep 1;
		// десант на точку
	    [] spawn {
	        [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Paras;
            [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Parasgosta;
		    sleep 180;
		    [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Paras;
            [_Point,3000,random 360,100 + (random 30),usmc_infantry] spawn srv_fnc_Parasgosta;
		};
    };
};

sleep 1;

missionNameSpace setVariable ["ReinforPointprocces",false,true];