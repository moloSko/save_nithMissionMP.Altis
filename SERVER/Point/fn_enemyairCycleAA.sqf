{
	if (typeOf _x in ["B_Pilot_F"]) then
	{
		params ["_type","_val"];

		sleep 600;
		if(therePoint == 1) then { waituntil {sleep 1;therePoint == 2;};};

		private _marker = (Gamer getVariable "datapoint") param [0];

		private _markpos = getMarkerPos _marker;
		private _dir = random 360;
		private _h = 300;
		private _ps = getMarkerPos spawnistreb;
		private _ps = [(_markpos select 0) + ((sin _dir) * 5000),(_markpos select 1) + ((cos _dir) * 5000),_h];
  
		private _spwndir = _dir + 180; 

		[_ps,_spwndir,_type,_markpos,_val] spawn srv_fnc_createenemyairCycleAA;
	};
} forEach playableUnits;

