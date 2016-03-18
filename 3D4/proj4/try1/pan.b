	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC consumer */
;
		;
		
	case 4: // STATE 4
		;
		now.who = trpt->bup.ovals[1];
		now.turn = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 8: // STATE 11
		;
		now.n = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 13
		;
		now.who = trpt->bup.ovals[1];
		now.turn = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 10: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC producer */
;
		;
		
	case 12: // STATE 4
		;
		now.who = trpt->bup.ovals[1];
		now.turn = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 16: // STATE 11
		;
		now.n = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 13
		;
		now.who = trpt->bup.ovals[1];
		now.turn = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 18: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;
	}

