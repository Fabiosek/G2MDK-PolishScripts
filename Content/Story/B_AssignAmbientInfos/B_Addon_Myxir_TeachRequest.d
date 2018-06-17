
func void b_dia_addon_myxir_teachrequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Naucz mnie tego dziwnego jêzyka.
};

func void b_dia_addon_myxir_teachl1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Zacznijmy od czegoœ prostego. Nauczê ciê jêzyka wieœniaków.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Teksty pisane w jêzyku wieœniaków traktuj¹ zwykle o sprawach przyziemnych: pracy, mi³oœci, zaopatrzeniu czy ¿ywnoœci.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Jêzyk ten by³ powszechnie wykorzystywany w mieœcie. Tak wiêc bêdziesz w stanie zrozumieæ wiêkszoœæ tekstów, które tam znajdziesz.
};

func void b_dia_addon_myxir_teachl2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//Znasz ju¿ jêzyk wieœniaków. Jêzyk wojowników jest nieco trudniejszy.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Teksty pisane w jêzyku wojowników dotycz¹ zwykle wojny i broni. Nauczysz siê wielu przydatnych rzeczy.
};

func void b_dia_addon_myxir_teachl3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Jêzyk kap³anów jest bardzo trudny do zrozumienia, ale chêtnie przeka¿ê ci jego zasady.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//W jêzyku kap³anów spisane s¹ wszystkie œwiête pisma objaœniaj¹ce historiê i magiê budowniczych.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Ka¿dy z tych tekstów to prawdziwy skarb, o ile ktoœ zrozumie ich znaczenie.
};

func void b_dia_addon_myxir_teachnomore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Nie mogê ci na razie pokazaæ niczego wiêcej. Opanowa³eœ jêzyk budowniczych.
};

func void b_dia_addon_myxir_teach_language_x()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//IdŸ i sprawdŸ swoj¹ now¹ wiedzê. Przekonasz siê, ¿e pisma budowniczych nie stanowi¹ ju¿ dla ciebie zagadki.
};

