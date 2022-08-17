 
   params ["_marker","_type"];

   private _pos = getMarkerPos _marker;
   private _dir = random 360;
   private _ps = [(_pos select 0) + ((sin _dir) * 5000),(_pos select 1) + ((cos _dir) * 5000),300];
   
   private _spwndir = _dir + 180;
   
   private _v = 0;

    switch (CountEnemyManFront) do
    {
        case 0:
	    {
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
	    };
        case 1:
	    {
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
		 sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
	    };
        case 2:
		{
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
		  sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
		  sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
		};
        case 3:
	    {
	        if((playersNumber east)<6) then 
	        {
 	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
            };	  
            if(((playersNumber east)>5)&&((playersNumber east)<10)) then
            {
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
			 sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
            };		
            if((playersNumber east)>10) then 
            {
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
			 sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
			 sleep 2;
	      [_ps,_spwndir,_type,_pos] spawn srv_fnc_createenemyair;
  
            };
        };			
    };
