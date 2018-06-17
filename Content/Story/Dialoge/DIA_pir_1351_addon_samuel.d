
instance DIA_ADDON_SAMUEL_EXIT(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 999;
	condition = dia_addon_samuel_exit_condition;
	information = dia_addon_samuel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_samuel_exit_condition()
{
	return TRUE;
};

func void dia_addon_samuel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAMUEL_HELLO(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 1;
	condition = dia_addon_samuel_hello_condition;
	information = dia_addon_samuel_hello_info;
	important = TRUE;
};


func int dia_addon_samuel_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//O, czy¿by nowa twarz?
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Masz ochotê na rum? Albo coœ mocniejszego?
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_SAMUEL_FRANCIS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 2;
	condition = dia_addon_samuel_francis_condition;
	information = dia_addon_samuel_francis_info;
	description = "Chcia³bym pogadaæ z tob¹ o Francisie.";
};


func int dia_addon_samuel_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_samuel_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Chcia³bym pogadaæ z tob¹ o Francisie.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Nie chcê s³yszeæ o tej imitacji kapitana!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Ca³y dzieñ tylko grzeje ty³ek na ³awie i myœli, ¿e jest kimœ wa¿nym.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Nie mam pojêcia, co za demon opêta³ kapitana, ¿e wpad³ na taki pomys³!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Czego chcesz od tego wa¿niaka?
};


instance DIA_ADDON_SAMUEL_VERSTECK(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 3;
	condition = dia_addon_samuel_versteck_condition;
	information = dia_addon_samuel_versteck_info;
	description = "Muszê siê dostaæ do chaty Grega.";
};


func int dia_addon_samuel_versteck_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_francis) && (FRANCIS_AUSGESCHISSEN == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_versteck_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Muszê siê dostaæ do chaty Grega.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//Naprawdê? A po co?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Potrzebujê pancerza bandytów.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//Francis nigdy nie pozwoli ci tam wejœæ, ¿ebyœ móg³ sobie coœ zabraæ.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Chyba ¿e...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Tak?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//...masz coœ, na czym mu bardzo zale¿y.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//Wiem, ¿e Francis ukry³ coœ w opuszczonej kopalni w kanionie.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Kiedyœ staliœmy razem na stra¿y. On, jak zwykle, zasn¹³. Przez sen zacz¹³ coœ mamrotaæ.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Nie wiem, co tam schowa³, ale to musia³o byæ dla niego bardzo wa¿ne. Mo¿e zdo³asz to wykorzystaæ.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//Kiedy kapitan wróci i zobaczy, ¿e z chaty coœ zniknê³o, Francis wpadnie w powa¿ne tarapaty.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Gorzelnik Samuel powiedzia³ mi o tajnym schowku Francisa w jednej z kopalni w kanionie. Mo¿e znajdê tam coœ, co pomo¿e mi dostaæ siê do chaty.");
};


var int samuel_knows_loushammer;
var int samuel_knows_schlafhammer;

instance DIA_ADDON_SAMUEL_RECIPE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 4;
	condition = dia_addon_samuel_recipe_condition;
	information = dia_addon_samuel_recipe_info;
	permanent = TRUE;
	description = "Mam dla ciebie recepturê!";
};


func int dia_addon_samuel_recipe_condition()
{
	if(((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0)) || ((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0)))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_recipe_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//Mam dla ciebie recepturê!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Popatrzmy... Co to za receptura?
	Info_ClearChoices(dia_addon_samuel_recipe);
	if((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"M³ot Lou",dia_addon_samuel_recipe_loushammer);
	};
	if((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Podwójny M³ot Lou",dia_addon_samuel_recipe_lousdoublehammer);
	};
};

func void dia_addon_samuel_recipe_back()
{
	Info_ClearChoices(dia_addon_samuel_recipe);
};

func void dia_addon_samuel_recipe_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Od Snafa.
	b_giveinvitems(other,self,itwr_addon_lou_rezept,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Ju¿ siê bojê... ale muszê j¹ wypróbowaæ.
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_LOUSHAMMER = TRUE;
};

func void dia_addon_samuel_recipe_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//To mo¿e byæ coœ naprawdê morderczego. Lepiej uwa¿aj.
	b_giveinvitems(other,self,itwr_addon_lou_rezept2,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Nie strasz mnie. No có¿, raz siê ¿yje...
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_SCHLAFHAMMER = TRUE;
};


var int samuel_grog_varianz;

instance DIA_ADDON_SAMUEL_GROG(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 5;
	condition = dia_addon_samuel_grog_condition;
	information = dia_addon_samuel_grog_info;
	permanent = TRUE;
	description = "Przyszed³em po moj¹ racjê grogu. (10 szt. z³ota)";
};


func int dia_addon_samuel_grog_condition()
{
	return TRUE;
};

func void dia_addon_samuel_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Przyszed³em po moj¹ racjê grogu.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		if(SAMUEL_GROG_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Ech, bez grogu to wy nawet palcem nie ruszycie, co?
			SAMUEL_GROG_VARIANZ = 1;
		}
		else if(SAMUEL_GROG_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Mam nadziejê, ¿e da siê to piæ. Koñczy mi siê s³odka woda, ale przecie¿ od odrobiny pleœni jeszcze nikt nie umar³.
			SAMUEL_GROG_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//Mo¿esz mieæ tyle grogu, ile zdo³asz wypiæ!
		};
		b_giveinvitems(self,other,itfo_addon_grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Sprzedajê go tanio, ale nie rozdajê za darmo. Zdob¹dŸ trochê z³ota, zanim do mnie przyjdziesz.
	};
};


var int samuel_rum_varianz;

instance DIA_ADDON_SAMUEL_RUM(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 6;
	condition = dia_addon_samuel_rum_condition;
	information = dia_addon_samuel_rum_info;
	permanent = TRUE;
	description = "Daj mi rumu! (30 szt. z³ota)";
};


func int dia_addon_samuel_rum_condition()
{
	return TRUE;
};

func void dia_addon_samuel_rum_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Daj mi rumu!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		if(SAMUEL_RUM_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ach, rum jest dla marynarza tym, czym mleko dla dziecka. Trzymaj!
			SAMUEL_RUM_VARIANZ = 1;
		}
		else if(SAMUEL_RUM_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//Co prawda mo¿e trochê zaje¿d¿aæ rybami, bo w beczkach wczeœniej by³y œledzie, ale rum to rum!
			SAMUEL_RUM_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Trzymaj!
		};
		b_giveinvitems(self,other,itfo_addon_rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//Nie masz chyba wystarczaj¹co du¿o z³ota, ch³opcze. Co powiesz na grog?
	};
};


var int samuel_stronger_varianz;
var int samuel_doppelhammer_varianz;

instance DIA_ADDON_SAMUEL_STRONGER(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 7;
	condition = dia_addon_samuel_stronger_condition;
	information = dia_addon_samuel_stronger_info;
	permanent = TRUE;
	description = "Chcê czegoœ mocniejszego. ";
};


func int dia_addon_samuel_stronger_condition()
{
	return TRUE;
};

func void dia_addon_samuel_stronger_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Chcê czegoœ mocniejszego.
	if(SAMUEL_STRONGER_VARIANZ == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//Ach, mamy tu konesera! Z chêci¹ poznam nowe przepisy!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Dobry trunek musi byæ przejrzysty i mocny. Powinien sp³ywaæ w g³¹b gard³a niczym p³ynny ogieñ.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Ciê¿ko to osi¹gn¹æ... Ale chyba znowu siê rozgada³em, a ty chcesz siê napiæ!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Proszê bardzo! Mój w³asny wynalazek, nazwa³em go Szybki œledŸ. Jak ci smakuje?
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
		b_useitem(other,itfo_addon_schnellerhering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Niesamowity!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//Nie inaczej.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//Nie znasz przypadkiem dobrych receptur? Chêtnie siê nauczê pêdzenia czegoœ ciekawego.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Jeszcze jednego?
		SAMUEL_STRONGER_VARIANZ = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Co podaæ?
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Podwójny M³ot Lou (60 szt. z³ota)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"M³ot Lou (30 szt. z³ota)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Szybki œledŸ (30 szt. z³ota)",dia_addon_samuel_stronger_schnellerhering);
};

func void b_addon_samuel_nogold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Kredyt umar³, bank nie ¿yje, kto nie p³aci, ten nie pije!
};

func void dia_addon_samuel_stronger_back()
{
	Info_ClearChoices(dia_addon_samuel_stronger);
};

func void dia_addon_samuel_stronger_schnellerhering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Daj trochê tego Szybkiego œledzia.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Srogi trunek, ale ma swoj¹ wartoœæ!
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Podwójny M³ot Lou (60 szt. z³ota)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"M³ot Lou (30 szt. z³ota)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Szybki œledŸ (30 szt. z³ota)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Mam ochotê na M³ot Lou!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Dobra rzecz. W gard³o twoje!
		b_giveinvitems(self,other,itfo_addon_loushammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Podwójny M³ot Lou (60 szt. z³ota)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"M³ot Lou (30 szt. z³ota)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Szybki œledŸ (30 szt. z³ota)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//Daj mi podwójnego. Podwójny M³ot raz!
	if(b_giveinvitems(other,self,itmi_gold,VALUE_SCHLAFHAMMER))
	{
		if(SAMUEL_DOPPELHAMMER_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Mam nadziejê, ¿e to nie dla ciebie.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Tak! To dopiero stawia na nogi!
		};
		b_giveinvitems(self,other,itfo_addon_schlafhammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Podwójny M³ot Lou (60 szt. z³ota)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"M³ot Lou (30 szt. z³ota)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Szybki œledŸ (30 szt. z³ota)",dia_addon_samuel_stronger_schnellerhering);
};


instance DIA_ADDON_SAMUEL_TRADE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 8;
	condition = dia_addon_samuel_trade_condition;
	information = dia_addon_samuel_trade_info;
	permanent = TRUE;
	description = "Co mo¿esz mi zaoferowaæ?";
	trade = TRUE;
};


func int dia_addon_samuel_trade_condition()
{
	return TRUE;
};

func void dia_addon_samuel_trade_info()
{
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itfo_addon_grog,Npc_HasItems(self,itfo_addon_grog));
	CreateInvItems(self,itfo_addon_grog,15);
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Co mo¿esz mi zaoferowaæ?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Mam wszystko, czego mo¿e potrzebowaæ pirat!
};


instance DIA_ADDON_SAMUEL_NEWS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 99;
	condition = dia_addon_samuel_news_condition;
	information = dia_addon_samuel_news_info;
	permanent = TRUE;
	description = "Coœ nowego wydarzy³o siê w obozie?";
};


func int dia_addon_samuel_news_condition()
{
	return TRUE;
};

func void dia_addon_samuel_news_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//Coœ nowego wydarzy³o siê w obozie?
	if(Npc_IsDead(francis) || (FRANCIS_AUSGESCHISSEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis wreszcie przesta³ siê panoszyæ. Nawet nie wyobra¿asz sobie, jak mnie to cieszy!
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//Jesteœ porz¹dnym kompanem. Napijmy siê! Ja stawiam.
		if(GREGISBACK == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//Greg wróci³. Co prawda straci³ statek, ale przynajmniej doprowadzi³ obóz do porz¹dku.
		};
	}
	else
	{
		if(!Npc_IsDead(morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Od czasu jego wyjazdu nic siê tu nie dzia³o. Morgan i reszta jego ch³opaków g³ównie chla³a i obija³a siê.
		};
		if(!Npc_IsDead(henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Tylko Henry zabra³ siê za jak¹œ robotê. Wzi¹³ swoich ch³opaków i zacz¹³ stawiaæ palisadê.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Najwy¿szy czas, ¿eby kapitan Greg wróci³ i porz¹dnie kopn¹³ Francisa w ten jego t³usty ty³ek!
	};
};

