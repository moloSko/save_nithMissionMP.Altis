class BlackFon {
	idd = -1;
	movingEnable = 1;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name = "BlackFon";
	onload = "uinamespace setvariable ['BlackFon',param [0]]";
	onUnload = "uinamespace setvariable ['BlackFon',nil]";
	class controls {
		class BlackFon_type {
			type = 0;
			idc = 61422;
			style = 0;
			x = "safeZoneXAbs";
			y = "safeZoneY";
			w = "safeZoneWAbs";
			h = "safeZoneH";
			font = "RobotoCondensed";
			sizeEx = 0.032;
			colorText[] = {1,1,1,1};
			colorBackground[]={0,0,0,1};
			text = "";
			shadow = 0;
		};
	};
};