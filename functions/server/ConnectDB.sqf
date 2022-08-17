
	/* 
		#2_1 ПОДКЛЮЧЕНИЕ БД
	*/	
	
	"Extdb3" callExtension "9:RESET";
	s_DB_PROTOCOL = ceil random 9999;
	"Extdb3" callExtension "9:ADD_DATABASE:9pota";
	"Extdb3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%1:SQL_CUSTOM:%2:testcustom.ini","9pota",s_DB_PROTOCOL];
	
	s_DB = true;

