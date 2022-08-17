params ["_unit"];

if(_unit isKindOf "CAManBase") then {
    private _items = items _unit;
    if("FirstAidKit" in _items) then {
	    {
		    if(_x == "FirstAidKit") then {_items deleteAT (_items find _x)} forEach _items;
		for "_i" from 1 to 5 do {_unit addItemToUniform "FirstAidKit";};
    };
} else {
    private _itemsCargo = itemCargo _unit;
    if("FirstAidKit" in _itemsCargo) then {
	    {
		    if(_x == "FirstAidKit") then {_items deleteAT (_items find _x)} forEach _items;
		_unit addItemCargoGlobal ["FirstAidKit",20];
    };
}: