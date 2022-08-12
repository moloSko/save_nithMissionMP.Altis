private _countgrp = _this select 0;//колличество групп
private _centrpos = _this select 1;//позиция точки
private _radius = _this select 2;//радиу точки
private _type = _this select 3;// "Man" или "LandVehicle"

private _dist = 0;
private _distpart = 0;

switch (_type) do
{
  case "Man":{_distpart = _radius/(_countgrp + 1);};
  case "LandVehicle":{_distpart = _radius - (random 100)};
};

_posarray = [];

for "_i" from 1 to _countgrp do
{
    private _dist = _dist + _distpart;
    private _spawnpos =  [_centrpos,_dist] call 
    {
      private _centrpos = _this select 0;
      private _dist = _this select 1;
      private _newPos = [];
	  private _run = true;
	    while {_run} do
        {
	      private _dir = random 360;
          private _testpos = [(_centrpos select 0) + ((sin _dir) * _dist), (_centrpos select 1) + ((cos _dir) * _dist)];
            if!(surfaceIsWater _testpos) then
	        {
	            if (!((count (_testpos isFlatEmpty [3,-1,60 * (pi / 180),3,0,false, objNull])) == 0)) then
		        {
		          _newPos = _testpos;
                  _run = false;
		        }else{
                  _testpos = _testpos findEmptyPosition [5,50];
                    if((count _testpos)>0) then
                    {
	                    if (!((count (_testpos isFlatEmpty [3,-1,60 * (pi / 180),3,0,false, objNull])) == 0)) then
		                {
		                  _newPos = _testpos;
                          _run = false;
		                };
                    };
                };
            };
        };
       _newPos
    };
 _posarray pushback _spawnpos; 
};
_posarray