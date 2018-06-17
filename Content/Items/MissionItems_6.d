
instance ITSE_XARDASNOTFALLBEUTEL_MIS(C_ITEM)
{
	name = "Bardzo dziwna skórzana torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_xardasnotfallbeutel;
	description = name;
	text[0] = "";
	text[1] = "Wydaje siê zawieraæ";
	text[2] = "coœ twardego i jakiœ";
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
	Doc_PrintLines(ndocid,0,"Mój m³ody przyjacielu - wielce mnie rozczarowa³a twoja postawa. Jak mog³eœ odp³yn¹æ bez Oka Innosa?");
	Doc_PrintLines(ndocid,0,"Liczyæ mogê jedynie na to, ¿e nawet twe niedbalstwo ma granice. W przeciwnym wypadku nie wygnasz Z³a ze œwiata i bêdê musia³ osobiœcie ocaliæ ciê od twej g³upoty.");
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
	text[3] = "Pisany niepewn¹ rêk¹.";
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
	Doc_PrintLines(ndocid,0,"Zawiod³em. P³onne me nadzieje na zatrzymanie Inubisa na œcie¿ce dobra.");
	Doc_PrintLines(ndocid,0,"Na pocz¹tku s¹dzi³em, ¿e nie ¿yjê, ale w starych koœciach Ivana drzemie jeszcze si³a.");
	Doc_PrintLines(ndocid,0,"Inubis jednak powsta³ z martwych i szuka zemsty za wygnanie przez prastary zakon paladynów.");
	Doc_PrintLines(ndocid,0,"Towarzyszy mu wielu wyznawców... Jak wojownik pokroju Inubisa móg³ staæ siê tak z³y?");
	Doc_PrintLines(ndocid,0,"Znalaz³em w tej krypcie jego grób, nie wiem jednak, czy zdo³am przekazaæ komuœ wieœci o moim odkryciu, piszê wiêc te s³owa w nadziei na to, ¿e zostan¹ odnalezione.");
	Doc_PrintLines(ndocid,0,"Strze¿cie siê. Potê¿ny nieprzyjaciel siêga po dusze sprawiedliwych. Inubis nie bêdzie ostatni...");
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
	name = "Klucz orka-pu³kownika";
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
	name = "Zwój czarnego maga";
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
	Doc_PrintLine(ndocid,0,"Niech Oko Mocy oœwietli tw¹ œcie¿kê.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Zwój czarnego maga zawiera s³owa KHADOSH EMEM KADAR. Brzmi to jak jakieœ zaklêcie, ale do czego s³u¿y - i czym jest Oko Mocy?");
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
	Doc_PrintLines(ndocid,0,"Zdo³a³em wskrzesiæ pradawn¹ sztukê, bojê siê jednak, ¿e nie spodoba siê to Feodaronowi.");
	Doc_PrintLines(ndocid,0,"Muszê zmieszaæ ca³e jego potomstwo i stworzyæ z niego miksturê w moim laboratorium. Gdyby jeszcze tylko nie siedzia³ bez przerwy na tych jajach... Nadal jednak czujê wobec niego szacunek.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Embarla Firgasto:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"10 smoczych jaj, jedna starta na proszek czarna per³a i szczypta siarki.");
	Doc_PrintLines(ndocid,0,"Miksturê nale¿y doprowadziæ do wrzenia i mieszaæ bez przerwy podczas destylacji.");
	Doc_PrintLines(ndocid,0,"Substancji koñcowej nale¿y u¿ywaæ z umiarem, gdy¿ wywo³uje silne efekty uboczne i mo¿e rozchwiaæ ca³y system kontroli nad magi¹.");
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
	Doc_PrintLines(ndocid,0,"Ju¿ od 36 dni czekam na wezwanie. Zaczynam w¹tpiæ, czy siê doczekam - mimo ¿e zrobi³em wszystko, o co mnie proszono. Lata³em dla nich i przynosi³em ró¿ne rzeczy jak jakiœ lokaj.");
	Doc_PrintLines(ndocid,0,"Klucznik nakaza³ mi zamkniêcie krat, ale jeszcze siê do tego nie zabra³em. Jak tak dalej pójdzie, to ka¿dy bêdzie sobie móg³ po prostu wejœæ przez bramê...");
	Doc_PrintLines(ndocid,0,"Szkoda, ¿e nie pamiêtam w³aœciwych kombinacji.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Bardzo dawno ju¿ nie zakrada³em siê do wielkiej komnaty i nie mogê siê doczekaæ spotkania z Mistrzem. Ciekaw jestem, czy pozwol¹ mi na nie, gdy ju¿ do nich do³¹czê.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Wczoraj podj¹³em próbê, ale dotar³em tylko do komnaty z dwoma dŸwigniami - nawet nie zdo³a³em wypróbowaæ kombinacji prze³¹czników w zachodnim skrzydle! Ta œwinia pozamyka³a komnaty. Jutro spróbujê wydostaæ od niego klucz...");
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Dziennik ucznia czarnego maga wspomina o komnatach z dŸwigniami, kluczniku, kombinacji prze³¹czników... Trzeba to zapamiêtaæ, nigdy nie wiadomo, kiedy mo¿e siê przydaæ.");
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
	Doc_PrintLine(ndocid,0,"   Ostatnie ostrze¿enie!");
	Doc_SetMargins(ndocid,-1,50,50,70,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Nic mnie nie obchodzi, czy uda siê wam przeleŸæ przez most z drugiej strony. Dla mnie mo¿ecie piec siê w piekle.");
	Doc_PrintLines(ndocid,0,"Tak d³ugo, jak jestem w swoich w³oœciach, most bêdzie podniesiony, a ka¿dego mêdrka, który bêdzie próbowa³ ustrzeliæ z ³uku prze³¹cznik, ¿eby siê tu dostaæ, osobiœcie wypatroszê i powieszê na najbli¿szym drzewie!");
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

