
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Nie mamy o czym rozmawia�, p�ki nie ui�cisz grzywny.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//A wzros�a ona jeszcze w �wietle ostatnich wydarze�.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Wpakowa�e� si� w kolejne k�opoty.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Mam nadziej�, �e wreszcie za wszystko zap�acisz. W sumie wychodzi...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Zawiod�em si� na tobie. Twoja grzywna wyniesie...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Sytuacja powa�nie si� zmieni�a.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Nie jeste� ju� oskar�ony o morderstwo.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Nikt nie przypomina sobie ciebie na miejscu kradzie�y.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//�aden �wiadek nie mo�e potwierdzi�, �e bra�e� udzia� w bijatyce.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Wygl�da na to, �e wszystkie zarzuty wobec ciebie zosta�y wycofane.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Nie wiem, co si� dzieje, ale ostrzegam: nie posuwaj si� za daleko!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Postanowi�em umorzy� tw�j d�ug.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//Tylko ju� nigdy nie sprawiaj k�opot�w na terenie zamku!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//�eby wszystko by�o jasne: I TAK zap�acisz ca�� grzywn�. Co do grosza!
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//Wi�c jak?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"Nie mam tyle pieni�dzy!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"Ile to mia�o by�?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"Chc� zap�aci� grzywn�!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Ile wynosi ta grzywna?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"Nie mam tyle pieni�dzy!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"Ile to mia�o by�?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"Chc� zap�aci� grzywn�!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Podobno stwarza�e� problemy moim podw�adnym.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//By�em ciekaw, ile czasu minie, zanim trafisz do mnie.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Morderstwo to ostatnia rzecz, kt�rej nam tutaj potrzeba.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Ka�dy z moich ludzi jest mi teraz potrzebny, a ty zabi�e� jednego z nich!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//Nie wspomn� ju� o twoich pozosta�ych wybrykach.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Wyja�nijmy co� sobie: wszyscy jedziemy na tym samym w�zku.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//Potrzebuj� ka�dego, kto jest w stanie nosi� or�, ��cznie z tob�.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Je�li ju� musisz kogo� zabi�, wyjd� za mury. Tam a� roi si� od ork�w!
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Wyznacz� ci grzywn�, cho� prawd� m�wi�c, brzydz� si� grzebaniem w takim g�wnie.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Plotka g�osi, �e po�yczy�e� sobie st�d kilka rzeczy.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Nie wspominaj�c ju� o innych twoich wybrykach.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Nie puszcz� tego p�azem. Chyba nie zdajesz sobie sprawy z powagi sytuacji.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Zap�acisz grzywn� za wszystkie swoje wyst�pki.
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Nie toleruj� bijatyk mi�dzy moimi lud�mi.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//A ta sprawa z owcami wcale nie poprawia twojej sytuacji.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Dlatego zap�acisz odpowiedni� grzywn�.
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Dlaczego zabijasz nasze owce, pozbawiaj�c nas �ywno�ci?
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Zap�acisz mi za to mi�so.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Ile?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"Nie mam tyle pieni�dzy!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"Chc� zap�aci� grzywn�!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Chc� zap�aci� grzywn�.
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Dobrze. Uprzedz� ch�opc�w, �eby dali ci spok�j. Tylko ju� nigdy nie pr�buj tutaj takich sztuczek!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//Nie mam tyle z�ota!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Wi�c postaraj si� czym pr�dzej je zdoby�.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//Ale ostrzegam: kolejna awantura znacznie podniesie cen�!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Sk�d si� tu wzi��e�? Nie jeste� g�rnikiem ani jednym z moich ludzi. No, s�ucham?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Przeszed�em przez prze��cz.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Prze��cz?! I uda�o ci si� przez ni� przedosta�? Na Innosa!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Co ci� tutaj sprowadza, magu?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Jakie s� twoje rozkazy, �o�nierzu?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Ciekawym, czemu najemnik chcia�by tak ryzykowa�... Czego tu szukasz?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "Przysy�a mnie Lord Hagen.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Przybywam na polecenie Lorda Hagena. Mam mu dostarczy� dow�d na istnienie smok�w.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//Zamierzasz wi�c znale�� taki dow�d, a potem wr�ci� do bezpiecznego miasta, co?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Co� w tym stylu.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//A wi�c chce dowodu? Dostanie go. Ale nie ode�l� ci� do Lorda Hagena bez dok�adnych informacji o rudzie.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//S�uchaj, Lord Hagen musi si� dowiedzie�, jak wygl�da sytuacja i ile rudy wydobyli�my do tej pory.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//W porz�dku. Co mam dla ciebie zrobi�?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//Wys�a�em trzy ekipy g�rnik�w, ale �adna z nich nie przys�a�a mi jeszcze ani bry�ki.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Udasz si� do ka�dej z nich i wybadasz, jak przebiega wydobycie.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Potem napisz� list, kt�ry zaniesiesz Lordowi Hagenowi.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//C�, chyba nie mam wyboru...
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Kapitan Garond chce, abym odnalaz� trzy ekipy g�rnicze i dowiedzia� si�, ile rudy uda�o im si� wydoby�.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Kapitan Garond wys�a� trzy ekipy g�rnik�w na poszukiwania magicznej rudy. �adna z nich nie wr�ci�a.");
	b_logentry(TOPIC_SCOUTMINE,"Moim zadaniem jest odnalezienie wszystkich trzech ekip i sprawdzenie, ile rudy uda�o im si� wydoby�.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "Ale dlaczego w�a�nie ja?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Ale dlaczego w�a�nie ja?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Bo potrafisz prze�lizgn�� si� przez linie wroga. Moi ludzie nie mieliby �adnych szans na twoim miejscu.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//A ty ju� raz pokona�e� t� drog�. To zadanie w sam raz dla ciebie.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "Potrzebuj� lepszego wyposa�enia.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Potrzebuj� lepszego wyposa�enia.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Porozmawiaj z magiem Miltenem. On b�dzie wiedzia�, czego ci potrzeba.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Zg�o� si� w tej sprawie do Tandora. On da ci wszystko, czego potrzebujesz.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Tandor handluje na zamku broni�.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "Co dostan� za wykonanie tego zadania?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Co dostan� za wykonanie tego zadania?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//Nie zwyk�em targowa� si� z najemnikami!
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Ale chyba nie mam wyboru. Zr�b, o co prosz�, a dostaniesz ode mnie 500 sztuk z�ota.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Gdzie mam szuka� twoich g�rnik�w?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Gdzie mam szuka� twoich g�rnik�w?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//We� t� map�. Zaznaczy�em na niej dwa rejony, w kt�rych prowadzimy wydobycie.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Gdyby� mia� jeszcze jakie� pytania, porozmawiaj z Parcivalem. On powie ci wszystko na temat g�rnik�w.
	b_logentry(TOPIC_SCOUTMINE,"Paladyn Parcival mo�e udzieli� mi informacji o g�rnikach.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Niech to diabli! Co si� tu dzieje? Czy�by sam Beliar przyby�, by si� z nami zmierzy�?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Wi�kszo�� moich ludzi zgin�a. Dzi�ki tej garstce rudy nie powstrzymamy nawet jednego orka, a co dopiero ca�� armi�!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Ta wyprawa jest z g�ry skazana na niepowodzenie!
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "Rozmawia�em z Fajethem.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Rozmawia�em z Fajethem.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Co u niego s�ycha�?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Jego ludzie wydobyli dwie skrzynie rudy.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmmm... dwie skrzynie?! Ja potrzebuj� DWUSTU skrzy�!
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Mam ci te� przekaza�, �e potrzebuje dodatkowych ludzi.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Co? Mam wys�a� kolejnych ludzi na pewn� �mier�? Nie ma mowy!
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "Je�li chodzi o grup� Silvestra...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (SILVESTRO_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Je�li chodzi o grup� Silvestra...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Widzia�e� go? Rozmawia�e� z nim?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Wszyscy zgin�li. Zaskoczy�o ich stado pe�zaczy.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//A co z rud�? Wiesz, ile zdo�ali wydoby�?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Zd��yli zabezpieczy� kilka skrzy�. Ukryli je w jaskini, przy �cie�ce prowadz�cej z zamku do miejsca wydobycia.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Do diaska... To byli dobrzy ludzie. Niech Innos ulituje si� nad ich duszami.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "Rozmawia�em z Marcosem.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Rozmawia�em z Marcosem.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//I jakie wie�ci? Ile rudy zdo�ali wydoby�?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Cztery skrzynie. Marcos opu�ci� ju� miejsce wydobycia, by przenie�� rud� w bezpieczne miejsce.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Teraz strze�e jej w ma�ej dolinie za liniami ork�w. Prosi o posi�ki.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Tylko cztery skrzynie? I opu�ci� ju� kopalni�? Niedobrze. Bardzo niedobrze.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//Mam mu wys�a� dodatkowych ludzi? Trudno... dw�ch b�dzie musia�o mu wystarczy�.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "Co z listem do Lorda Hagena?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//Co z listem do Lorda Hagena?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//Mamy w sumie dziesi�� marnych skrzy� rudy, a stracili�my dwa razy tyle dobrych ludzi.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Dostaniesz sw�j list. Lord Hagen MUSI si� o tym dowiedzie�. Ta dolina jest przekl�ta. To siedlisko z�a.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Kapitan Garond wr�czy� mi list. Musz� zanie�� go Lordowi Hagenowi - mam nadziej�, �e taki dow�d mu wystarczy.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "Co z moj� zap�at�?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//Co z moj� zap�at�?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Ach, tak, prawda. Jestem ci winien troch� z�ota. Oto twoja nagroda.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Jak si� maj� sprawy?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Czekam jeszcze na raport o ostatniej grupie. Mam nadziej�, �e b�d� to wreszcie dobre wiadomo�ci.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Czekam na raport o pozosta�ych dw�ch grupach. Wtedy zobaczymy.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Powiniene� czym pr�dzej ruszy� w drog�. Musz� wiedzie�, ile rudy wydobyto do tej pory.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "Chc�, �eby� wypu�ci� na wolno�� Gorna.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Chc�, �eby� wypu�ci� na wolno�� Gorna.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//To niemo�liwe. Pope�ni� wiele przest�pstw i musi za nie odpokutowa�.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Nie mog� go wykupi�?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//C�, istnieje taka mo�liwo��, ale jego wolno�� b�dzie ci� drogo kosztowa�. 1000 sztuk z�ota, to moja cena.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//To du�o pieni�dzy.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//A Gorn du�o narozrabia�. Przynie� mi pieni�dze, a ja puszcz� go wolno.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Za uwolnienie Gorna Garond domaga si� tysi�ca sztuk z�ota.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "Chc� wykupi� Gorna (zap�a� 1000 sztuk z�ota).";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Chc� wykupi� Gorna.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Dobrze. Id� do Gerolda i powiedz mu, �e z mojego rozkazu ma wypu�ci� wi�nia.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Zap�aci�em Garondowi. Teraz mog� p�j�� po Gorna do wi�zienia. Stra�nik Gerold go wypu�ci.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//Zatem przynie� mi 1000 sztuk z�ota.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "Co zamierzasz teraz zrobi�?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Co zamierzasz teraz zrobi�?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Pr�bowa�em wszystkiego. Teraz ca�a nadzieja w tobie, i w posi�kach od Lorda Hagena.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//B�dziemy dalej trwali na posterunku, zanosz�c mod�y do Innosa, by nie opu�ci� nas w tej godzinie pr�by.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Niech ci� szlag! Czego tu jeszcze szukasz? Potrzebuj� tych cholernych posi�k�w!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Nawet Milten wyni�s� si� z zamku. A ja potrzebuj� wi�cej ludzi! WI�CEJ!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "Wr�ci�em.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Wr�ci�em.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//Przecie� widz�. Gdzie s� posi�ki?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen przyb�dzie, gdy tylko b�dzie m�g�. Wiele si� wydarzy�o.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//Nie obchodzi mnie to! Potrzebuj� �o�nierzy! Ork�w jest co raz wi�cej. D�ugo tu nie wytrzymamy.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Moi ludzie s� wyczerpani. Ko�cz� si� nam zapasy.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Przyby�o paru ochotnik�w.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Masz na my�li siebie i swoich kumpli - �owc�w smok�w, tak? Mo�ecie nam pom�c, ale to i tak nie wystarczy.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Masz na my�li tych �owc�w smok�w na zewn�trz? Mog� nam pom�c, ale i tak to nie wystarczy!
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Je�li Hagen nie przy�le mi wkr�tce ludzi, w�tpi�, by�my wype�nili zadanie.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "Co do tych smok�w...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"Garond powinien by� zainteresowany problemem smok�w, tymczasem sprawia wra�enie, jakby ta sprawa w og�le go nie obchodzi�a.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//Mam wiadomo�ci dotycz�ce smok�w.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//M�w.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Zabi�em smoka z bagien na wsch�d st�d.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Smok z fortecy na po�udniu ju� nie �yje.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Ognisty smok z wulkanu na po�udniu ju� nikogo nie zaatakuje.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Uda�em si� na zach�d i rozprawi�em si� z lodowym smokiem.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//To dobra wiadomo��. Masz tu troch� pieni�dzy na lepszy ekwipunek.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Mo�esz mi powiedzie� co� wi�cej na temat tych smok�w?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Mam teraz inne zmartwienie. M�j doradca, Orik, powie ci o wszystkim.
		b_logentry(TOPIC_DRACHENJAGD,"Doradca Garonda, Orik, mo�e mie� dla mnie po�yteczne informacje.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Czy w mi�dzyczasie zaatakowa�y was smoki?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Na szcz�cie nie. Na razie mamy spok�j.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie �yj�.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Wszystkie smoki nie �yj�.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//Wszystkie? A wi�c Z�o zosta�o ostatecznie pokonane?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Niestety, nie. Pozosta� jeszcze ich przyw�dca.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Ale czy to nie smoki dowodzi�y orkami?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Tak, to prawda, ale one te� maj� swojego w�adc�. Jego r�wnie� musimy zg�adzi�.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Ale ja nie mog� si� st�d ruszy�! Musz� pilnowa� rudy, a dooko�a kr�c� si� jeszcze ci przekl�ci orkowie.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//B�dziesz musia� sam si� tym zaj��. Nie mog� ci pom�c.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Niech Innos ma ci� w swojej opiece.
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "Jest pewien problem z kowalem.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//Jest pewien problem z kowalem.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Jakim kowalem? Kowal zbieg�! Uciek� do lasu.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//Czy�by wr�ci�? W takim razie powiedz mu...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Nie, nie! TEN kowal ma na imi� Jan.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//To �owca smok�w, jak ja, a przy tym dobry kowal.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Jeden z �owc�w smok�w jest kowalem.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//To dobra wiadomo��. Poprzedni kowal da� nog�. Tch�rz!
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan ch�tnie zajmie si� prac� w ku�ni.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Rozumiem. My�lisz, �e mo�na mu zaufa�?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Tak.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//R�czysz za niego?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Je�li zacznie sprawia� k�opoty, to ty poniesiesz konsekwencje, jasne?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"Musz� si� zastanowi�.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"R�cz� za niego.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Jeszcze si� nad tym zastanowi�.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Jak mam mu zaufa�, skoro nawet ty nie mo�esz?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Dop�ki kto� nie we�mie za niego odpowiedzialno�ci, ma si� trzyma� z dala od ku�ni!
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//R�cz� za niego.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Dobrze. Mo�e od razu zacz�� prac� w ku�ni. Licz�, �e zaopatrzy moich ludzi w solidny or�.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "Jak wygl�da sytuacja?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Co nowego?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Przekl�te miejsce! Jaki� sukinsyn otworzy� g��wn� bram�! Teraz mo�emy ju� tylko czeka� na egzekucj�.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Jak si� dowiem, kto nas zdradzi�...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Je�li Hagen szybko nie przyb�dzie z odsiecz�, wybij� nas tu do nogi.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

