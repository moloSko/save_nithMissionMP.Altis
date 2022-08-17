params ["_veh"];
private _nameveh = "srveh";
private _netID = netid _veh;
private _netIDseparator = _netID find ":";
_nameveh = _nameveh + "_" + (_netID select [0,_netIDseparator]) + "_" + (_netID select [_netIDseparator + 1,100]);

_nameveh