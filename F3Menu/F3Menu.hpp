#define circle_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define circle_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define circle_W (safezoneH / 2)
#define circle_H (safezoneH / 2)

#define circle_center_X (safezoneX + (safezoneW / 2))
#define circle_center_Y (safezoneY + (safezoneH / 2))
#define circle_R (safezoneH / 5)
#define circle_angle 40

#define circle_img_size (circle_R / 3)

#define circle_X1 (circle_R * (cos(circle_angle * 0 - 90)) + circle_center_X)
#define circle_Y1 (circle_R * (sin(circle_angle * 0 - 90)) + circle_center_Y)

#define circle_X2 (circle_R * (cos(circle_angle * 1 - 90)) + circle_center_X)
#define circle_Y2 (circle_R * (sin(circle_angle * 1 - 90)) + circle_center_Y)

#define circle_X3 (circle_R * (cos(circle_angle * 2 - 90)) + circle_center_X)
#define circle_Y3 (circle_R * (sin(circle_angle * 2 - 90)) + circle_center_Y)

#define circle_X4 (circle_R * (cos(circle_angle * 3 - 90)) + circle_center_X)
#define circle_Y4 (circle_R * (sin(circle_angle * 3 - 90)) + circle_center_Y)

#define circle_X5 (circle_R * (cos(circle_angle * 4 - 90)) + circle_center_X)
#define circle_Y5 (circle_R * (sin(circle_angle * 4 - 90)) + circle_center_Y)

#define circle_X6 (circle_R * (cos(circle_angle * 5 - 90)) + circle_center_X)
#define circle_Y6 (circle_R * (sin(circle_angle * 5 - 90)) + circle_center_Y)

#define circle_X7 (circle_R * (cos(circle_angle * 6 - 90)) + circle_center_X)
#define circle_Y7 (circle_R * (sin(circle_angle * 6 - 90)) + circle_center_Y)

#define circle_X8 (circle_R * (cos(circle_angle * 7 - 90)) + circle_center_X)
#define circle_Y8 (circle_R * (sin(circle_angle * 7 - 90)) + circle_center_Y)

#define circle_X9 (circle_R * (cos(circle_angle * 8 - 90)) + circle_center_X)
#define circle_Y9 (circle_R * (sin(circle_angle * 8 - 90)) + circle_center_Y)

class F3Menu
{
	idd = 56000; duration = 1e+10; fadeIn = 0; fadeOut = 0; movingEnable = false;
	onUnload = "(findDisplay 2900) closeDisplay 0;(findDisplay 56000) closeDisplay 0;ppEffectDestroy F3MenuBlur;";
	class Controls
    {
		class Menu_BG: BTRscPicture { idc = 56101; text = "#(argb,8,8,3)color(0,0,0,0.5)"; x = safezoneX; y = safezoneY; w = safezoneW; h = safezoneH; };
		class Menu_VIEW: BTRscStructuredText { onButtonClick = "[] call VIEW_fnc_openMenu;"; idc = 56102; text = "<t align='center' color='#f1eb4b' size='1' shadow='0'>Настроить видимость</t>"; x = circle_center_X-0.12 * safezoneW/2 + 0.6; y = safeZoneY+0.14; w = 0.12 * safezoneW; h = 0.028 * safezoneH; tooltip = "Открыть меню"; };
		class Menu_URankName: BTRscStructuredText { idc = 56103; text = ""; x = circle_center_X-0.21 * safezoneW/2; 					y = safeZoneY+0.125; w = 0.21 * safezoneW; h = 0.165 * safezoneH; };
		class Menu_URankImg: BTRscStructuredText { idc = 56104; text = ""; 	x = circle_center_X-0.45 * safezoneW/2; 					y = safeZoneY+0.1; w = 0.45 * safezoneW; h = 0.08 * safezoneH; };
		class Menu_FPS: BTRscStructuredText { idc = 56105; text = ""; 		x = circle_center_X-0.08 * safezoneW/2 - 0.6; 				y = safeZoneY+0.12; w = 0.09 * safezoneW; h = 0.046 * safezoneH; };
		class Menu_Access: BTRscStructuredText { idc = 56106; text = ""; 	x = circle_center_X-0.2 * safezoneW/2-(0.25* safezoneW); 	y = safeZoneY+0.4; w = 0.2 * safezoneW; h = 0.7 * safezoneH; };
		class Menu_Progress: BTRscStructuredText { idc = 56107; text = ""; 	x = circle_center_X-0.2 * safezoneW/2; 						y = safeZoneY+0.4; w = 0.2 * safezoneW; h = 0.7 * safezoneH; };
		class Menu_Stats: BTRscStructuredText { idc = 56108; text = ""; 	x = circle_center_X-0.2 * safezoneW/2+(0.25* safezoneW); 	y = safeZoneY+0.4; w = 0.2 * safezoneW; h = 0.7 * safezoneH; };	
	};
};