	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 2
		;
		((P1 *)this)->numphil = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 4
		;
		_m = unsend(now.forks[ Index(((int)((P1 *)this)->numphil), 5) ]);
		;
		goto R999;

	case 6: // STATE 5
		;
	/* 0 */	((P1 *)this)->numphil = trpt->bup.oval;
		;
		;
		goto R999;

	case 7: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC phil */

	case 8: // STATE 1
		;
		XX = 1;
		unrecv(now.forks[ Index(((P0 *)this)->id, 5) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 9: // STATE 2
		;
		XX = 1;
		unrecv(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ], XX-1, 0, 1, 1);
		;
		;
		goto R999;
;
		
	case 10: // STATE 3
		goto R999;

	case 11: // STATE 5
		;
		_m = unsend(now.forks[ Index(((P0 *)this)->id, 5) ]);
		;
		goto R999;

	case 12: // STATE 6
		;
		_m = unsend(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
		;
		goto R999;
;
		
	case 13: // STATE 7
		goto R999;

	case 14: // STATE 12
		;
		p_restor(II);
		;
		;
		goto R999;
	}

