
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
				b_logentry(TOPIC_HALLENVONIRDORATH,"Ostatniej nocy mia³em dziwny sen. Widzia³em Xardasa, który kaza³ mi przynieœæ coœ ze sto³u alchemicznego na statku. Bardzo dziwne. Zw³aszcza ¿e nic nie pi³em przed snem.");
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
			Log_AddEntry(TOPIC_MYCREW,"Mój kapitan, Jorgen, poczeka na mnie na statku.");
		};
		if(TORLOFISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mój kapitan, Torlof, bêdzie broni³ statku tak d³ugo, a¿ nie wrócê z wyspy. Dziêki niemu stanê siê silniejszy i zrêczniejszy.");
		};
		if(JACKISCAPTAIN == TRUE)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mój kapitan, Jack, poczeka na mnie na statku. Wygl¹da na przestraszonego i mam nadziejê, ¿e poradzi sobie. Potrzebujê jego pomocy!");
		};
		if(LEE_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"W czasie mojej nieobecnoœci Lee obejmie dowództwo na statku. Dziêki niemu bêdê siê lepiej pos³ugiwa³ broni¹ jedno- i dwurêczn¹.");
		};
		if(MILTENNW_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Dziêki Miltenowi mogê zwiêkszyæ moj¹ magiczn¹ moc.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Milten poka¿e mi tak¿e, jak tworzyæ runy.");
			};
		};
		if(LESTER_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Niestety, wydaje mi siê, ¿e stan Lestera znacznie siê pogorszy³ na tej tajemniczej wyspie.");
		};
		if(MARIO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Mario dziwnie siê zachowuje. Od jakiegoœ czasu w ogóle siê nie odzywa.");
		};
		if(WOLF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Wilk mo¿e mnie nauczyæ, jak strzelaæ z ³uku i kuszy.");
		};
		if(VATRAS_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Vatras, Mag Wody, nie tylko mo¿e mnie uleczyæ, ale tak¿e sporo nauczyæ o warzeniu mikstur");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MYCREW,"Vatras mo¿e mi tak¿e pomóc poznaæ nowe krêgi magii.");
			};
		};
		if(BENNET_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Bennet mo¿e mi pokazaæ, jak wykuæ broñ.");
		};
		if(DIEGO_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Diego s³u¿y mi rad¹ i amunicj¹. Nauczy mnie tak¿e, jak otwieraæ zamki i strzelaæ z kuszy oraz ³uku.");
		};
		if(GORN_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"W czasie naszej podró¿y Gorn nie zmru¿y³ oka. Pilnuje naszego statku. Wiem, ¿e mogê mu zaufaæ.");
			Log_AddEntry(TOPIC_MYCREW,"Dziêki Gornowi bêdê siê lepiej pos³ugiwa³ broni¹ dwurêczn¹.");
		};
		if(LARES_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Lares obieca³ nauczyæ mnie skradania i walki broni¹ jednorêczn¹. Pomo¿e mi tak¿e staæ siê zrêczniejszym.");
		};
		if(BIFF_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Jedyne, na czym tak naprawdê zale¿y Biffowi, to pieni¹dze. Muszê na niego uwa¿aæ.");
		};
		if(ANGAR_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Angar jest bardzo niecierpliwy. Nie wiem, czy nie wyruszy sam do walki.");
		};
		if(GIRION_ISONBOARD == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MYCREW,"Girion jest niezmiernie cierpliwy. Dobra cecha u nauczyciela pos³ugiwania siê broni¹.");
		};
		IntroduceChapter(KAPWECHSEL_6,KAPWECHSEL_6_TEXT,"chapter6.tga","chapter_01.wav",6000);
		ENTERDI_KAPITEL6 = TRUE;
	};
};

