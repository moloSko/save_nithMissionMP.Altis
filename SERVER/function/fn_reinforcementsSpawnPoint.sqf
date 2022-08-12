params ["_point"];
private ["_point","_REINFORCEMENT","_ROUGH_REINFORCEMENT","_pos","_road","_newroad","_cnt","_rfnt","_marker"];
if(!nachinaem_zonovo && {!DatabasePointRead}) then {
   _REINFORCEMENT = ["read",["Point","REINFORCEMENT"]];
   missionNamespace setVariable ["REINFORCEMENT",_REINFORCEMENT];
};
if(nachinaem_zonovo) then {
   _REINFORCEMENT = missionNamespace getVariable ["REINFORCEMENT",[]];
    if!(_REINFORCEMENT isEqualTo []) then {_REINFORCEMENT resize 0};
	_newroad = [];

    //Поиск дорог от указанной точки в радиусе 1700 метров
    _pos = getMarkerPos _point;
    _road = _pos nearRoads 1800;
    //Фильтруем найденные частки дорог на удаленность от указанной точки.
    //Если участок удален дальше 1000 метров, то заносим в отдельный массив 
    _cnt =(count _road)-1;
    for "_i" from 0 to _cnt step 1 do {
        _rfnt = _road select _i;
        if(((getPos _rfnt) distance _pos)>1100) then {_newroad pushBack _rfnt};
    };
    //перемешиваем

    {_newroad = _newroad call BIS_fnc_arrayShuffle} forEach [1,2,3,4];

    //обрезаем полученный массив до 20 элементов(если кол-во в нем превышает 20 элементов)
    if(count _newroad > 20) then {_newroad resize 20};
    //Заносим позиции найденных дорог в массив _REINFORCEMENT
    for "_i" from 0 to ((count _newroad) - 1) do  {
        _rfnt = _newroad select _i;
        _REINFORCEMENT pushBack [getPos _rfnt select 0,getPos _rfnt select 1];
    };
	//пемемешаем массив
    _REINFORCEMENT = _REINFORCEMENT call BIS_fnc_arrayShuffle;

    missionNamespace setVariable ["REINFORCEMENT",_REINFORCEMENT];
};