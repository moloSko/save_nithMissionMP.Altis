if(!isServer) exitWith {};
//подкрепление
//if(ReinforPointprocces) exitWith {};
missionNameSpace setVariable ["ReinforPointprocces",true,true];
params ["_Point"];


//"Подкрепление" remoteexeccall ["hint",[0,-2] select isDedicated];
 
private ["_REINFORCEMENT","_RadioTower"];
_REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";

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