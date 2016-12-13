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

		 /* PROC :init: */
	case 3: // STATE 1 - prom.pml:41 - [(run p())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - prom.pml:42 - [(run q())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - prom.pml:43 - [((pc==2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!((now.pc==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - prom.pml:44 - [assert((n!=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		spin_assert((now.n!=2), "(n!=2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - prom.pml:45 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC q */
	case 8: // STATE 1 - prom.pml:25 - [((qtemp<9))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)this)->qtemp<9)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: qtemp */  (trpt+1)->bup.oval = ((P1 *)this)->qtemp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->qtemp = 0;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - prom.pml:28 - [qtemp = n] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->qtemp;
		((P1 *)this)->qtemp = now.n;
#ifdef VAR_RANGES
		logval("q:qtemp", ((P1 *)this)->qtemp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 3 - prom.pml:29 - [qtemp = (qtemp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->qtemp;
		((P1 *)this)->qtemp = (((P1 *)this)->qtemp+1);
#ifdef VAR_RANGES
		logval("q:qtemp", ((P1 *)this)->qtemp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 4 - prom.pml:30 - [n = qtemp] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = ((P1 *)this)->qtemp;
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 5 - prom.pml:31 - [printf('this is q->n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		Printf("this is q->n");
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 6 - prom.pml:32 - [printf('%u',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		Printf("%u", now.n);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 9 - prom.pml:35 - [pc = (pc+1)] (0:0:1 - 2)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.oval = now.pc;
		now.pc = (now.pc+1);
#ifdef VAR_RANGES
		logval("pc", now.pc);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 13 - prom.pml:38 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC p */
	case 16: // STATE 1 - prom.pml:8 - [((ptemp<9))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((P0 *)this)->ptemp<9)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: ptemp */  (trpt+1)->bup.oval = ((P0 *)this)->ptemp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->ptemp = 0;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - prom.pml:11 - [ptemp = n] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->ptemp;
		((P0 *)this)->ptemp = now.n;
#ifdef VAR_RANGES
		logval("p:ptemp", ((P0 *)this)->ptemp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 3 - prom.pml:12 - [ptemp = (ptemp+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->ptemp;
		((P0 *)this)->ptemp = (((P0 *)this)->ptemp+1);
#ifdef VAR_RANGES
		logval("p:ptemp", ((P0 *)this)->ptemp);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 4 - prom.pml:13 - [n = ptemp] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = now.n;
		now.n = ((P0 *)this)->ptemp;
#ifdef VAR_RANGES
		logval("n", now.n);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 5 - prom.pml:14 - [printf('this is p->n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		Printf("this is p->n");
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 6 - prom.pml:15 - [printf('%u',n)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("%u", now.n);
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 9 - prom.pml:17 - [pc = (pc+1)] (0:0:1 - 2)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = now.pc;
		now.pc = (now.pc+1);
#ifdef VAR_RANGES
		logval("pc", now.pc);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 13 - prom.pml:20 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][13] = 1;
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

