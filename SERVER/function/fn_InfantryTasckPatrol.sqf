//[_grp,_SpawnPosGrp,_pos,5 + (floor(random 5)),150,[-1,-1,-1,0,false],"path for tank"] spawn srv_fnc_InfantryTasckPatrol;
params ["_grp","_posgrp","_posPoint","_count","_mindist","_isFlatEmpty","_who"];
//_grp - группа
//_posgrp- позиция группы(спавна группы или позиция куда прибыла группа и откуда будет начинаться расчет путей)
//_posPoint - позиция точки
//_count - количество путей
//_mindist - мин длина пути

//_isFlatEmpty - массив проверки isFlatEmpty
//--------------------isFlatEmpty------------------------------
_isFlatEmpty params ["_distObj","_maxGradient","_maxGradientRadius","_waterMode","_shoreMode"];
//_distObj - минимальная дистанция до любого объекта.-1- игрорировать
//_maxGradient - максимальный градиент местности.-1- игрорировать
//_maxGradientRadius - радиус максимального градиента местности.-1- игрорировать
//_waterMode - варианты: 0  - позиция не может быть над водой; 2 - позиция не может быть над землей. -1 Игнорировать.
//_shoreMode - варианты: true - на берегу можно. false - нельзя на берегу

//-------------------------------------------- 
//_who - для кого создаются пути


//_radius - радиус патрулирования

if (isServer) then {
	private _radius = 300;

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";

	
	private _posarray = [];
	_posarray pushback _posgrp;
	private _wp1 = [];
	private _newPos = [];
	private _testpos = [];
	private _lastpos = [];
	private _a = 0;
	private _la = 0;
	private _dir = random 360;
	private _shagDir = 90 + (random 90);
	_posPoint params ["_posPoint_x","_posPoint_y"];
	//-----------------
	for "_i" from 0 to 1 do
	{
		_dir = _dir + _shagDir;
		if(_dir >360) then {_dir = _dir - 360};	
		_a = 0;
		scopeName "_nearWaypoint";
		while {_a < 1000} do
		{
			_testpos = [_posPoint_x + ((sin _dir) * _radius), _posPoint_y + ((cos _dir) * _radius)];
			_la = (count _posarray) - 1;
			_lastpos = _posarray select _la;
			if!(surfaceIsWater _testpos) then
			{
				if((_testpos distance _lastpos)>_mindist) then
				{
					if (!((count (_testpos isFlatEmpty [_distObj,-1,_maxGradient,_maxGradientRadius,_waterMode,_shoreMode,objNull])) == 0)) then
					{
						_newPos = _testpos;
						_posarray pushback _newPos;
						if(_i == 0) then {_wp1 = _wp1 + _newPos};
						breakTo "_nearWaypoint";
					};
				};
			};
			_dir = _dir + 10;
			_a = _a + 1;
		};

		_wp = _grp addWaypoint [_newPos, 20];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointBehaviour "COMBAT";
		_wp setWaypointCombatMode "RED";     
		_wp setWaypointCompletionRadius 50;
		_wp setWaypointFormation "LINE";
	};

	//Cycle back to the first position.
	private ["_wp"];
	_wp = _grp addWaypoint [_wp1, 0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";   
	_wp setWaypointCompletionRadius 50;

	true 
};