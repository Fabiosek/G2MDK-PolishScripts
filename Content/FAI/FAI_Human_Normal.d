
instance FA_ENEMY_PREHIT_42(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_42(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_W_COMBO_42(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_42(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_42(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_42(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_42(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_42(C_FIGHTAI)
{
};

instance FA_MY_G_RUNTO_42(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_42(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_42(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;
};

instance FA_MY_FK_FOCUS_42(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_42(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_FAR_42(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_FK_NOFOCUS_FAR_42(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_FK_FOCUS_MAG_42(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
	move[3] = MOVE_WAIT_EXT;
};

instance FA_MY_FK_NOFOCUS_MAG_42(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

