#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC consumer */
	case 3: // STATE 1 - test.pml:38 - [((n<121))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.n<121)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - test.pml:9 - [((turn==2))] (8:0:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!((now.turn==2)))
			continue;
		/* merge: turn = 3(8, 3, 8) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.turn;
		now.turn = 3;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		/* merge: who = _pid(8, 4, 8) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.who);
		now.who = ((int)((P1 *)this)->_pid);
#ifdef VAR_RANGES
		logval("who", ((int)now.who));
#endif
		;
		/* merge: printf('Consume: %d',_pid)(8, 7, 8) */
		reached[1][7] = 1;
		Printf("Consume: %d", ((int)((P1 *)this)->_pid));
		_m = 3; goto P999; /* 3 */
	case 5: // STATE 8 - test.pml:42 - [assert((who==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		spin_assert((((int)now.who)==((int)((P1 *)this)->_pid)), "(who==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 9 - test.pml:44 - [printf('%u',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		Printf("%u", now.n);
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 10 - test.pml:45 - [printf('\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		Printf("\n");
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 11 - test.pml:46 - [n = (n+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = (now.n+1);
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 12 - test.pml:13 - [turn = 3] (0:16:2 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.turn;
		now.turn = 3;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		/* merge: who = 0(16, 13, 16) */
		reached[1][13] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.who);
		now.who = 0;
#ifdef VAR_RANGES
		logval("who", ((int)now.who));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[1][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 21 - test.pml:51 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[1][21] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC producer */
	case 11: // STATE 1 - test.pml:21 - [((n<121))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.n<121)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 2 - test.pml:9 - [((turn==3))] (8:0:2 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.turn==3)))
			continue;
		/* merge: turn = 2(8, 3, 8) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.turn;
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		/* merge: who = _pid(8, 4, 8) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.who);
		now.who = ((int)((P0 *)this)->_pid);
#ifdef VAR_RANGES
		logval("who", ((int)now.who));
#endif
		;
		/* merge: printf('Produce: %d',_pid)(8, 7, 8) */
		reached[0][7] = 1;
		Printf("Produce: %d", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 8 - test.pml:25 - [assert((who==_pid))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		spin_assert((((int)now.who)==((int)((P0 *)this)->_pid)), "(who==_pid)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 9 - test.pml:27 - [printf('%u',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		Printf("%u", now.n);
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 10 - test.pml:28 - [printf('\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		Printf("\n");
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 11 - test.pml:29 - [n = (n+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = (now.n+1);
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 12 - test.pml:13 - [turn = 2] (0:16:2 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.turn;
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", now.turn);
#endif
		;
		/* merge: who = 0(16, 13, 16) */
		reached[0][13] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.who);
		now.who = 0;
#ifdef VAR_RANGES
		logval("who", ((int)now.who));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 18: // STATE 21 - test.pml:34 - [-end-] (0:0:0 - 2)
		IfNotBlocked
		reached[0][21] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

