
const int VALUE_SHELL_01 = 30;
const int VALUE_SHELL_02 = 60;
var int shell_opener;

func void b_openshell()
{
	var int shellomizer;
	shellomizer = Hlp_Random(100);
	SHELL_OPENER = SHELL_OPENER + 1;
	if(SHELL_OPENER == 1)
	{
		b_playerfinditem(itmi_addon_whitepearl,1);
	}
	else if(SHELL_OPENER == 25)
	{
		b_playerfinditem(itmi_darkpearl,1);
	}
	else if(shellomizer >= 80)
	{
		b_playerfinditem(itmi_addon_whitepearl,1);
	}
	else if(shellomizer >= 55)
	{
		b_playerfinditem(itfo_addon_shellflesh,1);
	}
	else if(shellomizer >= 50)
	{
		b_playerfinditem(itmi_aquamarine,1);
	}
	else if(shellomizer >= 40)
	{
		b_playerfinditem(itmi_quartz,1);
	}
	else if(shellomizer >= 35)
	{
		b_playerfinditem(itmi_rockcrystal,1);
	}
	else if(shellomizer >= 25)
	{
		b_playerfinditem(itmi_sulfur,1);
	}
	else
	{
		b_say_overlay(self,self,"$NOTHINGTOGET02");
		AI_PrintScreen(PRINT_NOTHINGTOGET02,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	};
};


instance ITMI_ADDON_SHELL_01(C_ITEM)
{
	name = "Otwierana muszla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHELL_01;
	visual = "ItMi_Shell_01.3ds";
	material = MAT_STONE;
	scemename = "MAPSEALED";
	on_state[0] = use_shell_01;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};


func void use_shell_01()
{
	b_openshell();
};


instance ITMI_ADDON_SHELL_02(C_ITEM)
{
	name = "Rogowa muszla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHELL_02;
	visual = "ItMi_Shell_02.3ds";
	material = MAT_STONE;
	scemename = "MAPSEALED";
	on_state[0] = use_shell_02;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};


func void use_shell_02()
{
	b_openshell();
};

