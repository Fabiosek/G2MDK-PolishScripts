
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
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Nie mamy o czym rozmawiaæ, póki nie uiœcisz grzywny.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//A wzros³a ona jeszcze w œwietle ostatnich wydarzeñ.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Wpakowa³eœ siê w kolejne k³opoty.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Mam nadziejê, ¿e wreszcie za wszystko zap³acisz. W sumie wychodzi...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Zawiod³em siê na tobie. Twoja grzywna wyniesie...
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
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Sytuacja powa¿nie siê zmieni³a.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Nie jesteœ ju¿ oskar¿ony o morderstwo.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Nikt nie przypomina sobie ciebie na miejscu kradzie¿y.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//¯aden œwiadek nie mo¿e potwierdziæ, ¿e bra³eœ udzia³ w bijatyce.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Wygl¹da na to, ¿e wszystkie zarzuty wobec ciebie zosta³y wycofane.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Nie wiem, co siê dzieje, ale ostrzegam: nie posuwaj siê za daleko!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Postanowi³em umorzyæ twój d³ug.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//Tylko ju¿ nigdy nie sprawiaj k³opotów na terenie zamku!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//¯eby wszystko by³o jasne: I TAK zap³acisz ca³¹ grzywnê. Co do grosza!
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//Wiêc jak?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"Nie mam tyle pieniêdzy!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"Ile to mia³o byæ?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"Chcê zap³aciæ grzywnê!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Ile wynosi ta grzywna?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"Nie mam tyle pieniêdzy!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"Ile to mia³o byæ?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"Chcê zap³aciæ grzywnê!",dia_garond_petzmaster_paynow);
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
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Podobno stwarza³eœ problemy moim podw³adnym.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//By³em ciekaw, ile czasu minie, zanim trafisz do mnie.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Morderstwo to ostatnia rzecz, której nam tutaj potrzeba.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Ka¿dy z moich ludzi jest mi teraz potrzebny, a ty zabi³eœ jednego z nich!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//Nie wspomnê ju¿ o twoich pozosta³ych wybrykach.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Wyjaœnijmy coœ sobie: wszyscy jedziemy na tym samym wózku.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//Potrzebujê ka¿dego, kto jest w stanie nosiæ orê¿, ³¹cznie z tob¹.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Jeœli ju¿ musisz kogoœ zabiæ, wyjdŸ za mury. Tam a¿ roi siê od orków!
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Wyznaczê ci grzywnê, choæ prawdê mówi¹c, brzydzê siê grzebaniem w takim gównie.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Plotka g³osi, ¿e po¿yczy³eœ sobie st¹d kilka rzeczy.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Nie wspominaj¹c ju¿ o innych twoich wybrykach.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Nie puszczê tego p³azem. Chyba nie zdajesz sobie sprawy z powagi sytuacji.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Zap³acisz grzywnê za wszystkie swoje wystêpki.
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Nie tolerujê bijatyk miêdzy moimi ludŸmi.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//A ta sprawa z owcami wcale nie poprawia twojej sytuacji.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Dlatego zap³acisz odpowiedni¹ grzywnê.
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Dlaczego zabijasz nasze owce, pozbawiaj¹c nas ¿ywnoœci?
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Zap³acisz mi za to miêso.
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
	Info_AddChoice(dia_garond_petzmaster,"Nie mam tyle pieniêdzy!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"Chcê zap³aciæ grzywnê!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Chcê zap³aciæ grzywnê.
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Dobrze. Uprzedzê ch³opców, ¿eby dali ci spokój. Tylko ju¿ nigdy nie próbuj tutaj takich sztuczek!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//Nie mam tyle z³ota!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Wiêc postaraj siê czym prêdzej je zdobyæ.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//Ale ostrzegam: kolejna awantura znacznie podniesie cenê!
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
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Sk¹d siê tu wzi¹³eœ? Nie jesteœ górnikiem ani jednym z moich ludzi. No, s³ucham?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Przeszed³em przez prze³êcz.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Prze³êcz?! I uda³o ci siê przez ni¹ przedostaæ? Na Innosa!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Co ciê tutaj sprowadza, magu?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Jakie s¹ twoje rozkazy, ¿o³nierzu?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Ciekawym, czemu najemnik chcia³by tak ryzykowaæ... Czego tu szukasz?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "Przysy³a mnie Lord Hagen.";
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
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Przybywam na polecenie Lorda Hagena. Mam mu dostarczyæ dowód na istnienie smoków.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//Zamierzasz wiêc znaleŸæ taki dowód, a potem wróciæ do bezpiecznego miasta, co?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Coœ w tym stylu.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//A wiêc chce dowodu? Dostanie go. Ale nie odeœlê ciê do Lorda Hagena bez dok³adnych informacji o rudzie.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//S³uchaj, Lord Hagen musi siê dowiedzieæ, jak wygl¹da sytuacja i ile rudy wydobyliœmy do tej pory.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//W porz¹dku. Co mam dla ciebie zrobiæ?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//Wys³a³em trzy ekipy górników, ale ¿adna z nich nie przys³a³a mi jeszcze ani bry³ki.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Udasz siê do ka¿dej z nich i wybadasz, jak przebiega wydobycie.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Potem napiszê list, który zaniesiesz Lordowi Hagenowi.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Có¿, chyba nie mam wyboru...
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Kapitan Garond chce, abym odnalaz³ trzy ekipy górnicze i dowiedzia³ siê, ile rudy uda³o im siê wydobyæ.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Kapitan Garond wys³a³ trzy ekipy górników na poszukiwania magicznej rudy. ¿adna z nich nie wróci³a.");
	b_logentry(TOPIC_SCOUTMINE,"Moim zadaniem jest odnalezienie wszystkich trzech ekip i sprawdzenie, ile rudy uda³o im siê wydobyæ.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "Ale dlaczego w³aœnie ja?";
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
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Ale dlaczego w³aœnie ja?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Bo potrafisz przeœlizgn¹æ siê przez linie wroga. Moi ludzie nie mieliby ¿adnych szans na twoim miejscu.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//A ty ju¿ raz pokona³eœ tê drogê. To zadanie w sam raz dla ciebie.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "Potrzebujê lepszego wyposa¿enia.";
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
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Potrzebujê lepszego wyposa¿enia.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Porozmawiaj z magiem Miltenem. On bêdzie wiedzia³, czego ci potrzeba.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Zg³oœ siê w tej sprawie do Tandora. On da ci wszystko, czego potrzebujesz.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Tandor handluje na zamku broni¹.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "Co dostanê za wykonanie tego zadania?";
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
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Co dostanê za wykonanie tego zadania?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//Nie zwyk³em targowaæ siê z najemnikami!
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Ale chyba nie mam wyboru. Zrób, o co proszê, a dostaniesz ode mnie 500 sztuk z³ota.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Gdzie mam szukaæ twoich górników?";
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
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Gdzie mam szukaæ twoich górników?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//WeŸ tê mapê. Zaznaczy³em na niej dwa rejony, w których prowadzimy wydobycie.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Gdybyœ mia³ jeszcze jakieœ pytania, porozmawiaj z Parcivalem. On powie ci wszystko na temat górników.
	b_logentry(TOPIC_SCOUTMINE,"Paladyn Parcival mo¿e udzieliæ mi informacji o górnikach.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Niech to diabli! Co siê tu dzieje? Czy¿by sam Beliar przyby³, by siê z nami zmierzyæ?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Wiêkszoœæ moich ludzi zginê³a. Dziêki tej garstce rudy nie powstrzymamy nawet jednego orka, a co dopiero ca³¹ armiê!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Ta wyprawa jest z góry skazana na niepowodzenie!
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "Rozmawia³em z Fajethem.";
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
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Rozmawia³em z Fajethem.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Co u niego s³ychaæ?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Jego ludzie wydobyli dwie skrzynie rudy.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmmm... dwie skrzynie?! Ja potrzebujê DWUSTU skrzyñ!
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Mam ci te¿ przekazaæ, ¿e potrzebuje dodatkowych ludzi.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Co? Mam wys³aæ kolejnych ludzi na pewn¹ œmieræ? Nie ma mowy!
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
	description = "Jeœli chodzi o grupê Silvestra...";
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
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Jeœli chodzi o grupê Silvestra...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Widzia³eœ go? Rozmawia³eœ z nim?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Wszyscy zginêli. Zaskoczy³o ich stado pe³zaczy.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//A co z rud¹? Wiesz, ile zdo³ali wydobyæ?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Zd¹¿yli zabezpieczyæ kilka skrzyñ. Ukryli je w jaskini, przy œcie¿ce prowadz¹cej z zamku do miejsca wydobycia.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Do diaska... To byli dobrzy ludzie. Niech Innos ulituje siê nad ich duszami.
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
	description = "Rozmawia³em z Marcosem.";
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
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Rozmawia³em z Marcosem.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//I jakie wieœci? Ile rudy zdo³ali wydobyæ?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Cztery skrzynie. Marcos opuœci³ ju¿ miejsce wydobycia, by przenieœæ rudê w bezpieczne miejsce.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Teraz strze¿e jej w ma³ej dolinie za liniami orków. Prosi o posi³ki.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Tylko cztery skrzynie? I opuœci³ ju¿ kopalniê? Niedobrze. Bardzo niedobrze.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//Mam mu wys³aæ dodatkowych ludzi? Trudno... dwóch bêdzie musia³o mu wystarczyæ.
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
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//Mamy w sumie dziesiêæ marnych skrzyñ rudy, a straciliœmy dwa razy tyle dobrych ludzi.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Dostaniesz swój list. Lord Hagen MUSI siê o tym dowiedzieæ. Ta dolina jest przeklêta. To siedlisko z³a.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Kapitan Garond wrêczy³ mi list. Muszê zanieœæ go Lordowi Hagenowi - mam nadziejê, ¿e taki dowód mu wystarczy.");
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
	description = "Co z moj¹ zap³at¹?";
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
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//Co z moj¹ zap³at¹?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Ach, tak, prawda. Jestem ci winien trochê z³ota. Oto twoja nagroda.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "Jak wygl¹da sytuacja?";
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
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Jak siê maj¹ sprawy?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Czekam jeszcze na raport o ostatniej grupie. Mam nadziejê, ¿e bêd¹ to wreszcie dobre wiadomoœci.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Czekam na raport o pozosta³ych dwóch grupach. Wtedy zobaczymy.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Powinieneœ czym prêdzej ruszyæ w drogê. Muszê wiedzieæ, ile rudy wydobyto do tej pory.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "Chcê, ¿ebyœ wypuœci³ na wolnoœæ Gorna.";
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
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Chcê, ¿ebyœ wypuœci³ na wolnoœæ Gorna.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//To niemo¿liwe. Pope³ni³ wiele przestêpstw i musi za nie odpokutowaæ.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Nie mogê go wykupiæ?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//Có¿, istnieje taka mo¿liwoœæ, ale jego wolnoœæ bêdzie ciê drogo kosztowaæ. 1000 sztuk z³ota, to moja cena.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//To du¿o pieniêdzy.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//A Gorn du¿o narozrabia³. Przynieœ mi pieni¹dze, a ja puszczê go wolno.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Za uwolnienie Gorna Garond domaga siê tysi¹ca sztuk z³ota.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "Chcê wykupiæ Gorna (zap³aæ 1000 sztuk z³ota).";
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
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Chcê wykupiæ Gorna.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Dobrze. IdŸ do Gerolda i powiedz mu, ¿e z mojego rozkazu ma wypuœciæ wiêŸnia.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Zap³aci³em Garondowi. Teraz mogê pójœæ po Gorna do wiêzienia. Stra¿nik Gerold go wypuœci.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//Zatem przynieœ mi 1000 sztuk z³ota.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "Co zamierzasz teraz zrobiæ?";
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
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Co zamierzasz teraz zrobiæ?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Próbowa³em wszystkiego. Teraz ca³a nadzieja w tobie, i w posi³kach od Lorda Hagena.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Bêdziemy dalej trwali na posterunku, zanosz¹c mod³y do Innosa, by nie opuœci³ nas w tej godzinie próby.
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
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Niech ciê szlag! Czego tu jeszcze szukasz? Potrzebujê tych cholernych posi³ków!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Nawet Milten wyniós³ siê z zamku. A ja potrzebujê wiêcej ludzi! WIÊCEJ!
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
	description = "Wróci³em.";
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
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Wróci³em.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//Przecie¿ widzê. Gdzie s¹ posi³ki?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen przybêdzie, gdy tylko bêdzie móg³. Wiele siê wydarzy³o.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//Nie obchodzi mnie to! Potrzebujê ¿o³nierzy! Orków jest co raz wiêcej. D³ugo tu nie wytrzymamy.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Moi ludzie s¹ wyczerpani. Koñcz¹ siê nam zapasy.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Przyby³o paru ochotników.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Masz na myœli siebie i swoich kumpli - ³owców smoków, tak? Mo¿ecie nam pomóc, ale to i tak nie wystarczy.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Masz na myœli tych ³owców smoków na zewn¹trz? Mog¹ nam pomóc, ale i tak to nie wystarczy!
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Jeœli Hagen nie przyœle mi wkrótce ludzi, w¹tpiê, byœmy wype³nili zadanie.
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
	description = "Co do tych smoków...";
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
	b_logentry(TOPIC_DRACHENJAGD,"Garond powinien byæ zainteresowany problemem smoków, tymczasem sprawia wra¿enie, jakby ta sprawa w ogóle go nie obchodzi³a.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//Mam wiadomoœci dotycz¹ce smoków.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Mów.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Zabi³em smoka z bagien na wschód st¹d.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Smok z fortecy na po³udniu ju¿ nie ¿yje.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Ognisty smok z wulkanu na po³udniu ju¿ nikogo nie zaatakuje.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Uda³em siê na zachód i rozprawi³em siê z lodowym smokiem.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//To dobra wiadomoœæ. Masz tu trochê pieniêdzy na lepszy ekwipunek.
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
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Mo¿esz mi powiedzieæ coœ wiêcej na temat tych smoków?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Mam teraz inne zmartwienie. Mój doradca, Orik, powie ci o wszystkim.
		b_logentry(TOPIC_DRACHENJAGD,"Doradca Garonda, Orik, mo¿e mieæ dla mnie po¿yteczne informacje.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Czy w miêdzyczasie zaatakowa³y was smoki?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Na szczêœcie nie. Na razie mamy spokój.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie ¿yj¹.";
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
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Wszystkie smoki nie ¿yj¹.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//Wszystkie? A wiêc Z³o zosta³o ostatecznie pokonane?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Niestety, nie. Pozosta³ jeszcze ich przywódca.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Ale czy to nie smoki dowodzi³y orkami?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Tak, to prawda, ale one te¿ maj¹ swojego w³adcê. Jego równie¿ musimy zg³adziæ.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Ale ja nie mogê siê st¹d ruszyæ! Muszê pilnowaæ rudy, a dooko³a krêc¹ siê jeszcze ci przeklêci orkowie.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Bêdziesz musia³ sam siê tym zaj¹æ. Nie mogê ci pomóc.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Niech Innos ma ciê w swojej opiece.
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
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Jakim kowalem? Kowal zbieg³! Uciek³ do lasu.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//Czy¿by wróci³? W takim razie powiedz mu...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Nie, nie! TEN kowal ma na imiê Jan.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//To ³owca smoków, jak ja, a przy tym dobry kowal.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Jeden z ³owców smoków jest kowalem.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//To dobra wiadomoœæ. Poprzedni kowal da³ nogê. Tchórz!
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan chêtnie zajmie siê prac¹ w kuŸni.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Rozumiem. Myœlisz, ¿e mo¿na mu zaufaæ?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Tak.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Rêczysz za niego?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Jeœli zacznie sprawiaæ k³opoty, to ty poniesiesz konsekwencje, jasne?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"Muszê siê zastanowiæ.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"Rêczê za niego.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Jeszcze siê nad tym zastanowiê.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Jak mam mu zaufaæ, skoro nawet ty nie mo¿esz?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Dopóki ktoœ nie weŸmie za niego odpowiedzialnoœci, ma siê trzymaæ z dala od kuŸni!
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Rêczê za niego.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Dobrze. Mo¿e od razu zacz¹æ pracê w kuŸni. Liczê, ¿e zaopatrzy moich ludzi w solidny orê¿.
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
	description = "Jak wygl¹da sytuacja?";
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
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Przeklête miejsce! Jakiœ sukinsyn otworzy³ g³ówn¹ bramê! Teraz mo¿emy ju¿ tylko czekaæ na egzekucjê.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Jak siê dowiem, kto nas zdradzi³...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Jeœli Hagen szybko nie przybêdzie z odsiecz¹, wybij¹ nas tu do nogi.
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

