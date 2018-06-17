
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
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Jak ci siê ¿yje na wolnoœci?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Kiepsko. Nikt mi nie powiedzia³, ¿e pod moj¹ nieobecnoœæ Khorinis zesz³o na psy.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No nie wiem. Dla mnie to miasto zawsze takie by³o.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//To powinieneœ je zobaczyæ parê lat temu. Spodoba³oby ci siê.
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
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Co siê tak dziwisz?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//Naprawdê s¹dzi³eœ, ¿e nie ¿yjê?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Na jakiœ czas straci³em przytomnoœæ, ale - jak widzisz - ¿yjê i mam siê ca³kiem dobrze.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//Teraz liczy siê to, ¿e jesteœmy tu obaj...
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//I to, ¿e potrzeba mi twojej pomocy.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Dobrze, ¿e ciê widzê. Musisz mi pomóc.
	};
	Info_ClearChoices(dia_diegonw_needhelp);
	if(diegoow.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
	};
	Info_AddChoice(dia_diegonw_needhelp,"Co to za strój?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"Co tu porabiasz?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"W czym rzecz?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//Obserwujê stra¿ników. Bez przerwy wêsz¹.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Nie³atwo bêdzie przeœlizgn¹æ siê têdy.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Cholera, to pewnie przez ten strój. Stra¿nicy nie chc¹ mnie wpuœciæ do miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Dlatego w³aœnie kupi³em te szaty od napotkanego handlarza. Teraz chyba sobie mnie przypominasz? To ja - Diego!
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Za Barier¹ nauczy³em ciê wszystkiego, co pomog³o ci w przetrwaniu.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Chyba nie mog³eœ tego zapomnieæ?
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Hmmm... Mo¿esz mi powiedzieæ, co siê wtedy sta³o?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Jasna cholera! Ty naprawdê nic nie pamiêtasz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//S³uchaj, nie mam teraz czasu, ¿eby ci to wszystko wyjaœniæ. Musisz wiedzieæ tylko tyle: byliœmy wtedy dobrymi kumplami i parê razy uratowa³em ci ¿ycie.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//A teraz potrzebujê twojej pomocy.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Co to za strój?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Kupi³em go od napotkanego handlarza. Stra¿nicy nie chcieli mnie wpuœciæ do miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Poza tym, nie chcê, ¿eby ca³y œwiat wiedzia³, sk¹d wracam.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//Nieg³upi pomys³.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Te¿ tak myœlê. Ale chocia¿ pozby³em siê stroju Cienia, nadal jestem tym, kim by³em w Kolonii.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//I wi¹¿ê z tym miastem wielkie plany.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//W czym rzecz?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Du¿o siê tu pozmienia³o od mojej ostatniej wizyty. Najpierw muszê jakoœ stan¹æ na nogi.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//Ale w czym problem?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Muszê siê dostaæ do górnego miasta.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Ale nie jestem mieszkañcem, a nie mam doœæ z³ota, by przekupiæ stra¿ników. I tu wkraczasz TY!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//Mam ci po¿yczyæ trochê z³ota?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//W ¿adnym wypadku! Mam trochê pieniêdzy... ca³kiem sporo, jeœli mam byæ szczery. Niestety, nie mam ich przy sobie.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Ktoœ musi mi je przynieœæ. Rozumiemy siê?
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Obawiam siê, ¿e nie mam na to czasu.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(dia_diegonw_needhelp,"A co JA bêdê z tego mia³?",dia_diegonw_needhelp_problem_reward);
	Info_AddChoice(dia_diegonw_needhelp,"W porz¹dku, pomogê ci.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//Obawiam siê, ¿e nie mam na to czasu.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hej, myœla³em, ¿e jesteœmy kumplami! Nie wiem, czy pamiêtasz, ale to JA uratowa³em twój ty³ek, gdy wyl¹dowa³eœ w Kolonii.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Chyba trochê przesadzasz.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//O, czy¿by? No to zastanów siê, co by siê z tob¹ sta³o, gdybym nie wyjaœni³ ci, kto jest kim, i jak siê zachowywaæ za Barier¹.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Magnaci zjedliby ciê na œniadanie! Skoñczy³byœ w zawszonej kopalni!
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//A co bêdê z tego mia³?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//A czy ja ciê prosi³em o coœ w zamian za moj¹ pomoc? Jesteœmy przyjació³mi. To ci nie wystarczy?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//W porz¹dku, pomogê ci.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//S³uchaj. Gdy Bariera nadal istnia³a, ukry³em sobie ma³y skarb.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//To by³o dawno temu, wiêc zapomnia³em go ze sob¹ zabraæ.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//Teraz nie mogê siê st¹d ruszyæ...
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//¯eby nie przed³u¿aæ: musisz pójœæ do Górniczej Doliny i odzyskaæ moje z³oto.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Z³oto Diega znajduje siê w Górniczej Dolinie. Diego potrzebuje go, aby dostaæ siê do górnego miasta, i prosi³ mnie o jego przyniesienie.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"Co zamierzasz zrobiæ z pieniêdzmi?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Sk¹d wzi¹³eœ to ca³e z³oto?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Gdzie schowa³eœ z³oto?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Co zamierzasz zrobiæ z pieniêdzmi?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//Muszê siê rozliczyæ z jednym kupcem z górnego miasta. Tym zajmê siê w pierwszej kolejnoœci.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//A potem rozpocznie siê moja nowa kariera!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Sk¹d wzi¹³eœ to ca³e z³oto?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Czy¿bym by³ jedynym, który uciu³a³ sobie trochê pieniêdzy w Górniczej Dolinie?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Od³o¿enie na bok paru sztuk z³ota by³o dziecinnie ³atwe. No wiesz, na wypadek, gdybyœmy siê stamt¹d wydostali.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Wszyscy szaleli za rud¹, nikogo nie obchodzi³o z³oto.
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Gdzie schowa³eœ z³oto?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Na placu wymian, nad opuszczon¹ kopalni¹, w skórzanej torbie.
	if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Nie musisz komentowaæ - dobrze wiem, ¿e nie zauwa¿yliœmy tego na czas.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Zdob¹dŸ torbê i mi j¹ przynieœ.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Tylko upewnij siê, ¿e to ta w³aœciwa, ¿ebyœ nie musia³ chodziæ dwa razy.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Jak j¹ rozpoznam?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Torba jest pe³na z³ota. Wypchana po brzegi!
	Info_AddChoice(dia_diegonw_needhelp,"Dobrze, spróbujê znaleŸæ twój skarb.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Z³oto Diega znajduje siê gdzieœ na starym placu wymian, nad opuszczon¹ kopalni¹ - tam, gdzie dostarczano za pomoc¹ kolejki linowej ca³e zaopatrzenie dla Kolonii.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Dobrze, spróbujê znaleŸæ twój skarb.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//Tak trzymaæ! To mi wystarczy.
	Info_ClearChoices(dia_diegonw_needhelp);
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "W porz¹dku, jednak ci pomogê.";
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
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//W porz¹dku, jednak ci pomogê.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Wiedzia³em, ¿e tak bêdzie.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//PrzejdŸmy od razu do rzeczy, dobrze?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Jasne. Ukry³em w Górniczej Dolinie pokaŸn¹ sumê pieniêdzy i chcê, ¿ebyœ je dla mnie odzyska³.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//Ja zostanê tutaj i w miêdzyczasie wszystko przygotujê.
	dia_diegonw_needhelp_problem_willhelpyou_wheregold();
	dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Z³oto Diega znajduje siê w Górniczej Dolinie. Diego potrzebuje go, aby dostaæ siê do górnego miasta, i prosi³ mnie o jego przyniesienie.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "Znalaz³em twoje z³oto!";
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
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Œwietnie. Gerbrandt mo¿e siê zacz¹æ pakowaæ.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Znalaz³em twoje z³oto!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Œwietnie. Poka¿!
	if(Npc_HasItems(other,itse_diegostreasure_mis) >= 1)
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold < DIEGOSTREASURE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Ale to jeszcze nie wszystko! Nie ufasz mi? Potrzebujê ca³ej sumy!
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Jeœli mój plan wypali, zostanie dla ciebie wystarczaj¹co du¿o.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Ale najpierw muszê dostaæ wszystko, co do grosza. To bardzo wa¿ne!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if((Npc_IsDead(gerbrandt) == FALSE) && (DIEGOSREVENGE == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//S³uchaj, muszê siê teraz zaj¹æ stra¿nikami.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Chcê, ¿ebyœ zaniós³ ten list Gerbrandtowi. To jeden z bogatych kupców z górnego miasta.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Przeka¿ mu moje pozdrowienia. Spotkamy siê przed jego domem.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Diego da³ mi list dla kupca Gerbrandta.");
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
	description = "Dostarczy³em twój list.";
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
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Dostarczy³em twój list.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Œwietnie. I jak zareagowa³ Gerbrandt?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Wydawa³ siê bardzo przestraszony i natychmiast znikn¹³.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//No, ja myœlê.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Obawiam siê, ¿e najpierw muszê poœwiêciæ trochê czasu na urz¹dzenie mojego nowego domu. Jeœli dobrze pamiêtam, Gerbrandt ma fatalny gust.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"Jak tego dokona³eœ?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"A wiêc dom jest twój?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//Co siê sta³o z Gerbrandtem?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Zbyt d³ugo cieszy³ siê ¿yciem w luksusie.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//Mieszka³ sobie tutaj, op³ywaj¹c w dostatki, podczas gdy ja za¿era³em siê gulaszem z chrz¹szczy.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Nie wiem, dok¹d uciek³, ale jego noga nigdy wiêcej nie postanie w Khorinis. Ju¿ ja siê o to postaram.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Jeœli koniecznie chcesz go znaleŸæ, popytaj w okolicach przystani.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//A wiêc dom jest twój?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Tak! Od piwnicy a¿ po strych, z ca³ym wyposa¿eniem.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Po spêdzeniu tylu lat w niezbyt komfortowych, wiêziennych warunkach, zamierzam wreszcie wyspaæ siê porz¹dnie na miêkkim ³ó¿ku.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//A na œniadanie bêdzie kawa³ prawdziwego miêsa i dobre wino!
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//NieŸle to sobie zaplanowa³eœ, co?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//¯ebyœ wiedzia³!
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//Jak tego dokona³eœ?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Myœlisz, ¿e Gerbrandt doszed³ do swojej fortuny w ci¹gu wielu lat uczciwej pracy?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Oczywiœcie on sam nie macza³ palców w szczególnie œliskich sprawach. Mia³ do tego specjalnego pomocnika.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Si³¹ rzeczy poznawa³em szczegó³y jego brudnych machlojek, a¿ postanowi³ pozbyæ siê mnie na dobre. Za du¿o wiedzia³em.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//Nigdy mi o tym nie mówi³eœ.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//Nigdy mnie o to nie pyta³eœ.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"A co z moj¹ dzia³k¹?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"Co siê sta³o z Gerbrandtem?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//A co z moj¹ dzia³k¹?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Widzê, ¿e jednak nie zapomnia³eœ wszystkiego, czego ciê nauczy³em.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Ale masz racjê. Bez ciebie nigdy by mi siê nie uda³o. Oto twoja czêœæ.
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Jasne. Daj znaæ, jak bêdziesz gotowy.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Mam najpierw parê spraw do za³atwienia.
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
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Naucz mnie czegoœ.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Mogê popracowaæ trochê nad twoj¹ zrêcznoœci¹.
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
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Ju¿ jesteœ bardziej zrêczny. Tak trzymaæ.
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
	description = "Zamierzam opuœciæ Khorinis.";
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
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Zamierzam opuœciæ Khorinis.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//M¹dra decyzja. Chêtnie zabra³bym siê z tob¹. To miasto za bardzo siê zmieni³o. Ciê¿ko bêdzie tutaj szybko siê wzbogaciæ.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Móg³bym ciê podszkoliæ w ³ucznictwie, otwieraniu zamków i zrêcznoœci.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//No i przyda ci siê chyba dobry z³odziej?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Oczywiœcie, Diego chce mi towarzyszyæ. Uwa¿a, ¿e im szybciej opuœci Khorinis, tym lepiej. Móg³by mi pokazaæ, jak zwiêkszyæ zrêcznoœæ, i przeszkoliæ mnie w pos³ugiwaniu siê ³ukiem oraz otwieraniu zamków.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Zastanowiê siê nad tym. W tej chwili mam ju¿ prawie ca³¹ za³ogê.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Nie musisz siê spieszyæ. Nigdzie siê nie wybieram.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Szczegó³y poznasz, gdy nadejdzie odpowiednia pora.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Nie chcesz iœæ ze mn¹?",dia_diegonw_knowwhereenemy_yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Pop³yñ ze mn¹. Mo¿emy siê spotkaæ na przystani.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Hmmm... Masz racjê. Khorinis to rynsztok. P³ynê z tob¹!
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Daj mi jedn¹ chwilê. Zaraz bêdê gotowy.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Mogê ju¿ ruszaæ. Do zobaczenia na statku!
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
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Mo¿e dam ci znaæ, gdy nadejdzie odpowiednia chwila.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Tak zrób. Kto wie? Mo¿e nawet z tob¹ pop³ynê?
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
	description = "Mo¿esz ju¿ wracaæ do miasta.";
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
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Mo¿esz ju¿ wracaæ do miasta.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Serio? Nie potrzebujesz mnie? Jak chcesz. Jak wrócisz do miasta, zajrzyj do mnie koniecznie.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Myœlisz, ¿e siê jeszcze kiedyœ spotkamy?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Nigdy nie zapomnê wyrazu twojej twarzy podczas naszego pierwszego spotkania, gdy Bullit powali³ ciê na ziemiê.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Takich jak ty nie mo¿na pokonaæ. Jeszcze siê spotkamy. Bywaj!
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
	description = "ChodŸ ze mn¹. Chcê, ¿ebyœ mi towarzyszy³.";
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
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//ChodŸ ze mn¹. Chcê, ¿ebyœ mi towarzyszy³.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Gdzie siê podzia³a twoja pewnoœæ siebie, przyjacielu? Jasne, pójdê z tob¹. Tylko siê wreszcie zdecyduj!
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Czekaj, za chwilê bêdê gotowy.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Dobra, mo¿emy iœæ.
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

