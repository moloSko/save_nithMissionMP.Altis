	"Extdb3" callExtension "9:RESET";
	Freq = 0.2;
	PROTOCOL = ceil random 9999;
	OurDataBase = "9pota";
	"Extdb3" callExtension "9:ADD_DATABASE:9pota";
	"Extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:testcustom.ini",OurDataBase,PROTOCOL];

	missionNamespace setVariable ["DBPROTOCOL",PROTOCOL,true];
	missionNamespace setVariable ["DBCONNECT",true,true];
