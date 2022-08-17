
	/*
		Название: «Спавн Зоны Боевых Действий»
		Авторы: Rurix & Warsom
		Авторское право: (c) 2022 «Девятка»
		Данный скрипт был разработан, написан, протестирован специально для проекта-сервера «Девятка». Любое копирование и использование скрипта без согласия авторов запрещено!
		https://discord.gg/GPfv3qAQFX 
	*/

_triggerOnMap = _this # 0;
_location = _this # 1;
_trgPos = _this # 2;

for [{ _i = 0 }, { _i < 2 }, { _i = _i + 1 }] do 
{
	[ _location, _triggerOnMap] spawn trg_fnc_spawnCheenook;	// Спавн воздушного десанта
	sleep 10;
};
[ _trgPos ] spawn trg_fnc_reinfAir;		// Спавн воздушного подкрепа
[ _location, _triggerOnMap ] spawn trg_fnc_reinfGround;
if ((playersNumber east) > 15 && (random 1) <= 0.05) then 
{
	[ _location, _triggerOnMap] spawn trg_fnc_spawnBlackFish;
};