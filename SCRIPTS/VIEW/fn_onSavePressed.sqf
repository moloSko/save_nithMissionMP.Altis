#include "defines.h"

private ["_saveIndex","_saveName"]; _saveIndex = lbCurSel SAVES_LIST; _saveName = ctrlText SLOT_NAME;  SVAR_PNS [format["view_slot_%1",_saveIndex], [ _saveName, view_foot, view_car, view_air, view_drone, view_object, view_syncObject ] ];  saveProfileNamespace; [] call VIEW_fnc_openSaveManager;
