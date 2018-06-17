
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Ach, klient - co mogê dla ciebie zrobiæ?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "Szukam pokoju.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Szukam pokoju.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//A wiêc trafi³eœ we w³aœciwe miejsce.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Jeden z paladynów powiedzia³ mi, ¿e mogê tu spêdziæ noc za darmo...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Ile kosztuje nocleg?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Absolutnie nic.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Paladyni op³acaj¹ noclegi dla wszystkich przyjezdnych.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//A wiêc mogê tutaj nocowaæ za darmo?
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Tak.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//IdŸ na górê.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Wci¹¿ jeszcze mamy tu kilka wolnych ³ó¿ek.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "Czemu paladyni op³acaj¹ noclegi?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Czemu paladyni op³acaj¹ noclegi?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Ja te¿ tego nie rozumiem.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//Mo¿e chodzi im o to, ¿eby oczyœciæ ulice z biedoty, która, jak wiadomo, pope³nia wiele przestêpstw.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//Poza tym, pewnie chc¹ siê przypodobaæ wêdrownym kupcom.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Odk¹d ch³opi zaczêli siê buntowaæ, to oni s¹ naszym jedynym Ÿród³em zaopatrzenia.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//A poza tym, chyba chc¹ za³agodziæ panuj¹ce w mieœcie nastroje.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre zorganizowa³ nawet darmowe piwo. Rozdaje je na placu wisielców.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "Kto tu teraz mieszka?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Kto tu teraz mieszka?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Praktycznie wszyscy moi klienci to wêdrowni handlarze.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Tylko nie próbuj ich okradaæ! Nie chcê tutaj ¿adnych problemów!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "Mam parê pytañ dotycz¹cych miasta...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Mam parê pytañ dotycz¹cych miasta...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"Gdzie mogê tu coœ kupiæ?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"Opowiedz mi o mieœcie.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Gdzie mogê tu coœ kupiæ?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Targ znajduje siê dok³adnie naprzeciwko drzwi frontowych. Znajdziesz tam wszelkie mo¿liwe towary.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Po drugiej stronie miasta jest jeszcze kilka sklepów i zak³adów rzemieœlniczych. Wiêkszoœæ z nich znajduje siê przy bramie.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//Ryby mo¿esz kupiæ w dzielnicy portowej. Sklep rybny znajdziesz tam bez trudu.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Opowiedz mi o mieœcie.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis to jedno z najbogatszych miast w królestwie, choæ mo¿e w tym momencie trudno w to uwierzyæ.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Odk¹d zaczê³a siê wojna z orkami, handel przesta³ przynosiæ zyski. Król za¿¹da³, ¿eby wszystkie statki handlowe zosta³y skonfiskowane na u¿ytek armii.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//Wiêc rzadko przyp³ywaj¹ tutaj jakiekolwiek jednostki, co z kolei oznacza marne zaopatrzenie. Wielu mieszkañców martwi taki stan rzeczy.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nikt nie mo¿e przewidzieæ, co przyniesie przysz³oœæ. Mo¿emy tylko z pokor¹ czekaæ na to, co ma nast¹piæ. Chyba nie mamy ¿adnego wp³ywu na przysz³e wydarzenia.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "Co s³ychaæ?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Jak ci idzie?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Nie wygl¹dasz na osobê, która przejmuje siê cudzymi zmartwieniami.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Jasne, oczywiœcie.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"To zale¿y.",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"Nie.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Niezupe³nie.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//No widzisz, o tym w³aœnie mówiê. Ka¿dy teraz myœli tylko o sobie. Czego chcesz?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//To zale¿y.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//To zale¿y, ile mo¿na na tym zarobiæ, to chcesz powiedzieæ.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Nie znoszê takich jak ty.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Tak, pewnie. Nie ma problemu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Wiesz, ¿ycie jest pe³ne niespodzianek. Ostatnio robi³am porz¹dek w moich rzeczach i znalaz³am parê starych map, które sprzeda³am kartografowi Brahimowi z portu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Niestety, nied³ugo potem zauwa¿y³am, ¿e brakuje mi pewnego dokumentu.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Przypuszczam, ¿e jakimœ cudem dosta³ siê pomiêdzy mapy.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Czy móg³byœ go dla mnie odzyskaæ?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"Hanna zgubi³a pewien dokument. Najprawdopodobniej znajduje siê on w dzielnicy portowej, gdzie mieœci siê siedziba kartografa Brahima.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Nie jestem ch³opcem na posy³ki.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"A co JA bêdê z tego mia³?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"Zobaczê, co da siê zrobiæ.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Nie jestem ch³opcem na posy³ki.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Rozumiem - problemy prostej kobiety nic dla ciebie nie znacz¹. Widzê, ¿e sama bêdê musia³a siê tym zaj¹æ.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//A co z tego bêdê mia³?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Aha, wiedzia³am. Niczym siê nie ró¿nisz od tej ho³oty mieszkaj¹cej w porcie.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Wiêc czego chcesz ode mnie, biednej kobiety?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Niewa¿ne.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"Mog³abyœ byæ dla mnie nieco milsza...",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"Z³ota.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Niewa¿ne.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Widzê, ¿e jednak pozosta³a ci krztyna przyzwoitoœci. Jeœli odzyskasz ten dokument, dostaniesz ode mnie 75 sztuk z³ota.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Mog³abyœ byæ dla mnie nieco milsza...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//To oburzaj¹ce. Wy...wynoœ siê st¹d! Ty wieprzu!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Z³ota.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Mogê ci za to daæ 50 sztuk z³ota, nie wiêcej.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Jeœli zdo³asz odzyskaæ dokument, dostaniesz ode mnie 50 sztuk z³ota.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Zobaczê, co da siê zrobiæ.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//Jesteœ taki s³odki. Powodzenia!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Jeœli przyniesiesz mi ten dokument, dostaniesz ode mnie nagrodê.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "Czy chodzi³o o ten dokument?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Czy chodzi³o o ten dokument?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Tak, w³aœnie o ten. Dziêkujê ci.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//Gdzie moja nagroda?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Nie tak szybko. Oto twoje pieni¹dze.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Sk¹d... wracasz?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//Znalaz³em ciekaw¹ rzecz w twojej piwnicy...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//Co robi³eœ w mojej piwnicy?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//Dobrze wiesz!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//Nie mam pojêcia, o czym mówisz...
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//Spójrz tylko na siebie! Gdzie by³eœ? Hm?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//Ja...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//Ju¿ wiem!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//Nie musisz nic mówiæ. Domyœli³am siê wszystkiego.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Nawet nie myœl o tym, ¿eby coœ st¹d ukraœæ, jasne?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//Nie mo¿emy sobie pozwoliæ na ¿aden skandal.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "Zobacz, jak¹ ksi¹¿kê znalaz³em!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Zobacz, jak¹ ksi¹¿kê znalaz³em!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//To ksiêga rachunkowa Lehmara. Sk¹d j¹ masz?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//No...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//To dobrze, ¿e Lehmar ju¿ jej nie ma. Jednak czu³abym siê lepiej, gdybym mog³a j¹ zatrzymaæ.
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "Proszê - weŸ tê ksiêgê.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Proszê - weŸ tê ksiêgê.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Dziêkujê.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Przyjmij to w nagrodê.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Co to jest?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//To klucz do bram bogactwa.
};

func void hanna_blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Wszystko w porz¹dku w kryjówce?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//Nie by³am tam ju¿ od d³u¿szego czasu.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Kiedy tylko nadarzy siê okazja, zejdê na dó³ i sprawdzê, czy wszystko w porz¹dku.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Tak. Ale lepiej o tym tak g³oœno nie mówiæ.
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Wiedzia³aœ o z³odziejskiej kryjówce?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//Nie mam pojêcia, o czym mówisz...
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//By³a tutaj stra¿... Ktoœ powiedzia³ im o kryjówce!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Nie mogli mi nic udowodniæ, ale Cassia i jej ludzie nie ¿yj¹!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Jestem pewna, ¿e to TWOJA sprawka...
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Kupi³am to specjalnie dla ciebie.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Kosztowa³o mnie to masê pieniêdzy, ale op³aca³o siê, ty œwinio...
};

