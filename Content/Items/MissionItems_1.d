
instance ITKE_XARDAS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skrzyni";
	text[3] = "Xardasa.";
};

instance ITWR_CANTHARS_KOMPROBRIEF_MIS(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_canthars_komprobrief;
	scemename = "MAP";
	description = "List Canthara do Sary.";
};


func void use_canthars_komprobrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Ostatnie ostrze¿enie");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Wielokrotnie ju¿ ostrzega³em ciê");
	Doc_PrintLine(ndocid,0," w niezwykle przyjazny sposób,");
	Doc_PrintLine(ndocid,0," ¿e broñ zamówiona u ciebie tydzieñ");
	Doc_PrintLine(ndocid,0," temu jest mi wyj¹tkowo pilnie");
	Doc_PrintLine(ndocid,0," potrzebna.");
	Doc_PrintLine(ndocid,0," Jeœli szybko siê nie odezwiesz w tej");
	Doc_PrintLine(ndocid,0," sprawie, to zmusisz mnie do zmiany");
	Doc_PrintLine(ndocid,0," sposobu, w jaki ciê traktujê. Mam");
	Doc_PrintLine(ndocid,0," nadziejê, ¿e siê dobrze rozumiemy!!!!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Onar");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMW_2H_ROD(C_ITEM)
{
	name = "Miecz dwurêczny Roda";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = DAMAGE_ROD;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ROD;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_CORAGONSSILBER(C_ITEM)
{
	name = "Srebro Coragona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_THEKLASPAKET(C_ITEM)
{
	name = "Paczka Thekli";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_theklaspacket;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_theklaspacket()
{
	CreateInvItems(hero,itpl_mana_herb_01,3);
	CreateInvItems(hero,itpl_health_herb_02,1);
	CreateInvItems(hero,itpl_speed_herb_01,1);
	CreateInvItems(hero,itpl_blueplant,2);
	Print(PRINT_GOTPLANTS);
};


instance ITMI_MARIASGOLDPLATE(C_ITEM)
{
	name = "Ciê¿ki, z³oty talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Ozdobiono go stylizowanymi";
	text[3] = "imionami Onara i Marii.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_VALENTINOSRING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_valentinosring;
	on_unequip = unequip_valentinosring;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Valentina";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_valentinosring()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE;
	self.protection[PROT_BLUNT] += RI_PROTEDGE;
};

func void unequip_valentinosring()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE;
};


instance ITKE_DEXTER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skrzyni";
	text[3] = "Dextera.";
};

instance ITWR_KRAEUTERLISTE(C_ITEM)
{
	name = "Lista";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_kraeuterliste;
	scemename = "MAP";
	description = "Lista zió³ Constantina.";
};


func void use_kraeuterliste()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Zio³a alchemiczne");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Roœlina lecznicza");
	Doc_PrintLine(ndocid,0,"Ziele lecznicze");
	Doc_PrintLine(ndocid,0,"Korzeñ leczniczy");
	Doc_PrintLine(ndocid,0,"Ognista pokrzywa");
	Doc_PrintLine(ndocid,0,"Ogniste ziele");
	Doc_PrintLine(ndocid,0,"Ognisty korzeñ");
	Doc_PrintLine(ndocid,0,"Goblinie jagody");
	Doc_PrintLine(ndocid,0,"Smoczy korzeñ");
	Doc_PrintLine(ndocid,0,"Zêbate ziele");
	Doc_PrintLine(ndocid,0,"Rdest polny");
	Doc_PrintLine(ndocid,0,"Szczaw królewski");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Niech roœliny zbiera dla ciebie kandydat na ucznia - przekonasz siê, czy siê do czegoœ nadaje. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Z powa¿aniem, Zuris.");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_MANAREZEPT(C_ITEM)
{
	name = "Receptura";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept;
	scemename = "MAP";
	description = "Receptura esencji magicznej.";
};


func void use_manarezept()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Mikstury magiczne");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Do warzenia mikstur magicznych alchemik potrzebuje - oprócz umiejêtnoœci - tak¿e:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ognistej pokrzywy");
	Doc_PrintLine(ndocid,0,"Ognistego ziela");
	Doc_PrintLine(ndocid,0,"Ognistego korzenia");
	Doc_PrintLines(ndocid,0,"oraz");
	Doc_PrintLine(ndocid,0,"Rdestu polnego");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Mistrz Neoras");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_PASSIERSCHEIN(C_ITEM)
{
	name = "Przepustka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassierschein;
	scemename = "MAP";
	description = name;
	text[3] = "Dziêki tym dokumentom nie";
	text[4] = "zatrzymaj¹ mnie stra¿nicy miejscy.";
};


func void usepassierschein()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Przepustka");
	Doc_PrintLine(ndocid,0,"        Khorinis    ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Ten dokument uprawnia jego posiadacza");
	Doc_PrintLine(ndocid,0," do swobodnego poruszania siê po dolnej czêœci");
	Doc_PrintLine(ndocid,0," Khorinis przez czas nieograniczony.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    Larius,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    gubernator królewski");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMI_HERBPAKET(C_ITEM)
{
	name = "Paczka ziela";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ciê¿ka, lepi¹ca siê paczka,";
	text[3] = "œmierdz¹ca bagiennym zielem.";
	text[5] = NAME_VALUE;
	count[5] = 200;
};

instance ITKE_STORAGE(C_ITEM)
{
	name = "Klucz do magazynu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do magazynu";
	text[3] = "portowego.";
};


const int HP_HERING = 20;

instance ITFO_SMELLYFISH(C_ITEM)
{
	name = "ŒledŸ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_smellyfish;
	description = "ŒledŸ";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HERING;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISH;
};


func void use_smellyfish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERING);
};


instance ITFO_HALVORFISH_MIS(C_ITEM)
{
	name = "Dziwna ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_halvorfish;
	description = "Dziwnie wygl¹daj¹ca ryba.";
	text[2] = "Z t¹ ryb¹ jest coœ nie tak.";
	text[3] = "Wygl¹da, jakby ktoœ j¹ pozszywa³...";
};


func void use_halvorfish()
{
	CreateInvItems(hero,itwr_halvormessage,1);
	Print(PRINT_FISHLETTER);
};


instance ITWR_HALVORMESSAGE(C_ITEM)
{
	name = "Œmierdz¹ca notatka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehalvormessage;
	scemename = "MAP";
	description = name;
	text[2] = "W rybie by³a schowana ta notatka.";
};


func void usehalvormessage()
{
	var int ndocid;
	KNOWS_HALVOR = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    Nie wychylajcie siê! ");
	Doc_PrintLine(ndocid,0,"    Stra¿ zaczyna coœ podejrzewaæ.");
	Doc_PrintLine(ndocid,0,"    Nic nie róbcie, dopóki znów siê nie odezwê!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Halvor");
	Doc_Show(ndocid);
};


instance ITMW_ALRIKSSWORD_MIS(C_ITEM)
{
	name = "Miecz Alrika";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ALRIK;
	damagetotal = DAMAGE_ALRIK;
	damagetype = DAM_EDGE;
	range = RANGE_ALRIK;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ALRIK;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	on_equip = equip_alrikssword;
	on_unequip = unequip_alrikssword;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITWR_VATRASMESSAGE(C_ITEM)
{
	name = "Zapieczêtowana wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessage;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Wiadomoœæ od Vatrasa";
	text[3] = "do Magów Ognia.";
};


func void usevatrasmessage()
{
	var int ndocid;
	CreateInvItems(self,itwr_vatrasmessage_open,1);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Drogi Isgarocie,");
	Doc_PrintLines(ndocid,0,"wyczuwam coraz mocniej obecnoœæ nie znanej nam si³y.");
	Doc_PrintLines(ndocid,0,"Czy to mo¿liwe, ¿e s³ugi Beliara nadchodz¹? Byæ mo¿e siê mylê,");
	Doc_PrintLines(ndocid,0,"s¹dzê jednak, ¿e Ojciec Pyrokar powinien wzi¹æ sprawy w swoje rêce. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Oby nasze mod³y zosta³y wys³uchane.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITWR_VATRASMESSAGE_OPEN(C_ITEM)
{
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessageopen;
	scemename = "MAP";
	description = name;
	text[2] = "Wiadomoœæ od Vatrasa";
	text[3] = "do Magów Ognia.";
	text[4] = "Pieczêæ zosta³a z³amana.";
};


func void usevatrasmessageopen()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Drogi Isgarocie,");
	Doc_PrintLines(ndocid,0,"wyczuwam coraz mocniej obecnoœæ nie znanej nam si³y.");
	Doc_PrintLines(ndocid,0,"Czy to mo¿liwe, ¿e s³ugi Beliara nadchodz¹? Byæ mo¿e siê mylê,");
	Doc_PrintLines(ndocid,0,"s¹dzê jednak, ¿e Ojciec Pyrokar powinien wzi¹æ sprawy w swoje rêce. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Oby nasze mod³y zosta³y wys³uchane.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITKE_HOTEL(C_ITEM)
{
	name = "Klucz do pokoju";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do izby w";
	text[3] = "gospodzie.";
};

instance ITKE_THIEFGUILDKEY_MIS(C_ITEM)
{
	name = "Zardzewia³y klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ten nie opar³ siê dzia³aniu s³onej, morskiej wody.";
};

instance ITKE_THIEFGUILDKEY_HOTEL_MIS(C_ITEM)
{
	name = "Zardzewia³y klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do piwnicy w gospodzie.";
};

instance ITKE_INNOS_MIS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do portalu klasztoru";
	text[3] = "Innosa.";
};

instance ITKE_KLOSTERSCHATZ(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do skarbca";
	text[3] = "klasztornego.";
};

instance ITKE_KLOSTERSTORE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do spi¿arni";
	text[3] = "klasztornej.";
};

instance ITKE_KDFPLAYER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do komnaty";
	text[3] = "w klasztorze.";
};

instance ITKE_KLOSTERBIBLIOTHEK(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do biblioteki";
	text[3] = "klasztornej.";
};

instance ITFO_SCHAFSWURST(C_ITEM)
{
	name = "Barania kie³basa";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_schafswurst;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SAUSAGE;
};


func void use_schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
};


instance ITPO_PERM_LITTLEMANA(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_littlemana;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "Esencja ducha";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_littlemana()
{
	b_raiseattribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance HOLY_HAMMER_MIS(C_ITEM)
{
	name = "Œwiêty m³ot";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HOLYHAMMER;
	owner = nov_608_garwig;
	damagetotal = DAMAGE_HOLYHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_HOLYHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HOLYHAMMER;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Obra¿enia:                   ??";
	text[3] = "Wymagana si³a:          ??";
	text[4] = "Broñ dwurêczna";
	text[5] = "Wartoœæ:  niemo¿liwa do ustalenia";
};

instance ITKE_MAGICCHEST(C_ITEM)
{
	name = "Stary klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Stary, ¿elazny klucz.";
	text[3] = "Prawdopodobnie otwiera";
	text[4] = "jak¹œ k³ódkê.";
};

instance ITWR_PASSAGE_MIS(C_ITEM)
{
	name = "Propozycja Lee dla paladynów";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassage;
	scemename = "MAP";
	description = name;
	text[3] = "Dziêki tej wiadomoœci byæ mo¿e uda";
	text[4] = "mi siê porozmawiaæ z Lordem Hagenem.";
};


func void usepassage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Szanowny Lordzie Hagenie,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"obydwaj zdajemy sobie sprawê z sytuacji, wiêc przejdê od razu do rzeczy:");
	Doc_PrintLines(ndocid,0,"uniewinnij mnie i moich ludzi wobec Jego Wysokoœci i samego Innosa.");
	Doc_PrintLines(ndocid,0,"W zamian zobowi¹zujemy siê pomóc Ci w obronie miasta i okolicznych ziem.");
	Doc_PrintLines(ndocid,0,"Osobiœcie dopilnujê te¿, by moi ludzie trzymali siê z dala od tutejszych farm - naturalnie oprócz zagród Onara, gdzie nadal bêdziemy stacjonowali.");
	Doc_PrintLines(ndocid,0,"Wiem, ¿e statek, którym zamierzacie wróciæ na kontynent, mo¿e zabraæ kilka dodatkowych osób. Gdy bêdziecie ruszaæ w drogê, chcê pop³yn¹æ z wami.");
	Doc_PrintLines(ndocid,0,"Zaklinam ciê: rozwa¿ dobrze moje s³owa i podejmij rozs¹dn¹ decyzjê.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Podpisano   Genera³ Lee");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_BANDITLETTER_MIS(C_ITEM)
{
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebanditletter;
	scemename = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
};


func void usebanditletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"Zatrzymujcie wszystkich, którzy");
	Doc_PrintLine(ndocid,0,"przyjd¹ od strony gór.");
	Doc_PrintLine(ndocid,0,"Jeœli ktoœ przekroczy prze³êcz,");
	Doc_PrintLine(ndocid,0,"bêdzie to prawdopodobnie pewien");
	Doc_PrintLine(ndocid,0,"starzec. Nie dajcie siê");
	Doc_PrintLine(ndocid,0,"zwieœæ - to niebezpieczny mag.");
	Doc_PrintLine(ndocid,0,"Miejcie na niego oko.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Mo¿e siê z nim skontaktowaæ cz³owiek,");
	Doc_PrintLine(ndocid,0,"którego szukamy.");
	Doc_PrintLine(ndocid,0,"Wraz z tym listem otrzymujecie");
	Doc_PrintLine(ndocid,0,"30 sztuk z³ota.");
	Doc_PrintLine(ndocid,0,"Kolejne 30 otrzyma osoba,");
	Doc_PrintLine(ndocid,0,"która go zabije.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"G³owê przynieœcie do starej kopalni.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,".....D.");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_POSTER_MIS(C_ITEM)
{
	name = "List goñczy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useposter;
	scemename = "MAP";
	description = name;
	text[3] = "Moja podobizna!";
	text[4] = "";
};


func void useposter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Gesucht.TGA",0);
	Doc_Show(ndocid);
};


instance ITKE_BANDIT(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ten klucz nale¿a³";
	text[3] = "do bandyty.";
};

instance ITRW_BOW_L_03_MIS(C_ITEM)
{
	name = "£uk myœliwski";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = "£uk myœliwski Bospera.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_PROT_POINT_01_MIS(C_ITEM)
{
	name = "Pierœcieñ Constantina";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_PROTPOINT;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_01_mis;
	on_unequip = unequip_itri_prot_point_01_mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Drewniana ochrona";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] += RI_PROTPOINT;
};

func void unequip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT;
};


instance ITMI_EDDASSTATUE(C_ITEM)
{
	name = "Pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innosie, W³adco Prawoœci,";
	text[3] = "pob³ogos³aw mnie,";
	text[4] = "i chroñ przed wrogiem.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_CRYPT_01(C_ITEM)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 1";
};

instance ITKE_EVT_CRYPT_02(C_ITEM)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 2";
};

instance ITKE_EVT_CRYPT_03(C_ITEM)
{
	name = "Stary mosiê¿ny klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz ze szkieletu w pomieszczeniu 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_ITEM)
{
	name = "Stara rycerska zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_VALENTINO(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "Valentina.";
};

instance ITKE_BUERGER(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Le¿a³ na parapecie.";
	text[3] = "";
};

instance ITKE_RICHTER(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "sêdziego.";
};

instance ITKE_SALANDRIL(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "alchemika Salandrila.";
	text[3] = "";
};

instance ITKE_PALADINTRUHE(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Niewielki mosiê¿ny klucz";
	text[3] = "z siedziby paladynów.";
};

instance ITKE_THIEFTREASURE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ma³y klucz.";
};

instance ITKE_FINGERS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Zardzewia³y klucz do drzwi";
	text[3] = "z kana³ów.";
};

instance ITWR_SCHULDENBUCH(C_ITEM)
{
	name = "Ksiêga D³ugów";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Ksiêga D³ugów Lehmara.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschuldbuch;
};


func void useschuldbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Umowy i d³ugi");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ja, Mistrz Thorben, stolarz z Khorinis, jestem winien sz.p. Lehmarowi 200 monet.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Thorben");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ja, Coragon, w³aœciciel gospody w Khorinis, jestem winien sz.p. Lehmarowi 150 monet.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Coragon");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Ja, Hanna, w³aœcicielka gospody w Khorinis, jestem winna sz.p. Lehmarowi 250 monet.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"          Hanna");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITPL_SAGITTA_HERB_MIS(C_ITEM)
{
	name = "S³oneczny aloes";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRENGTH_HERB_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_ITEM)
{
	name = "Klucz do pokoju";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "gospody 'Pod Martw¹ Harpi¹'.";
	text[3] = "";
};

instance ITRW_DRAGOMIRSARMBRUST_MIS(C_ITEM)
{
	name = "Kusza Dragomira";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

