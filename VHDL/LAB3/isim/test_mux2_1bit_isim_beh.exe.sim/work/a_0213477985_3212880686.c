/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/owner/Desktop/VHDL/LAB2/mux2_1bit.vhd";



static void work_a_0213477985_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    int64 t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    int64 t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int64 t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(16, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:    t13 = (t0 + 1352U);
    t14 = *((char **)t13);
    t15 = *((unsigned char *)t14);
    t16 = (t15 == (unsigned char)3);
    if (t16 != 0)
        goto LAB5;

LAB6:
LAB7:    t25 = (1 * 1000LL);
    t26 = (t0 + 3072);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    *((unsigned char *)t30) = (unsigned char)2;
    xsi_driver_first_trans_delta(t26, 0U, 1, t25);
    t31 = (t0 + 3072);
    xsi_driver_intertial_reject(t31, t25, t25);

LAB2:    t32 = (t0 + 2992);
    *((int *)t32) = 1;

LAB1:    return;
LAB3:    t5 = (1 * 1000LL);
    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t7 = *((unsigned char *)t6);
    t1 = (t0 + 3072);
    t8 = (t1 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_delta(t1, 0U, 1, t5);
    t12 = (t0 + 3072);
    xsi_driver_intertial_reject(t12, t5, t5);
    goto LAB2;

LAB5:    t17 = (1 * 1000LL);
    t13 = (t0 + 1192U);
    t18 = *((char **)t13);
    t19 = *((unsigned char *)t18);
    t13 = (t0 + 3072);
    t20 = (t13 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t19;
    xsi_driver_first_trans_delta(t13, 0U, 1, t17);
    t24 = (t0 + 3072);
    xsi_driver_intertial_reject(t24, t17, t17);
    goto LAB2;

LAB8:    goto LAB2;

}


extern void work_a_0213477985_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0213477985_3212880686_p_0};
	xsi_register_didat("work_a_0213477985_3212880686", "isim/test_mux2_1bit_isim_beh.exe.sim/work/a_0213477985_3212880686.didat");
	xsi_register_executes(pe);
}
