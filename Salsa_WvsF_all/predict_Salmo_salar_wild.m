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
  
  if E_Hh > E_Hb
      info = 0; prdData = []; return
  end
  
% compute temperature correction factors for each stage
TC_Tah_Dennis_Peterson1977 = tempcorr(data.Tah_Dennis_Peterson1977(:,1), T_ref, T_A); 
TC_Tah_Mirachimi_Peterson1977 = tempcorr(data.Tah_Mirachimi_Peterson1977(:,1), T_ref, T_A); 
TC_Tah_Wallace1988 = tempcorr(data.Tah_Wallace1988(:,1), T_ref, T_A); 
TC_Tah_norF = tempcorr(data.Tah_norF(:,1), T_ref, T_A); 
TC_Tah_norV = tempcorr(data.Tah_norV(:,1), T_ref, T_A); 
TC_Tah_norA = tempcorr(data.Tah_norA(:,1), T_ref, T_A); 
TC_Tah_Berg1999 = tempcorr(data.Tah_Berg1999(:,1), T_ref, T_A); 
TC_Tah_Johnston1997 = tempcorr(data.Tah_Johnston1997(:,1), T_ref, T_A); 

TC_TabC = tempcorr(data.TabC(:,1), T_ref, T_A);
TC_Tab_sco =  tempcorr(data.Tab_sco(:,1), T_ref, T_A);

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
% TC_am_sco = tempcorr(temp.am_sco, T_ref, T_A);
% TC_am_rus = tempcorr(temp.am_rus, T_ref, T_A);
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
  %for parents in natural conditions
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0_nat 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); % time between fertilization and hatching at f and T_ref
  t_hb = aUL(3,1) - aUL(2,1); % time between hatching and birth at f and T_ref
  aT_h_Dennis_Peterson1977 = a_h ./ TC_Tah_Dennis_Peterson1977;
  aT_h_Mirachimi_Peterson1977 = a_h ./ TC_Tah_Mirachimi_Peterson1977;
  aT_h_Wallace1988 = a_h ./ TC_Tah_Wallace1988;
  aT_h_norF = a_h ./ TC_Tah_norF;
  aT_h_norV = a_h ./ TC_Tah_norV;
  aT_h_norA = a_h ./ TC_Tah_norA;
  aT_h_Berg1999 = a_h ./ TC_Tah_Berg1999;
  aT_h_Johnston1997 = a_h ./ TC_Tah_Johnston1997;  
  L_h = aUL(2,3); % cm, structural length at hatching at f
  Lw_h = L_h/ del_M; % cm, physical length at hatching at f
  Ww_h = L_h^3 * (1 + f_nat * ome); % g, wet weight at hatching at f natural


  % birth
  a_b = tau_b_nat/ k_M; % age at birth at f_nat and T_ref 
   % Check that ages at birth are consistent between get_tj and dget_aul
  if (((a_b-aUL(3,1))/a_b)^2 > 0.0001)
      a_b
      aaUL(3,1)
      disp('Inconsistent values of age at birth');
  end
%   aT_b_norM = aT_h_norM + (t_hb / TC_abM_feed); % if change of temperature at hatching

  aT_bC  = a_b./ TC_TabC ; % if change of temperature at first feeding
  aT_b_sco  = a_b./ TC_Tab_sco ; % if change of temperature at first feeding

  L_b = L_m * l_b_nat;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
    % Check that lengths at birth are consistent between get_tj and dget_aul
  if (((L_b-aUL(3,3))/L_b)^2 > 0.0001)
      L_b
      aUL(3,3)
      disp('Inconsistent values of L_b');
  end
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f    %%%%%%% del_M : shape coefficient
  Ww_b = L_b^3 * (1 + f_nat * ome);       % g, wet weight at birth at f  %%%%%%%%%% structural volume volume at birth* (scaled length + scaled reserve density*contrib of dry mass reserve to toal dry biomass).
%   aT_b_AqG = tau_b/ k_M/ TC_abAqG;           % d, age at birth at f and T  %%%%%% scaled age at birth / somatic maitnenance rate coef / temp correction.
%   aT_b_M = tau_b/ k_M/ TC_abM;

  
  
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
%     RT_i = TC_Ri * R_i_nat;% #/d, max reprod rate  
%same for natural f
   pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i_nat, UE0_nat, Lb_nat, Lj_nat, Lp_nat, info_nat]  =  reprod_rate_j(L_i_nat, f_nat, pars_R, L_b);
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
%   aT_am_sco = t_m_nat/ k_M/ TC_am_sco;               % d, mean life span at T
%   aT_am_rus = t_m_nat/ k_M/ TC_am_rus;               % d, mean life span at T
  

  % pack to output
prdData.Tah_Dennis_Peterson1977 = aT_h_Dennis_Peterson1977;
prdData.Tah_Mirachimi_Peterson1977 = aT_h_Mirachimi_Peterson1977;
prdData.Tah_Wallace1988 = aT_h_Wallace1988;
prdData.Tah_norF = aT_h_norF;
prdData.Tah_norV = aT_h_norV;
prdData.Tah_norA = aT_h_norA;
prdData.Tah_Berg1999 = aT_h_Berg1999;
prdData.Tah_Johnston1997 = aT_h_Johnston1997;

 prdData.TabC = aT_bC;
 prdData.Tab_sco= aT_b_sco;
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
%   prdData.am_sco = aT_am_sco;
%   prdData.am_rus = aT_am_rus;
% prdData.Lh = Lw_h; %manque calcul Lh
prdData.Lh_Can2 = Lw_h/SNFtoTOT;
prdData.Lh_Can4 = Lw_h/SNFtoTOT;
prdData.Lh_Can6 = Lw_h/SNFtoTOT;
prdData.Lh_Can8 = Lw_h/SNFtoTOT;
prdData.Lh_Can10 = Lw_h/SNFtoTOT;
prdData.Lh_Can12 = Lw_h/SNFtoTOT;
prdData.Lh_CanM4 = Lw_h/SNFtoTOT;
prdData.Lh_CanM6 = Lw_h/SNFtoTOT;
prdData.Lh_CanM8 = Lw_h/SNFtoTOT;
prdData.Lh_CanM10 = Lw_h/SNFtoTOT;
prdData.Lh_CanM12 = Lw_h/SNFtoTOT;
prdData.Lh_CanP = Lw_h/SNFtoTOT;
prdData.Lh_Rus = Lw_h;
prdData.Lh_scocanmix = Lw_h/SNFtoTOT;

  prdData.Lb_Sco1SWM = Lw_b/SNFtoTOT;
  prdData.Lb_Sco2SWM = Lw_b/SNFtoTOT;
  prdData.Lb_NorF2011 = Lw_b/SNFtoTOT;
  prdData.Lb_NorF2012 = Lw_b/SNFtoTOT;
  prdData.Lb_NorF2013 = Lw_b/SNFtoTOT;
  prdData.Lb_NorV2013 = Lw_b/SNFtoTOT;
  prdData.Lb_Can2D = Lw_b/SNFtoTOT;
  prdData.Lb_Can6D = Lw_b/SNFtoTOT;
  prdData.Lb_Can12D = Lw_b/SNFtoTOT;
  prdData.Lb_Can4M = Lw_b/SNFtoTOT;
  prdData.Lb_Can6M = Lw_b/SNFtoTOT;
  prdData.Lb_Can8M = Lw_b/SNFtoTOT;
   prdData.Lb_Can10M = Lw_b/SNFtoTOT;
  prdData.Lb_Can12M = Lw_b/SNFtoTOT;
  prdData.Lb_CanP = Lw_b/SNFtoTOT;
  prdData.Lb_Rus = Lw_b;
  prdData.Lb_Usa = Lw_b/SNFtoTOT;
  prdData.Lb_ScoA = Lw_b/SNFtoTOT;

%   prdData.Ls = Lw_s;
  prdData.Lp_norS = Lw_p_nat;
  prdData.Lp_sco = Lw_p_nat /SNFtoTOT;
  prdData.Lp_norI  = Lw_p_nat /SNFtoTOT;
  prdData.Lp_spaNM = Lw_p_nat /SNFtoTOT;
  prdData.Lp_canM = Lw_p_nat /SNFtoTOT;
  prdData.Lp_canR = Lw_p_nat /SNFtoTOT;
  prdData.Lp_norSf = Lw_p_nat / POHtoTOT;
  prdData.Lp_norSm = Lw_p_nat / POHtoTOT;
  prdData.Lp_rus = Lw_p_nat /SNFtoTOT;
  prdData.Lp_usa = Lw_p_nat /SNFtoTOT;
  prdData.Lp_norI2 = Lw_p_nat /SNFtoTOT;% pas bon, fertilisation-smolt en ad lib

  prdData.Li_ScoMax = Lw_i_nat /SNFtoTOT;
  prdData.Li_NorFM = Lw_i_nat /SNFtoTOT;
  prdData.Li_NorFF = Lw_i_nat /SNFtoTOT;
  prdData.Li_NorVM = Lw_i_nat;
  prdData.Li_NorVF = Lw_i_nat /SNFtoTOT;
  prdData.Li_NorAM = Lw_i_nat /SNFtoTOT;
  prdData.Li_NorAF = Lw_i_nat /SNFtoTOT;
  prdData.Li_norI = Lw_i_nat /SNFtoTOT;
  prdData.Li_spaNM = Lw_i_nat /SNFtoTOT;
  prdData.Li_canBS = Lw_i_nat /SNFtoTOT;
  prdData.Li_rusN = Lw_i_nat /SNFtoTOT;
  prdData.Li_rusO = Lw_i_nat /SNFtoTOT;
  prdData.Li_rusS = Lw_i_nat /SNFtoTOT;
  prdData.Li_usa = Lw_i_nat /SNFtoTOT;

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

prdData.Wwh_Eng = Ww_h;
prdData.Wwh_Can = Ww_h;
prdData.Wwh_Rus = Ww_h;
prdData.Wwh_Sco = Ww_h;
prdData.Wwh_FNor = Ww_h;

 prdData.Wwb_Sco1SWM = Ww_b;
 prdData.Wwb_Sco2SWM = Ww_b;
 prdData.Wwb_Can = Ww_b;
 prdData.Wwb_Rus = Ww_b; 
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
% TC_TabC = tempcorr(TabC(:,1), T_ref, T_A); 
% EabC = tau_b_nat/ k_M ./ TC_TabC;        % d, age at birth at f and T
% 
% TC_Tab_sco = tempcorr(Tab_sco(:,1), T_ref, T_A); 
% Eab_sco = tau_b_nat/ k_M ./ TC_Tab_sco;        % d, age at birth at f and T



% temperature - Length at hatching




  
    % t-Ww


  % time-weight data from McCarthy2003;
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_0 = (W0_McCarthy2003./ (1 + f * ome))^(1/3); % cm, structural length at t initial
  % T10 
  TC_tWw_sco=tempcorr(temp.tWw_sco, T_ref, T_A);
  rT_B = TC_tWw_sco * rho_B * k_M; rT_j = TC_tWw_sco * rho_j * k_M; % 1/d, von Bert, exponential growth rate
  t = tWw_sco(:,1) - tWw_sco(1,1); % correction so that t initial = 0
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  EWw_sco = L.^3 * (1 + f * ome);

  
  
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
  L_0= L0_usa*del_M;
  t = tL_usa(:,1) - tL_usa(1,1); % correction so that t initial = 0
 
if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
ELw_usa = L/del_M; % cm, predicted physical length

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

%   % time-length %%% _nor4 f= ad lib
  TC_tL_nor4 = tempcorr(temp.tL_nor4, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_nor4; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_0= L0_nor*del_M*SNFtoTOT;
  t = tL_nor4(:,1) - tL_nor4(1,1);
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  ELw_nor4 = L/ del_M; % cm, total length
% 

%   % time-length %%% _nor5 f= ad lib
  TC_tL_nor5 = tempcorr(temp.tL_nor5, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_nor5; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  t = tL_nor5(:,1) - tL_nor5(1,1); % 
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
ELw_nor5 = L/ del_M; % cm, total length

%   % time-length %%% _nor7 f= ad lib
  TC_tL_nor7 = tempcorr(temp.tL_nor7, T_ref, T_A);
  kT_M = k_M * TC_tL_nor7; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  t = tL_nor7(:,1) - tL_nor7(1,1); % 
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  ELw_nor7 = L/ del_M; % cm, total length
% 

%   % time-length %%% _nor57 f= ad lib
  TC_tL_nor57 = tempcorr(temp.tL_nor57, T_ref, T_A);
  kT_M = k_M * TC_tL_nor57; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  t = tL_nor57(:,1) - tL_nor57(1,1); % 
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  ELw_nor57 = L/ del_M; % cm, total length
% 

%   % time-length %%% _scoA f= ad lib
  TC_tL_scoA = tempcorr(temp.tL_scoA, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_scoA; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_scoA(tL_scoA(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_scoA(tL_scoA(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_scoA = [L_bj; L_ji]/ del_M; % cm, total length
% 


%   % time-length %%% _scoS f= ad lib
  TC_tL_scoS = tempcorr(temp.tL_scoS, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_scoS; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_0 = L0_scoS*del_M;
  t = tL_scoS(:,1) - tL_scoS(1,1);
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
ELw_scoS = L/ del_M; % cm, total length



%   % time-length %%% _spa f= ad lib
  TC_tL_spa = tempcorr(temp.tL_spa, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_spa; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_0= L0_spa*del_M;
  t = tL_spa(:,1) - tL_spa(1,1); % correction so that t initial = 0
 if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  ELw_spa = L/ del_M; % cm, total length

  
%   % time-length %%% _scoAa f= ad lib
  TC_tL_scoAa = tempcorr(temp.tL_scoAa, T_ref, T_A);
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B,info] = get_tj(pars_tj, f_tL);
if info ~= 1 || info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = [];
    info_nat = 0; prdData= [];
    return;
    
  end
  kT_M = k_M * TC_tL_scoAa; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_0= L0_scoAa * del_M * SNFtoTOT;
  t = tL_scoAa(:,1) - tL_scoAa(1,1); % correction so that t initial = 0
   if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
  end
  
  ELw_scoAa = L/ del_M; % cm, total length
% 

%   
%   % length-weight   %%%%
%   EWw_AqG = (LWw_AqG(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
%   EWw_norM = (LWw_norM(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
EWw_nor = (LWw_nor(:,1) * del_M).^3 * (1 + f_nat * ome);% g, wet weight
EWw_scoA = (LWw_scoA(:,1) * del_M * SNFtoTOT).^3 * (1 + f_nat * ome);% g, wet weight
ELWw_sco = (LWw_sco(:,1) * del_M * SNFtoTOT).^3 * (1 + f_nat * ome);% g, wet weight
EWw_Can = (LWw_Can(:,1) * del_M * SNFtoTOT).^3 * (1 + f_nat * ome); % g, wet weight
ELWw_usa = (LWw_usa(:,1) * del_M).^3 * (1 + f_nat * ome); % g, wet weight
EWw_Nor = (LWw_Nor(:,1) * del_M).^3 * (1 + f_nat * ome); % g, wet weight


  % pack to output
  

% prdData.TLb = TLb;
%   prdData.tWwe_norT12 = EWw_eT12;
%   prdData.tWwe_T10 = EWw_eT10;
%   prdData.tWwe_T8 = EWw_eT8;
 prdData.tL_usa = ELw_usa;
 prdData.tL_norI = ELw_norI;
prdData.tL_nor4 = ELw_nor4 / SNFtoTOT;
prdData.tL_nor5 = ELw_nor5 / SNFtoTOT;
prdData.tL_nor7 = ELw_nor7 / SNFtoTOT;
prdData.tL_nor57 = ELw_nor57 / SNFtoTOT;
prdData.tL_scoA = ELw_scoA / SNFtoTOT;
prdData.tL_scoS = ELw_scoS;
prdData.tL_spa = ELw_spa;
prdData.tL_scoAa = ELw_scoAa / SNFtoTOT;
prdData.tWw_sco = EWw_sco;
prdData.LWw_nor = EWw_nor;
prdData.LWw_scoA = EWw_scoA;
prdData.LWw_sco = ELWw_sco;
prdData.LWw_Can = EWw_Can;
prdData.LWw_usa = ELWw_usa;
prdData.LWw_Nor = EWw_Nor;

%Manque t-E
%Manque L-R
%Manque Ww-R

