	
	/*
		ПРАВИЛА, КОНТАКТЫ НА КАРТЕ
	*/
	player createDiarySubject ["Rules","Правила"];player setDiarySubjectPicture ["Rules", "a3\3den\data\cfg3den\history\changeattributes_ca.paa"];
		
	player createDiaryRecord ["Rules", ["==[ ШТАБ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ КРАСНЫЙ КРЕСТ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ СТРИНГЕР ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ ПАТРИОТ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ ТАНКИСТ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ ПИЛОТ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ КНГ ]==", "Правила в дискорде чеееек"]];
	player createDiaryRecord ["Rules", ["==[ ПЕХОТА ]==", '\
	<font color="#fee93c" size="20">Правила пехоты</font><br/>\
	<font color="#fee93c">1.1.</font> Командир всегда прав!<br/>\
	<font color="#fee93c">1.2.</font> Если командир не прав, читай "Правила пехоты п.1.1"<br/>\
	<font color="#fee93c">1.3.</font> Смена слота ТОЛЬКО на базе<br/>\
	<font color="#fee93c">1.4.</font> Задача пехоты обеспечить безопасность в ЗБД и сохранить жизни мирных граждан острова (те кто с оружием - задержать; допросить; убить)!<br/>\
	<font color="#fee93c">1.5.</font> Упав 300 (трехсотым) дождаться медика или солдат, которые вам помогут<br/>\
	<font color="#fee93c">1.6.</font> По прибытию на базу, обслужить технику, сбросить трофейное вооружение, построиться на плацу, перейти в группу "ШТАБ"<br/>\
	\
	<font color="#fee93c" size="20">Обязанности</font><br/>\
	<font color="#fee93c">2.1.</font> Выполнять все приказы НШ => ВриоНШ => КНГ => ЗамКома<br/>\
	<font color="#fee93c">2.2.</font> Сохранить жизни мирных жителей в ЗБД<br/>\
	<font color="#fee93c">2.3.</font> Выдвигаться с базы с вооружением доступным по занимаемому слоту<br/>\
	<font color="#fee93c">2.4.</font> Выдвигаться на операцию/миссию с разрешения КНГ (делаем запрос "КНГ разрешите присоединиться к операции, слот Название слота")<br/>\
	<font color="#fee93c">2.5.</font> Помогать перетаскивать 300 к медику<br/>\
	<font color="#fee93c">2.6.</font> Оперативно информировать КНГ, давать только полезную информацию в "Канал группы"<br/>\
	\
	<font color="#fee93c" size="20">Права</font><br/>\
	<font color="#fee93c">3.1.</font> Пользоваться любой наземной колесной техникой<br/>\
	<font color="#fee93c">3.2.</font> Использовать любое вооружение доступное в арсенале<br/>\
	<font color="#fee93c">3.3.</font> Использовать трофейное вооружение или технику в ЗБД (предупредив КНГ)<br/>\
	<font color="#fee93c">3.4.</font> Отыгрывать специальные роли (придуманные вами)<br/>\
	<font color="#fee93c">3.5.</font> Уходить в АФК (предварительно предупредив КНГ и поставив метку на себя)<br/>\
	<font color="#fee93c">3.6.</font> Уходить на БЗ (предварительно предупредив КНГ)<br/>\
	<font color="#fee93c">3.7.</font> Действовать в зависимости от ситуации (не уходя далеко от плана/приказа КНГ)<br/>\
	<font color="#fee93c">3.8.</font> Предлагать свои идеи КНГ при заходе в ЗБД<br/>\
	<font color="#fee93c">3.9.</font> Открывать ответный огонь без приказа КНГ<br/>\
	<font color="#fee93c">3.10.</font> Вызывать ЗЕВСа (при наличии, только вытаскивание из текстур)<br/>\
	<font color="#fee93c">3.11.</font> Перезайти на другой слот (только находясь на базе)<br/>\
	<font color="#fee93c">3.12.</font> Обжаловать любое действие или приказ КНГ или солдат служебной запиской<br/>\
	\
	<font color="#fe3c3c" size="20">Запрещено</font><br/>\
	<font color="#fee93c">4.1.</font> Действовать самовольно<br/>\
	<font color="#fee93c">4.2.</font> Убивать намеренно своих (ТКшить)<br/>\
	<font color="#fee93c">4.3.</font> Использовать каналы не по предназначению (флудить)<br/>\
	<font color="#fee93c">4.4.</font> Возрождаться без приказа НШ => ВриоНШ => КНГ<br/>\
	<font color="#fee93c">4.5.</font> Выходить в лобби и снова в игру (исключение: приказ НШ => ВриоНШ => КНГ)<br/>\
	<font color="#fee93c">4.6.</font> Убивать гражданских не представляющих опастность<br/>\
	<font color="#fee93c">4.7.</font> Разговаривать, давать мета-информацию (в состоянии 300)<br/>\
	<font color="#fee93c">4.8.</font> Издеваться над РП-стороной<br/>\
	<font color="#fee93c">4.9.</font> Разрушать инфраструктуру гражданских строений (исключение: вынужденная мера)<br/>\
	<font color="#fee93c">4.10.</font> Перебивать НШ => ВриоНШ => КНГ<br/>\
	<font color="#fee93c">4.11.</font> Обсуждать приказы НШ => ВриоНШ => КНГ<br/>\
	']];
	
	player createDiaryRecord ["Rules", ["==[ ОБЩИЕ ]==", '\
	<font color="#fee93c" size="20">Проект «Девятка»</font><br/>\
	<font color="#fee93c">1.1.</font> Приходя к нам, вы соглашаетесь, принимаете и чтите все правила и уставы<br/>\
	<font color="#fee93c">1.2.</font> Мы - ВС РФ, миротворческая организация, которая противостоит силам НАТО и другим группировкам на островах<br/>\
	<font color="#fee93c">1.3.</font> Игра имеет элементы РП и армейского устава<br/>\
	<font color="#fee93c">1.4.</font> Ваш "позывной" должен быть читабельным и адекватным<br/>\
	<font color="#fee93c">1.5.</font> Помогайте новобранцам (особенно тем, кто впервые установил игру)<br/>\
	\
	<font color="#fe3c3c" size="20">Запрещено</font><br/>\
	<font color="#fe3c3c">2.1.</font> Мат\Оскорбления\Унижения\Троллинг и прочее неадекватное поведение в любом виде<br/>\
	<font color="#fe3c3c">2.2.</font> Использовать или публиковать контент содержащий 18+, эротику, обнаженку, или полуобнаженку<br/>\
	<font color="#fe3c3c">2.3.</font> Проводить "агрессивную" агитацию в отряды<br/>\
	<font color="#fe3c3c">2.4.</font> Использовать баги, читы и прочее стороннее ПО для нечестной игры<br/>\
	<font color="#fe3c3c">2.5.</font> Обсуждать политические настрои, обстановку в мире и прочее, что может быть воспринято негативно солдатами, а так же запрещается любая символика, которая может повлечь за собой нарушение установленного пункта правил<br/>\
	<font color="#fe3c3c">2.6.</font> Рекламировать сторонние проекты, или продукты нарушающие законы РФ<br/>\
	<font color="#fe3c3c">2.7.</font> Дискредитировать проект<br/>\
	<font color="#fe3c3c">2.8.</font> Заходить с никам: "ASUS", "ACER", "HP", "AMD", "RADEON", "MSI", "Admin", "Админ", "User", "Пользователь", "PC", "ПС", "Kiosk", "Player", "Игрок", "Play", "Gamer" (могут дополняться)<br/>\
	<font color="#fe3c3c">2.9.</font> Распространять личные данные<br/>\
	\
	<font color="#fee93c" size="20">Наказания</font><br/>\
	<font color="#fee93c">3.1.</font> Профилактическая беседа<br/>\
	<font color="#fee93c">3.2.</font> Исправительные работы (отжимания, бег, маршбросок, прочие уставные "игровые" наказания)<br/>\
	<font color="#fee93c">3.3.</font> "Штрафбат" за систематические нарушения или понижение в звании<br/>\
	<font color="#fee93c">3.4.</font> КИК<br/>\
	<font color="#fee93c">3.5.</font> БАН от 1 дня до 30 дней<br/>\
	<font color="#fee93c">3.6.</font> Перманентный макияж<br/>\
	']];
		
		
		
	player createDiarySubject ["Contact","Контакты"];player setDiarySubjectPicture ["Contact", "a3\3den\data\cfg3den\history\connectitems_ca.paa"];
	player createDiaryRecord ["Contact", ["Ссылки", format["<br/>Наши контакты<br/><br/>Discord: <font color='#fee93c'>%1</font><br/>VK: <font color='#fee93c'>%2</font><br/>IP: <font color='#fee93c'>%3</font>",TEXT_DC,TEXT_VK,TEXT_IP]]];
	
	
	
	player createDiarySubject ["History","История"];player setDiarySubjectPicture ["History", "a3\missions_f_exp\data\img\lobby\ui_campaign_lobby_icon_player_host_ca.paa"];
	player createDiaryRecord ["History", ["СМИ", ""]];
	player createDiaryRecord ["History", ["КРАСНЫЙ КРЕСТ", ""]];
	player createDiaryRecord ["History", ["ПАТРИОТЫ", '\
Бывшие военнослужащие армии США, ветераны боевых действий во Вьетнаме. Уволенные из армии по окончанию войны. Брошенные собственной страной, они хотели только одного- мести.<br/>\
По имеющимся данным, их спонсирует компания “TPC,, принадлежащая бывшему агенту ЦРУ.<br/>\
**Уэйн Даунинг**<br/>\
Патриоты отправились в Эгейское моря в апреле 1992г.<br/>\
Звонок Уэйн Даунинг, неизвестному[17.05.92]<br/>\
-Собирай своих ребят, для вас есть работа-<br/>\
-Что за работа?-<br/>\
-Пришло время отомстить начальникам в белом доме.-<br/>\
-Как давно я это ждал! Что нам делать.-<br/>\
-Как всегда. Вылететь по координатам, и убить всех кто помешает. Дальнейшие указания получишь на месте.']];
	player createDiaryRecord ["History", ["НАТО", '\
Статус: Совершенно секретно<br/>\
Уровень допуска: Альфа 1-4-1<br/>\
В апреле 1992г. была получена информация от агента “Крот,,. РФ открыла неизвестное вещество на нескольких островах в Эгейском море. Руководством НАТО было принято решения, скрытно перебросить части 34 бригады морской пехоты США, роту 13 батальона рейнджеров и отряд SAS в Грецию.<br/>\
18 мая началась операция “Филин,, по взятию под контроль острова Алтис.<br/>\
Радио передача с острова Алтис [18.05.92]<br/>\
“Олимп- я Белый ястреб. Обнаружили неизвестные силы. Предположительно русские. Действуем по плану?<br/>\
“Белый ястреб- я Олимп. Продолжайте выполнять поставленную задачу']];
	player createDiaryRecord ["History", ["ВС РФ", '\
Афганистан 1988 год, только что с учебки, где Старший прапорщик Дыгало дрючил их месяцами, десантники были приписаны к доблестной 9-ой Роте 345-го отдельного парашютно-десантного полка. Их задача заключалась в занятии высоты 3234 (миссия "Магистраль"), которую вскоре называли «Последний гарнизон» - их просто забыли. Там же они приняли последний бой, в котором погибло много десантников, лишь только чудом, а именно с помощью вертолетов им удалось отбить наступление и эвакуироваться с высоты. 9 Рота была награждена множественными наградами, они продолжили служить своей стране.<br/><br/>\
Спустя 4 года, уже будучи военнослужащими Российской Федерации, они были направленны в Эгейское моря с миротворческой миссией. (официальная версия)<br/><br/>\
Статус: Совершенно секретно<br/>\
Уровень допуска: 1<br/>\
В 1990 году на нескольких островах в Эгейском море, был найден неизвестный хим.Элемент "Алтий" .Его оценивают в: 35 000 000 долларов за 1 грамм. Оно обладает колоссальной мощностью, как в гражданских, так и в военных целях. Местное правительство не обладает технологиями по добычи хим. Элемента.<br/>\
Этот элемент был найден учёным физиком-ядерщиком **Отто Ган**, прибывший из ГДР(Германская Демократическая Республика) после воссоединения Германии 3 октября 1990 г.<br/>\
При содействии крупных компаний по добыче полезных ископаемых, началась разработка месторождений. По прибытию на место сил ОДКБ (9-ой роты 345-го отдельного парашютно-десантного полка,7-ой роты 106-го отдельного разведывательного батальона ВС РК, части 927-го истребительного авиационного полка ВС РБ, отряд ГРУ [секретно]) местное правительство сопротивления не оказало, в отличии от населения острова. Группы вооруженных людей, совершали диверсии на месторождениях элемента. Спустя 2 недели, на островах высадились силы НАТО их численность- неизвестна.<br/>\
Радио передача с острова Алтис [18.05.92]<br/>\
“Берлога-я Медведь. Подверглись удару неизвестных сил. Просим помощи…[помехи]<br/>\
']];
	
	
	player removeDiarySubject "Diary";
	player removeDiarySubject "Units";
	player removeDiarySubject "Statistics";
	player removeDiarySubject "log";

	/*

	TAG_fnc_processDiaryLink = {
		processDiaryLink createDiaryLink ["Diary", _this, ""];
	};
	DiaryRec1 = player createDiaryRecord ["Diary", ["Record 1", 
		"Go to <execute expression='DiaryRec2 call TAG_fnc_processDiaryLink'>Record 2</execute>"
	]];
	DiaryRec2 = player createDiaryRecord ["Diary", ["Record 2", 
		"Go to <execute expression='DiaryRec3 call TAG_fnc_processDiaryLink'>Record 3</execute>"
	]];
	DiaryRec3 = player createDiaryRecord ["Diary", ["Record 3", 
		"Go to <execute expression='DiaryRec1 call TAG_fnc_processDiaryLink'>Record 1</execute>"
	]];

	a3\ui_f\data\map\respawn\icon_enemy_ca.paa
	a3\modules_f\data\iconhq_ca.paa
	a3\ui_f_curator\data\logos\arma3_zeus_icon_ca.paa

	player setDiarySubjectPicture ["Intel", "a3\modules_f\data\iconhq_ca.paa"];



	player createDiaryRecord ["myPage", ["Intel", "Enemy base is on grid <marker name='enemyBase'>161170</marker>3"]];


	player createDiaryRecord ["myPage", ["Intel", "Enemy base is on grid <marker name='enemyBase'>161170</marker>"]];

	player createDiaryRecord ["myPage", "Information gathered.<br /><img image='wellDone_ca.paa' />"];

	player createDiaryRecord ["myPage", ["No Title", "  🛐 ⛎ ♈ ♉ ♊ ♋ ♌ ♍ ♎ ♏ ♐ ♑ ♒ ♓ 🆔  📴 📳 🈶 🈚 🈸 🈺  🆚 🉑 💮 🉐  🈴 🈵 🈹 🈲 🅰 🅱 🆎 🆑 🅾 🆘 ⛔ 📛 🚫 ❌ ⭕ 💢  🚷 🚯 🚳 🚱 🔞 📵 🚭 description"], taskNull, "", false];

	player createDiaryRecord ["myPage", ["Font tag","<font color='#7FFF00' size='30' face='TahomaB'>This will changed text size, colour and font</font>"], taskNull, "",false];

	player createDiaryRecord ["myPage", ["Image", "<img image='\A3\Ui_F_Curator\Data\Logos\arma3_curator_artwork.jpg' width='500' height='800'/>"], taskNull, "", false];

	player createDiaryRecord ["myPage", ["Linebreak","Line1<br></br>Line2<br></br><br></br>Line4"], taskNull, "", false];

	player createDiaryRecord ["myPage", ["Execute","<execute expression='hint ""Some code"";'>Some text</execute>"], taskNull, "", false];

	player createDiaryRecord ["myPage", ["ExecuteClose <img image='a3\modules_f\data\iconhq_ca.paa' />", "<executeClose expression=""hint 'Diary closed';"">Close Diary</executeClose>"], taskNull, "", false];


	player setDiarySubjectPicture ["myPage", "\A3\ui_f\data\map\markers\nato\o_mech_inf.paa"];

	*/