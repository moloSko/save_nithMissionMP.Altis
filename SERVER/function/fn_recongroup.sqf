if(!isServer) exitWith {};
params ["_pos"];

private _arrayrecon = [];
private _vanilagroup = "true" configClasses(configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_ReconTeam") apply {getText (_x>>"vehicle")};
switch true do {
	case (VANILAPODKL):{_arrayrecon = _vanilagroup};
};
missionNameSpace setVariable ["arrayrecon",_arrayrecon,true];
missionNameSpace setVariable ["recongrouparry",[],true];
missionNameSpace setVariable ["spawnrecongroup",true,true];
[_pos,_arrayrecon] call srv_fnc_spawnrecongroup;
