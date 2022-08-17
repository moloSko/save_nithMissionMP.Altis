if (isServer) then {
	private _leader = param [0];//командир группы
	private _grp = group _leader;
	_grp setVariable ["VCM_NOFLANK",true];
	private _posgrp = getPos _leader;
	private _datapoint = Gamer getVariable ["datapoint",[]];
	private _pos = getMarkerPos (_datapoint param [0]);
	[_grp,_posgrp,_pos,1,150,[-1,-1,-1,0,false],"path for reinforce"] call srv_fnc_InfantryTasckPatrol;
};

