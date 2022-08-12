params ["_unit"];

[_unit] call srv_fnc_nvgoggles;

private _minemag = "";

switch (true) do {
    case (VANILAPODKL):{_minemag = "APERSMine_Range_Mag"};
};

private _arraysaper= [
"B_soldier_exp_F"
];

if((typeOf _unit) in _arraysaper) then {
    {_unit removeItem _x} forEach (backpackItems _unit);
    for "_i" from 1 to 10 do {_unit addItemToBackpack _minemag};
}; 
