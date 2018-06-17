
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hej, nie znam ciê... Czego tutaj szukasz? Mo¿e knajpy?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Nie, nie idê do knajpy... (KONIEC)",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Wiêc to tutaj zbiera siê ca³e towarzystwo...",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Tak, masz coœ przeciwko?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Nie, nie szukam knajpy...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Tak, te¿ bym tak powiedzia³. Ale to nie ma znaczenia - i dlatego mo¿emy od razu przejœæ do interesów.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Poniewa¿ jesteœ tu nowy, mam dla ciebie propozycjê. Zap³acisz mi 50 sztuk z³ota, a ja pozwolê ci wejœæ.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//Tyle kosztuje wejœcie do knajpy.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Dowiedzmy siê, co na ten temat s¹dzi stra¿...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"W porz¹dku, zap³acê.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"Ale ja nie chcê wejœæ do knajpy!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Ale ja nie chcê wejœæ do knajpy!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Taaak, prêdzej czy póŸniej ka¿dy chce wejœæ do knajpy. Wiêc równie dobrze mo¿esz mi zap³aciæ ju¿ teraz - i potem bêdziesz mia³ spokój.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ach, wiêc to tutaj zbiera siê ca³e towarzystwo. £atwo pomyliæ to miejsce z pa³acem gubernatora...
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hej, daruj sobie te kiepskie dowcipy, jeœli nie chcesz zbieraæ zêbów z ulicy.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Widzê, ¿e nie obêdzie siê bez bijatyki...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Za ma³o masz problemów?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uspokój siê, chcê tylko wypiæ piwo.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"Ale ja nie chcê wejœæ do knajpy!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Tak, masz coœ przeciwko?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Nie masz tu czego szukaæ, kurduplu.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Widzê, ¿e nie obêdzie siê bez bijatyki...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Za ma³o masz problemów?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uspokój siê, chcê tylko wypiæ piwo.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Dowiedzmy siê, co na ten temat s¹dzi stra¿...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//Na twoim miejscu nie liczy³bym na stra¿. Stra¿nicy tu nie przychodz¹.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Jesteœmy w dzielnicy portowej, cwaniaczku. Baliby siê tutaj z kimkolwiek zadrzeæ.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Stra¿nicy mog¹ co najwy¿ej chodziæ do 'Czerwonej Latarni'. A zatem, jak sam widzisz, to sprawa tylko miêdzy nami.
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Rozumiem. Widzê, ¿e nie obejdzie siê bez bijatyki.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Proszê bardzo, spróbuj. Poka¿, co potrafisz!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Za ma³o masz problemów?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Jasne, problemy to moje drugie imiê. Broñ siê, kurduplu!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Uspokój siê, chcê tylko wypiæ piwo.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Dobrze, ale ¿eby wejœæ do œrodka, musisz mi zap³aciæ 50 sztuk z³ota.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"W porz¹dku, zap³acê.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//W porz¹dku, zap³acê.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Wspaniale. A skoro ju¿ posz³o nam tak ³atwo, mo¿esz mi teraz oddaæ resztê swoich pieniêdzy.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Proszê, to wszystko, co mam.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...ale nie mam przy sobie tylu pieniêdzy.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//To nie ma znaczenia. Po prostu daj mi wszystko, co masz.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Proszê, to wszystko, co mam.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...ale nie mam nawet 10 sztuk z³ota.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Ale trafi³em.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//No dobrze ju¿, dobrze, mo¿esz wejœæ.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Zapomnij o tym, nie dostaniesz nawet z³amanego grosza!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Wiêc zabiorê wszystko, co masz - ale najpierw spuszczê ci porz¹dne lanie.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Proszê, to wszystko, co mam.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Dobrze, to wystarczy. Chodz¹ca pob³a¿liwoœæ - oto ca³y ja.
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "Wiesz, co dzieje siê w porcie, prawda?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Wiesz, co dzieje siê w porcie, prawda?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Pewnie. A dlaczego pytasz?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"Du¿o tu macie statków?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Czemu nie widzê tu ¿adnej stra¿y?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"S³ysza³eœ ostatnio jakieœ plotki?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Du¿o tu macie statków?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Jedyny statek w tym mieœcie nale¿y do paladynów.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Jest zacumowany na po³udniowym zachodzie.
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Czemu nie widzê tu ¿adnej stra¿y?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Stra¿ tutaj nie przychodzi. Sami za³atwiamy nasze spory.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//S³ysza³eœ ostatnio jakieœ plotki?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//W tych okolicach nie lubimy, kiedy ktoœ zadaje zbyt du¿o pytañ. Szczególnie jeœli jest to ktoœ obcy.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//¯adnych. A czego siê spodziewa³eœ? To spokojne miejsce.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//Nie jest dobrze. Czasy s¹ ciê¿kie, a my z trudem wi¹¿emy koniec z koñcem.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Przestañ siê ze mnie nabijaæ.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Jak mog³eœ pomyœleæ coœ takiego? Zrani³eœ moje uczucia.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Jest nieweso³o. Od jakiegoœ czasu Lord Andre ci¹gle wsadza nos w nie swoje sprawy.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Taki elegancik nigdy nie zrozumie, co siê tutaj dzieje.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//Nie mamy z tym nic wspólnego.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//To znaczy z czym?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//Z tym zamordowanym paladynem. Powinieneœ zainteresowaæ siê najemnikami, zamiast marnowaæ tutaj swój czas.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Wiem, ¿e nie mia³eœ z tym nic wspólnego, ale to morderstwo naprawdê wzbudzi³o niepokój porz¹dnych obywateli.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Jeœli zechcesz przyj¹æ przyjacielsk¹ radê, najlepiej bêdzie, jeœli znikniesz z miasta. Przynajmniej na jakiœ czas.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Odk¹d zosta³o udowodnione, ¿e najemnicy nie mieli nic wspólnego ze œmierci¹ tego paladyna, stra¿ boi siê tu przychodziæ.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Pewnie obawiaj¹ siê tych paru mieszkaj¹cych tutaj pijaków, he, he. I dobrze.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Nic siê tu nie dzieje.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Ci nadêci paladyni opuszczaj¹ nasz port. Najwy¿szy czas.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Hej, ty! Pozdrowienia od Lehmara.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

