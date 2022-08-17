
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_location = _this # 0;
_unitsCount = _this # 1;
_triggerOnMap = _this # 2;
_trgPos = _this # 3;

_countRP = 0;
_whTURE = true;
while {_whTURE} do
{
	sleep 600;
	if(_countRP >= 2)exitWith{_whTURE=false;};
	if ( count (( units BLUFOR ) inAreaArray _triggerOnMap ) <= (0.6 * _unitsCount) ) then { _countRP = _countRP + 1; [ _triggerOnMap, _location, _trgPos ] spawn trg_fnc_reinfSpawn;};
};