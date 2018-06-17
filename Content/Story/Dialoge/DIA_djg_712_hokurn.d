
instance DIA_HOKURN_EXIT(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 999;
	condition = dia_hokurn_exit_condition;
	information = dia_hokurn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hokurn_exit_condition()
{
	return TRUE;
};

func void dia_hokurn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOKURN_HELLO(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 4;
	condition = dia_hokurn_hello_condition;
	information = dia_hokurn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hokurn_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hokurn_hello_info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Masz coœ do picia?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//Rozumiem, ¿e nie chodzi ci o wodê?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//Nie, do diaska! Potrzebujê jakiegoœ alkoholu, ¿eby pozbyæ siê tego cholernego bólu g³owy.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Kiedy przez pewien czas nie mam siê czego napiæ, czujê, jakby ³epetyna mia³a mi zaraz wybuchn¹æ.
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,"Spróbujê coœ zorganizowaæ.",dia_hokurn_hello_no);
	if((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1))
	{
		Info_AddChoice(dia_hokurn_hello,"Proszê, weŸ to.",dia_hokurn_hello_yes);
	};
};

func void dia_hokurn_hello_no()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nie mam nic, co móg³bym ci daæ.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Wiêc spadaj!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"Jeszcze jedno...",dia_hokurn_hello_ask1);
};

func void dia_hokurn_hello_ask1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Jeszcze jedno...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//Nie zrozumia³eœ mnie? WYNOCHA!!!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"To wa¿ne.",dia_hokurn_hello_ask2);
};

func void dia_hokurn_hello_ask2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//To wa¿ne.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//Sam siê o to prosi³eœ.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_hokurn_hello_end()
{
	AI_StopProcessInfos(self);
};

func void b_hokurn_sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//Tego mi by³o trzeba.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//No, znowu jasno myœlê. Co mogê dla ciebie zrobiæ?
};

func void dia_hokurn_hello_yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Proszê, weŸ to.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
	Info_ClearChoices(dia_hokurn_hello);
};


instance DIA_HOKURN_DRINK(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_drink_condition;
	information = dia_hokurn_drink_info;
	permanent = TRUE;
	description = "Przynios³em ci coœ do picia.";
};


func int dia_hokurn_drink_condition()
{
	if((HOKURNGETSDRINK == FALSE) && ((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drink_info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Przynios³em ci coœ do picia.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//Dawaj!
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
};


instance DIA_HOKURN_QUESTION(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_question_condition;
	information = dia_hokurn_question_info;
	permanent = TRUE;
	description = "Potrzebujê paru informacji.";
};


func int dia_hokurn_question_condition()
{
	if(HOKURNGETSDRINK == FALSE)
	{
		return TRUE;
	};
};

func void dia_hokurn_question_info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Potrzebujê paru informacji.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//Myœla³em, ¿e siê zrozumieliœmy. Gadam tylko z przyjació³mi.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//A przyjaciele proponuj¹ jakiœ napitek. £apiesz? A teraz spadaj!
};


instance DIA_HOKURN_LEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_learn_condition;
	information = dia_hokurn_learn_info;
	permanent = FALSE;
	description = "Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.";
};


func int dia_hokurn_learn_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_learn_info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//Móg³bym ci pokazaæ to i owo. Jestem najlepszym wojownikiem w okolicy.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Poniewa¿ jesteœmy przyjació³mi, dam ci specjaln¹ cenê. 300 sztuk z³ota.
	Info_ClearChoices(dia_hokurn_learn);
	Info_AddChoice(dia_hokurn_learn,"To trochê za drogo.",dia_hokurn_learn_tooexpensive);
	if(Npc_HasItems(other,itmi_gold) >= 300)
	{
		Info_AddChoice(dia_hokurn_learn,"W porz¹dku. Oto pieni¹dze.",dia_hokurn_learn_ok);
	};
};

func void dia_hokurn_learn_tooexpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//To dla mnie za drogo.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Za drogo? Ka¿dy inny na moim miejscu policzy³by sobie wiêcej.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//Przemyœl to.
	Info_ClearChoices(dia_hokurn_learn);
};

func void dia_hokurn_learn_ok()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//W porz¹dku. Oto pieni¹dze.
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_hokurn_learn);
};


instance DIA_HOKURN_PAYTEACHER(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_payteacher_condition;
	information = dia_hokurn_payteacher_info;
	permanent = TRUE;
	description = "Masz tu pieni¹dze. Chcê, ¿ebyœ mnie wyszkoli³.";
};


func int dia_hokurn_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_hokurn_learn) && (Npc_HasItems(other,itmi_gold) >= 300) && (HOKURN_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_payteacher_info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Masz tu pieni¹dze. Chcê, ¿ebyœ mnie wyszkoli³.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Nie po¿a³ujesz tego!
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
};


instance DIA_HOKURN_DRINKANDLEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_drinkandlearn_condition;
	information = dia_hokurn_drinkandlearn_info;
	permanent = TRUE;
	description = "Masz tu coœ do picia.";
};


func int dia_hokurn_drinkandlearn_condition()
{
	if((HOKURNGETSDRINK == TRUE) && ((Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1) || (Npc_HasItems(other,itfo_beer) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drinkandlearn_info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Masz tu coœ do picia.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//Czujê siê znacznie lepiej. Teraz mogê przenosiæ góry!
};


instance DIA_HOKURN_TEACH(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_teach_condition;
	information = dia_hokurn_teach_info;
	permanent = TRUE;
	description = "Dobra. Bierzmy siê do nauki.";
};


func int dia_hokurn_teach_condition()
{
	if(HOKURN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_teach_info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Zacznijmy od nauki.
	if(HOKURNLASTDRINK < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Najpierw przynieœ mi coœ do picia!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Wtedy przekonamy siê, co mo¿emy wycisn¹æ z tych spróchnia³ych paladyñskich koœci.
		}
		else if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//No widzisz. Nawet magicy u¿ywaj¹ broni do walki wrêcz.
		};
		Info_ClearChoices(dia_hokurn_teach);
		Info_AddChoice(dia_hokurn_teach,DIALOG_BACK,dia_hokurn_teach_back);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
	};
};

func void dia_hokurn_teach_back()
{
	Info_ClearChoices(dia_hokurn_teach);
};

func void b_hokurn_teachedenough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Nie potrzebujesz ju¿ nauczyciela w tej dyscyplinie.
};

func void dia_hokurn_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
};

func void dia_hokurn_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
};

func void dia_hokurn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
};

func void dia_hokurn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
};


instance DIA_HOKURN_STAYHERE(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_stayhere_condition;
	information = dia_hokurn_stayhere_info;
	permanent = FALSE;
	description = "A co tu w³aœciwie robisz?";
};


func int dia_hokurn_stayhere_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_stayhere_info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//A tak w ogóle - co tutaj robisz?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Nie mam pojêcia, co tutaj robimy, ani kiedy siê to zacznie.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//I nie obchodzi mnie to, dopóki mam coœ do picia.
};


instance DIA_HOKURN_WHEREDRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_wheredragon_condition;
	information = dia_hokurn_wheredragon_info;
	permanent = TRUE;
	description = "A czy wiesz, gdzie s¹ smoki?";
};


func int dia_hokurn_wheredragon_condition()
{
	if((HOKURNGETSDRINK == TRUE) && (HOKURNTELLSDRAGON == FALSE) && Npc_KnowsInfo(other,dia_hokurn_stayhere))
	{
		return TRUE;
	};
};

func void dia_hokurn_wheredragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//A czy wiesz, gdzie s¹ smoki?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//A co bêdê z tego mia³, jeœli ci powiem?
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"Nic, sam ich szukam.",dia_hokurn_wheredragon_findmyself);
	Info_AddChoice(dia_hokurn_wheredragon,"Jestem gotów zap³aciæ za tak¹ informacjê.",dia_hokurn_wheredragon_gold);
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"Wci¹¿ mam butelkê d¿inu!",dia_hokurn_wheredragon_booze);
	};
};

func void dia_hokurn_wheredragon_findmyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nic, sam ich szukam.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//Lepiej uwa¿aj. Czeka ciê cholernie ciê¿ka walka.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Jestem gotów zap³aciæ za tak¹ informacjê.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Zap³aciæ? Hmmm. Powiem ci, co wiem, za 200 sztuk z³ota.
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"Za du¿o!",dia_hokurn_wheredragon_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 200)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"Stoi. Oto pieni¹dze!",dia_hokurn_wheredragon_ok);
	};
};

func void dia_hokurn_wheredragon_toomuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//Za du¿o!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//No to zapomnij o tym.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_ok()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Stoi. Oto pieni¹dze!
	b_giveinvitems(other,self,itmi_gold,200);
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//Wci¹¿ mam butelkê d¿inu!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//Za dobry trunek gotów jestem walczyæ ze wszystkimi smokami œwiata.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Zgoda. Dawaj tê butelkê!
	b_giveinvitems(other,self,itfo_booze,1);
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Zachowam j¹ na deszczowy dzieñ.
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};


instance DIA_HOKURN_DRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_dragon_condition;
	information = dia_hokurn_dragon_info;
	permanent = TRUE;
	description = "No dobra, przejdŸmy do rzeczy - gdzie s¹ te smoki?";
};


func int dia_hokurn_dragon_condition()
{
	if(HOKURNTELLSDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_dragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//No dobra, przejdŸmy do rzeczy - gdzie s¹ te smoki?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//Oczywiœcie nie znam ¿adnych szczegó³ów, ale s³ysza³em, ¿e s¹ cztery smoki.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//W nocy, nad najwy¿sz¹ gór¹, widzieliœmy czerwon¹ ³unê.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//Przysiêgam na moj¹ matkê. Jak szukasz smoka, to na pewno tam jakiegoœ znajdziesz.
};


instance DIA_HOKURN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_alldragonsdead_condition;
	information = dia_hokurn_alldragonsdead_info;
	permanent = TRUE;
	description = "Zabi³em wszystkie smoki.";
};


func int dia_hokurn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Zabi³em wszystkie smoki.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Nie gadaj po pró¿nicy, ja siê na takie bajki na pewno nie nabiorê!
};


instance DIA_HOKURN_PICKPOCKET(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 900;
	condition = dia_hokurn_pickpocket_condition;
	information = dia_hokurn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hokurn_pickpocket_condition()
{
	return c_beklauen(69,210);
};

func void dia_hokurn_pickpocket_info()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_BACK,dia_hokurn_pickpocket_back);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_PICKPOCKET,dia_hokurn_pickpocket_doit);
};

func void dia_hokurn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hokurn_pickpocket);
};

func void dia_hokurn_pickpocket_back()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
};

