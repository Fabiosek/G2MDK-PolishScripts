
instance DIA_SCHWARZMAGIER_HELLO(C_INFO)
{
	npc = dmt_1299_oberdementor_di;
	nr = 5;
	condition = dia_schwarzmagier_hello_condition;
	information = dia_schwarzmagier_hello_info;
	important = TRUE;
};


func int dia_schwarzmagier_hello_condition()
{
	return TRUE;
};


var int sc_knowsmadpsi;

func void dia_schwarzmagier_hello_info()
{
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//No, o�lizg�y robaku, odwa�y�e� si� w ko�cu zjawi� u wr�t siedziby mego Mistrza.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//To ty tu poci�gasz za sznurki?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Jestem Stra�nikiem Dworu Irdorath. Najwi�kszego na �wiecie �r�d�a pot�gi Beliara. M�j Mistrz i Pan nape�nia mnie bosk� moc�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Jedno moje s�owo wystarczy, by na zawsze skaza� ci� na wieczne szale�stwo.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");	//Rozumiem, znowu jaki� pacho�ek z przerostem ambicji.
	b_logentry(TOPIC_HALLENVONIRDORATH,"Jestem przy ostatniej bramie. Kluczem wydaje si� by� czarny mag.");
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,"Prowad� mnie do swego pana.",dia_schwarzmagier_hello_meister);
	Info_AddChoice(dia_schwarzmagier_hello,"Ilu jeszcze tobie podobnych b�d� musia� zabi�?",dia_schwarzmagier_hello_dmt);
	Info_AddChoice(dia_schwarzmagier_hello,"Co kryje w sobie ten portal?",dia_schwarzmagier_hello_hintertor);
	Info_AddChoice(dia_schwarzmagier_hello,"Kto jest twoim Mistrzem?",dia_schwarzmagier_hello_wer);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_schwarzmagier_hello,"By�e� wyznawc� �ni�cego.",dia_schwarzmagier_hello_schlaefer);
	};
};

func void dia_schwarzmagier_hello_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Kto jest twoim Mistrzem?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//M�j pan podr�uje mi�dzy �wiatami, a jego boska m�dro�� nas o�wieca.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Jest wybra�cem Beliara, kt�ry uwolni kr�lestwo od cuchn�cych wyznawc�w Innosa.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//Tym, kt�rzy w�tpi� w jego pot�g�, przynosi cierpienie i �mier�.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");	//Sk�d ja to znam?
};

func void dia_schwarzmagier_hello_hintertor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//Co kryje w sobie ten portal?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//Komnaty mego pana pozostan� dla ciebie niedost�pne. Nigdy nie zezwol� ci na otwarcie bramy!
};

func void dia_schwarzmagier_hello_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//By�e� wyznawc� �ni�cego.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//To odleg�a przesz�o��. Pan otworzy� mi oczy. Nikt nas ju� nie powstrzyma.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");	//M�j Mistrz ukaza� mi jedyny spos�b post�powania z wami, niewiernymi.
	TOPIC_END_DEMENTOREN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_schwarzmagier_hello_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//Ilu jeszcze tobie podobnych b�d� musia� zabi�?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Jest nas wielu. Nie masz nawet poj�cia, jak wielu. Wszyscy czekamy na ostateczne wyzwolenie.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//Okrzyki i lament zalej� �wiat wsz�dzie tam, gdzie b�dziemy st�pa�.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Uwolnimy �wiat od barbarzy�c�w nazywaj�cych si� Stra�nikami Ognia. Nie zabawimy d�ugo w tej �wi�tyni.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");	//To prawda.
};

func void dia_schwarzmagier_hello_meister()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//Do�� tych bredni! Teraz nadejdzie tw�j koniec.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Twoje oczy zakryje ciemno��, a twa dusza zniknie w za�wiatach.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");	//Bez amuletu przyzwania dusz b�dzie mi troch� trudno.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		if(hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		};
		SC_OBSESSIONCOUNTER = 100;
		b_scisobsessed(hero);
	};
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,DIALOG_ENDE,dia_schwarzmagier_hello_back);
};

func void dia_schwarzmagier_hello_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

