params ["_type","_pos","_val","_dir","_radioBashnya"];
private ["_mine"];
   _mine = createMine [_type, _pos, [], 0];
   [_mine,(_dir+_val)] remoteExecCall ["setDir",0,_mine];
   _mine setPosATL _pos;
   west revealMine _mine;
   _arrayMine = _radioBashnya getVariable "Mine";
   _arrayMine pushback _mine;
   _radioBashnya setVariable ["Mine",_arrayMine,true];
  _mine

