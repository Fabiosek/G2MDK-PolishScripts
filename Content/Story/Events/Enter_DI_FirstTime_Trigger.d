
var int enterdi_kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,itke_ship_levelchange_mis))
	{
		Npc_RemoveInvItems(hero,itke_ship_levelchange_mis,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 15)
	{
		Wld_InsertItem(itpo_perm_dex,"FP_ITEM_DI_ENTER_05");
	};
	if(ENTERDI_KAPITEL6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(archol,itru_paldestroyevil,1);
		};
		Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_12");
		if(Npc_HasItems(hero,itmi_innoseye_mis) == FALSE)
		{
			if(Npc_HasItems(hero,itmi_innoseye_discharged_mis) == FALSE)
			{
				Wld_InsertItem(itse_xardasnotfallbeutel_mis,"FP_ITEM_SHIP_12");
				SC_INNOSEYEVERGESSEN_DI = TRUE;
				b_logentry(TOPIC_HALLENVONIRDORATH,"Ostatniej nocy mia�em dziwny sen. Widzia�em Xardasa, kt�ry kaza� mi przynie�� co� ze sto�u alchemicznego na statku. Bardzo dziwne. Zw�aszcza �e nic nie pi�em przed snem.");
			};
			Wld_InsertItem(itmi_flask,"FP_ITEM_SHIP_06");
			if(((Npc_HasItems(hero,itat_icedragonheart) >= 1) || (Npc_HasItems(hero,itat_rockdragonheart) >= 1) || (Npc_HasItems(hero,itat_firedragonheart) >= 1) || (Npc_HasItems(hero,itat_swampdragonheart) >= 1)) == FALSE)
			{
				CreateInvItems(orkelite_antipaladinorkoberst_di,itat_rockdragonheart,1);
			};
		};
		Log_CreateTopic(TOPIC_MYCREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MYCREW,LOG_RUNNING);
		if(JORGENISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"M�j kapitan, Jorgen, poczeka na mnie na statku.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"M�j kapitan, Torlof, b�dzie broni� statku tak d�ugo, a� nie wr�c� z wyspy. Dzi�ki niemu stan� si� silniejszy i zr�czniejszy.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"M�j kapitan, Jack, poczeka na mnie na statku. Wygl�da na przestraszonego i mam nadziej�, �e poradzi sobie. Potrzebuj� jego pomocy!");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"W czasie mojej nieobecno�ci Lee obejmie dow�dztwo na statku. Dzi�ki niemu b�d� si� lepiej pos�ugiwa� broni� jedno- i dwur�czn�.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Dzi�ki Miltenowi mog� zwi�kszy� moj� magiczn� moc.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Milten poka�e mi tak�e, jak tworzy� runy.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Niestety, wydaje mi si�, �e stan Lestera znacznie si� pogorszy� na tej tajemniczej wyspie.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mario dziwnie si� zachowuje. Od jakiego� czasu w og�le si� nie odzywa.");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Wilk mo�e mnie nauczy�, jak strzela� z �uku i kuszy.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Vatras, Mag Wody, nie tylko mo�e mnie uleczy�, ale tak�e sporo nauczy� o warzeniu mikstur");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Vatras mo�e mi tak�e pom�c pozna� nowe kr�gi magii.");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Bennet mo�e mi pokaza�, jak wyku� bro�.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Diego s�u�y mi rad� i amunicj�. Nauczy mnie tak�e, jak otwiera� zamki i strzela� z kuszy oraz �uku.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"W czasie naszej podr�y Gorn nie zmru�y� oka. Pilnuje naszego statku. Wiem, �e mog� mu zaufa�.");
			Log_AddEntry(TOPIC_MYCREW,"Dzi�ki Gornowi b�d� si� lepiej pos�ugiwa� broni� dwur�czn�.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lares obieca� nauczy� mnie skradania i walki broni� jednor�czn�. Pomo�e mi tak�e sta� si� zr�czniejszym.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Jedyne, na czym tak naprawd� zale�y Biffowi, to pieni�dze. Musz� na niego uwa�a�.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Angar jest bardzo niecierpliwy. Nie wiem, czy nie wyruszy sam do walki.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Girion jest niezmiernie cierpliwy. Dobra cecha u nauczyciela pos�ugiwania si� broni�.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

