function [prdData, info] = predict_Salmo_salar_farm_Ch(par, data, auxData)
  

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
  TC_Tah_Gunnes1979 = tempcorr(data.Tah_Gunnes1979(:,1), T_ref, T_A); 
  TC_Tah_Wallace1988 = tempcorr(data.Tah_Wallace1988(:,1), T_ref, T_A); 
  TC_Tah_Solberg2014 = tempcorr(data.Tah_Solberg2014(:,1), T_ref, T_A); 
  TC_Tah_Berg1999 = tempcorr(data.Tah_Berg1999(:,1), T_ref, T_A); 
  TC_abM_egg =  tempcorr(temp.ab_norM, T_ref, T_A);
  TC_abM_feed =  tempcorr(temp.ab_norM2, T_ref, T_A);
  TC_tbAqG = tempcorr(temp.tb_12_AqG, T_ref, T_A);
  TC_tbB = tempcorr(temp.tb_norB, T_ref, T_A);
% TC_ts = tempcorr(temp.ts, T_ref, T_A);
% TC_ts = tempcorr(temp.as_norM, T_ref, T_A);
% TC_tp = tempcorr(temp.tp, T_ref, T_A);
TC_tp_norire = tempcorr(temp.ap_norire, T_ref, T_A);
TC_tp_norNBP = tempcorr(temp.ap_norNBP, T_ref, T_A);
%   TC_am = tempcorr(temp.am, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
%   TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];  %%%%%values computed l 4 %we keep j because it's real metam., not smoltif.
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %%%%%%%%%% Obtains scaled ages at metamorphosis, puberty, birth and the scaled lengths at these ages 
  [tau_j_nat, tau_p_nat, tau_b_nat, l_j_nat, l_p_nat, l_b_nat, l_i_nat, rho_j_nat, rho_B_nat, info_nat] = get_tj(pars_tj, f_nat); %%%%%%%%%% Obtains scaled ages at metamorphosis, puberty, birth and the scaled lengths at these ages 
  
  if info~=1||info_nat ~= 1 % numerical procedure failed
    info = 0; prdData = []; return;
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  % for ad libitum food
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = p_Am * U_E0;            % J, initial energy content
  Wd_0 = E_0 * w_E/ mu_E;      % g, initial dry weight 
  V_0 = Wd_0/ d_E;             % cm^3, egg volume 
  % ajouter calcul Wet weight
  % for natural f
  U_E0_nat = initial_scaled_reserve(f_nat, pars_UE0); % d.cm^2, initial scaled reserve
  E_0_nat = p_Am * U_E0_nat;            % J, initial energy content
  Wd_0_nat = E_0_nat * w_E/ mu_E;      % g, initial dry weight 
  V_0_nat = Wd_0_nat/ d_E;             % cm^3, egg volume 
  
  % hatch 
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); % time between fertilization and hatching at f and T_ref
  t_hb = aUL(3,1) - aUL(2,1); % time between hatching and birth at f and T_ref
  aT_h_norM = a_h / TC_abM_egg;
  aT_h_Gunnes1979 = a_h ./ TC_Tah_Gunnes1979;
  aT_h_Wallace1988 = a_h ./ TC_Tah_Wallace1988;
  aT_h_Solberg2014 = a_h ./ TC_Tah_Solberg2014;
  aT_h_Berg1999 = a_h ./ TC_Tah_Berg1999;
  L_h = aUL(2,3); % cm, structural length at hatching at f
  Lw_h = L_h/ del_M; % cm, physical length at hatching at f
%   Ww_f = L_h^3 * (1 + f * ome); % g, wet weight at hatching at f
  
  % birth data
  a_b = tau_b/ k_M; % age at birth at f and T_ref 
  % Check that ages at birth are consistent between get_tj and dget_aul
  if (((a_b-aUL(3,1))/a_b)^2 > 0.0001)
      a_b
      aaUL(3,1)
      disp('Inconsistent values of age at birth');
  end
  aT_b_norM = aT_h_norM + (t_hb / TC_abM_feed); % if change of temperature at hatching
  aT_b_norM2 = a_b/ TC_abM_egg; % if change of temperature at first feeding
  tT_hb_AqG = t_hb/ TC_tbAqG;
  tT_hb_norB = t_hb/ TC_tbB;
  
  L_b = L_m * l_b;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
  % Check that lengths at birth are consistent between get_tj and dget_aul
  if (((L_b-aUL(3,3))/L_b)^2 > 0.0001)
      L_b
      aUL(3,3)
      disp('Inconsistent values of L_b');
  end
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f    %%%%%%% del_M : shape coefficient
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f  %%%%%%%%%% structural volume volume at birth* (scaled length + scaled reserve density*contrib of dry mass reserve to toal dry biomass).

  %same for natural f
  L_b_nat = L_m * l_b_nat;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
  Lw_b_nat = L_b_nat/ del_M;                % cm, physical length at birth at f    %%%%%%% del_M : shape coefficient
  Ww_b_nat = L_b_nat^3 * (1 + f_nat * ome);       % g, wet weight at birth at f  %%%%%%%%%% structural volume volume at birth* (scaled length + scaled reserve density*contrib of dry mass reserve to toal dry biomass).

  
  
  
%   % smoltification 
%  all calculation are wrong because they are meant for  metamorphosis
%   L_j = L_m * l_j;                  % cm, structural length at metam
%   Lw_j = L_j/ del_M;                % cm, physical length at metam at f
%   Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
%   tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
%  


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
  tT_p_norire = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_norire;   % d, time since birth at puberty at f and T
  tT_p_norNBP = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_norNBP;   % d, time since birth at puberty at f and T

  
  
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
   RT_i = TC_Ri * R_i;% #/d, max reprod rate  
%same for natural f
   pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i_nat, UE0_nat, Lb_nat, Lj_nat, Lp_nat, info_nat]  =  reprod_rate_j(L_i_nat, f_nat, pars_R, L_b_nat);
   RT_i_nat = TC_Ri * R_i_nat;% #/d, max reprod rate  
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    %same for natural f
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m_nat = get_tm_s(pars_tm, f_nat, l_b_nat);      % -, scaled mean life span at T_ref
  aT_m_nat = t_m_nat/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.Tah_Gunnes1979 = aT_h_Gunnes1979;
  prdData.Tah_Wallace1988 = aT_h_Wallace1988;
  prdData.Tah_Solberg2014 = aT_h_Solberg2014;
  prdData.Tah_Berg1999 = aT_h_Berg1999;
  prdData.ab_norM = aT_b_norM;
  prdData.ab_norM2 = aT_b_norM2;
  prdData.tb_12_AqG = tT_hb_AqG;
  prdData.tb_norB = tT_hb_norB;
  prdData.ap_norNBP = tT_p_norNBP;
  prdData.ap_norire = tT_p_norNBP;
  prdData.am = aT_m_nat;
% prdData.Lh = Lw_h;
  prdData.Lb_NorM2011 = Lw_b;
  prdData.Lb_NorM2012 = Lw_b;
  prdData.Lb_NorM2013 = Lw_b;
  prdData.Lb_NorS2013 = Lw_b;
%   prdData.Ls = Lw_s;
  prdData.Lp_norSf = Lw_p;
  prdData.Lp_norSm = Lw_p;
%   prdData.Lp_norN = Lw_p;
%   prdData.Li = Lw_i_nat;
%  prdData.Wwh_norM = Ww_h;
%  prdData.Wwb = Ww_b;
%   prdData.Wwj_nor = Ww_j;
 prdData.Wwp_norf = Ww_p;
 prdData.Wwp_norm = Ww_p;
 prdData.Wwi_norM = Ww_i_nat;
 prdData.Ri = RT_i;
 prdData.V0_norM2011  = V_0;
 prdData.V0_norM2012  = V_0;
%  prdData.E0 = E_0; 
 
  % uni-variate data
  
    % t-Wwe and t-WwVe
  % temperature 12°C
  % compute temperature correction factors
  TC12 = tempcorr(temp.tWwVe_T12, T_ref, T_A);
  vT12 = v * TC12; 
  kT12_J = TC12 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT12_E_Am = TC12 * J_E_Am;
  UT12_E0 = TC12 * U_E0;
  % tW-data embryo
  t = [0; tWwVe_T12(:,1)]; 
  [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT12, kT12_J, g, L_m); 
  LUH(1,:) = []; %suppr 1ere valeur??
  L = LUH(:,1); % cm, structural length
  L3 = L .^3; 
  EWw_e12 = L3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
   % tWV-data yolk
  M_E = LUH(:,2) * JT12_E_Am;
  EV_e12 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  EWw_eT12 =EWw_e12+EV_e12;
  
  
  %idem 10°C
  TC10 = tempcorr(temp.tWwVe_T10, T_ref, T_A);
  vT10 = v * TC10; 
  kT10_J = TC10 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT10_E_Am = TC10 * J_E_Am;
  UT10_E0 = TC10 * U_E0;
  % tW-data embryo
  t = [0; tWwVe_T10(:,1)]; 
  [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT10, kT10_J, g, L_m); 
  LUH(1,:) = []; %suppr 1ere valeur??
  L = LUH(:,1); % cm, structural length
  L3 = L .^3; 
  EWw_e10 = L3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
   % tWV-data yolk
  M_E = LUH(:,2) * JT12_E_Am;
  EV_e10 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  EWw_eT10 =EWw_e10+EV_e10;
  
 %idem 8°C
 TC8 = tempcorr(temp.tWwVe_T8, T_ref, T_A);
  vT8 = v * TC8; 
  kT8_J = TC8 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT8_E_Am = TC8 * J_E_Am;
  UT8_E0 = TC8 * U_E0;
  % tW-data embryo
  t = [0; tWwVe_T8(:,1)]; 
  [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT8_E0 0], [], kap, vT8, kT8_J, g, L_m); 
  LUH(1,:) = []; %suppr 1ere valeur??
  L = LUH(:,1); % cm, structural length
  L3 = L .^3; 
  EWw_e8 = L3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
  % tWV-data yolk
  M_E = LUH(:,2) * JT12_E_Am;
  EV_e8 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  EWw_eT8 =EWw_e8+EV_e8;
    
  % time-length %%% _iceT11
  TC_tL_iceT11 = tempcorr(temp.tL_iceT11, T_ref, T_A);
  kT_M = k_M * TC_tL_iceT11; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_iceT11(tL_iceT11(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_iceT11(tL_iceT11(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_iceT11 = [L_bj; L_ji]/ del_M; % cm, total length
  
  TC_tL_iceT611 = tempcorr(temp.tL_iceT611, T_ref, T_A);
  kT_M = k_M * TC_tL_iceT611; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_iceT611(tL_iceT611(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_iceT611(tL_iceT611(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_iceT611 = [L_bj; L_ji]/ del_M; % cm, total length

  TC_tL_ice1mw = tempcorr(temp.tL_ice1mw, T_ref, T_A);
  kT_M = k_M * TC_tL_ice1mw; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_ice1mw(tL_ice1mw(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_ice1mw(tL_ice1mw(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_ice1mw = [L_bj; L_ji]/ del_M; % cm, total length

  TC_tL_ice3mw = tempcorr(temp.tL_ice3mw, T_ref, T_A);
  kT_M = k_M * TC_tL_ice3mw; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_ice3mw(tL_ice3mw(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_ice3mw(tL_ice3mw(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_ice3mw = [L_bj; L_ji]/ del_M; % cm, total length

  TC_tL_ice5mw = tempcorr(temp.tL_ice3mw, T_ref, T_A);
  kT_M = k_M * TC_tL_ice5mw; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_ice5mw(tL_ice5mw(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_ice5mw(tL_ice5mw(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_ice5mw = [L_bj; L_ji]/ del_M; % cm, total length

  TC_tL_norM = tempcorr(temp.tL_norM, T_ref, T_A);
  kT_M = k_M * TC_tL_norM; %%%km corrected
  rT_j = rho_j * kT_M; %%%rhoj corrected
  rT_B = rho_B * kT_M; %%%%rhoB corrected
  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_norM(tL_norM(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norM(tL_norM(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_norM = [L_bj; L_ji]/ del_M; % cm, total length

  
  % length-weight   %%%%
  EWw_AqG = (LWw_AqG(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
  EWw_norM = (LWw_norM(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % temperature-age at birth
%   TC_Tab = tempcorr(Tab(:,1), T_ref, T_A); 
%   Eab = tau_b/ k_M ./ TC_Tab;        % d, age at birth at f and T
  
  % pack to output
  prdData.tWwVe_T8 = EWw_e8;
  prdData.tWwYe_T8 = EV_e8;
  prdData.tWwVe_T10 = EWw_e10;
  prdData.tWwYe_T10 = EV_e10;
  prdData.tWwVe_T12 = EWw_e12;
  prdData.tWwYe_T12 = EV_e12;
  prdData.tL_iceT11 = ELw_iceT11;
  prdData.tL_iceT611 = ELw_iceT611;
  prdData.tL_ice1mw = ELw_ice1mw;
  prdData.tL_ice3mw = ELw_ice3mw;
  prdData.tL_ice5mw = ELw_ice5mw;
  prdData.tL_norM = ELw_norM;
  %lack of Tww juvenile and seawater
  prdData.LWw_AqG = EWw_AqG;
  prdData.LWw_norM = EWw_norM;
  %lack of T-JX
%   prdData.Tab = Eab;
