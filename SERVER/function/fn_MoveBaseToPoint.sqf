params ["_posPoint"];


private _maxDist = 400;

_posPoint params ["_posX","_posY"];

private _newposbase = [];


private ["_mpt","_newX","_newY","_testPos"];
_mpt = 0;
while {_mpt <2000} do {
    _newX = _posX + (_maxDist - (random (_maxDist * 2)));
    _newY = _posY + (_maxDist - (random (_maxDist * 2)));
    _testPos = [_newX,_newY];

	if(!(surfaceIsWater _testPos)
	    &&
        {!(_testPos isFlatEmpty[8,-1,0.3,20,0,false] isEqualTo [])
		&&
	    {({_testPos distance _x >= 10} forEach playableunits)}}) exitWith {
		_newposbase = _testPos;			
    };
	_mpt = _mpt + 1;
};

if(_newposbase isEqualTo []) exitWith {};

_newposbase params ["_newposbase_x","_newposbase_y"];
private _markerbase = "mrk_base_east";

private _posoldbase = [];
private _posbase = getMarkerPos "mrk_base_east"; 
_posoldbase append _posbase;

//перемещаем маркер базы на новую позицию
_markerbase setMarkerPos [_newposbase_x,_newposbase_y];

//перемещаем маркер респавна на новую позицию
private _mrkresp = "respawn_east";
private _newposmrkresp =  [_newposbase_x + 2,_newposbase_y + 2];
_mrkresp setMarkerPos _newposmrkresp;

//определяем флаг
private _Flag = missionnamespace getvariable "FlagVDV";

// перемещаем флаг
_Flag setPos _newposbase;

//перемещаем маркер флага базы на новую позицию
private _milflagBse = "milflagBse";
_milflagBse setMarkerPos _newposbase;