class MYres_RscButton
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	colorDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundDisabled[] = 
	{
		0,
		0,
		0,
		0.5
	};
	colorBackgroundActive[] = 
	{
		0,
		0,
		0,
		1
	};
	colorFocused[] = 
	{
		0,
		0,
		0,
		1
	};
	colorShadow[] = 
	{
		0,
		0,
		0,
		0
	};
	colorBorder[] = 
	{
		0,
		0,
		0,
		1
	};
	soundEnter[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] = 
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	idc = -1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};

class MYres
{
	idd=-1;
	movingenable=false;
	
	class controls 
	{
class MYresObz: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.99,0.94,0.02,1]";
	onButtonClick = "[] spawn TAWVD_fnc_openTAWVD;";

	idc = -1;
	text = "$STR_CONF_RESHPP1"; //--- ToDo: Localize;
	x = 0.380223 * safezoneW + safezoneX;
	y = 0.278989 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.99,0.94,0.02,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.5 * GUI_GRID_H;
};
class MYresStata: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.28,1,0.3,1]";
	onButtonClick = "CloseDialog 0;[] spawn srv_fnc_mystata;";

	idc = -1;
	text = "$STR_STATA"; //--- ToDo: Localize;
	x = 0.380223 * safezoneW + safezoneX;
	y = 0.346992 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.28,1,0.3,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.5 * GUI_GRID_H;
};
class MYresInf: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.99,0.69,0.28,1]";
	onButtonClick = "CloseDialog 0;if(System == 1) then {[] spawn srv_fnc_zvInfdialog} else {[] spawn srv_fnc_zvInfdialog2};";

	idc = -1;
	text = "$STR_CONF_RESHPP2"; //--- ToDo: Localize;
	x = 0.380542 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.99,0.69,0.28,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.5 * GUI_GRID_H;
};
class MyResSBh: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.12,0.31,0.97,1]";
	onButtonClick = "CloseDialog 0;[] spawn srv_fnc_HighlightChopper;";

	idc = 1003;
	text = "$STR_CONF_RESHPP4"; //--- ToDo: Localize;
	x = 0.380542 * safezoneW + safezoneX;
	y = 0.551003 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.12,0.31,0.97,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.2  * GUI_GRID_H;
};
class ResCl: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	onButtonClick = "CloseDialog 0;";

	idc = 1004;
	text = "$STR_CONF_RESHPP5"; //--- ToDo: Localize;
	x = 0.380542 * safezoneW + safezoneX;
	y = 0.619006 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0340009 * safezoneH;
	colorBackground[] = {0,0,0,0.3};
};
    };
};
///////////////////////////////////////////////////////////////////////////////////////////
class MYres2
{
	idd=-1;
	movingenable=false;
	
	class controls 
	{
class MYresObz2: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.99,0.94,0.02,1]";
	onButtonClick = "[] spawn TAWVD_fnc_openTAWVD";

	idc = -1;
	text = "$STR_CONF_RESHPP1"; //--- ToDo: Localize;
	x = 0.380223 * safezoneW + safezoneX;
	y = 0.278989 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.99,0.94,0.02,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.5  * GUI_GRID_H;
};
class MYresStata2: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.28,1,0.3,1]";
	onButtonClick = "CloseDialog 0;[] spawn srv_fnc_mystata";

	idc = -1;
	text = "$STR_STATA"; //--- ToDo: Localize;
	x = 0.380542 * safezoneW + safezoneX;
	y = 0.346992 * safezoneH + safezoneY;
	w = 0.23239 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.28,1,0.3,1};
	colorBackground[] = {0,0,0,0.3};
	sizeEx = 1.5  * GUI_GRID_H;
};

class ResCl2: MYres_RscButton
{
	colorBackgroundActive[] = {1,1,1,1};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	onButtonClick = "CloseDialog 0;";

	idc = -1;
	text = "$STR_CONF_RESHPP5"; //--- ToDo: Localize;
	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
	y = 14 * GUI_GRID_H + GUI_GRID_Y;
	w = 14.5902 * GUI_GRID_W;
	h = 0.999975 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.3};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};