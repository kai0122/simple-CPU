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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002484851782_3424634258_init();
    work_m_00000000003883018569_2091391583_init();
    work_m_00000000002481737148_2513369863_init();
    work_m_00000000003883018569_0850835919_init();
    work_m_00000000004257517207_1719110223_init();
    work_m_00000000003911485759_1817558700_init();
    work_m_00000000003911485759_3232891280_init();
    work_m_00000000003398323573_1671813300_init();
    work_m_00000000003911485759_2456658499_init();
    work_m_00000000003327005604_0886308060_init();
    work_m_00000000000114529247_3258266500_init();
    work_m_00000000000517522798_3838344542_init();
    work_m_00000000004175342966_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004175342966_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
