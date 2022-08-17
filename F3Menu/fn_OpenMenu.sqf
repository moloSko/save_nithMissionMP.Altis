	
	/*
		МЕНЮ F3
	*/
	
	private _p_DATA_TEXT = ["Звание","Прогресс",
	["Транспортные вертолёты","Боевые вертолёты","Транспортные самолёты","Боевые самолёты"],
	["Гусеничная легкая техника","Гусеничная средняя техника","Гусеничная тяжелая техника","Артилерия"],
	["ЗЕВС","Патриоты","Стрингеры","Красный Крест"],
	["Инструктор пилотов","Инструктор танкистов","Инструктор РП","Инструктор новобранцев","Инструктор Офицеров","Инструктор Снайперов","Инструктор Инженеров","Инструктор Санитаров"],
	["Офицер","Инженер","Снайпер","Санитар"],
	["Админ","Тех.Поддержка","Заместитель","Разработчик"]
	];

	private _target = cursorTarget;
	private _isTarget = false;
	private _player = player;
	if(call COND_F3) then { _player = _target;_isTarget=true;};


	private _ccY = ["#ffffff","#66f14b","ЕСТЬ"];
	private _ccN = ["#999999","#f14b4b","НЕТ"];
		
	private _GetInfoPlayer = {
		private _text = "";
		private _dopusk = _player getVariable [format["p%1",_this # 0],0];
		private _name = _p_DATA_TEXT # (_this # 1);

		{
			if((_dopusk # _forEachIndex) == 1)then{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccY # 0,_x,_ccY # 1,_ccY # 2];
			}else{
				_text = _text + format["<t align='left' shadow='0' color='%1' size='1'>%2</t><t align='right' shadow='0' color='%3' size='1'>%4</t><br/>",_ccN # 0,_x,_ccN # 1,_ccN # 2]
			};
		} forEach _name;
		
		_text;
	};

	private _GetStatPlayer = {
		private _text = "";
		private _pDiscord = _player getVariable ["pDiscord",0];
		private _pRedName = _player getVariable ["pRegName",name _player];
		private _pRegDate = _player getVariable ["pRegDate","Сегодня"];
		if(_pRedName == "")then{_pRedName=name _player;};if(_pRegDate == "")then{_pRegDate="Сегодня";};
		_text = _text + format["<t align='left' shadow='0' color='#ffffff' size='1'>Первый ник</t><t align='right' shadow='0' color='#ffffff' size='0.7'>%1</t><br/>",_pRedName];
		_text = _text + format["<t align='left' shadow='0' color='#ffffff' size='1'>Впервые зашел</t><t align='right' shadow='0' color='#ffffff' size='0.7'>%1</t><br/>",_pRegDate];
		if(_pDiscord == 1)then{_text = _text + "<t align='left' shadow='0' color='#ffffff' size='1'>Связь с дискордом</t><t align='right' shadow='0' color='#66f14b' size='1'>ЕСТЬ</t><br/>";
		}else{_text = _text + "<t align='left' shadow='0' color='#999999' size='1'>Связь c дискордом</t><t align='right' shadow='0' color='#f14b4b' size='1'>НЕТ</t><br/>";};
		_text;
	};

	
	if (!isNull (findDisplay 56000)) then {
		(findDisplay 2900) closeDisplay 0;(findDisplay 56000) closeDisplay 0;ppEffectDestroy F3MenuBlur;
	} else {
		F3MenuBlur = ppEffectCreate ["DynamicBlur", 401]; 
		F3MenuBlur ppEffectEnable true; 
		F3MenuBlur ppEffectAdjust [1]; 
		F3MenuBlur ppEffectCommit 0;
		createDialog "F3Menu";
		
		waitUntil{!isNull (findDisplay 56000)};

		private _pLvl = _player getVariable ["pLvl",-1];
		private _pKarma = _player getVariable ["pKarma",0];
		private _pLvlName = (iLVL # _pLvl # 0);
		private _Prc = [_player] call fnc_GetPrc;
		
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
					",["CYP",2] call _GetInfoPlayer,["BTV",3] call _GetInfoPlayer,["RP",4] call _GetInfoPlayer];
		((findDisplay 56000) displayCtrl 56107) ctrlSetStructuredText parseText format["\
					<t align='center' shadow='0' color='#ffffff' size='1.5'>ДОПОЛНИТЕЛЬНО</t>\
					<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ПРОЙДЕННЫЕ КУРСЫ</t><br/>%1\
					<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ИНСТРУКТОР</t><br/>%2\
					<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ПАНЕЛИ</t><br/>%3\
					",["Skill",6] call _GetInfoPlayer,["KMB",5] call _GetInfoPlayer,["Admin",7] call _GetInfoPlayer];					
		((findDisplay 56000) displayCtrl 56108) ctrlSetStructuredText parseText format["\
					<t align='center' shadow='0' color='#ffffff' size='1.5'>СТАТИСТИКА</t>\
					<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ИНФОРМАЦИЯ</t><br/>%1\
					<br/><t align='left' shadow='0' color='#ebc44c' size='1'>ВРЕМЯ</t><br/>%2\
					",call _GetStatPlayer];
	};

