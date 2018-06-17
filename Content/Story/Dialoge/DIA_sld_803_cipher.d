
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
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Jak si� sprawy maj�?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hej, czy ja ci� sk�d� nie znam?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//To ca�kiem mo�liwe...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//W Kolonii zajmowa�em si� bagiennym zielem, pami�tasz?
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
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//Przynios�em ze sob� z kolonii g�rniczej du�� paczk� bagiennego ziela.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Sporo najemnik�w lubi sobie czasem zapali�, zgromadzi�em wi�c na boku ma�� fortunk�.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//Ale jaki� gnojek ukrad� mi ca�y zapas ze skrzyni!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"Najemnik Cipher straci� paczk� bagiennego ziela.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//Jestem prawie pewien, �e to by� Bodo. �pi w tym samym pokoju co ja i zawsze szczerzy si� do mnie jak idiota...
		b_logentry(TOPIC_CIPHERPAKET,"Podejrzewa, �e ukrad� j� Bodo.");
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
	description = "Co w takim razie zrobisz ze z�odziejem?";
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
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//Co w takim razie zrobisz ze z�odziejem?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//Pewnego dnia z�api� go, jak b�dzie pali� moje ziele.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//A wtedy znajd� spokojne miejsce i dam mu lekcj�, kt�rej nie zapomni.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//Jak spior� go tutaj, na �rodku podw�rka, to zobacz� mnie wie�niacy i nie wyrobi� na grzywny.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//To znaczy?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//To do�� proste. Nie mo�emy gn�bi� ch�op�w, bo Lee ka�e nam za to p�aci� wysokie grzywny. Onar tak to zorganizowa�.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//Im wi�cej �wiadk�w, tym wi�kszy smr�d. A wtedy sprawa robi si� kosztowniejsza.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//Tak wi�c zamierzam wykona� sw�j ruch cichaczem...
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "Chc� do��czy� do ludzi Lee!";
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
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//Chc� do��czy� do ludzi Lee!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//Do ludzi LEE?! Je�eli b�dzie tak dalej post�powa�, to ju� wkr�tce nie b�d� jego ludzie.
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Czemu?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee zawsze by� spokojny. W Kolonii te� tak by�o.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//Ale ostatnio przesadza. Chce tu po prostu siedzie� i czeka�, a� paladyni wyzdychaj� z g�odu.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio uwa�a, �e powinni�my wyczy�ci� kilka ma�ych farm poza miastem.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//My�l�, �e to by by�a doskona�a odmiana.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//Teraz wi�kszo�� z nas zbija b�ki - i co, chcesz zosta� jednym z nas?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "Tak! Bez wzgl�du na wszystko!";
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
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//Tak! Bez wzgl�du na wszystko!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//Wiesz ju�, �e przeprowadzamy g�osowanie w sprawie ka�dego nowego rekruta?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//Do czego zmierzasz?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//C�, ju� od dawna nie mia�em nic do palenia. Przynie� mi kilka �odyg bagiennego ziela, a m�j g�os b�dzie tw�j.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//Na pewno gdzie� mo�na go troch� zebra�.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Cipher poprze mnie, je�li przynios� mu kilka �odyg bagiennego ziela.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "Je�li chodzi o to bagienne ziele...";
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
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//Je�li chodzi o to bagienne ziele...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//Przynios�e� moj� paczk�! Teraz wszystko b�dzie ju� w porz�dku.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//Z pewno�ci� b�d� na ciebie g�osowa�...
			b_logentry(TOPIC_SLDRESPEKT,"Cipher poprze mnie, je�li zechc� si� przy��czy� do najemnik�w.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"Zobacz�, co da si� zrobi�...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Mam dla ciebie kilka �odyg...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//Zobacz�, co da si� zrobi�...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Mam dla ciebie kilka �odyg...
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ach! M�j cz�owiek!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//Masz m�j g�os.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Cipher poprze mnie, je�li zechc� si� przy��czy� do najemnik�w.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//To wszystko? Tyle wypal� na jedno posiedzenie!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//To musi by� przynajmniej 10 skr�t�w.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//Tak czy inaczej w g�osowaniu o przyj�cie masz m�j g�os.
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
	description = "Poka� mi swoje towary.";
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
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Poka� mi, co tam masz.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Jasne. Pocz�stuj si�.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//Nie mam w tej chwili bagiennego ziela. Potrzebujesz czego� innego?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "Wiem, kto zabra� twoje ziele.";
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
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//Wiem, kto zabra� twoje ziele.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Kto? To by� Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//Nie - zrobi� to jeden z najemnik�w - Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//A to bydlak - gdzie on jest?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Nawet je�li go znajdziesz, nic ci to nie pomo�e. Nie ma ju� tej paczki. Sprzeda� j� w Khorinis.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//GDZIE ON JEST!?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Za kuchni�, na rogu...
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//SKASUJ� GNOJKA!
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
	description = "Naprawd� da�e� Darowi popali�... czujesz si� teraz lepiej?";
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
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//Naprawd� da�e� Darowi popali�... czujesz si� teraz lepiej?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//Taak, to by�o przyjemne.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Chyba nie dla NIEGO...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//Ten ma�y �ebrak nie ma po co przeszukiwa� mojej skrzyni!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Czy ta paczka bagiennego ziela przypadkiem nie nale�y do ciebie?";
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
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Czy ta paczka bagiennego ziela przypadkiem nie nale�y do ciebie?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//A niech mnie! Sk�d to masz?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//To d�uga historia...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//Zreszt� niewa�ne, porz�dny z ciebie go��.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Masz, we� to jako nagrod�. Dobrej zabawy!
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//Najpierw pozw�l, �e sobie skr�c�...
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

