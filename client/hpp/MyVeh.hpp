class MYveh_RscButton
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
class MYveh_RscListBox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 5;
	rowHeight = 0;
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
	colorScrollbar[] = 
	{
		1,
		0,
		0,
		0
	};
	colorSelect[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelectBackground[] = 
	{
		0.95,
		0.95,
		0.95,
		1
	};
	colorSelectBackground2[] = 
	{
		1,
		1,
		1,
		0.5
	};
	colorBackground[] = 
	{
		0,
		0,
		0,
		0.3
	};
	soundSelect[] = 
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorPictureRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightSelected[] = 
	{
		1,
		1,
		1,
		1
	};
	colorPictureRightDisabled[] = 
	{
		1,
		1,
		1,
		0.25
	};
	colorTextRight[] = 
	{
		1,
		1,
		1,
		1
	};
	colorSelectRight[] = 
	{
		0,
		0,
		0,
		1
	};
	colorSelect2Right[] = 
	{
		0,
		0,
		0,
		1
	};
	tooltipColorText[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorBox[] = 
	{
		1,
		1,
		1,
		1
	};
	tooltipColorShade[] = 
	{
		0,
		0,
		0,
		0.65
	};
	class ListScrollBar
	{
		color[] = 
		{
			1,
			1,
			1,
			1
		};
		autoScrollEnabled = 1;
	};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] = 
	{
		0,
		0,
		0,
		0.5
	};
	period = 1.2;
	maxHistoryDelay = 1;
};
class MYveh
{
	idd=-1;
	movingenable=false;
	
	class controls 
	{
class DelMyveh: MYveh_RscButton
{
	idc = -1;
	text = "$STR_CONF_MYVEH1"; //--- ToDo: Localize;
	x = 0.373243 * safezoneW + safezoneX;
	y = 0.278994 * safezoneH + safezoneY;
	w = 0.211262 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.55,0.6,0.97,1};
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [0.55,0.6,0.97,1]";
	sizeEx = 1.5 * GUI_GRID_H;
	onButtonClick = "CloseDialog 0;createdialog 'MYvehListBox';";
};
class PosMyveh: MYveh_RscButton
{
	idc = -1;
	text = "$STR_CONF_MYVEH2"; //--- ToDo: Localize;
	x = 0.373243 * safezoneW + safezoneX;
	y = 0.346996 * safezoneH + safezoneY;
	w = 0.211262 * safezoneW;
	h = 0.0680018 * safezoneH;
	colorText[] = {0.55,0.6,0.97,1};
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
    onMouseExit = "(_this select 0) ctrlSetTextColor [0.55,0.6,0.97,1]";	
	sizeEx = 1.5 * GUI_GRID_H;
};
class closeMyveh: MYveh_RscButton
{
	idc = -1;
	text = "$STR_CONF_MYVEH3"; //--- ToDo: Localize;
	x = 0.373243 * safezoneW + safezoneX;
	y = 0.414998 * safezoneH + safezoneY;
	w = 0.211262 * safezoneW;
	h = 0.0340009 * safezoneH;
	//colorText[] = {0.44,0.26,0,1};
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	onButtonClick = "CloseDialog 0;";
};
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////

class MYvehListBox
{
	idd=-1;
	movingenable=false;	
	class controls 
	{
class MYvLB: MYveh_RscListBox
{
	idc = 63001;
	x = 0.316906 * safezoneW + safezoneX;
	y = 0.244993 * safezoneH + safezoneY;
	w = 0.359146 * safezoneW;
	h = 0.238006 * safezoneH;
	//colorBackground[] = {0,0.69,0.18,1};
	//colorBackground[] = {0,0.52,0.06,1};
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
};
class Myvcl: MYveh_RscButton
{
	idc = -1;
	text = "$STR_CONF_MYVEH4"; //--- ToDo: Localize;
	x = 0.316906 * safezoneW + safezoneX;
	y = 0.483 * safezoneH + safezoneY;
	w = 0.091547 * safezoneW;
	h = 0.0340009 * safezoneH;
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	onButtonClick = "CloseDialog 0;";
};
class MyvD: MYveh_RscButton
{
	idc = -1;
	text = "$STR_CONF_MYVEH5"; //--- ToDo: Localize;
	x = 0.584505 * safezoneW + safezoneX;
	y = 0.483 * safezoneH + safezoneY;
	w = 0.091547 * safezoneW;
	h = 0.0340009 * safezoneH;
	colorBackgroundActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.3};
	OnMouseEnter = "(_this select 0) ctrlSetTextColor [0, 0, 0, 1]";
	onMouseExit = "(_this select 0) ctrlSetTextColor [1, 1, 1, 1]";
	onButtonClick = "[] spawn srv_fnc_delMyVeh";
};
	};
};