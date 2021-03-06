function [par, metaPar, txtPar] = pars_init_Salmo_salar_wild(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 5383;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.7346;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.029869;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.87281;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 68.313;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5025;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 6.733e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 8.102e+04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.630e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.386e-49;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 10;         free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 5.574e+01; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.L0_nor = 4.8;     free.L0_nor = 0;   units.L0_nor = 'cm';      label.L0_nor = 'initial length in Rowe1990'; 
par.L0_scoAa = 6.5;   free.L0_scoAa = 0;   units.L0_scoAa = 'cm';    label.L0_scoAa = 'initial length in Rowe1990'; 
par.L0_scoS = 3.75;   free.L0_scoS = 0;   units.L0_scoS = 'cm';     label.L0_scoS = 'initial length in Nicieza1994 scotland data'; 
par.L0_spa = 3.77;    free.L0_spa = 0;   units.L0_spa = 'cm';      label.L0_spa = 'initial length in Nicieza1994'; 
par.L0_usa = 19.7;    free.L0_usa = 0;   units.L0_usa = 'cm';      label.L0_usa = 'initial length in Rottiers1993'; 
par.POHtoTOT = 1.3;   free.POHtoTOT = 0;   units.POHtoTOT = '-';     label.POHtoTOT = 'conversion from postorbital-hypural length to total length'; 
par.SNFtoTOT = 1.06;  free.SNFtoTOT = 0;   units.SNFtoTOT = '-';     label.SNFtoTOT = 'conversion from fork length to total length'; 
par.W0_McCarthy2003 = 0.28;  free.W0_McCarthy2003 = 0;   units.W0_McCarthy2003 = 'g';  label.W0_McCarthy2003 = 'Initial Wet weight in McCarthy2003'; 
par.del_M = 0.17141;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_LWw = 1;        free.f_LWw = 0;   units.f_LWw = '-';        label.f_LWw = 'scaled functional response for 1-var data'; 
par.f_nat = 0.7;      free.f_nat = 0;   units.f_nat = '-';        label.f_nat = 'scaled functional response for 0-var data, when reared in natural condition (not ad lib)'; 
par.f_scoAa = 0.5;    free.f_scoAa = 0;   units.f_scoAa = '-';      label.f_scoAa = 'scaled functional response in Rowe1990 - 1';
par.f_tL = 1;         free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for 1-var data'; 
par.f_tL_nat = 0.7;   free.f_tL_nat = 0;   units.f_tL_nat = '-';     label.f_tL_nat = 'scaled functional response for 1-var data, natural f'; 
par.f_tWeVe_tWeYe = 1;  free.f_tWeVe_tWeYe = 0;   units.f_tWeVe_tWeYe = '-';  label.f_tWeVe_tWeYe = 'scaled functional response for embryo growth'; 
par.t0_scoAa = 270;   free.t0_scoAa = 0;   units.t0_scoAa = 'cm';    label.t0_scoAa = 'initial time since birth in Rowe1990'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
