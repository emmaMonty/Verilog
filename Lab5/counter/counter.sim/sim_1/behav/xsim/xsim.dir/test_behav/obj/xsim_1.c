/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_63(char*, char *);
extern void execute_64(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_75(char*, char *);
extern void execute_76(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_87(char*, char *);
extern void execute_88(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_6(char*, char *);
extern void execute_54(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[35] = {(funcp)execute_51, (funcp)execute_52, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_57, (funcp)execute_58, (funcp)execute_63, (funcp)execute_64, (funcp)execute_69, (funcp)execute_70, (funcp)execute_75, (funcp)execute_76, (funcp)execute_81, (funcp)execute_82, (funcp)execute_87, (funcp)execute_88, (funcp)execute_93, (funcp)execute_94, (funcp)execute_99, (funcp)execute_100, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_6, (funcp)execute_54, (funcp)execute_55, (funcp)execute_56, (funcp)execute_108, (funcp)execute_109, (funcp)execute_110, (funcp)execute_111, (funcp)execute_112, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 35;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/test_behav/xsim.reloc",  (void **)funcTab, 35);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/test_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/test_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/test_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/test_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/test_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
