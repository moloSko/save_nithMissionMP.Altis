	
	/*
		ПРОВЕРКА ИНВЕНТАРЯ НА ЗАПРЕЩЕНКУ
	*/
	
	private _Slot = player getVariable ["Slot","Rifleman"];
	
	#include "i\CSAT.sqf"
	
	switch (_Slot) do {
		case "Gunner1" : { 
			#include "i\CSAT_Gunner1.sqf"
		};
		case "AT_AA" : { 
			#include "i\CSAT_AT_AA.sqf"
		};
		case "Marksman" : { 
			#include "i\CSAT_Marksman.sqf"
		};
		case "Medic" : { 
			#include "i\CSAT_Medic.sqf"
		};
		case "Engineer" : { 
			#include "i\CSAT_Engineer.sqf"
		};
		case "Sniper" : { 
			#include "i\CSAT_Sniper.sqf"
		};
		case "CYP" : { 
			#include "i\CSAT_CYP.sqf"
		};
		case "BTV" : { 
			#include "i\CSAT_BTV.sqf"
		};
	};
	
	_uni = format["%1", toLower(uniform player)]; if (_uni != "") then { _uniform = _uniform apply { toLower _x }; if !(_uni in _uniform) then { removeUniform player; }; }; _ve = format["%1", toLower(vest player)]; if (_ve != "") then { _vest = _vest apply { toLower _x }; if !(_ve in _vest) then { removeVest player; }; }; _back = format["%1", toLower(backpack player)]; if (_back != "" && _back != "b_parachute") then { _backpack = _backpack apply { toLower _x }; if !(_back in _backpack) then { removeBackpack player; }; }; _head = format["%1", toLower(headgear player)]; if (_head != "") then { _headgear = _headgear apply { toLower _x }; if !(_head in _headgear) then { removeHeadgear player; }; }; _pWeapon = format["%1", toLower(primaryWeapon player)]; if (_pWeapon != "") then { _primaryWeapon = _primaryWeapon apply { toLower _x }; if !(_pWeapon in _primaryWeapon) then { player removeWeapon(primaryWeapon player); }; }; _sWeapon = format["%1", toLower(secondaryWeapon player)]; if (_sWeapon != "") then { _secondaryWeapon = _secondaryWeapon apply { toLower _x }; if !(_sWeapon in _secondaryWeapon) then { player removeWeapon(secondaryWeapon player); }; }; _hWeapon = format["%1", toLower(handgunWeapon player)]; if (_hWeapon != "") then { _handgunWeapon = _handgunWeapon apply { toLower _x }; if !(_hWeapon in _handgunWeapon) then { player removeWeapon(handgunWeapon player); }; }; _attachments = primaryWeaponItems player; _silenser = format["%1", toLower(_attachments select 0)]; if (_silenser != '') then { _muzzles = _muzzles apply {toLower _x}; if !(_silenser in _muzzles) then { player removePrimaryWeaponItem(_attachments select 0); }; }; _laserpointer = format["%1", toLower(_attachments select 1)]; if (_laserpointer != '') then { _pointers = _pointers apply { toLower _x}; if !(_laserpointer in _pointers) then { player removePrimaryWeaponItem(_attachments select 1); }; }; _optic = format["%1", toLower(_attachments select 2)]; if (_optic != '') then { _optics = _optics apply { toLower _x}; if !(_optic in _optics) then { player removePrimaryWeaponItem(_attachments select 2); }; }; _bipod = format["%1", toLower(_attachments select 3)]; if (_bipod != '') then { _bipods = _bipods apply {toLower _x}; if !(_bipod in _bipods) then { player removePrimaryWeaponItem(_attachments select 3); }; }; _goggles = format["%1", toLower(goggles player)]; if (_goggles != "") then { _googles = _googles apply {toLower _x}; if !(_goggles in _googles) then { removeGoggles player; }; }; _assignedItems = assignedItems player; _items = _items apply { toLower _x}; { _currentItem = _x; if !((toLower _currentItem) in _items) then { player unassignItem _currentItem; player unlinkItem _currentItem; player removeItem _currentItem;  }; } forEach _assignedItems;
