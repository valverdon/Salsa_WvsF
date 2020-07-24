function [par, metaPar, txtPar] = pars_init_Salmo_salar_farm(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 5383;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; %on va l'avoir
par.z = 4.841;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; %need data bouffz capacité à trouver la nourriture.
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; %compliqué a estimer
par.v = 0.029802;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.41987;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; % compliqué  à estimer
par.p_M = 13.9313;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; %suppose peu de thermoregulation et osmose. ! hypothèse forte
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient';  %pe estimable
par.E_G = 5025;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure';  %pe estimable
par.E_Hb = 6.169e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.014e+05; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.112e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.398e-25;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 10;         free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = par.E_Hb*3/4; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.del_M = 0.17853;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.SNFtoTOT = 1.06; free.SNFtoTOT = 0; units.SNFtoTOT = '-'; label.SNFtoTOT = 'conversion from fork length to total length';
par.POHtoTOT = 1.3; free.POHtoTOT = 0; units.POHtoTOT = '-'; label.POHtoTOT = 'conversion from postorbital-hypural length to total length';
par.f = 1;          free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_nat = 0.7;          free.f_nat     = 0;   units.f_nat = '-';            label.f_nat = 'scaled functional response for 0-var data, when reared in natural condition (not ad lib)'; 
par.f_LWw = 1;  free.f_LWw = 0;   units.f_LWw = '-';        label.f_LWw = 'scaled functional response for 1-var data'; 
par.f_tL = 1;  free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for 1-var data'; 
par.f_tWeVe_tWeYe = 1;  free.f_tWeVe_tWeYe = 0; units.f_tWeVe_tWeYe = '-';  label.f_tWeVe_tWeYe = 'scaled functional response for embryo growth';
par.L0_Ire = 15.6; free.L0_Ire = 0; units.L0_Ire = 'cm'; label.L0_Ire = 'initial length in UnPub data';
par.L0_norM2003 = 17.87; free.L0_norM2003 = 0; units.L0_norM2003 = 'cm'; label.L0_norM2003 = 'initial length in Glover 2009 - 2003 experiment';
par.L0_norM2004 = 13.96; free.L0_norM2004 = 0; units.L0_norM2004 = 'cm'; label.L0_norM2004 = 'initial length in Glover 2009 - 2004 experiment';
par.W0_Hosfeld2009 = 71.94; free.W0_Hosfeld2009 = 0; units.W0_Hosfeld2009 = 'g'; label.W0_Hosfeld2009 = 'initial wet weight in Hosfeld 2009';
par.W0_Handeland1998 = (51.9+54.6)/2; free.W0_Handeland1998 = 0; units.W0_Handeland1998 = 'g'; label.W0_Handeland1998 = 'initial wet weight in Handeland 1998';
par.W0_Handeland2008 = (75.2+74.5+74.5+76.6)/4; free.W0_Handeland2008 = 0; units.W0_Handeland2008 = 'g'; label.W0_Handeland2008 = 'initial wet weight in Handeland 2008';

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
