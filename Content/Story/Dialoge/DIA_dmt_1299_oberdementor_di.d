
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
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//No, oœlizg³y robaku, odwa¿y³eœ siê w koñcu zjawiæ u wrót siedziby mego Mistrza.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//To ty tu poci¹gasz za sznurki?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Jestem Stra¿nikiem Dworu Irdorath. Najwiêkszego na œwiecie Ÿród³a potêgi Beliara. Mój Mistrz i Pan nape³nia mnie bosk¹ moc¹.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Jedno moje s³owo wystarczy, by na zawsze skazaæ ciê na wieczne szaleñstwo.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");	//Rozumiem, znowu jakiœ pacho³ek z przerostem ambicji.
	b_logentry(TOPIC_HALLENVONIRDORATH,"Jestem przy ostatniej bramie. Kluczem wydaje siê byæ czarny mag.");
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,"ProwadŸ mnie do swego pana.",dia_schwarzmagier_hello_meister);
	Info_AddChoice(dia_schwarzmagier_hello,"Ilu jeszcze tobie podobnych bêdê musia³ zabiæ?",dia_schwarzmagier_hello_dmt);
	Info_AddChoice(dia_schwarzmagier_hello,"Co kryje w sobie ten portal?",dia_schwarzmagier_hello_hintertor);
	Info_AddChoice(dia_schwarzmagier_hello,"Kto jest twoim Mistrzem?",dia_schwarzmagier_hello_wer);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_schwarzmagier_hello,"By³eœ wyznawc¹ œni¹cego.",dia_schwarzmagier_hello_schlaefer);
	};
};

func void dia_schwarzmagier_hello_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Kto jest twoim Mistrzem?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//Mój pan podró¿uje miêdzy œwiatami, a jego boska m¹droœæ nas oœwieca.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Jest wybrañcem Beliara, który uwolni królestwo od cuchn¹cych wyznawców Innosa.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//Tym, którzy w¹tpi¹ w jego potêgê, przynosi cierpienie i œmieræ.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");	//Sk¹d ja to znam?
};

func void dia_schwarzmagier_hello_hintertor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//Co kryje w sobie ten portal?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//Komnaty mego pana pozostan¹ dla ciebie niedostêpne. Nigdy nie zezwolê ci na otwarcie bramy!
};

func void dia_schwarzmagier_hello_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//By³eœ wyznawc¹ Œni¹cego.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//To odleg³a przesz³oœæ. Pan otworzy³ mi oczy. Nikt nas ju¿ nie powstrzyma.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");	//Mój Mistrz ukaza³ mi jedyny sposób postêpowania z wami, niewiernymi.
	TOPIC_END_DEMENTOREN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_schwarzmagier_hello_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//Ilu jeszcze tobie podobnych bêdê musia³ zabiæ?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Jest nas wielu. Nie masz nawet pojêcia, jak wielu. Wszyscy czekamy na ostateczne wyzwolenie.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//Okrzyki i lament zalej¹ œwiat wszêdzie tam, gdzie bêdziemy st¹paæ.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Uwolnimy œwiat od barbarzyñców nazywaj¹cych siê Stra¿nikami Ognia. Nie zabawimy d³ugo w tej œwi¹tyni.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");	//To prawda.
};

func void dia_schwarzmagier_hello_meister()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//Doœæ tych bredni! Teraz nadejdzie twój koniec.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Twoje oczy zakryje ciemnoœæ, a twa dusza zniknie w zaœwiatach.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");	//Bez amuletu przyzwania dusz bêdzie mi trochê trudno.
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

