function [prdData, info] = predict_Salmo_salar_wild(par, data, auxData)
  

%par=parPets.(pets{1})
%par=q
%data=data.(pets{1})
%auxData= auxData.(pets{1})
  % unpack par, data, auxData
  cPar = parscomp_st(par); %%%%Computes compound parameters
  vars_pull(par); %%%unpacking of structures
  vars_pull(cPar);  %%%unpacking of structures
  vars_pull(data);  %%%unpacking of structures
  vars_pull(auxData);%%%unpacking of structures
  
%   if E_Hh > E_Hb
%       info = 0; prdData = []; return
%   end
  
% compute temperature correction factors for each stage
% TC_ah = tempcorr(temp.ah_nor2013, T_ref, T_A); 
% TC_ah_4_eng = tempcorr(temp.ah_4_eng, T_ref, T_A); 
% TC_ah_4_nor = tempcorr(temp.ah_4_nor, T_ref, T_A); 
% TC_ah_scocanmix = tempcorr(temp.ah_scocanmix, T_ref, T_A); 
% TC_ah_05_fnor = tempcorr(temp.ah_05_fnor, T_ref, T_A); 
% TC_ah_sco4to13 = tempcorr(temp.ah_sco4to13, T_ref, T_A); % a modifier

TC_ab_4_nor = tempcorr(temp.ab_4_nor, T_ref, T_A);
TC_ab_scocanmix =  tempcorr(temp.ab_scocanmix, T_ref, T_A);
%   TC_ts = tempcorr(temp.ts, T_ref, T_A);
%   TC_ts = tempcorr(temp.as_norM, T_ref, T_A);
%   TC_tp = tempcorr(temp.tp, T_ref, T_A);
TC_tp_gbr = tempcorr(temp.tp_gbr, T_ref, T_A);
TC_tp_ice = tempcorr(temp.tp_ice, T_ref, T_A);
TC_tp_nor = tempcorr(temp.tp_nor, T_ref, T_A);
TC_tp_fraspa = tempcorr(temp.tp_fraspa, T_ref, T_A);
TC_tp_ire = tempcorr(temp.tp_ire, T_ref, T_A);
TC_tp_canm = tempcorr(temp.tp_canm, T_ref, T_A);
TC_tp_canf = tempcorr(temp.tp_canf, T_ref, T_A);
TC_tp_rus = tempcorr(temp.tp_rus, T_ref, T_A);
TC_tp_norI = tempcorr(temp.tp_norI, T_ref, T_A);
TC_tp_ire2 = tempcorr(temp.tp_ire2, T_ref, T_A);
%   TC_am = tempcorr(temp.am, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_am_sco = tempcorr(temp.am_sco, T_ref, T_A);
TC_am_rus = tempcorr(temp.am_rus, T_ref, T_A);
%   TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
TC_Ri_sco = tempcorr(temp.Ri_sco, T_ref, T_A); 
TC_Ri_spa  = tempcorr(temp.Ri_spa, T_ref, T_A); 
TC_Ri_can = tempcorr(temp.Ri_can, T_ref, T_A); 
TC_Ri_nor = tempcorr(temp.Ri_nor, T_ref, T_A); 


%   TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];  %%%%%values computed l 4 %we keep j because it's real metam., not smoltif.
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %%%%%%%%%% Obtains scaled ages at metamorphosis, puberty, birth and the scaled lengths at these ages 
  [tau_j_nat, tau_p_nat, tau_b_nat, l_j_nat, l_p_nat, l_b_nat, l_i_nat, rho_j_nat, rho_B_nat, info_nat] = get_tj(pars_tj, f_nat); %%%%%%%%%% Obtains scaled ages at metamorphosis, puberty, birth and the scaled lengths at these ages 
  
  if info~=1||info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = []; return;
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = p_Am * U_E0;            % J, initial energy content
  Wd_0 = E_0 * w_E/ mu_E;      % g, initial dry weight 
  V_0 = Wd_0/ d_E;             % cm^3, egg volume 
  %ajouter calcul Wet weight Ww0
  %same for natural f
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0_nat = initial_scaled_reserve(f_nat, pars_UE0); % d.cm^2, initial scaled reserve
  E_0_nat = p_Am * U_E0_nat;            % J, initial energy content
  Wd_0_nat = E_0_nat * w_E/ mu_E;      % g, initial dry weight 
  V_0_nat = Wd_0_nat/ d_E;             % cm^3, egg volume 
  
  
  % hatch   
  %  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
    %same for natural f
   % [U_H-nat aUL_nat] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0_nat 1e-10], [], kap, v, k_J, g, L_m);
   %  a_h_4_eng = aUL-nat(2,1); aT_h = a_h/ TC_ah_4_eng; % d, age at hatch at f and T
   %  a_h_4_nor = aUL-nat(2,1); aT_h = a_h/ TC_ah_4_nor; % d, age at hatch at f and T
   %  a_h_scocanmix = aUL-nat(2,1); aT_h = a_h/ TC_ah_scocanmix; % d, age at hatch at f and T
   %  a_h_05_fnor = aUL-nat(2,1); aT_h = a_h/ TC_ah_05_fnor; % d, age at hatch at f and T
   %  a_h_sco4to13 = aUL-nat(2,1); aT_h = a_h/ TC_ah_sco4to13 ; % d, age at hatch at f and T

%ajouter Lh
%ajouter Wwh

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f    %%%%%%% del_M : shape coefficient
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f  %%%%%%%%%% structural volume volume at birth* (scaled length + scaled reserve density*contrib of dry mass reserve to toal dry biomass).
%   aT_b_AqG = tau_b/ k_M/ TC_abAqG;           % d, age at birth at f and T  %%%%%% scaled age at birth / somatic maitnenance rate coef / temp correction.
%   aT_b_M = tau_b/ k_M/ TC_abM;
  %same for natural f
  L_b_nat = L_m * l_b_nat;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
  Lw_b_nat = L_b_nat/ del_M;                % cm, physical length at birth at f    %%%%%%% del_M : shape coefficient
  Ww_b_nat = L_b_nat^3 * (1 + f_nat * ome);       % g, wet weight at birth at f  %%%%%%%%%% structural volume volume at birth* (scaled length + scaled reserve density*contrib of dry mass reserve to toal dry biomass).
  aT_b_4_nor = tau_b_nat/ k_M/ TC_ab_4_nor;   
  aT_b_scocanmix = tau_b_nat/ k_M/ TC_ab_scocanmix;   
  
  
  
%   % smoltification 
%  all calculation are wrong because they are meant for  metamorphosis
%   L_j = L_m * l_j;                  % cm, structural length at metam
%   Lw_j = L_j/ del_M;                % cm, physical length at metam at f
%   Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
%   % tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
%   tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
%  calculation Wws


  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  %same for natural f
  L_p_nat = L_m * l_p_nat;                  % cm, structural length at puberty at f
  Lw_p_nat = L_p_nat/ del_M;                % cm, physical length at puberty at f
  Ww_p_nat = L_p_nat^3 *(1 + f_nat * ome);        % g, wet weight at puberty 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  tT_p_gbr = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_gbr;   % d, time since birth at puberty at f and T
  tT_p_ice = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_ice;   % d, time since birth at puberty at f and T
  tT_tp_nor = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_nor;   % d, time since birth at puberty at f and T
  tT_tp_fraspa = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_fraspa;   % d, time since birth at puberty at f and T
  tT_tp_ire = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_ire;   % d, time since birth at puberty at f and T
  tT_tp_canm = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_canm;   % d, time since birth at puberty at f and T
  tT_tp_canf = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_canf;   % d, time since birth at puberty at f and T
  tT_tp_rus = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_rus;   % d, time since birth at puberty at f and T
  tT_tp_norI = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_norI;   % d, time since birth at puberty at f and T
  tT_tp_ire2 = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_ire2;   % d, time since birth at puberty at f and T

  
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
  %same for natural f
  L_i_nat = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_nat = L_i_nat/ del_M;                % cm, ultimate physical length at f
  Ww_i_nat = L_i_nat^3 * (1 + f_nat * ome);       % g, ultimate wet weight
  
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R, L_b);
%    RT_i = TC_Ri * R_i;% #/d, max reprod rate  
%same for natural f
   pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i_nat, UE0_nat, Lb_nat, Lj_nat, Lp_nat, info_nat]  =  reprod_rate_j(L_i_nat, f_nat, pars_R, L_b_nat);
   RT_i_sco = TC_Ri_sco * R_i_nat;% #/d, max reprod rate  
   RT_i_spa = TC_Ri_spa * R_i_nat;% #/d, max reprod rate  
   RT_i_can = TC_Ri_can * R_i_nat;% #/d, max reprod rate  
   RT_i_nor = TC_Ri_nor * R_i_nat;% #/d, max reprod rate  
      
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    %same for natural f
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m_nat = get_tm_s(pars_tm, f_nat, l_b_nat);      % -, scaled mean life span at T_ref
  aT_m_nat = t_m_nat/ k_M/ TC_am;               % d, mean life span at T
  aT_am_sco = t_m_nat/ k_M/ TC_am_sco;               % d, mean life span at T
  aT_am_rus = t_m_nat/ k_M/ TC_am_rus;               % d, mean life span at T
  
  
  % pack to output
 % prdData.ah_nor2013 = aT_h;
  % prdData.ah_4_eng = aT_h_4_eng;
  % prdData.ah_4_nor = aT_h_4_nor;
  % prdData.ah_scocanmix = aT_h_scocanmix;
  % prdData.ah_05_fnor = aT_h_05_fnor;
  % prdData.ah_sco4to13 = aT_h_sco4to13; % a modifier
 prdData.ab_4_nor = aT_b_4_nor;
 prdData.ab_scocanmix= aT_b_scocanmix;
% prdData.ts = tT_s;
%   prdData.aj_norM = tT_j;
% prdData.tp = tT_p;
  prdData.tp_gbr = tT_p_gbr;
  prdData.tp_ice = tT_p_ice;
  prdData.tp_nor = tT_tp_nor;
  prdData.tp_fraspa = tT_tp_fraspa;
  prdData.tp_ire = tT_tp_ire;
  prdData.tp_canm = tT_tp_canm;
  prdData.tp_canf = tT_tp_canf;
  prdData.tp_rus = tT_tp_rus;
  prdData.tp_norI = tT_tp_norI;
  prdData.tp_ire2 = tT_tp_ire2;
  prdData.am = aT_m_nat;
  prdData.am_sco = aT_am_sco;
  prdData.am_rus = aT_am_rus;
% prdData.Lh = Lw_h; %manque calcul Lh
% prdData.Lh_Can2 = Lw_Lh_Can2;
% prdData.Lh_Can4 = Lw_Lh_Can4;
% prdData.Lh_Can6 = Lw_Lh_Can6;
% prdData.Lh_Can8 = Lw_h_Can8;
% prdData.Lh_Can10 = Lw_h_Can10;
% prdData.Lh_Can12 = Lw_h_Can12;
% prdData.Lh_CanM4 = Lw_h_CanM4;
% prdData.Lh_CanM6 = Lw_h_CanM6;
% prdData.Lh_CanM8 = Lw_h_CanM8;
% prdData.Lh_CanM10 = Lw_h_CanM10;
% prdData.Lh_CanM12 = Lw_h_CanM12;
% prdData.Lh_CanP = Lw_h_CanP;
% prdData.Lh_Rus = Lw_h_Rus;
% prdData.Lh_scocanmix = Lw_h_scocanmix;


  prdData.Lb_Sco1SWM = Lw_b_nat;
  prdData.Lb_Sco2SWM = Lw_b_nat;
  prdData.Lb_NorF2011 = Lw_b_nat;
  prdData.Lb_NorF2012 = Lw_b_nat;
  prdData.Lb_NorF2013 = Lw_b_nat;
  prdData.Lb_NorV2013 = Lw_b_nat;
  prdData.Lb_Can2D = Lw_b_nat;
  prdData.Lb_Can6D = Lw_b_nat;
  prdData.Lb_Can12D = Lw_b_nat;
  prdData.Lb_Can4M = Lw_b_nat;
  prdData.Lb_Can6M = Lw_b_nat;
  prdData.Lb_Can8M = Lw_b_nat;
   prdData.Lb_Can10M = Lw_b_nat;
  prdData.Lb_Can12M = Lw_b_nat;
  prdData.Lb_CanP = Lw_b_nat;
  prdData.Lb_Rus = Lw_b_nat;
  prdData.Lb_Usa = Lw_b_nat;
  prdData.Lb_ScoA = Lw_b_nat;

%   prdData.Ls = Lw_s;
  prdData.Lp_norS = Lw_p_nat;
  prdData.Lp_sco = Lw_p_nat;
  prdData.Lp_norI  = Lw_p_nat;
  prdData.Lp_spaNM = Lw_p_nat;
  prdData.Lp_canM = Lw_p_nat;
  prdData.Lp_canR = Lw_p_nat;
  prdData.Lp_norSf = Lw_p_nat;
  prdData.Lp_norSm = Lw_p_nat;
  prdData.Lp_rus = Lw_p_nat;
  prdData.Lp_usa = Lw_p_nat;
  prdData.Lp_norI2 = Lw_p_nat;

  prdData.Li_ScoMax = Lw_i_nat;
  prdData.Li_NorFM = Lw_i_nat;
  prdData.Li_NorFF = Lw_i_nat;
  prdData.Li_NorVM = Lw_i_nat;
  prdData.Li_NorVF = Lw_i_nat;
  prdData.Li_NorAM = Lw_i_nat;
  prdData.Li_NorAF = Lw_i_nat;
  prdData.Li_norI = Lw_i_nat;
  prdData.Li_spaNM = Lw_i_nat;
  prdData.Li_canBS = Lw_i_nat;
  prdData.Li_rusN = Lw_i_nat;
  prdData.Li_rusO = Lw_i_nat;
  prdData.Li_rusS = Lw_i_nat;
  prdData.Li_usa = Lw_i_nat;

 prdData.V0_nor  = V_0_nat;
 prdData.V0_can  = V_0_nat;
 prdData.V0_norF2011 = V_0_nat;
 prdData.V0_norF2012  = V_0_nat;
 prdData.V0_rus  = V_0_nat;
 prdData.V0_sco  = V_0_nat;
 prdData.V0_usa  = V_0_nat;
 prdData.V0_scoBC  = V_0_nat;
 prdData.V0_canD  = V_0_nat;
 prdData.V0_fnor  = V_0_nat;
  %manque calcul Ww0
% prdData.Ww0_ScoB  = Ww0_nat;
% prdData.Ww0_ScoB2  = Ww0_nat;
% prdData.Ww0_ScoA  = Ww0_nat;
% prdData.Ww0_Fra  = Ww0_nat;
% prdData.Ww0_Nor  = Ww0_nat;
% prdData.Ww0_SweS  = Ww0_nat;
% prdData.Ww0_SweL  = Ww0_nat;
% prdData.Ww0_SweU  = Ww0_nat;
% prdData.Ww0_SweV  = Ww0_nat;
% prdData.Ww0_RusN  = Ww0_nat;
% prdData.Ww0_RusU  = Ww0_nat;
% prdData.Ww0_RusNe  = Ww0_nat;
% prdData.Ww0_Canaf  = Ww0_nat;
% prdData.Ww0_norbf  = Ww0_nat;

%  prdData.Wwh_Eng = Ww_h;
%  prdData.Wwh_Can = Ww_h;
%  prdData.Wwh_Rus = Ww_h;
%  prdData.Wwh_Sco = Ww_h;
%  prdData.Wwh_FNor = Ww_h;

 prdData.Wwb_Sco1SWM = Ww_b_nat;
 prdData.Wwb_Sco2SWM = Ww_b_nat;
 prdData.Wwb_Can = Ww_b_nat;
 prdData.Wwb_Rus = Ww_b_nat; 
%   prdData.WwsI = Ww_s;
%   prdData.WwsS = Ww_s;
 prdData.Wwp_norf = Ww_p_nat;
 prdData.Wwp_norm = Ww_p_nat;
 prdData.Wwp_rus = Ww_p_nat;
 prdData.Wwp_usa = Ww_p_nat;
 
 prdData.Wwi = Ww_i_nat;
 prdData.Wwi_NorFM = Ww_i_nat;
 prdData.Wwi_NorFF = Ww_i_nat;
 prdData.Wwi_NorVM = Ww_i_nat;
 prdData.Wwi_NorVF = Ww_i_nat;
 prdData.Wwi_NorAM = Ww_i_nat;
 prdData.Wwi_NorAF = Ww_i_nat;
 prdData.Wwi_RusN = Ww_i_nat;
 prdData.Wwi_RusO = Ww_i_nat;
 prdData.Wwi_RusS = Ww_i_nat;
 prdData.Wwi_usa = Ww_i_nat;
 prdData.Wwi_FNor = Ww_i_nat;
 
  prdData.E0_Canaf = E_0_nat; 
  prdData.E0_Nor = E_0_nat; 
 
%  prdData.R_scoNE = RT_i_nat;
%  prdData.R_scoM = RT_i_nat;
%  prdData.R_scoL = RT_i_nat;
%  prdData.R_scoB = RT_i_nat;
%  prdData.R_scoG = RT_i_nat;
%  prdData.R_scoD = RT_i_nat;
%  prdData.R_scoC = RT_i_nat;
%  prdData.R_nor = RT_i_nat;
%  prdData.R_spa = RT_i_nat;
%  prdData.R_canM = RT_i_nat;
%  prdData.R_canR = RT_i_nat;
%  prdData.R_usa = RT_i_nat;

prdData.Ri_sco = RT_i_sco ;
prdData.Ri_spa = RT_i_spa ;
prdData.Ri_can = RT_i_can ;
prdData.Ri_nor = RT_i_nor ;


 
  % uni-variate data
  
    % temperature-age at hatching
%compléter

  % temperature-age at birth
TC_TabC = tempcorr(TabC(:,1), T_ref, T_A); 
EabC = tau_b_nat/ k_M ./ TC_TabC;        % d, age at birth at f and T

TC_Tab_sco = tempcorr(Tab_sco(:,1), T_ref, T_A); 
Eab_sco = tau_b_nat/ k_M ./ TC_Tab_sco;        % d, age at birth at f and T



% temperature - Length at hatching




  
    % t-Wwe and t-WwVe
  % temperature 12°C
  % compute temperature correction factors
%   TC12 = tempcorr(temp.tWwe_norT12, T_ref, T_A);
%   vT12 = v * TC12; 
%   kT12_J = TC12 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT12_E_Am = TC12 * J_E_Am;
% %   UT12_E0 = TC12 * U_E0;
%   UT12_E0_nat = TC12 * U_E0_nat;
%   
  % tW-data embryo
%   t = [0; tWwe_norT12(:,1)]; 
 % [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT12, kT12_J, g, L_m); 
%   [t, LUH_nat] = ode45(@dget_LUH, t, [1e-10 UT12_E0_nat 0], [], kap, vT12, kT12_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   LUH_nat(1,:) = [];
%   L = LUH(:,1); % cm, structural length
%   L_nat = LUH_nat(:,1);
%   EWw_e12 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
%   EWw_e12 = L_nat .^ 3 * (1 + f_tWeVe_tWeYe * w); 

   % tWV-data yolk
%   M_E = LUH(:,2) * JT12_E_Am;
%   M_E_nat = LUH_nat(:,2) * JT12_E_Am;
%   
%   EV_e12 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
%


    % temperature 10°C
  % compute temperature correction factors
%   TC10 = tempcorr(temp.tWwe_norT12, T_ref, T_A);
%   vT10 = v * TC10; 
%   kT10_J = TC10 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT10_E_Am = TC10 * J_E_Am;
% %   UT10_E0 = TC10 * U_E0;
%   UT10_E0_nat = TC10 * U_E0_nat;
%   
  % tW-data embryo
%   t = [0; tWwe_norT10(:,1)]; 
 % [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT10_E0 0], [], kap, vT10, kT10_J, g, L_m); 
%   [t, LUH_nat] = ode45(@dget_LUH, t, [1e-10 UT10_E0_nat 0], [], kap, vT10, kT10_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   LUH_nat(1,:) = [];
%   L = LUH(:,1); % cm, structural length
%   L_nat = LUH_nat(:,1);
%   EWw_e10 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
%   EWw_e10 = L_nat .^ 3 * (1 + f_tWeVe_tWeYe * w); 

   % tWV-data yolk
%   M_E = LUH(:,2) * JT10_E_Am;
%   M_E_nat = LUH_nat(:,2) * JT10_E_Am;
%   
%   EV_e10 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
%

      % temperature 8°C
  % compute temperature correction factors
%   TC8 = tempcorr(temp.tWwe_norT8, T_ref, T_A);
%   vT8 = v * TC8; 
%   kT8_J = TC8 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT8_E_Am = TC8 * J_E_Am;
% %   UT8_E0 = TC8 * U_E0;
%   UT8_E0_nat = TC8 * U_E0_nat;
%   
  % tW-data embryo
%   t = [0; tWwe_norT8(:,1)]; 
 % [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT8_E0 0], [], kap, vT8, kT8_J, g, L_m); 
%   [t, LUH_nat] = ode45(@dget_LUH, t, [1e-10 UT8_E0_nat 0], [], kap, vT8, kT8_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   LUH_nat(1,:) = [];
%   L = LUH(:,1); % cm, structural length
%   L_nat = LUH_nat(:,1);
%   EWw_e8 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
%   EWw_e8 = L_nat .^ 3 * (1 + f_tWeVe_tWeYe * w); 

   % tWV-data yolk
%   M_E = LUH(:,2) * JT8_E_Am;
%   M_E_nat = LUH_nat(:,2) * JT8_E_Am;
%   
%   EV_e8 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
%

      % temperature 6°C
  % compute temperature correction factors
%   TC6 = tempcorr(temp.tWwe_norT8, T_ref, T_A);
%   vT6 = v * TC6; 
%   kT6_J = TC8 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT6_E_Am = TC6 * J_E_Am;
% %   UT6_E0 = TC6 * U_E0;
%   UT6_E0_nat = TC6 * U_E0_nat;
%   
  % tW-data embryo
%   t = [0; tWwe_norT6(:,1)]; 
 % [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT6_E0 0], [], kap, vT6, kT6_J, g, L_m); 
%   [t, LUH_nat] = ode45(@dget_LUH, t, [1e-10 UT6_E0_nat 0], [], kap, vT6, kT6_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   LUH_nat(1,:) = [];
%   L = LUH(:,1); % cm, structural length
%   L_nat = LUH_nat(:,1);
%   EWw_e6 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
%   EWw_e6 = L_nat .^ 3 * (1 + f_tWeVe_tWeYe * w); 

   % tWV-data yolk
%   M_E = LUH(:,2) * JT6_E_Am;
%   M_E_nat = LUH_nat(:,2) * JT6_E_Am;
%   
%   EV_e6 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
%



%   % time-length %%% _usa f=ad lib
  TC_tL_usa = tempcorr(temp.tL_usa, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
  if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_usa; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_usa(tL_usa(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_usa(tL_usa(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_usa = [L_bj; L_ji]/ del_M; % cm, total length
% 

%   % time-length %%% _norI f= natural
  TC_tL_norI = tempcorr(temp.tL_norI, T_ref, T_A);
 [tau_j_nat, tau_p_nat, tau_b_nat, l_j_nat, l_p_nat, l_b_nat, l_i_nat, rho_j_nat, rho_B_nat,info_nat] = get_tj(pars_tj, f_tL_nat);
  if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norI; %%%km corrected
  rT_j = rho_j_nat * kT_M; %%%rhoj corrected
  rT_B = rho_B_nat * kT_M; %%%%rhoB corrected
  tT_j = (tau_j_nat - tau_b_nat)/ kT_M;   
  L_b = L_m * l_b_nat; L_j = L_m * l_j_nat; L_i = L_m * l_i_nat;
  L_bj = L_b * exp(tL_norI(tL_norI(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norI(tL_norI(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norI = [L_bj; L_ji]/ del_M; % cm, total length
% 

%   % time-length %%% _norSu4 f= ad lib
  TC_tL_norSu4 = tempcorr(temp.tL_norSu4, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norSu4; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norSu4(tL_norSu4(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norSu4(tL_norSu4(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norSu4 = [L_bj; L_ji]/ del_M; % cm, total length
% 


%   % time-length %%% _norSu5 f= ad lib
  TC_tL_norSu5 = tempcorr(temp.tL_norSu5, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norSu5; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norSu5(tL_norSu5(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norSu5(tL_norSu5(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norSu5 = [L_bj; L_ji]/ del_M; % cm, total length
% 


%   % time-length %%% _norSu7 f= ad lib
  TC_tL_norSu7 = tempcorr(temp.tL_norSu7, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norSu7; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norSu7(tL_norSu7(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norSu7(tL_norSu7(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norSu7 = [L_bj; L_ji]/ del_M; % cm, total length
% 

%   % time-length %%% _norSu f= ad lib
  TC_tL_norSu = tempcorr(temp.tL_norSu, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norSu7; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norSu(tL_norSu(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norSu(tL_norSu(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norSu = [L_bj; L_ji]/ del_M; % cm, total length
% 

%   % time-length %%% _norA4 f= ad lib
  TC_tL_norSu = tempcorr(temp.tL_norSu, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_norSu7; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norSu(tL_norSu(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norSu(tL_norSu(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norSu = [L_bj; L_ji]/ del_M; % cm, total length
% 


%   
%   % length-weight   %%%%
%   EWw_AqG = (LWw_AqG(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
%   EWw_norM = (LWw_norM(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight


  % pack to output
  
  %manque calcul Tah
%   prdData.Tah_dennis = Tah_dennis;
%   prdData.Tah_Mirachimi = Tah_Mirachimi;
%   prdData.Tah_nor = Tah_nor;
%   prdData.Tah_norF = Tah_norF;
%   prdData.Tah_norV = Tah_norV;
%   prdData.Tah_norA = Tah_norA;
%   prdData.Tah_normix = Tah_normix;
%   prdData.Tah_sco = Tah_sco;
prdData.TabC = EabC;
prdData.Tab_sco = Eab_sco;
% prdData.TLb = TLb;
%   prdData.tWwe_norT12 = EWw_eT12;
%   prdData.tWwe_T10 = EWw_eT10;
%   prdData.tWwe_T8 = EWw_eT8;
 prdData.tL_usa = ELw_usa;
 prdData.tL_norI = ELw_norI;
 prdData.tL_norSu4 = ELw_norI;
prdData.tL_norSu5 = ELw_norI;
prdData.tL_norSu7 = ELw_norI;
%   %lack of Tww juvenile and seawater
%   prdData.LWw_AqG = EWw_AqG;
%   prdData.LWw_norM = EWw_norM;
%   %lack of T-JX
