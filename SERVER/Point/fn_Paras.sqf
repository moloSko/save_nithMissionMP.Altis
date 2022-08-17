if(!isServer) exitWith {};
    params ["_marker","_distance","_direction","_height","_usmc_infantry"]; 

	private _type = selectRandom EnemyHelliParadrop; //class name вертолета
	
	private _markpos = getMarkerPos _marker; //позиция маркера точки

      private _paradist = 500;
      
   //позиция-здесь вертолет заспавнится
    private _spawnpos = [(_markpos select 0) + ((sin _direction) * _distance), (_markpos select 1) + ((cos _direction) * _distance), _height];
    private _dirveh = _direction + 180;
	if(HardReinfor == 1) then {
	    [_type,_dirveh,_spawnpos,_height,_markpos,_paradist,_usmc_infantry] spawn srv_fnc_desant1;
	} else {
	    [_type,_dirveh,_spawnpos,_height,_markpos,_paradist,_usmc_infantry] spawn srv_fnc_desant1;
	};
	
	sleep 3;
	private _random = false;
    switch HardReinfor do {
	    case 0:{_random = (random 10)> 4};		
	    case 1:{_random = (random 10)> 8};
	};
    
if(_random && {PodkrepCobra}) then {
    missionNamespace setVariable ["PodkrepCobra",false,true];	
   [_markpos,_spawnpos,_dirveh] spawn srv_fnc_Spr_cobra;
};
