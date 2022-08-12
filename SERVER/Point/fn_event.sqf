if(!isServer) exitWith {};

params ["_Point"];

private _posPoint = getMarkerPos _Point;

private ["_list"];

while {srv_cycleworks} do {
    _list = _posPoint nearEntities [["Man","Car","Tank"],400];
	switch (true) do {
	    //первое основное подкрепление для режимов 2 и 3
	    case (HardReinfor == 0 && 
		        {(Rezhim == 2 || {Rezhim == 3}) && 
				{Stage == 2 && 
				{ReinforPoint1 && 
				{(WEST countSide _list) < (numberOfArmy/2)}}}}):{
                    missionNameSpace setVariable ["ReinforPoint1",false,true];	
                    missionNameSpace setVariable ["ReinforPoint",true,true];
                    [_Point] spawn srv_fnc_ReinforPoint;
				};
		//второе основное подкрепление для режимов 2 и 3		
	    case (HardReinfor == 0 && 
				{(Rezhim == 2 || {Rezhim == 3}) && 
				{Stage == 3 && 
				{ReinforPoint2 && 
				{(WEST countSide _list) < 20}}}}):{
                    missionNameSpace setVariable ["ReinforPoint2",false,true];
                    missionNameSpace setVariable ["ReinforPoint",true,true];
                    [_Point] spawn srv_fnc_ReinforPoint;				
				};
		//условия для перехода к следующему городу		
		case(Rezhim == 3 && 
		    {Stage == 4 && 
			{RTST == 0 && 
			{PerehodPoint && 
			{(WEST countSide _list) < 6}}}}):{//для режима 3
            missionNameSpace setVariable ["therePoint",1,true];
            missionNameSpace setVariable ["Stage",5,true];
            [_Point] spawn srv_fnc_TransitionPoint;		
		};
		
	    case(Rezhim == 2  && 
		    {Stage == 4 && 
			{PerehodPoint && 
			{(WEST countSide _list) < 6}}}):{//для режима 2
		
            missionNameSpace setVariable ["therePoint",1,true];
            missionNameSpace setVariable ["Stage",5,true];	
			[_Point] spawn srv_fnc_TransitionPoint;		
		};
		case (Rezhim == 1 && {(WEST countSide _list) < 6}):{//для режима 1
            missionNameSpace setVariable ["Stage",5,true];
            missionNameSpace setVariable ["therePoint",1,true];
            [_Point] spawn srv_fnc_TransitionPoint;		
		};		
	};
    sleep 5;
};