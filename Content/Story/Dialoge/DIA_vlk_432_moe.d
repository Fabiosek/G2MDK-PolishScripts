
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
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hej, nie znam ci�... Czego tutaj szukasz? Mo�e knajpy?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Nie, nie id� do knajpy... (KONIEC)",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Wi�c to tutaj zbiera si� ca�e towarzystwo...",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Tak, masz co� przeciwko?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Nie, nie szukam knajpy...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Tak, te� bym tak powiedzia�. Ale to nie ma znaczenia - i dlatego mo�emy od razu przej�� do interes�w.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Poniewa� jeste� tu nowy, mam dla ciebie propozycj�. Zap�acisz mi 50 sztuk z�ota, a ja pozwol� ci wej��.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//Tyle kosztuje wej�cie do knajpy.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Dowiedzmy si�, co na ten temat s�dzi stra�...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"W porz�dku, zap�ac�.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"Ale ja nie chc� wej�� do knajpy!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Ale ja nie chc� wej�� do knajpy!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Taaak, pr�dzej czy p�niej ka�dy chce wej�� do knajpy. Wi�c r�wnie dobrze mo�esz mi zap�aci� ju� teraz - i potem b�dziesz mia� spok�j.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ach, wi�c to tutaj zbiera si� ca�e towarzystwo. �atwo pomyli� to miejsce z pa�acem gubernatora...
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hej, daruj sobie te kiepskie dowcipy, je�li nie chcesz zbiera� z�b�w z ulicy.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Widz�, �e nie ob�dzie si� bez bijatyki...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Za ma�o masz problem�w?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uspok�j si�, chc� tylko wypi� piwo.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"Ale ja nie chc� wej�� do knajpy!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Tak, masz co� przeciwko?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Nie masz tu czego szuka�, kurduplu.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Widz�, �e nie ob�dzie si� bez bijatyki...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Za ma�o masz problem�w?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Uspok�j si�, chc� tylko wypi� piwo.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Dowiedzmy si�, co na ten temat s�dzi stra�...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//Na twoim miejscu nie liczy�bym na stra�. Stra�nicy tu nie przychodz�.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Jeste�my w dzielnicy portowej, cwaniaczku. Baliby si� tutaj z kimkolwiek zadrze�.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Stra�nicy mog� co najwy�ej chodzi� do 'Czerwonej Latarni'. A zatem, jak sam widzisz, to sprawa tylko mi�dzy nami.
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Rozumiem. Widz�, �e nie obejdzie si� bez bijatyki.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Prosz� bardzo, spr�buj. Poka�, co potrafisz!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Za ma�o masz problem�w?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Jasne, problemy to moje drugie imi�. Bro� si�, kurduplu!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Uspok�j si�, chc� tylko wypi� piwo.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Dobrze, ale �eby wej�� do �rodka, musisz mi zap�aci� 50 sztuk z�ota.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"W porz�dku, zap�ac�.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//W porz�dku, zap�ac�.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Wspaniale. A skoro ju� posz�o nam tak �atwo, mo�esz mi teraz odda� reszt� swoich pieni�dzy.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Prosz�, to wszystko, co mam.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...ale nie mam przy sobie tylu pieni�dzy.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//To nie ma znaczenia. Po prostu daj mi wszystko, co masz.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Prosz�, to wszystko, co mam.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...ale nie mam nawet 10 sztuk z�ota.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Ale trafi�em.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//No dobrze ju�, dobrze, mo�esz wej��.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Zapomnij o tym, nie dostaniesz nawet z�amanego grosza!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Wi�c zabior� wszystko, co masz - ale najpierw spuszcz� ci porz�dne lanie.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Prosz�, to wszystko, co mam.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Dobrze, to wystarczy. Chodz�ca pob�a�liwo�� - oto ca�y ja.
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "Wiesz, co dzieje si� w porcie, prawda?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Wiesz, co dzieje si� w porcie, prawda?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Pewnie. A dlaczego pytasz?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"Du�o tu macie statk�w?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Czemu nie widz� tu �adnej stra�y?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"S�ysza�e� ostatnio jakie� plotki?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Du�o tu macie statk�w?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Jedyny statek w tym mie�cie nale�y do paladyn�w.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Jest zacumowany na po�udniowym zachodzie.
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Czemu nie widz� tu �adnej stra�y?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Stra� tutaj nie przychodzi. Sami za�atwiamy nasze spory.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//S�ysza�e� ostatnio jakie� plotki?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//W tych okolicach nie lubimy, kiedy kto� zadaje zbyt du�o pyta�. Szczeg�lnie je�li jest to kto� obcy.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//�adnych. A czego si� spodziewa�e�? To spokojne miejsce.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//Nie jest dobrze. Czasy s� ci�kie, a my z trudem wi��emy koniec z ko�cem.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Przesta� si� ze mnie nabija�.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Jak mog�e� pomy�le� co� takiego? Zrani�e� moje uczucia.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Jest nieweso�o. Od jakiego� czasu Lord Andre ci�gle wsadza nos w nie swoje sprawy.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Taki elegancik nigdy nie zrozumie, co si� tutaj dzieje.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//Nie mamy z tym nic wsp�lnego.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//To znaczy z czym?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//Z tym zamordowanym paladynem. Powiniene� zainteresowa� si� najemnikami, zamiast marnowa� tutaj sw�j czas.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Wiem, �e nie mia�e� z tym nic wsp�lnego, ale to morderstwo naprawd� wzbudzi�o niepok�j porz�dnych obywateli.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Je�li zechcesz przyj�� przyjacielsk� rad�, najlepiej b�dzie, je�li znikniesz z miasta. Przynajmniej na jaki� czas.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Odk�d zosta�o udowodnione, �e najemnicy nie mieli nic wsp�lnego ze �mierci� tego paladyna, stra� boi si� tu przychodzi�.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Pewnie obawiaj� si� tych paru mieszkaj�cych tutaj pijak�w, he, he. I dobrze.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Nic si� tu nie dzieje.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Ci nad�ci paladyni opuszczaj� nasz port. Najwy�szy czas.
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

