
instance DIA_SENTENZA_EXIT(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 999;
	condition = dia_sentenza_exit_condition;
	information = dia_sentenza_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sentenza_exit_condition()
{
	return TRUE;
};

func void dia_sentenza_exit_info()
{
	AI_StopProcessInfos(self);
};


var int sentenza_wants50;
var int sentenza_searchday;

instance DIA_SENTENZA_HELLO(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_hello_condition;
	information = dia_sentenza_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_hello_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_sentenza_hello_info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//A ty gdzie siê wybierasz?
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"A co ciê to obchodzi?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"Chcia³em siê rozejrzeæ, to wszystko.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Chcia³em siê tylko rozejrzeæ, to wszystko.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//Na ludzi takich jak ty czekaj¹ tu same k³opoty! A ty mi mówisz, ¿e chcesz siê tylko rozejrzeæ?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ha! Zmierzasz w kierunku dworu! Po co inaczej przywlók³byœ siê a¿ tutaj, hm?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Nie wciskaj mi wiêc kitu i pozwól siê przeszukaæ. Wtedy bêdziesz móg³ przejœæ.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Trzymaj ³apy przy sobie!",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"Jak tam sobie chcesz, mo¿esz mnie przeszukaæ.",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//A co ciê to obchodzi?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//Wyjaœniê ci to powoli i dok³adnie.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Jak tam sobie chcesz, mo¿esz mnie przeszukaæ.
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Spójrzmy, co my tu mamy...
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Ach! Z³oto! Niebezpiecznie jest nosiæ przy sobie z³oto.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Wiêkszoœæ najemników to zwyk³e rzezimieszki. Nie uczciwi ludzie jak ja.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//Có¿, nie masz przy sobie zbyt wiele.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Poczekaj, zaraz bêdê z powrotem.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//Przyszed³eœ tu taki kawa³ drogi bez z³ota?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Nie wygl¹dasz na zag³odzonego, przyznaj siê, gdzie ukry³eœ kasê?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Tak czy inaczej, m¹dry z ciebie goœæ. Jestem pewien, ¿e jeszcze siê spotkamy. Do tego czasu, uwa¿aj na siebie.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//Tylko ty wiesz, gdzie schowa³eœ z³oto!
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//Chcê tylko 50 sztuk z³ota - tyle wynosi myto. P³acisz tylko raz. To chyba rozs¹dne rozwi¹zanie, prawda?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Trzymaj ³apy przy sobie!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//Albo co?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Albo nic - mo¿esz mnie przeszukaæ!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"Albo przez nastêpne dni nie bêdziesz mia³ si³y, ¿eby kogokolwiek przeszukaæ!",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//Albo przez nastêpne kilka dni nie bêdziesz w stanie nikogo przeszukaæ!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Przekonamy siê!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_VZWEI(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 2;
	condition = dia_sentenza_vzwei_condition;
	information = dia_sentenza_vzwei_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_vzwei_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SENTENZA_GOLDTAKEN == FALSE) && (SENTENZA_SEARCHDAY < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_sentenza_vzwei_info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//To znowu ty. SprawdŸmy, co tam masz przy sobie!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"Zabieraj ode mnie swoje obleœne ³apska!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"Jak tam sobie chcesz, mo¿esz mnie przeszukaæ.",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Zabieraj ode mnie swoje obleœne ³apska!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//Ach? Widzê, ¿e tym razem masz coœ przy sobie!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_WANNAJOIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 3;
	condition = dia_sentenza_wannajoin_condition;
	information = dia_sentenza_wannajoin_info;
	permanent = FALSE;
	description = "Chcê siê do was przy³¹czyæ!";
};


func int dia_sentenza_wannajoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sentenza_wannajoin_info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//Chcê siê do was przy³¹czyæ!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//Œwietny pomys³.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//Rozumiesz chyba, ¿e najemnicy bêd¹ musieli zdecydowaæ, czy chc¹ byœ siê przy³¹czy³, czy te¿ nie?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "Czy bêdziesz g³osowa³ na tak?";
};


func int dia_sentenza_vote_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_vote_info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//Czy bêdziesz g³osowa³ na tak?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Dlaczego? Dlatego, ¿e mnie pobi³eœ? Nie ma szans.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//W³aœciwie, czemu nie? 50 sztuk z³ota to chyba niewygórowana cena za pozytywny g³os, nie uwa¿asz?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"Sentenza nie sprzeciwia siê mojemu wst¹pieniu w szeregi najemników.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//Po tym, jak odebra³eœ mi z³oto? Nie licz na to, ch³opcze.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//Tak nic nie za³atwimy. Jeœli mam na ciebie g³osowaæ, musisz wysup³aæ trochê z³ota.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Ile?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 sztuk z³ota, tyle ile wynosi myto.
		SENTENZA_WANTS50 = TRUE;
	};
};


var int sentenza_goldgiven;

instance DIA_SENTENZA_PAY50(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 5;
	condition = dia_sentenza_pay50_condition;
	information = dia_sentenza_pay50_info;
	permanent = TRUE;
	description = "Oto twoje 50 sztuk z³ota.";
};


func int dia_sentenza_pay50_condition()
{
	if((SENTENZA_WANTS50 == TRUE) && (Npc_HasItems(self,itmi_gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_pay50_info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Oto twoje 50 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Dziêki, to powinno wystarczyæ.
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Nie wkurzaj mnie. 50 i ani sztuki mniej, rozumiesz?
	};
};


var int sentenza_einmal;

instance DIA_SENTENZA_GOLDBACK(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 6;
	condition = dia_sentenza_goldback_condition;
	information = dia_sentenza_goldback_info;
	permanent = TRUE;
	description = "Oddawaj moje z³oto!";
};


func int dia_sentenza_goldback_condition()
{
	if(Npc_HasItems(self,itmi_gold) >= 50)
	{
		if((SENTENZA_GOLDGIVEN == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_goldback_info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Oddawaj moje z³oto!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//Teraz, kiedy odda³em na ciebie g³os?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ty œmierdz¹cy ¿ebraku!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Uspokój siê! Postanowi³em je tylko przechowaæ...
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "Powiedz no, czy to coœ z przodu twojej g³owy to twarz czy dupa?";
};


func int dia_sentenza_aufsmaul_condition()
{
	if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_sentenza_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Powiedz no, czy to coœ z przodu twojej g³owy to twarz czy dupa?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//W porz¹dku, skoro tak chcesz...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_AUFSMAULAGAIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 8;
	condition = dia_sentenza_aufsmaulagain_condition;
	information = dia_sentenza_aufsmaulagain_info;
	permanent = TRUE;
	description = "Koniec z mi³ym goœciem!";
};


func int dia_sentenza_aufsmaulagain_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_aufsmaul))
	{
		if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_aufsmaulagain_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Koniec z mi³ym goœciem!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Skoro tak mówisz...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_PERM(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_perm_condition;
	information = dia_sentenza_perm_info;
	permanent = TRUE;
	description = "I jak tam interes?";
};


func int dia_sentenza_perm_condition()
{
	return TRUE;
};

func void dia_sentenza_perm_info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//No i jak tam interes?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Niewiele osób ostatnio têdy przechodzi, ale jak dot¹d wszyscy p³acili myto.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//Oprócz ciebie...
	};
};


instance DIA_SENTENZA_PICKPOCKET(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 900;
	condition = dia_sentenza_pickpocket_condition;
	information = dia_sentenza_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_sentenza_pickpocket_condition()
{
	return c_beklauen(56,65);
};

func void dia_sentenza_pickpocket_info()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_BACK,dia_sentenza_pickpocket_back);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_PICKPOCKET,dia_sentenza_pickpocket_doit);
};

func void dia_sentenza_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sentenza_pickpocket);
};

func void dia_sentenza_pickpocket_back()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
};

