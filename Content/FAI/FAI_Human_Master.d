
instance FA_ENEMY_PREHIT_4(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
};

instance FA_ENEMY_STORMPREHIT_4(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_COMBO_4(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_4(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_FRONTATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_WAIT;
};

instance FA_MY_W_NOFOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_4(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_4(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_FK_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_4(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_4(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
};

instance FA_MY_FK_NOFOCUS_MAG_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

