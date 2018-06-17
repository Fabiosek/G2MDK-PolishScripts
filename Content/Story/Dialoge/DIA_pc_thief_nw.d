
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 998;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "Jak idzie interes?";
};


func int dia_diegonw_perm_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak ci si� �yje na wolno�ci?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Kiepsko. Nikt mi nie powiedzia�, �e pod moj� nieobecno�� Khorinis zesz�o na psy.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nie wiem. Dla mnie to miasto zawsze takie by�o.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//To powiniene� je zobaczy� par� lat temu. Spodoba�oby ci si�.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	if(DIEGO_ISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Co si� tak dziwisz?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//Naprawd� s�dzi�e�, �e nie �yj�?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Na jaki� czas straci�em przytomno��, ale - jak widzisz - �yj� i mam si� ca�kiem dobrze.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//Teraz liczy si� to, �e jeste�my tu obaj...
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//I to, �e potrzeba mi twojej pomocy.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dobrze, �e ci� widz�. Musisz mi pom�c.
	};
	Info_ClearChoices(dia_diegonw_needhelp);
	if(diegoow.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
	};
	Info_AddChoice(dia_diegonw_needhelp,"Co to za str�j?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"Co tu porabiasz?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"W czym rzecz?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Obserwuj� stra�nik�w. Bez przerwy w�sz�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Nie�atwo b�dzie prze�lizgn�� si� t�dy.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Cholera, to pewnie przez ten str�j. Stra�nicy nie chc� mnie wpu�ci� do miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Dlatego w�a�nie kupi�em te szaty od napotkanego handlarza. Teraz chyba sobie mnie przypominasz? To ja - Diego!
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Za Barier� nauczy�em ci� wszystkiego, co pomog�o ci w przetrwaniu.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Chyba nie mog�e� tego zapomnie�?
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Hmmm... Mo�esz mi powiedzie�, co si� wtedy sta�o?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Jasna cholera! Ty naprawd� nic nie pami�tasz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//S�uchaj, nie mam teraz czasu, �eby ci to wszystko wyja�ni�. Musisz wiedzie� tylko tyle: byli�my wtedy dobrymi kumplami i par� razy uratowa�em ci �ycie.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A teraz potrzebuj� twojej pomocy.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co to za str�j?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Kupi�em go od napotkanego handlarza. Stra�nicy nie chcieli mnie wpu�ci� do miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Poza tym, nie chc�, �eby ca�y �wiat wiedzia�, sk�d wracam.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//Nieg�upi pomys�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Te� tak my�l�. Ale chocia� pozby�em si� stroju Cienia, nadal jestem tym, kim by�em w Kolonii.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//I wi��� z tym miastem wielkie plany.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//W czym rzecz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Du�o si� tu pozmienia�o od mojej ostatniej wizyty. Najpierw musz� jako� stan�� na nogi.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//Ale w czym problem?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Musz� si� dosta� do g�rnego miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Ale nie jestem mieszka�cem, a nie mam do�� z�ota, by przekupi� stra�nik�w. I tu wkraczasz TY!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Mam ci po�yczy� troch� z�ota?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//W �adnym wypadku! Mam troch� pieni�dzy... ca�kiem sporo, je�li mam by� szczery. Niestety, nie mam ich przy sobie.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Kto� musi mi je przynie��. Rozumiemy si�?
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Obawiam si�, �e nie mam na to czasu.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(dia_diegonw_needhelp,"A co JA b�d� z tego mia�?",dia_diegonw_needhelp_problem_reward);
	Info_AddChoice(dia_diegonw_needhelp,"W porz�dku, pomog� ci.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Obawiam si�, �e nie mam na to czasu.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hej, my�la�em, �e jeste�my kumplami! Nie wiem, czy pami�tasz, ale to JA uratowa�em tw�j ty�ek, gdy wyl�dowa�e� w Kolonii.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Chyba troch� przesadzasz.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//O, czy�by? No to zastan�w si�, co by si� z tob� sta�o, gdybym nie wyja�ni� ci, kto jest kim, i jak si� zachowywa� za Barier�.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Magnaci zjedliby ci� na �niadanie! Sko�czy�by� w zawszonej kopalni!
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//A co b�d� z tego mia�?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//A czy ja ci� prosi�em o co� w zamian za moj� pomoc? Jeste�my przyjaci�mi. To ci nie wystarczy?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//W porz�dku, pomog� ci.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//S�uchaj. Gdy Bariera nadal istnia�a, ukry�em sobie ma�y skarb.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//To by�o dawno temu, wi�c zapomnia�em go ze sob� zabra�.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Teraz nie mog� si� st�d ruszy�...
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//�eby nie przed�u�a�: musisz p�j�� do G�rniczej Doliny i odzyska� moje z�oto.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Z�oto Diega znajduje si� w G�rniczej Dolinie. Diego potrzebuje go, aby dosta� si� do g�rnego miasta, i prosi� mnie o jego przyniesienie.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Co zamierzasz zrobi� z pieni�dzmi?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Sk�d wzi��e� to ca�e z�oto?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Gdzie schowa�e� z�oto?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co zamierzasz zrobi� z pieni�dzmi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//Musz� si� rozliczy� z jednym kupcem z g�rnego miasta. Tym zajm� si� w pierwszej kolejno�ci.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A potem rozpocznie si� moja nowa kariera!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Sk�d wzi��e� to ca�e z�oto?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Czy�bym by� jedynym, kt�ry uciu�a� sobie troch� pieni�dzy w G�rniczej Dolinie?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Od�o�enie na bok paru sztuk z�ota by�o dziecinnie �atwe. No wiesz, na wypadek, gdyby�my si� stamt�d wydostali.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Wszyscy szaleli za rud�, nikogo nie obchodzi�o z�oto.
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Gdzie schowa�e� z�oto?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Na placu wymian, nad opuszczon� kopalni�, w sk�rzanej torbie.
	if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Nie musisz komentowa� - dobrze wiem, �e nie zauwa�yli�my tego na czas.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Zdob�d� torb� i mi j� przynie�.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Tylko upewnij si�, �e to ta w�a�ciwa, �eby� nie musia� chodzi� dwa razy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak j� rozpoznam?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Torba jest pe�na z�ota. Wypchana po brzegi!
	Info_AddChoice(dia_diegonw_needhelp,"Dobrze, spr�buj� znale�� tw�j skarb.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Z�oto Diega znajduje si� gdzie� na starym placu wymian, nad opuszczon� kopalni� - tam, gdzie dostarczano za pomoc� kolejki linowej ca�e zaopatrzenie dla Kolonii.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Dobrze, spr�buj� znale�� tw�j skarb.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//Tak trzyma�! To mi wystarczy.
	Info_ClearChoices(dia_diegonw_needhelp);
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "W porz�dku, jednak ci pomog�.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//W porz�dku, jednak ci pomog�.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Wiedzia�em, �e tak b�dzie.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Przejd�my od razu do rzeczy, dobrze?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Jasne. Ukry�em w G�rniczej Dolinie poka�n� sum� pieni�dzy i chc�, �eby� je dla mnie odzyska�.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//Ja zostan� tutaj i w mi�dzyczasie wszystko przygotuj�.
	dia_diegonw_needhelp_problem_willhelpyou_wheregold();
	dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Z�oto Diega znajduje si� w G�rniczej Dolinie. Diego potrzebuje go, aby dosta� si� do g�rnego miasta, i prosi� mnie o jego przyniesienie.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "Znalaz�em twoje z�oto!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OPENEDDIEGOSBAG == TRUE) || (Npc_HasItems(other,itse_diegostreasure_mis) >= 1)) && (MIS_HELPDIEGONW == LOG_RUNNING) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//�wietnie. Gerbrandt mo�e si� zacz�� pakowa�.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Znalaz�em twoje z�oto!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//�wietnie. Poka�!
	if(Npc_HasItems(other,itse_diegostreasure_mis) >= 1)
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold < DIEGOSTREASURE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to jeszcze nie wszystko! Nie ufasz mi? Potrzebuj� ca�ej sumy!
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Je�li m�j plan wypali, zostanie dla ciebie wystarczaj�co du�o.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Ale najpierw musz� dosta� wszystko, co do grosza. To bardzo wa�ne!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if((Npc_IsDead(gerbrandt) == FALSE) && (DIEGOSREVENGE == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//S�uchaj, musz� si� teraz zaj�� stra�nikami.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Chc�, �eby� zani�s� ten list Gerbrandtowi. To jeden z bogatych kupc�w z g�rnego miasta.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Przeka� mu moje pozdrowienia. Spotkamy si� przed jego domem.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Diego da� mi list dla kupca Gerbrandta.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "Dostarczy�em tw�j list.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Dostarczy�em tw�j list.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//�wietnie. I jak zareagowa� Gerbrandt?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Wydawa� si� bardzo przestraszony i natychmiast znikn��.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//No, ja my�l�.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Obawiam si�, �e najpierw musz� po�wi�ci� troch� czasu na urz�dzenie mojego nowego domu. Je�li dobrze pami�tam, Gerbrandt ma fatalny gust.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"Jak tego dokona�e�?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"A wi�c dom jest tw�j?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//Co si� sta�o z Gerbrandtem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Zbyt d�ugo cieszy� si� �yciem w luksusie.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//Mieszka� sobie tutaj, op�ywaj�c w dostatki, podczas gdy ja za�era�em si� gulaszem z chrz�szczy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Nie wiem, dok�d uciek�, ale jego noga nigdy wi�cej nie postanie w Khorinis. Ju� ja si� o to postaram.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Je�li koniecznie chcesz go znale��, popytaj w okolicach przystani.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//A wi�c dom jest tw�j?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Tak! Od piwnicy a� po strych, z ca�ym wyposa�eniem.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po sp�dzeniu tylu lat w niezbyt komfortowych, wi�ziennych warunkach, zamierzam wreszcie wyspa� si� porz�dnie na mi�kkim ��ku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A na �niadanie b�dzie kawa� prawdziwego mi�sa i dobre wino!
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Nie�le to sobie zaplanowa�e�, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//�eby� wiedzia�!
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//Jak tego dokona�e�?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//My�lisz, �e Gerbrandt doszed� do swojej fortuny w ci�gu wielu lat uczciwej pracy?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Oczywi�cie on sam nie macza� palc�w w szczeg�lnie �liskich sprawach. Mia� do tego specjalnego pomocnika.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Si�� rzeczy poznawa�em szczeg�y jego brudnych machlojek, a� postanowi� pozby� si� mnie na dobre. Za du�o wiedzia�em.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//Nigdy mi o tym nie m�wi�e�.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nigdy mnie o to nie pyta�e�.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co z moj� dzia�k�?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"Co si� sta�o z Gerbrandtem?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co z moj� dzia�k�?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Widz�, �e jednak nie zapomnia�e� wszystkiego, czego ci� nauczy�em.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale masz racj�. Bez ciebie nigdy by mi si� nie uda�o. Oto twoja cz��.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_diegonw_canyouteach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Mo�esz mnie czego� nauczy�?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Jasne. Daj zna�, jak b�dziesz gotowy.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Mam najpierw par� spraw do za�atwienia.
	};
};


var int diegonw_merke_dex;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "Naucz mnie.";
};


func int dia_diegonw_teach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Naucz mnie czego�.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Mog� popracowa� troch� nad twoj� zr�czno�ci�.
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Ju� jeste� bardziej zr�czny. Tak trzyma�.
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_diegonw_teachdex_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "Zamierzam opu�ci� Khorinis.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Zamierzam opu�ci� Khorinis.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//M�dra decyzja. Ch�tnie zabra�bym si� z tob�. To miasto za bardzo si� zmieni�o. Ci�ko b�dzie tutaj szybko si� wzbogaci�.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//M�g�bym ci� podszkoli� w �ucznictwie, otwieraniu zamk�w i zr�czno�ci.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//No i przyda ci si� chyba dobry z�odziej?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Oczywi�cie, Diego chce mi towarzyszy�. Uwa�a, �e im szybciej opu�ci Khorinis, tym lepiej. M�g�by mi pokaza�, jak zwi�kszy� zr�czno��, i przeszkoli� mnie w pos�ugiwaniu si� �ukiem oraz otwieraniu zamk�w.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Zastanowi� si� nad tym. W tej chwili mam ju� prawie ca�� za�og�.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Nie musisz si� spieszy�. Nigdzie si� nie wybieram.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Szczeg�y poznasz, gdy nadejdzie odpowiednia pora.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Nie chcesz i�� ze mn�?",dia_diegonw_knowwhereenemy_yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Pop�y� ze mn�. Mo�emy si� spotka� na przystani.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmmm... Masz racj�. Khorinis to rynsztok. P�yn� z tob�!
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Daj mi jedn� chwil�. Zaraz b�d� gotowy.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Mog� ju� rusza�. Do zobaczenia na statku!
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Mo�e dam ci zna�, gdy nadejdzie odpowiednia chwila.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Tak zr�b. Kto wie? Mo�e nawet z tob� pop�yn�?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "Mo�esz ju� wraca� do miasta.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Mo�esz ju� wraca� do miasta.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Serio? Nie potrzebujesz mnie? Jak chcesz. Jak wr�cisz do miasta, zajrzyj do mnie koniecznie.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//My�lisz, �e si� jeszcze kiedy� spotkamy?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nigdy nie zapomn� wyrazu twojej twarzy podczas naszego pierwszego spotkania, gdy Bullit powali� ci� na ziemi�.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Takich jak ty nie mo�na pokona�. Jeszcze si� spotkamy. Bywaj!
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "Chod� ze mn�. Chc�, �eby� mi towarzyszy�.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Chod� ze mn�. Chc�, �eby� mi towarzyszy�.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Gdzie si� podzia�a twoja pewno�� siebie, przyjacielu? Jasne, p�jd� z tob�. Tylko si� wreszcie zdecyduj!
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Czekaj, za chwil� b�d� gotowy.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobra, mo�emy i��.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

