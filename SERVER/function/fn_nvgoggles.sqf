params ["_unit"];
if(hmd _unit != "") exitWith {};

private _nvgoggles =[
"NVGoggles",
"NVGoggles_OPFOR",
"NVGoggles_INDEP",
"Integrated_NVG_F",
"Integrated_NVG_TI_0_F",
"Integrated_NVG_TI_1_F",
"O_NVGoggles_hex_F",
"O_NVGoggles_urb_F",
"O_NVGoggles_ghex_F",
"NVGoggles_tna_F",
"NVGogglesB_blk_F",
"NVGogglesB_grn_F",
"NVGogglesB_gry_F",
"ACE_NVG_Gen1",
"ACE_NVG_Gen2",
"ACE_NVG_Gen3",
"ACE_NVG_Gen4",
"ACE_NVG_Wide"
];

private _nvgogglesUnit = [];

{if(_x in _nvgoggles) then {_nvgogglesUnit pushback _x}} forEach (items _unit);

if!(_nvgogglesUnit isEqualTo []) then {
   switch (true) do {
      case (count _nvgogglesUnit == 1):{_unit assignItem (_nvgogglesUnit select 0)};
      case (count _nvgogglesUnit > 1):{_unit assignItem (selectRandom _nvgogglesUnit)}; 	  
   };
};

