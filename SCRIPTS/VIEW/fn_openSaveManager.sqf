#include "defines.h"

private ["_controlGrp","_saveList"]; disableSerialization;  _controlGrp = CONTROL(MENU_IDD,MANAGER_GROUP); _saveList = CONTROL(MENU_IDD,SAVES_LIST); lbClear _saveList;  _controlGrp ctrlSetfade 0; _controlGrp ctrlCommit .3;  for "_i" from 0 to 9 do { _varData = GVAR_PNS format["view_slot_%1",_i]; if(!isNil "_varData") then { _saveList lbAdd SEL(_varData,0); _saveList lbSetData [(lbSize _saveList)-1,"true"]; } else { _saveList lbAdd format["Save Slot %1",_i]; _saveList lbSetData [(lbSize _saveList)-1,"false"]; }; };