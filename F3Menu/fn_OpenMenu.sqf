	
	/*
		МЕНЮ F3
	*/
	
	private _target = _this # 0;
	private _isTarget = false;
	private _player = player;
	if(call CONDITION_VIEWSTAT) then { _player = _target;_isTarget=true;};
	
	private _AllDopusk = PDATA_TEXT # 4 # 4;
	private _AllPanels = [PDATA_TEXT # 4 # 3,PDATA_TEXT # 4 # 2,PDATA_TEXT # 4 # 0];
	private _AllHours = PDATA_TEXT # 3;

	private _ccY = ["#ffffff","#66f14b","ЕСТЬ"];
	private _ccN = ["#999999","#f14b4b","НЕТ"];
		
	GetDopuskPlayer = {
		private _type = _this;
		private _text = "";
		private _pPanels = _player getVariable "pPanels";
		
		{
			if((_pPanels # 4 # _type # _forEachIndex) == 1)then{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccY # 0,_x,_ccY # 1,_ccY # 2];
			}else{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccN # 0,_x,_ccN # 1,_ccN # 2]
			};
		} forEach _AllDopusk # _type;
		
		_text;
	};

	GetPanelsPlayer = {
		private _type = _this;
		private _text = "";
		private _pPanels = _player getVariable "pPanels";
		private _nn = 0;
		if(_type == 0)then{_nn=3;};
		if(_type == 1)then{_nn=2;};
		if(_type == 2)then{_nn=0;};
		{
			if((_pPanels # _nn # _forEachIndex) == 1)then{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccY # 0,_x,_ccY # 1,_ccY # 2];
			}else{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccN # 0,_x,_ccN # 1,_ccN # 2]
			};
		} forEach _AllPanels # _type;
		_text;
	};
	
	GetHoursPlayer = {
		private _type = _this;
		private _text = "";
		private _pHours = _player getVariable "pHours";
		{
			_text = _text + format["<t align='left' shadow='0' color='ffffff' size='1'>%1</t><t align='right' shadow='0' color='ddddd' size='1'>%2    ч.</t><br/>",_x,floor ((_pHours # _forEachIndex)/60)];
		} forEach _AllHours;
		_text;
	};
	
	GetFPS = {
		if(!local player) exitWith {};
		if(!clientstart) exitWith {};
		disableSerialization;
		_disp = (findDisplay 56000);
		_fps_sever = str (_this # 0);
		_fps_client = str (round (diag_fps));
		private _form = format["<t color='#f1eb4b' size='0.9' shadow='0' valign='middle'><t align='left'>FPS сервера</t><t align='right'>%1</t><br/><t align='left'>FPS клиента</t><t align='right'>%2</t><br/></t>",_fps_sever,_fps_client];
		(_disp displayCtrl 56105) ctrlSetStructuredText parseText _form;	
	};
	
	
	if (!isNull (findDisplay 56000)) then {
		(findDisplay 2900) closeDisplay 0;(findDisplay 56000) closeDisplay 0;ppEffectDestroy F3MenuBlur;
	} else {
		F3MenuBlur = ppEffectCreate ["DynamicBlur", 401]; 
		F3MenuBlur ppEffectEnable true; 
		F3MenuBlur ppEffectAdjust [1]; 
		F3MenuBlur ppEffectCommit 0;
		createDialog "F3Menu";

		[] spawn { while {!isNull (findDisplay 56000)} do {[round diag_fps] remoteexeccall ["GetFPS"]; sleep 1; };};
		
		waitUntil {!isNull (findDisplay 56000)};
		
		while {!isNull (findDisplay 56000)} do {
		
			private _pLvl = _player getVariable ["pLvl",-1];
			private _pKarma = _player getVariable ["pKarma",0];
			private _pLvlName = (iLVL # _pLvl # 1);
			private _Prc = ["GetPrc",[_player]] call F_fnc_S;
			
			private _form = format["<t align='center' valign='middle' shadow='0'><t color='#ffffff' size='0.8'>%1</t><br/><t color='#66f14b' size='1.3'>%2</t><br/><br/><t color='#ffffff' size='0.8'>прогресс</t><br/><t color='#66f14b' size='2'>%3%4</t><br/></t>",_pLvlName,name _player,_Prc,"%"];
			
			if(_pKarma > 0) then {
				_pLvlName = "штрафник";
				_Prc = "выполняй полезные действия<br/>для восстановления звания";
				if(_isTarget) then {_Prc = "";};
				_form = format["<t align='center' valign='middle' shadow='0'><t color='#ff0000' size='0.8'>%1</t><br/><t color='#f10000' size='1.3'>%2</t><br/><br/><t color='#ffffff' size='0.8'>%3</t></t>",_pLvlName,name _player,_Prc];
			};
			
			if(_isTarget) then {((findDisplay 56000) displayCtrl 56102) ctrlShow false;};
			if(_isTarget) then {((findDisplay 56000) displayCtrl 56105) ctrlShow false;};
			
			((findDisplay 56000) displayCtrl 56103) ctrlSetStructuredText parseText _form;	
			if(_pLvl > 0 && _pKarma <= 0)then{((findDisplay 56000) displayCtrl 56104) ctrlSetStructuredText parseText format["<img image='F3Menu\ranks\%1.paa' size='3' shadow='0' align='center' valign='top'/>",_pLvl];	
			((findDisplay 56000) displayCtrl 56104) ctrlSetTooltip format["%1 %2",_pLvlName,name _player];};
			((findDisplay 56000) displayCtrl 56106) ctrlSetStructuredText parseText format["\
						<t align='center' shadow='0' color='#ffffff' size='1.5'>ДОПУСКИ</t>\
						<br/><t align='left' shadow='0' color='#4cc3eb' size='1'>АВИАЦИЯ</t><br/>%1\
						<br/><t align='left' shadow='0' color='#66f14b' size='1'>БРОНЕТЕХНИКА</t><br/>%2\
						<br/><t align='left' shadow='0' color='#bc4bf1' size='1'>РП СТОРОНЫ</t><br/>%3\
						",0 call GetDopuskPlayer,1 call GetDopuskPlayer,2 call GetDopuskPlayer];
			((findDisplay 56000) displayCtrl 56107) ctrlSetStructuredText parseText format["\
						<t align='center' shadow='0' color='#ffffff' size='1.5'>ДОПОЛНИТЕЛЬНО</t>\
						<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ПРОЙДЕННЫЕ КУРСЫ</t><br/>%1\
						<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ИНСТРУКТОР</t><br/>%2\
						<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ПАНЕЛИ</t><br/>%3\
						",0 call GetPanelsPlayer,1 call GetPanelsPlayer,2 call GetPanelsPlayer];					
			((findDisplay 56000) displayCtrl 56108) ctrlSetStructuredText parseText format["\
						<t align='center' shadow='0' color='#ffffff' size='1.5'>СТАТИСТИКА</t>\
						<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ВРЕМЯ</t><br/>%1",[] call GetHoursPlayer];	
			Sleep 0.1;
		};
	};

