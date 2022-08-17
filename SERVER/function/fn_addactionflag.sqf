if(isDedicated) exitWith {};

params ["_flag"];

if(HaloJump > 0) then {
    _flag addAction [format["<t color='#38761D'>%1</t>",localize "STR_CONF_PARAJUMP"],{createdialog "Menupara"}];
};

_flag addAction [localize "STR_CONF_NAVPP",srv_fnc_teleport_airport,[],1000,false,true,"","(!isNull(missionnamespace getvariable 'VPP'))"];
_flag addAction [localize "STR_CONF_NAMHQ",srv_fnc_teleport_MHQ,[],1000];