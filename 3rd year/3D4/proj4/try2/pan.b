	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;
;
		;
		;
		;
		
	case 7: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC q */

	case 8: // STATE 1
		;
	/* 0 */	((P1 *)this)->qtemp = trpt->bup.oval;
		;
		;
		goto R999;

	case 9: // STATE 2
		;
		((P1 *)this)->qtemp = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 3
		;
		((P1 *)this)->qtemp = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 4
		;
		now.n = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 14: // STATE 9
		;
		now.pc = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC p */

	case 16: // STATE 1
		;
	/* 0 */	((P0 *)this)->ptemp = trpt->bup.oval;
		;
		;
		goto R999;

	case 17: // STATE 2
		;
		((P0 *)this)->ptemp = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 3
		;
		((P0 *)this)->ptemp = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 4
		;
		now.n = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 22: // STATE 9
		;
		now.pc = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}

