params ["_side","_faction","_podrazdelenie","_grp"];

"true" configClasses(configfile >> "CfgGroups" >> _side >> _faction >> _podrazdelenie >> _grp) apply {getText (_x>>"vehicle")};
