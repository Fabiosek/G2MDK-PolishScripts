
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Dobrze, ¿e jesteœ. Mo¿esz od razu zap³aciæ grzywnê.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Widzê, ¿e lekcewa¿ysz prawa tego miasta, co?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Lista twoich wystêpków jeszcze siê powiêkszy³a!
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//Tylko mi tu nie udawaj niewini¹tka!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Zap³acisz maksymaln¹ grzywnê.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//Có¿, wygl¹da na to, ¿e sytuacja siê zmieni³a.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Nie ma ¿adnych œwiadków morderstwa!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Nikt nie chce zeznawaæ, ¿e widzia³ ciê podczas kradzie¿y!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Nie ma ¿adnych œwiadków twojej bijatyki.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Wszystkie oskar¿enia wobec ciebie zosta³y wycofane.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Nie wiem, co siê sta³o w mieœcie i NIE CHCÊ tego wiedzieæ.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Po prostu staraj siê na przysz³oœæ unikaæ k³opotów.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//W ka¿dym b¹dŸ razie - postanowi³em darowaæ ci karê.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Staraj siê trzymaæ z dala od podobnych awantur.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Mimo to zap³acisz nale¿ne grzywny.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Wiêc jak bêdzie, p³acisz?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"Nie mam tyle pieniêdzy!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"Ile to mia³o byæ?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"Chcê zap³aciæ grzywnê!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Ile wynosi grzywna?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"Nie mam tyle pieniêdzy!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"Ile to mia³o byæ?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"Chcê zap³aciæ grzywnê!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Twoja reputacja ciê wyprzedza. S³ysza³em, ¿e pogwa³ci³eœ prawa tego miasta.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Wpl¹ta³eœ siê w niez³¹ kaba³ê.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Morderstwo to powa¿ne przestêpstwo!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Nie wspominaj¹c nawet o twoich pozosta³ych przewinieniach.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Stra¿nicy otrzymali rozkaz natychmiastowego zabijania ka¿dego mordercy.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Mordercy nie bêd¹ tutaj tolerowani. Ale mo¿esz okazaæ skruchê, p³ac¹c odpowiedni¹ grzywnê.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Oskar¿ono ciê o kradzie¿!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Nie wspominaj¹c nawet o twoich pozosta³ych przewinieniach.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//To pogwa³cenie praw tego miasta. Musisz zap³aciæ grzywnê.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Wda³eœ siê w bijatykê, tym samym ³ami¹c prawo tego miasta.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//A co to za sprawa z owcami?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Pogwa³cenie miejskiego prawa to z³amanie prawa ustanowionego przez Innosa.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Dlatego musisz zap³aciæ za swoje przewinienia.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Zabija³eœ nasze owce! Pocz¹tkowo nie dawa³em temu wiary...
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Dlaczego muszê zajmowaæ siê takimi b³ahostkami?
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Musisz zap³aciæ grzywnê!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Ile mam zap³aciæ?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"Nie mam tyle pieniêdzy!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"Chcê zap³aciæ grzywnê!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Przychodzê, ¿eby zap³aciæ grzywnê.
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Œwietnie! Dopilnujê, ¿eby dowiedzieli siê o tym wszyscy mieszkañcy miasta. To poprawi trochê twoj¹ reputacjê.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//Nie mam tyle z³ota!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Zatem postaraj siê szybko je zdobyæ.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//Ale ostrzegam: jeœli pope³nisz jeszcze jakieœ wykroczenia, nie bêdzie dla ciebie litoœci!
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//S³ysza³em ju¿ o tobie.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar doniós³ mi, ¿e chcia³eœ ze mn¹ rozmawiaæ.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Jesteœ tym obcym, który domaga siê Oka Innosa.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Jestem Lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Królewski paladyn, wojownik w s³u¿bie Innosa i namiestnik Khorinis.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Jestem zajêtym cz³owiekiem, wiêc nie marnuj mojego czasu. Mów od razu, co ciê tu sprowadza.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "Przynoszê propozycjê rozejmu od jednego z najemników.";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Przynoszê propozycjê rozejmu od jednego z najemników.
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//Hmmm... Poka¿!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Znam genera³a Lee. Znam te¿ okolicznoœci, w wyniku których trafi³ jako wiêzieñ do Kolonii.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Uwa¿am go za cz³owieka honoru. Jestem sk³onny go u³askawiæ... Ale TYLKO jego.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//Jego ludzie zostan¹ na miejscu. Wiêkszoœæ z nich to pozbawione skrupu³ów ³otry, które trafi³y tu zas³u¿enie.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Oni nie mog¹ liczyæ na moj¹ ³askê.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Czy to wszystko?
	};
	b_logentry(TOPIC_FRIEDEN,"Lord Hagen mo¿e wybaczyæ Lee, ale nie pozosta³ym najemnikom.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "Armie ciemnoœci zbieraj¹ siê w pobli¿u miasta, w Górniczej Dolinie.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Armie ciemnoœci zbieraj¹ siê w pobli¿u miasta, w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//W Dolinie? Wys³a³em tam oddzia³ moich ludzi. Doniesiono mi, ¿e prze³êcz jest zajêta przez orków.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Ale pierwsze s³yszê o... armiach ciemnoœci.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Czy to jakaœ sztuczka, która ma mnie sk³oniæ do zawarcia przymierza z najemnikami?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Nie.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//A co to niby za armia?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Stado smoków, którym towarzyszy horda równie groŸnych istot.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Smoki? Stare pisma g³osz¹, ¿e ostatnie smoki widziano setki lat temu!
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Dlaczego mia³bym ci uwierzyæ, co?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Tu nie chodzi o to, czy mi wierzysz, tylko czy mo¿esz sobie pozwoliæ, ¿eby mi NIE wierzyæ.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Dopóki nie przedstawisz mi jakiegoœ dowodu, nie wyœlê tam ¿adnych nowych ludzi.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = TRUE;
	description = "A wiêc mam ci dostarczyæ dowodów?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (HAGEN_BRINGPROOF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//A wiêc mam ci dostarczyæ dowodów?
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Dok³adnie tak. ZejdŸ prze³êcz¹ do Górniczej Doliny. Na miejscu poszukaj naszej ekspedycji, a gdy j¹ znajdziesz - porozmawiaj z kapitanem Garondem.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Jeœli ktoœ mo¿e coœ powiedzieæ o tej sytuacji, to w³aœnie on.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//Jeœli Garond potwierdzi twoje s³owa, bêdê sk³onny ci zaufaæ.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Czy to znaczy, ¿e przeka¿esz mi Oko Innosa?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Oko Innosa... niech bêdzie. Przynieœ mi niezbity dowód, a dopilnujê, ¿ebyœ dosta³ ten amulet.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//Mam na to twoje s³owo?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Tak, masz moje s³owo.
		HAGEN_BRINGPROOF = TRUE;
	}
	else
	{
		if(hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED_NOV,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED,-1,-1,FONT_SCREEN,2);
		};
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "Co ci wiadomo na temat Oka Innosa?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Co ci wiadomo na temat Oka Innosa?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//To œwiêty artefakt... Stare przepowiednie ³¹cz¹ go ze smokami.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//Ale g³osz¹ równie¿, ¿e tylko Wybraniec Innosa mo¿e nosiæ ten amulet.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//JA jestem Wybrañcem Innosa.
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Wiêc mo¿e bêdziesz móg³ za³o¿yæ Oko.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "Jak mam siê dostaæ na prze³êcz?";
};


func int dia_lord_hagen_pass_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Jak mam siê dostaæ na prze³êcz?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Dam ci klucz do bramy prowadz¹cej na prze³êcz. Dalej musisz jednak radziæ sobie sam. Tej drogi pilnuj¹ stada orków.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Niech Innos bêdzie z tob¹.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Lord Hagen chce, abym dostarczy³ mu jakiœ dowód na istnienie armii Z³a. Powinienem siê udaæ do Górniczej Doliny i porozmawiaæ z Kapitanem Garondem.");
	if(FERNANDO_IMKNAST == FALSE)
	{
		b_startotherroutine(fernando,"WAIT");
	};
	Wld_InsertNpc(bdt_1020_bandit_l,"NW_TROLLAREA_PATH_47");
};


instance DIA_ADDON_LORD_HAGEN_ORNAMENT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 10;
	condition = dia_addon_lord_hagen_ornament_condition;
	information = dia_addon_lord_hagen_ornament_info;
	description = "Szukam metalowego ornamentu.";
};


func int dia_addon_lord_hagen_ornament_condition()
{
	if((MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING) && (LORD_HAGEN_GOTORNAMENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lord_hagen_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//Szukam metalowego ornamentu. Powinien byæ gdzieœ w kamiennym krêgu przy farmie Lobarta.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//Jeœli chodzi ci o to tutaj... Myœleliœmy, ¿e mo¿e to byæ magiczna runa, ale to ca³kowicie bezwartoœciowy przedmiot.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//WeŸ go sobie, do niczego nam siê nie przyda.
	CreateInvItems(self,itmi_ornament_addon,1);
	b_giveinvitems(self,other,itmi_ornament_addon,1);
	LORD_HAGEN_GOTORNAMENT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Co was sprowadza do Khorinis?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Co was sprowadza do Khorinis?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Wys³ano nas z misj¹ wagi pañstwowej. Otrzymaliœmy rozkaz od samego Króla Rhobara.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//Mówi³em ci ju¿, ¿e wys³aliœmy ekspedycjê do Górniczej Doliny. Po to tu w³aœnie przybyliœmy.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "Co twoi ludzie robi¹ w Górniczej Dolinie?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//Co twoi ludzie robi¹ w Górniczej Dolinie?
	if(HAGEN_BRINGPROOF == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Nie widzê powodu, dla którego mia³bym ci to mówiæ!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//By³eœ tam. Sam powinieneœ wiedzieæ.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//No dobrze. Skoro i tak siê tam udajesz, mogê ci chyba powiedzieæ.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Chodzi o magiczn¹ rudê. Dziêki niej mo¿emy jeszcze wygraæ tê wojnê.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Bez orê¿a wykonanego z tej rudy, królewska armia nie ma ¿adnych szans w starciu z elitarnymi oddzia³ami orków.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//A na tej wyspie znajduj¹ siê ostatnie kopalnie, do których mamy jeszcze dostêp.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Wracamy na kontynent, gdy tylko za³adujemy ca³¹ rudê na statek.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//A wiêc przegrywamy tê wojnê?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//I tak powiedzia³em ci zbyt wiele.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "Szukam jakiegoœ mistrza miecza.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Szukam jakiegoœ mistrza miecza.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//No to go znalaz³eœ.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Lord Hagen mo¿e mnie nauczyæ walki orê¿em dwurêcznym.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Zacznijmy (trening walki broniami dwurêcznymi).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Zaczynajmy.
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Jesteœ teraz prawdziwym mistrzem miecza. Wiêcej nie mogê ciê nauczyæ.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Niech m¹droœæ mistrza miecza zawsze kieruje twoimi czynami.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "Chcia³bym wst¹piæ do waszego zakonu.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Chcia³bym wst¹piæ do waszego zakonu.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Dobrze, ale najpierw musisz udowodniæ, ¿e posiadasz odwagê, umiejêtnoœci i wiedzê potrzebn¹ s³udze Innosa.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Twoje czyny œwiadcz¹, ¿e jesteœ cz³owiekiem honoru.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Jeœli takie jest twoje ¿yczenie, chêtnie powitam ciê w naszym zakonie.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"Nie podj¹³em jeszcze ostatecznej decyzji.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"Jestem gotów!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Aby zostaæ wojownikiem Innosa, musisz ca³kowicie poœwiêciæ siê wype³nianiu jego woli.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//W naszym zakonie s³u¿yæ mog¹ tylko najmê¿niejsi i najszlachetniejsi z wojowników.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Jeœli naprawdê chcesz zostaæ jednym z nas, musisz dowieœæ, ¿e jesteœ tego godzien.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Nie podj¹³em jeszcze ostatecznej decyzji.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Zatem rozwa¿ tê sprawê w swoim sercu i wróæ, gdy bêdziesz gotowy.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Jestem gotów!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//Niech tak siê stanie!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//Wielu z tych, którzy wst¹pili na tê œcie¿kê, odda³o ¿ycie w s³u¿bie Innosowi.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//Czy przysiêgasz czciæ swymi czynami pamiêæ po nich i g³osiæ wszem, i wobec chwa³ê Innosa?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Przysiêgam!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Zatem od tej pory jesteœ cz³onkiem naszego zakonu.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Niniejszym tytu³ujê ciê wojownikiem Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Dajê ci orê¿ i zbrojê godn¹ rycerza. Noœ je z dum¹!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//Zostaj¹c jednym z nas, otrzymujesz prawo wstêpu do klasztoru.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht wyuczy ciê naszej magii. IdŸ i porozmawiaj z nim.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//Nasze kwatery w górnym mieœcie s¹ oczywiœcie do twojej dyspozycji.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "Jak mam udowodniæ, ¿e jestem godny, by do was do³¹czyæ?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Jak mam udowodniæ, ¿e jestem godny, by do was do³¹czyæ?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//Tylko twoje czyny bêd¹ odpowiednim œwiadectwem.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//W imiê Innosa walczymy o wolnoœæ i sprawiedliwoœæ.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Stawiamy czo³a Beliarowi i jego s³ugom, którzy próbuj¹ zniszczyæ œwiêty ³ad Innosa.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Rozumiem.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Nic nie rozumiesz! Honor jest ca³ym naszym ¿yciem, a nasze ¿ycie nale¿y do Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Paladyn rusza do boju z imieniem swojego boga na ustach. Wielu z nas z³o¿y³o ¿ycie na o³tarzu odwiecznej walki Dobra ze Z³em.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//Ka¿dy paladyn musi pozostaæ wierny tej tradycji. Jeœli zb³¹dzimy, zbrukamy pamiêæ naszych poleg³ych towarzyszy.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Aby zostaæ paladynem, musisz w pe³ni zdaæ sobie z tego sprawê.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "Jak wygl¹da sytuacja?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jakieœ wieœci?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Muszê jakoœ uratowaæ tê ekspedycjê.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Musimy coœ zrobiæ w sprawie tych smoków.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//Mo¿e Oko Innosa zdo³a nas jeszcze ocaliæ...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Ja tu chyba oszalejê. Jestem ¿o³nierzem, a nie urzêdnikiem!
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//Przez te wszystkie dokumenty, pisma i zarz¹dzenia zapomnia³em ju¿ chyba, jak siê trzyma miecz w garœci!
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "Mam Oko przy sobie. Niestety, jest uszkodzone.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Mam Oko przy sobie. Niestety, jest uszkodzone.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//CO TAKIEGO?! Có¿eœ uczyni³?! Bez Oka jesteœmy zgubieni!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Porozmawiaj z Pyrokarem! Musi byæ jakiœ sposób, ¿eby je naprawiæ!
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "Przynoszê wieœci od Garonda.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Przynoszê ci wieœci od Garonda. Proszê, kaza³ mi wrêczyæ ten list.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Sytuacja jest groŸniejsza, ni¿ przypuszcza³em. Ale mów! Mów, co siê dzieje w Górniczej Dolinie!
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Paladyni zabarykadowali siê w tamtejszym zamku. Oblega ich horda orków.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Wielu ¿o³nierzy poleg³o. Zosta³o te¿ bardzo niewiele rudy.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//Obawiam siê, ¿e bez odpowiedniego wsparcia ci ludzie nie maj¹ szans.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Znajdê jakiœ sposób, ¿eby ich stamt¹d wyci¹gn¹æ. Innos bêdzie ci wdziêczny...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Bardziej ni¿ jego wdziêcznoœæ przyda mi siê Oko.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Tak, naturalnie. Dotrzymam s³owa. WeŸ ten list. On otworzy przed tob¹ bramy klasztoru.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Porozmawiaj z Pyrokarem - najwy¿szym z Magów Ognia. Poka¿ mu to pismo, a on zaprowadzi ciê do Oka.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//Jeszcze jedno, zanim pójdziesz.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//WeŸ tê runê jako wyraz mojej wdziêcznoœci. W chwilach potrzeby przeniesie ciê ona bezpiecznie do miasta.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Lord Hagen wrêczy³ mi przesy³kê, dziêki której Mistrz Pyrokar dopuœci mnie do Oka Innosa.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "Muszê z tob¹ porozmawiaæ o Bennecie.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Muszê z tob¹ porozmawiaæ o Bennecie.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Ale to ten najemnik, który zamordowa³ jednego z moich ludzi!
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"Sk¹d masz pewnoœæ, ¿e to Bennet jest morderc¹?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"S¹dzê, ¿e Bennet jest niewinny.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Mo¿e Bennet móg³by naprawiæ Oko Innosa.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Mo¿e Bennet móg³by naprawiæ Oko Innosa.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//Choæby nawet móg³ œci¹gn¹æ na ziemiê potêgê samego Innosa...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//...ten cz³owiek zamordowa³ paladyna i zostanie za to stracony.
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Sk¹d masz pewnoœæ, ¿e to Bennet jest morderc¹?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//Mamy naocznego œwiadka.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Jak widzisz, wina tego najemnika nie podlega dyskusji.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Co to za œwiadek?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, sekretarz gubernatora, widzia³ ca³e zajœcie.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Podany przez niego rysopis pasuje jak ula³ do Benneta. Z mojego punktu widzenia, sprawa jest zamkniêta.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Najemnik zostanie powieszony za zdradê stanu.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius, sekretarz gubernatora, twierdzi, ¿e by³ œwiadkiem morderstwa.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//S¹dzê, ¿e Bennet jest niewinny.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Dowody s¹ jednoznaczne. To on jest sprawc¹.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//A jeœli dowody zosta³y sfa³szowane?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Uwa¿aj, co mówisz! To bardzo powa¿ne oskar¿enie!
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Jeœli nie masz dowodów, które podwa¿aj¹ zeznania mojego œwiadka, lepiej trzymaj jêzyk za zêbami.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Cornelius k³amie.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius k³amie.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Sk¹d ta pewnoœæ?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Mam jego pamiêtnik. S¹ tu wszystkie dowody.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//A to pod³a gnida!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//W œwietle nowych dowodów mogê zrobiæ tylko jedno.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Na mocy powierzonej mi przez Jego Wysokoœæ i Œwi¹tyniê og³aszam...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//...¿e wiêzieñ Bennet zostaje oczyszczony ze wszystkich zarzutów i ma zostaæ zwolniony.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Za to Cornelius ma zostaæ pojmany, pod zarzutem krzywoprzysiêstwa.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Oszczêdzê ci k³opotu. Cornelius nie ¿yje.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//Zatem otrzyma³ ju¿ sprawiedliw¹ karê. Dobra robota.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Cornelius uciek³.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Znajdziemy go, prêdzej czy póŸniej. Nie wywinie siê.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Twoje czyny godne s¹ jednego z nas.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "Oko nale¿y do mnie!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Oko nale¿y do mnie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//Tak, Oko jest twoje!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//I to ty musisz je naprawiæ!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//Zatem musisz byæ Wybrañcem Innosa.
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Zamierzam po³o¿yæ kres zagro¿eniu ze strony smoków.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//IdŸ wiêc, i z pomoc¹ Innosa zniszcz Z³o w zarodku.
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "Najlepsi wojownicy orków ruszyli do ataku.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Najlepsi wojownicy orków ruszyli do ataku.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Rozmawia³em z Lordem Hagenem na temat zbli¿aj¹cych siê hord hersztów orków.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Dlaczego tak s¹dzisz?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Rozmawia³em z jednym z nich. W rozmowie pad³o twoje imiê.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Brednie. Moi ludzie nie donieœli mi o ¿adnym pospolitym ruszeniu orków.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Mo¿e jacyœ ich zwiadowcy zab³¹kali siê do pobliskich lasów.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//To nie byli zwiadowcy. Przy jednym z nich znalaz³em ten pierœcieñ.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Poka¿.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Hmmm... Niepokoj¹ce...
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//To znak ich si³y. A wiêc orkowie porzucili swoje palisady i stanêli do boju w otwartym polu.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Nie widzia³em ich jeszcze zbyt wielu. G³ównie ich przywódców i kilku wojowników.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Tak? Zatem planuj¹ coœ innego. To ma³o podobne do orków, by ich przywódcy wypuszczali siê w pojedynkê poza swoje osiedla.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Ale to œwietna okazja, by uderzyæ w ich czu³y punkt.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Gdy strac¹ swoich przywódców, morale ca³ej armii os³abnie.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//Mam dla ciebie nowe zadanie, rycerzu. Masz zabiæ wszystkich orkowych przywódców, którzy krêc¹ siê po okolicy.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Tylko przynieœ mi ich pierœcienie! Po takim ciosie szybko siê nie podnios¹.
		b_logentry(TOPIC_ORCELITE,"Na dowód moich s³ów przynios³em Hagenowi orkowy pierœcieñ. Kaza³ sobie dostarczyæ wszystkie pierœcienie, jakie tylko uda mi siê zdobyæ.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Udaj siê najpierw do Ingmara. Doradzi ci, jak skutecznie walczyæ z takim przeciwnikiem.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Elitarni wojownicy orków to jego specjalnoœæ. Czêsto mia³ z nimi do czynienia.
			b_logentry(TOPIC_ORCELITE,"Elitarni orkowi wojownicy s¹ specjalnoœci¹ Ingmara.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Twoje s³owo, ¿e pokona³eœ orkowego wodza, to dla mnie za ma³o!
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Jeœli mam ci uwierzyæ, potrzebujê bardziej wiarygodnych dowodów.
		b_logentry(TOPIC_ORCELITE,"Hagen nie chce mi uwierzyæ. Za¿¹da³ dowodów na to, ¿e orkowi wojownicy faktycznie atakuj¹ ludzkie siedziby. Có¿, by³bym zaskoczony, gdyby tego nie zrobi³.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "Mam jeszcze coœ do powiedzenia w sprawie orkowych przywódców.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Mam jeszcze coœ do powiedzenia w sprawie orkowych przywódców.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//S³ucham...
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Mam dla ciebie jeszcze jeden pierœcieñ.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Mam dla ciebie kolejne pierœcienie.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Dobra robota! Tak trzymaæ.
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//W okolicy mo¿e siê krêciæ jeszcze kilku.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Wkrótce rzucimy te bestie na kolana!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Zdziwi³bym siê, gdyby w okolicy krêci³o siê ich jeszcze wielu.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Jeœli chcesz, mo¿esz nadal przynosiæ mi pierœcienie, ale myœlê, ¿e orkowie dostali ju¿ odpowiedni¹ nauczkê.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Proszê. WeŸ to z³oto i kup za nie lepsze wyposa¿enie.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "Wszystkie smoki nie ¿yj¹.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Wszystkie smoki zosta³y zg³adzone.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Wiedzia³em, ¿e Innos doda ci si³ w walce ze smokami!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Gdzie jest ruda?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Orkowie wci¹¿ oblegaj¹ zamek w Górniczej Dolinie. Garond nie mo¿e opuœciæ twierdzy, póki nie odeprze ich ataku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//Niech to szlag!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Jeœli Garond nie potrafi uporaæ siê z t¹ sytuacj¹, sam siê tym zajmê!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//¯adna banda orków nie stanie mi na przeszkodzie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Powiadomi³em ju¿ moich ludzi. Przygotowujemy siê do wyruszenia w drogê.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Zabieram ich wszystkich. Na stra¿y statku pozostan¹ nieliczni wartownicy.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//Pora, by ktoœ wreszcie rozprawi³ siê z tymi orkami!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "Potrzebujê okrêtu.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Potrzebujê okrêtu.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//Nie ty jeden, ¿o³nierzu.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//S³yszê to prawie codziennie, przyjacielu. Ale...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//Nie masz nawet kapitana, nie wspominaj¹c ju¿ o za³odze...
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//A co z tym statkiem na przystani?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Ten okrêt nale¿y do mnie. To na nim przewieziemy rudê.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Mogê ci go u¿yczyæ, dopiero gdy wywi¹¿emy siê z zadania.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "Orkowie przypuœcili szturm na zamek w Górniczej Dolinie!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Orkowie przypuœcili szturm na zamek w Górniczej Dolinie!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//Na Innosa! Co tam siê sta³o?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Wygl¹da na to, ¿e brama by³a otwarta...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Wygl¹da... Jak to mo¿liwe... W zamku musi byæ zdrajca!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "Na co czekasz?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Na co czekasz?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Czekam tylko na wyposa¿enie i ¿ywnoœæ. Zaraz potem ruszamy!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Po szturmie na zamek potrzebujemy jeszcze wiêcej zapasów.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//Ale to tylko nieznacznie opóŸni nasz wymarsz.
	};
};

