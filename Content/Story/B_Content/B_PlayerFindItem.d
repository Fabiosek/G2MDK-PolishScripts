
func void b_playerfinditem(var int itm,var int amount)
{
	var string concattext;
	var string itemname;
	if(Npc_IsPlayer(self))
	{
		CreateInvItems(self,itm,amount);
		itemname = item.name;
		if(itm == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDERHALTEN);
			Print(concattext);
			Snd_Play("Geldbeutel");
		}
		else if(amount == 1)
		{
			concattext = ConcatStrings(itemname,PRINT_ADDON_ERHALTEN);
			Print(concattext);
		}
		else
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSERHALTEN);
			concattext = ConcatStrings(concattext," (");
			concattext = ConcatStrings(concattext,itemname);
			concattext = ConcatStrings(concattext,")");
			Print(concattext);
		};
	};
};

