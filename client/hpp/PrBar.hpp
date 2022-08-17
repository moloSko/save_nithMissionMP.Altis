#define CT_STATIC     0
#define ST_LEFT           0x00
//#define DEFAULTFONT			"RobotoCondensed"
#define DEFAULTFONT       "RobotoCondensed"

class CPvP_RscText {
  idc = -1;
  type = 0;
  x = 0.0;
  y = 0.0;
  w = 0.183825;
  h = 0.104575;
  style = ST_LEFT;
  font = DEFAULTFONT;
  sizeEx = 0.03921;
  colorText[] = {0.95, 0.95, 0.95, 1.0};
  colorBackground[] = {0, 0, 0, 0};
  text = "";
};

class PrBar {
    idd = -1;
    movingEnable = false;
	duration = 1e+011;
	name = "PrBar";
	onLoad = "uiNamespace setVariable ['PrBar', param [0]]; ((param [0]) displayCtrl 3800) progressSetPosition 0";
	onUnLoad = "uiNamespace setVariable ['PrBar', nil]";
    objects[] = {};

    class controlsBackground {
        class Background {
            idc = -1;
            moving = 0;
            font = "TahomaB";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 0;
            size = 1;
            colorBackground[] = {0, 0, 0, 0.0};
            colorText[] = {0, 0, 0, 0};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
        class CPvP_Fon: CPvP_RscText {
            idc = 3600;
            style = ST_CENTER;
            sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0, 0, 0, 0.5};
            colorText[] = {1, 1, 1, 1};
            x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
            y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
            w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class PrBarSam: CPvP_RscText {
            idc = 3800;
            x = "1.2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
            y = "0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.1 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0.09,0.58,0,0.7};
        };
        class PrBarText: CPvP_Fon {
            idc = 3900;
            colorBackground[] = {0, 0, 0, 0};
        };
    };
};	