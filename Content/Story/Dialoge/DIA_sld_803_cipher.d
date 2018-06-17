
instance DIA_CIPHER_EXIT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 999;
	condition = dia_cipher_exit_condition;
	information = dia_cipher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipher_exit_condition()
{
	return TRUE;
};

func void dia_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HELLO(C_INFO)
{
	npc = sld_803_cipher;
	nr = 1;
	condition = dia_cipher_hello_condition;
	information = dia_cipher_hello_info;
	permanent = FALSE;
	description = "Jak leci?";
};


func int dia_cipher_hello_condition()
{
	return TRUE;
};

func void dia_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Jak siê sprawy maj¹?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hej, czy ja ciê sk¹dœ nie znam?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//To ca³kiem mo¿liwe...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//W Kolonii zajmowa³em siê bagiennym zielem, pamiêtasz?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "A w czym teraz siedzisz?";
};


func int dia_cipher_tradewhat_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello))
	{
		return TRUE;
	};
};

func void dia_cipher_tradewhat_info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//A w czym teraz siedzisz?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ach, nie pytaj.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Przynios³em ze sob¹ z kolonii górniczej du¿¹ paczkê bagiennego ziela.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Sporo najemników lubi sobie czasem zapaliæ, zgromadzi³em wiêc na boku ma³¹ fortunkê.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Ale jakiœ gnojek ukrad³ mi ca³y zapas ze skrzyni!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"Najemnik Cipher straci³ paczkê bagiennego ziela.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Jestem prawie pewien, ¿e to by³ Bodo. Œpi w tym samym pokoju co ja i zawsze szczerzy siê do mnie jak idiota...
		b_logentry(TOPIC_CIPHERPAKET,"Podejrzewa, ¿e ukrad³ j¹ Bodo.");
	};
	MIS_CIPHER_PAKET = LOG_RUNNING;
};


instance DIA_CIPHER_DOWITHTHIEF(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dowiththief_condition;
	information = dia_cipher_dowiththief_info;
	permanent = FALSE;
	description = "Co w takim razie zrobisz ze z³odziejem?";
};


func int dia_cipher_dowiththief_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_dowiththief_info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//Co w takim razie zrobisz ze z³odziejem?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Pewnego dnia z³apiê go, jak bêdzie pali³ moje ziele.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//A wtedy znajdê spokojne miejsce i dam mu lekcjê, której nie zapomni.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Jak spiorê go tutaj, na œrodku podwórka, to zobacz¹ mnie wieœniacy i nie wyrobiê na grzywny.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//To znaczy?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//To doœæ proste. Nie mo¿emy gnêbiæ ch³opów, bo Lee ka¿e nam za to p³aciæ wysokie grzywny. Onar tak to zorganizowa³.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//Im wiêcej œwiadków, tym wiêkszy smród. A wtedy sprawa robi siê kosztowniejsza.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Tak wiêc zamierzam wykonaæ swój ruch cichaczem...
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "Chcê do³¹czyæ do ludzi Lee!";
};


func int dia_cipher_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Chcê do³¹czyæ do ludzi Lee!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Do ludzi LEE?! Je¿eli bêdzie tak dalej postêpowa³, to ju¿ wkrótce nie bêd¹ jego ludzie.
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Czemu?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee zawsze by³ spokojny. W Kolonii te¿ tak by³o.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Ale ostatnio przesadza. Chce tu po prostu siedzieæ i czekaæ, a¿ paladyni wyzdychaj¹ z g³odu.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio uwa¿a, ¿e powinniœmy wyczyœciæ kilka ma³ych farm poza miastem.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//Myœlê, ¿e to by by³a doskona³a odmiana.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//Teraz wiêkszoœæ z nas zbija b¹ki - i co, chcesz zostaæ jednym z nas?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "Tak! Bez wzglêdu na wszystko!";
};


func int dia_cipher_yesjoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_yesjoin_info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Tak! Bez wzglêdu na wszystko!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Wiesz ju¿, ¿e przeprowadzamy g³osowanie w sprawie ka¿dego nowego rekruta?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//Có¿, ju¿ od dawna nie mia³em nic do palenia. Przynieœ mi kilka ³odyg bagiennego ziela, a mój g³os bêdzie twój.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Na pewno gdzieœ mo¿na go trochê zebraæ.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Cipher poprze mnie, jeœli przyniosê mu kilka ³odyg bagiennego ziela.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "Jeœli chodzi o to bagienne ziele...";
};


func int dia_cipher_joints_condition()
{
	if(MIS_CIPHER_BRINGWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cipher_joints_info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Jeœli chodzi o to bagienne ziele...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Przynios³eœ moj¹ paczkê! Teraz wszystko bêdzie ju¿ w porz¹dku.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Z pewnoœci¹ bêdê na ciebie g³osowa³...
			b_logentry(TOPIC_SLDRESPEKT,"Cipher poprze mnie, jeœli zechcê siê przy³¹czyæ do najemników.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"Zobaczê, co da siê zrobiæ...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Mam dla ciebie kilka ³odyg...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Zobaczê, co da siê zrobiæ...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Mam dla ciebie kilka ³odyg...
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ach! Mój cz³owiek!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Masz mój g³os.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Cipher poprze mnie, jeœli zechcê siê przy³¹czyæ do najemników.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//To wszystko? Tyle wypalê na jedno posiedzenie!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//To musi byæ przynajmniej 10 skrêtów.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//Tak czy inaczej w g³osowaniu o przyjêcie masz mój g³os.
		};
	};
	Info_ClearChoices(dia_cipher_joints);
};


instance DIA_CIPHER_TRADE(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_trade_condition;
	information = dia_cipher_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int dia_cipher_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Poka¿ mi, co tam masz.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Jasne. Poczêstuj siê.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//Nie mam w tej chwili bagiennego ziela. Potrzebujesz czegoœ innego?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "Wiem, kto zabra³ twoje ziele.";
};


func int dia_cipher_dardieb_condition()
{
	if(((DAR_DIEB == TRUE) || (DAR_VERDACHT == TRUE)) && !Npc_IsDead(dar))
	{
		return TRUE;
	};
};

func void dia_cipher_dardieb_info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Wiem, kto zabra³ twoje ziele.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Kto? To by³ Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Nie - zrobi³ to jeden z najemników - Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//A to bydlak - gdzie on jest?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Nawet jeœli go znajdziesz, nic ci to nie pomo¿e. Nie ma ju¿ tej paczki. Sprzeda³ j¹ w Khorinis.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//GDZIE ON JEST!?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Za kuchni¹, na rogu...
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//SKASUJÊ GNOJKA!
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,dar,AR_NONE,0);
};


instance DIA_CIPHER_DARLOST(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_darlost_condition;
	information = dia_cipher_darlost_info;
	permanent = FALSE;
	description = "Naprawdê da³eœ Darowi popaliæ... czujesz siê teraz lepiej?";
};


func int dia_cipher_darlost_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipher_darlost_info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Naprawdê da³eœ Darowi popaliæ... czujesz siê teraz lepiej?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//Taak, to by³o przyjemne.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Chyba nie dla NIEGO...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Ten ma³y ¿ebrak nie ma po co przeszukiwaæ mojej skrzyni!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Czy ta paczka bagiennego ziela przypadkiem nie nale¿y do ciebie?";
};


func int dia_cipher_krautpaket_condition()
{
	if((Npc_HasItems(other,itmi_herbpaket) > 0) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cipher_krautpaket_info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Czy ta paczka bagiennego ziela przypadkiem nie nale¿y do ciebie?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//A niech mnie! Sk¹d to masz?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//To d³uga historia...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//Zreszt¹ niewa¿ne, porz¹dny z ciebie goœæ.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Masz, weŸ to jako nagrodê. Dobrej zabawy!
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Najpierw pozwól, ¿e sobie skrêcê...
	CreateInvItems(self,itmi_joint,40);
	Npc_RemoveInvItems(self,itmi_herbpaket,1);
	MIS_CIPHER_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_CIPHERPAKET);
};


instance DIA_CIPHERSLD_PICKPOCKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 900;
	condition = dia_ciphersld_pickpocket_condition;
	information = dia_ciphersld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ciphersld_pickpocket_condition()
{
	return c_beklauen(65,65);
};

func void dia_ciphersld_pickpocket_info()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_BACK,dia_ciphersld_pickpocket_back);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_PICKPOCKET,dia_ciphersld_pickpocket_doit);
};

func void dia_ciphersld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cipher_pickpocket);
};

func void dia_ciphersld_pickpocket_back()
{
	Info_ClearChoices(dia_cipher_pickpocket);
};

