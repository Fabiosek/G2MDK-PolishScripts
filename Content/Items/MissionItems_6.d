
instance ITSE_XARDASNOTFALLBEUTEL_MIS(C_ITEM)
{
	name = "Bardzo dziwna sk�rzana torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_xardasnotfallbeutel;
	description = name;
	text[0] = "";
	text[1] = "Wydaje si� zawiera�";
	text[2] = "co� twardego i jaki�";
	text[3] = "dokument.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_xardasnotfallbeutel()
{
	var string concattext;
	CreateInvItems(hero,itwr_xardasermahnungfueridioten_mis,1);
	CreateInvItems(hero,itmi_innoseye_discharged_mis,1);
	concattext = ConcatStrings("2",PRINT_ITEMSERHALTEN);
	Print(concattext);
};


instance ITWR_XARDASERMAHNUNGFUERIDIOTEN_MIS(C_ITEM)
{
	name = "List ostrzegawczy Xardasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardasermahnungfueridioten;
	scemename = "MAP";
	description = name;
};


func void use_xardasermahnungfueridioten()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"M�j m�ody przyjacielu - wielce mnie rozczarowa�a twoja postawa. Jak mog�e� odp�yn�� bez Oka Innosa?");
	Doc_PrintLines(ndocid,0,"Liczy� mog� jedynie na to, �e nawet twe niedbalstwo ma granice. W przeciwnym wypadku nie wygnasz Z�a ze �wiata i b�d� musia� osobi�cie ocali� ci� od twej g�upoty.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Xardas");
	Doc_Show(ndocid);
};


instance ITWR_KRYPTA_GARON(C_ITEM)
{
	name = "Stary list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_krypta_garon;
	scemename = "MAP";
	description = name;
	text[3] = "Pisany niepewn� r�k�.";
};


func void use_krypta_garon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zawiod�em. P�onne me nadzieje na zatrzymanie Inubisa na �cie�ce dobra.");
	Doc_PrintLines(ndocid,0,"Na pocz�tku s�dzi�em, �e nie �yj�, ale w starych ko�ciach Ivana drzemie jeszcze si�a.");
	Doc_PrintLines(ndocid,0,"Inubis jednak powsta� z martwych i szuka zemsty za wygnanie przez prastary zakon paladyn�w.");
	Doc_PrintLines(ndocid,0,"Towarzyszy mu wielu wyznawc�w... Jak wojownik pokroju Inubisa m�g� sta� si� tak z�y?");
	Doc_PrintLines(ndocid,0,"Znalaz�em w tej krypcie jego gr�b, nie wiem jednak, czy zdo�am przekaza� komu� wie�ci o moim odkryciu, pisz� wi�c te s�owa w nadziei na to, �e zostan� odnalezione.");
	Doc_PrintLines(ndocid,0,"Strze�cie si�. Pot�ny nieprzyjaciel si�ga po dusze sprawiedliwych. Inubis nie b�dzie ostatni...");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Niechaj Innos chroni wasze dusze");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                 Ivan");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_ORKKNASTDI_MIS(C_ITEM)
{
	name = "Klucz orka-pu�kownika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_UNDEAD_01(C_ITEM)
{
	name = "Klucz Archola";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ITKE_EVT_UNDEAD_02(C_ITEM)
{
	name = "Klucz klucznika";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Klucz do komnaty czarnego maga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "Zw�j czarnego maga";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_lastdoortoundeaddrgdi_mis;
	scemename = "MAP";
	description = name;
};


func void use_itwr_lastdoortoundeaddrgdi_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"KHADOSH ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"EMEM KADAR");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niech Oko Mocy o�wietli tw� �cie�k�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Zw�j czarnego maga zawiera s�owa KHADOSH EMEM KADAR. Brzmi to jak jakie� zakl�cie, ale do czego s�u�y - i czym jest Oko Mocy?");
};


instance ITKE_CHESTMASTERDEMENTOR_MIS(C_ITEM)
{
	name = "Klucz do kufra czarnego maga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_REZEPT_MEGADRINK_MIS(C_ITEM)
{
	name = "Receptura";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_rezeptfuermegatrank;
	scemename = "MAP";
	description = name;
};


func void use_rezeptfuermegatrank()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zdo�a�em wskrzesi� pradawn� sztuk�, boj� si� jednak, �e nie spodoba si� to Feodaronowi.");
	Doc_PrintLines(ndocid,0,"Musz� zmiesza� ca�e jego potomstwo i stworzy� z niego mikstur� w moim laboratorium. Gdyby jeszcze tylko nie siedzia� bez przerwy na tych jajach... Nadal jednak czuj� wobec niego szacunek.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Embarla Firgasto:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"10 smoczych jaj, jedna starta na proszek czarna per�a i szczypta siarki.");
	Doc_PrintLines(ndocid,0,"Mikstur� nale�y doprowadzi� do wrzenia i miesza� bez przerwy podczas destylacji.");
	Doc_PrintLines(ndocid,0,"Substancji ko�cowej nale�y u�ywa� z umiarem, gdy� wywo�uje silne efekty uboczne i mo�e rozchwia� ca�y system kontroli nad magi�.");
	Doc_Show(ndocid);
	PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] = TRUE;
};


instance ITWR_DIARY_BLACKNOVICE_MIS(C_ITEM)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_diary_blacknovice;
};


func void use_diary_blacknovice()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ju� od 36 dni czekam na wezwanie. Zaczynam w�tpi�, czy si� doczekam - mimo �e zrobi�em wszystko, o co mnie proszono. Lata�em dla nich i przynosi�em r�ne rzeczy jak jaki� lokaj.");
	Doc_PrintLines(ndocid,0,"Klucznik nakaza� mi zamkni�cie krat, ale jeszcze si� do tego nie zabra�em. Jak tak dalej p�jdzie, to ka�dy b�dzie sobie m�g� po prostu wej�� przez bram�...");
	Doc_PrintLines(ndocid,0,"Szkoda, �e nie pami�tam w�a�ciwych kombinacji.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bardzo dawno ju� nie zakrada�em si� do wielkiej komnaty i nie mog� si� doczeka� spotkania z Mistrzem. Ciekaw jestem, czy pozwol� mi na nie, gdy ju� do nich do��cz�.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Wczoraj podj��em pr�b�, ale dotar�em tylko do komnaty z dwoma d�wigniami - nawet nie zdo�a�em wypr�bowa� kombinacji prze��cznik�w w zachodnim skrzydle! Ta �winia pozamyka�a komnaty. Jutro spr�buj� wydosta� od niego klucz...");
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Dziennik ucznia czarnego maga wspomina o komnatach z d�wigniami, kluczniku, kombinacji prze��cznik�w... Trzeba to zapami�ta�, nigdy nie wiadomo, kiedy mo�e si� przyda�.");
};


instance ITWR_ZUGBRUECKE_MIS(C_ITEM)
{
	name = "Stary list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_zugbruecke;
	scemename = "MAP";
	description = name;
};


func void use_zugbruecke()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"   Ostatnie ostrze�enie!");
	Doc_SetMargins(ndocid,-1,50,50,70,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nic mnie nie obchodzi, czy uda si� wam przele�� przez most z drugiej strony. Dla mnie mo�ecie piec si� w piekle.");
	Doc_PrintLines(ndocid,0,"Tak d�ugo, jak jestem w swoich w�o�ciach, most b�dzie podniesiony, a ka�dego m�drka, kt�ry b�dzie pr�bowa� ustrzeli� z �uku prze��cznik, �eby si� tu dosta�, osobi�cie wypatrosz� i powiesz� na najbli�szym drzewie!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      Archol");
	Doc_Show(ndocid);
};


instance ITMI_POWEREYE(C_ITEM)
{
	name = "Oko Mocy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

