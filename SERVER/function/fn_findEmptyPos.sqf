scopeName "eklmn";

params ["_pos","_minDist","_maxDist","_maxGradient","_maxGradientRadius","_type"];

_pos params ["_posX","_posY"];

private _newPos = [];
private _testPos = [];

while {true} do
{
	private ["_newX", "_newY", "_testPos","_testPos1"];
	_newX = _posX + (_maxDist - (random (_maxDist * 2)));
	_newY = _posY + (_maxDist - (random (_maxDist * 2)));
	_testPos = [_newX, _newY];
 
	_testPos = _testPos findEmptyPosition [0,0,_type];
	
	if!(_testPos isEqualTo []) then {
	    if!(surfaceIsWater _testPos) then  {
            if!(isOnRoad _testPos) then {
			    if((_pos distance _testPos) >= _minDist) then {
				    if !(_testPos isFlatEmpty [5, -1,_maxGradient,_maxGradientRadius,0,false] isEqualTo []) then {
					    _newPos = _testPos;
					    breakTo "eklmn";
					};
				};
			};
		};
	};
};
_newPos