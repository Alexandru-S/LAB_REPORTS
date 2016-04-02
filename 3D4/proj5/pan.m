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
	case 3: // STATE 1 - df1.pml:25 - [((numphil>0))] (3:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)((P1 *)this)->numphil)>0)))
			continue;
		/* merge: numphil = (numphil-1)(0, 2, 3) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)this)->numphil);
		((P1 *)this)->numphil = (((int)((P1 *)this)->numphil)-1);
#ifdef VAR_RANGES
		logval(":init::numphil", ((int)((P1 *)this)->numphil));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 3 - df1.pml:27 - [(run phil(numphil))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(II, 1, 0, ((int)((P1 *)this)->numphil))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 4 - df1.pml:28 - [forks[numphil]!fork] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (q_full(now.forks[ Index(((int)((P1 *)this)->numphil), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((int)((P1 *)this)->numphil), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((int)((P1 *)this)->numphil), 5) ], 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 6: // STATE 5 - df1.pml:29 - [((numphil==0))] (9:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)((P1 *)this)->numphil)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: numphil */  (trpt+1)->bup.oval = ((P1 *)this)->numphil;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->numphil = 0;
		/* merge: goto :b1(0, 6, 9) */
		reached[1][6] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 11 - df1.pml:33 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC phil */
	case 8: // STATE 1 - df1.pml:11 - [forks[id]?fork] (0:0:0 - 1)
		reached[0][1] = 1;
		if (q_len(now.forks[ Index(((P0 *)this)->id, 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.forks[ Index(((P0 *)this)->id, 5) ], 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.forks[ Index(((P0 *)this)->id, 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.forks[ Index(((P0 *)this)->id, 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((P0 *)this)->id, 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 9: // STATE 2 - df1.pml:12 - [forks[((id+1)%5)]?fork] (0:0:0 - 1)
		reached[0][2] = 1;
		if (q_len(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]) == 0) continue;

		XX=1;
		if (1 != qrecv(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ], 0, 0, 0)) continue;
		if (q_flds[((Q0 *)qptr(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]-1))->_t] != 1)
			Uerror("wrong nr of msg fields in rcv");
		;
		qrecv(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ], XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 10: // STATE 3 - df1.pml:13 - [printf('%u',id)] (0:5:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		Printf("%u", ((P0 *)this)->id);
		/* merge: printf('phil eating...')(5, 4, 5) */
		reached[0][4] = 1;
		Printf("phil eating...");
		_m = 3; goto P999; /* 1 */
	case 11: // STATE 5 - df1.pml:15 - [forks[id]!fork] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (q_full(now.forks[ Index(((P0 *)this)->id, 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((P0 *)this)->id, 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((P0 *)this)->id, 5) ], 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 12: // STATE 6 - df1.pml:15 - [forks[((id+1)%5)]!fork] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (q_full(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ], 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 13: // STATE 7 - df1.pml:16 - [printf('%u',id)] (0:9:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		Printf("%u", ((P0 *)this)->id);
		/* merge: printf('meditating')(9, 8, 9) */
		reached[0][8] = 1;
		Printf("meditating");
		/* merge: .(goto)(0, 10, 9) */
		reached[0][10] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 14: // STATE 12 - df1.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
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

