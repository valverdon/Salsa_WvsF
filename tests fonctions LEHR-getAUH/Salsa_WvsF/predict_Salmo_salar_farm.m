function [prdData, info] = predict_Salmo_salar_farm(par, data, auxData)
  

%par=parPets.(pets{1})
%par=q
%data=data.(pets{1})
%data=data2plot.(pets{1})
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
  if E_Hh < 0
      info = 0; prdData = []; return
  end
  
TC_Tah_Gunnes1979 = tempcorr(data.Tah_Gunnes1979(:,1), T_ref, T_A); 
  TC_Tah_Wallace1988 = tempcorr(data.Tah_Wallace1988(:,1), T_ref, T_A); 
  TC_Tah_Solberg2014 = tempcorr(data.Tah_Solberg2014(:,1), T_ref, T_A); 
  TC_Tah_Berg1999 = tempcorr(data.Tah_Berg1999(:,1), T_ref, T_A); 
%   TC_abM_egg =  tempcorr(temp.ab_norM, T_ref, T_A);
%   TC_abM_feed =  tempcorr(temp.ab_norM2, T_ref, T_A);
TC_abF =  tempcorr(mean(temp.abF(:,2)), T_ref, T_A);
%   TC_tbAqG = tempcorr(temp.tb_12_AqG, T_ref, T_A);
%   TC_tbB = tempcorr(temp.tb_norB, T_ref, T_A);
% TC_ts = tempcorr(temp.ts, T_ref, T_A);
% TC_ts = tempcorr(temp.as_norM, T_ref, T_A);
% TC_tp = tempcorr(temp.tp, T_ref, T_A);
%   TC_tp_norire = tempcorr(temp.ap_norire, T_ref, T_A);
  TC_asp_norire = tempcorr(temp.asp_norire, T_ref, T_A);
%   TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Lsp_norS = tempcorr(temp.Lsp_norSf, T_ref, T_A);
%   TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Rnbe = tempcorr(temp.Rnbe, T_ref, T_A);
%   TC_tL_iceT11 = tempcorr(temp.tL_iceT11, T_ref, T_A);
%   TC_tL_iceT611 = tempcorr(temp.tL_iceT611, T_ref, T_A);
%   TC_tL_norM = tempcorr(temp.tL_norM, T_ref, T_A);
%   TC_tL_norM2003 = tempcorr(temp.tL_norM2003, T_ref, T_A);   
%   TC_tL_norM2004 = tempcorr(temp.tL_norM2004, T_ref, T_A);
  TC_tL= tempcorr(temp.tL, T_ref, T_A);
%   TC_tWw_norB = tempcorr(temp.tWw_norB, T_ref, T_A);
%   TC_tWw_T4 = tempcorr(temp.tWw_T4_Mow, T_ref, T_A);
%   TC_tWw_T8 = tempcorr(temp.tWw_T8_Mow, T_ref, T_A);
%   TC_tWw_T6 = tempcorr(temp.tWw_T6_AqG, T_ref, T_A);
%   TC_tWw_T10 = tempcorr(temp.tWw_T10_AqG, T_ref, T_A);
%   TC_tWw_T14 = tempcorr(temp.tWw_T14_AqG, T_ref, T_A);
%   TC_tWw_T18 = tempcorr(temp.tWw_T18_AqG, T_ref, T_A);
TC_tWw = tempcorr(temp.tWw, T_ref, T_A);
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
  %ajouter calcul Wet weight
  %same for natural f
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0_nat = initial_scaled_reserve(f_nat, pars_UE0); % d.cm^2, initial scaled reserve
  E_0_nat = p_Am * U_E0_nat;            % J, initial energy content
  Wd_0_nat = E_0_nat * w_E/ mu_E;      % g, initial dry weight 
  V_0_nat = Wd_0_nat/ d_E;             % cm^3, egg volume 
  
  
  % hatch 
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  %[U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); % time between fertilization and hatching at f and T_ref
  t_hb = aUL(3,1) - aUL(2,1); % time between hatching and birth at f and T_ref
%   aT_h_norM = a_h / TC_abM_egg;
  ah10_1 = a_h / tempcorr(C2K(7), T_ref, T_A);
  aT_h_Gunnes1979 = a_h ./ TC_Tah_Gunnes1979;
  aT_h_Wallace1988 = a_h ./ TC_Tah_Wallace1988;
  aT_h_Solberg2014 = a_h ./ TC_Tah_Solberg2014;
  aT_h_Berg1999 = a_h ./ TC_Tah_Berg1999;
  L_h = aUL(2,3); % cm, structural length at hatching at f
  Lw_h = L_h/ del_M; % cm, physical length at hatching at f
  
%  Ww_f = L_h^3 * (1 + f * ome); % g, wet weight at hatching at f


  % birth data
  a_b = tau_b/ k_M; % age at birth at f and T_ref 
  % Check that ages at birth are consistent between get_tj and dget_aul
  if (((a_b-aUL(3,1))/a_b)^2 > 0.0001)
      a_b
      aaUL(3,1)
      disp('Inconsistent values of age at birth');
  end


%   aT_b = a_b/ TC_ab; % manque effet T°
%   aT_b_norM2 = a_b/ TC_abM_egg; % if change of temperature at first feeding
%   tT_hb_AqG = t_hb/ TC_tbAqG;
%   tT_hb_norB = t_hb/ TC_tbB;
%   ab_10_1 = a_b/tempcorr(C2K(7), T_ref, T_A);
 
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

  InitCond = [ 1e-15; E_0; 0; 0; 0]; % concatenate initial conditions Length, Energy
  t0 = data.tL(1,1);
%   t0 = tL_scoAa(1,1); % time since birth at start of experiment
L_j = L_m * l_j;   
s_M  = L_j/ L_b; % -, acceleration factor for f
  [t, LEHR] = ode45(@ode_LEHR, linspace(0, t0, 1000), InitCond,[], par, cPar, f, s_M, temp.abF(:,1), temp.abF(:,2));%from fecondation to start of experiment
%   Eh(1)=0;
%   for i=2:size(LEHR,1)
%       Eh(i)=Eh(1)+sum(LEHR(1:i-1,3));
%   end
  naissance=find(LEHR(:,3)>=E_Hb, 1, 'first');%index du passage de Eh au dessus de E_Hb
  aT_b=t(naissance);%Temps de ce passage
  
  
  %test
  
 aT_btest=aUL(3,1)/ TC_abF;
 
 
 
 
 
 
 
%   % smoltification 
%  all calculation are wrong because they are meant for  metamorphosis
%   L_j = L_m * l_j;                  % cm, structural length at metam
%   Lw_j = L_j/ del_M;                % cm, physical length at metam at f
%   Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
%   % tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
%   tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
%  


  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  %same for natural f
  L_p_nat = L_m * l_p_nat;                  % cm, structural length at puberty at f_nat
  Lw_p_nat = L_p_nat/ del_M;                % cm, physical length at puberty at f_nat
  Ww_p_nat = L_p_nat^3 *(1 + f_nat * ome);        % g, wet weight at puberty 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f_nat and T
%   tT_p_norire = (tau_p_nat - tau_b_nat) / k_M/ TC_tp_norire;   % d, time since birth at puberty at f and T
  tT_sp_norire = (tau_p_nat - tau_b_nat) / k_M/ TC_asp_norire;   % d, time since birth at puberty at f and T
  ap10_1= tau_p_nat/k_M/tempcorr(C2K(7), T_ref, T_A);
%  monvecteurdetrucs = ["ah10_1 = ",ah10_1," ; Lh_10_1 = ",Lw_h," ; ab10_1 = ", ab_10_1, " ; Lb10_1 = ",Lw_b, " ; ap10_1 = ",ap10_1, " ; Lp10_1 = ",Lw_p   ];
%  disp(monvecteurdetrucs)
 





  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
  %same for natural f
  L_i_nat = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_nat = L_i_nat/ del_M;                % cm, ultimate physical length at f
  Ww_i_nat = L_i_nat^3 * (1 + f_nat * ome);       % g, ultimate wet weight
  
  % first spawning
  rT_B = TC_Lsp_norS * rho_B * k_M;
  L_norS = L_i - (L_i - L_p) * exp( - rT_B * 365); % cm, expected structural length one year after puberty at f and T
  Ww_norS = L_norS^3 * (1 + f * ome);       % g, wet weight one year after puberty at f and T
  Lw_norS = L_norS / del_M; % cm, expected physical length one year after puberty at f and T
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R, L_b);
   RT_i = TC_Rnbe * R_i;% #/d, max reprod rate  
%same for natural f
   pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i_nat, UE0_nat, Lb_nat, Lj_nat, Lp_nat, info_nat]  =  reprod_rate_j(L_i_nat, f_nat, pars_R, L_b_nat);
   RT_i_nat = TC_Rnbe * R_i_nat;% #/d, max reprod rate  
   
   
%tests seasonality
ap_Ri= tau_p / k_M / TC_Rnbe; % prediction of age at puberty for Ri data envir. condtions
p_jul=mod(ap_Ri,365); % julian days of puberty (considering fecondation at 1st of January)
if p_jul<100 % early april
  treprod=365-p_jul;
else
  treprod=365-p_jul+365;
end

asp_Ri= tau_p / k_M / TC_asp_norire;
p_jul=mod(asp_Ri,365); % julian days of puberty (considering fecondation at 1st of January)
if p_jul<100 % early april
  treprodsp=365-p_jul;
else
  treprodsp=365-p_jul+365;
end

% Age at 1st reprod
asp= tau_p / k_M/ TC_asp_norire + treprodsp;

%Length-Weight at 1st reprod
rT_B = TC_Lsp_norS * rho_B * k_M;
Lsp_struct_pred = L_i - (L_i - L_p) * exp( - rT_B * treprod);
Wwsp_pred = Lsp_struct_pred^3 * (1 + f * ome);       % g, wet weight at 1st reprod at f and T
Lsp_pred = L_norS / del_M; % cm, expected physical length at 1st reprod at f and T
 
%neggs at first reprod
n_eggs=treprod*RT_i;


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
%   prdData.ab_norM = aT_b_norM;
%   prdData.ab_norM2 = aT_b_norM2;
  prdData.abF=aT_b;
  prdData.abFtest=aT_btest;
%   prdData.tb_12_AqG = tT_hb_AqG;
%   prdData.tb_norB = tT_hb_norB;
%   prdData.ap_norNBP = tT_p_norNBP;
  prdData.asp_norire =tT_sp_norire;
%   prdData.ap_norire = tT_p_norNBP;
  prdData.am = aT_m_nat;
% prdData.Lh = Lw_h;
  prdData.Lb_NorM2011 = Lw_b / SNFtoTOT;
  prdData.Lb_NorM2012 = Lw_b / SNFtoTOT;
  prdData.Lb_NorM2013 = Lw_b / SNFtoTOT;
  prdData.Lb_NorS2013 = Lw_b / SNFtoTOT;
%   prdData.Ls = Lw_s;
  prdData.Lsp_norSf = Lsp_pred / POHtoTOT;
  prdData.Lsp_norSm = Lsp_pred / POHtoTOT;
%   prdData.Lp_norN = Lw_p;
prdData.Li = Lw_i_nat / SNFtoTOT;
%  prdData.Wwh_norM = Ww_h;
%  prdData.Wwb = Ww_b;
%   prdData.Wwj_nor = Ww_j;
 prdData.Wwsp_norf = Wwsp_pred;
 prdData.Wwsp_norm = Wwsp_pred;
 prdData.Wwi_norM = Ww_i_nat;
%  prdData.Ri = RT_i;
 prdData.Rnbe=n_eggs;
 prdData.V0 = V_0;
 prdData.V0 = V_0;
 prdData.V0 = V_0;
%  prdData.E0 = E_0; 
 
 
  % uni-variate data
%   
%     % t-Wwe and t-WwVe
%   % temperature 12°C
%   % compute temperature correction factors
%   TC12 = tempcorr(temp.tWwVe_T12, T_ref, T_A);
%   vT12 = v * TC12; 
%   kT12_J = TC12 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT12_E_Am = TC12 * J_E_Am;
%   UT12_E0 = TC12 * U_E0;
%   % tW-data embryo
%   t = [0; tWwVe_T12(:,1)]; 
%   [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT12, kT12_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   L = LUH(:,1); % cm, structural length
%   L3 = L .^3; 
%   EWw_e12 = L .^ 3 * (1 + f_tWeVe_tWeYe * ome); % g, wet weight embryo minus vitellus
%    % tWV-data yolk
%   M_E = LUH(:,2) * JT12_E_Am;
%   EV_e12 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * ome); % g, wet weight vitellus
%   EWw_eT12 =EWw_e12+EV_e12;
%   
%   
%   %idem 10°C
%   TC10 = tempcorr(temp.tWwVe_T10, T_ref, T_A);
%   vT10 = v * TC10; 
%   kT10_J = TC10 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT10_E_Am = TC10 * J_E_Am;
%   UT10_E0 = TC10 * U_E0;
%   % tW-data embryo
%   t = [0; tWwVe_T10(:,1)]; 
%   [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT10_E0 0], [], kap, vT10, kT10_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   L = LUH(:,1); % cm, structural length
%   L3 = L .^3; 
%   EWw_e10 = L .^ 3 * (1 + f_tWeVe_tWeYe * ome); % g, wet weight embryo minus vitellus
%    % tWV-data yolk
%   M_E = LUH(:,2) * JT12_E_Am;
%   EV_e10 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * ome); % g, wet weight vitellus
%   EWw_eT10 =EWw_e10+EV_e10;
%   
%  %idem 8°C
%  TC8 = tempcorr(temp.tWwVe_T8, T_ref, T_A);
%   vT8 = v * TC8; 
%   kT8_J = TC8 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
%   JT8_E_Am = TC8 * J_E_Am;
%   UT8_E0 = TC8 * U_E0;
%   % tW-data embryo
%   t = [0; tWwVe_T8(:,1)]; 
%   [t, LUH] = ode45(@dget_LUH, t, [1e-10 UT8_E0 0], [], kap, vT8, kT8_J, g, L_m); 
%   LUH(1,:) = []; %suppr 1ere valeur??
%   L = LUH(:,1); % cm, structural length
%   L3 = L .^3; 
%   EWw_e8 = L .^ 3 * (1 + f_tWeVe_tWeYe * ome); % g, wet weight embryo minus vitellus
%   % tWV-data yolk
%   M_E = LUH(:,2) * JT12_E_Am;
%   EV_e8 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * ome); % g, wet weight vitellus
%   EWw_eT8 =EWw_e8+EV_e8;
%  
  
%   % time-weight data from Hosfeld 2009
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = (W0_Hosfeld2009./ (1 + f * ome))^(1/3); % cm, structural length at t initial
%   % T4 
%   rT_B = TC_tWw_norB * rho_B * k_M; rT_j = TC_tWw_norB * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_norB(:,1) - tWw_norB(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_norB = L.^3 * (1 + f * ome);
% 
%   % time-weight data from Handeland 1998
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = (W0_Handeland1998./ (1 + f * ome))^(1/3); % cm, structural length at t initial
%   % T4 
%   rT_B = TC_tWw_T4 * rho_B * k_M; rT_j = TC_tWw_T4 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T4_Mow(:,1) - tWw_T4_Mow(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T4 = L.^3 * (1 + f * ome);
%   % T8 
%   rT_B = TC_tWw_T8 * rho_B * k_M; rT_j = TC_tWw_T8 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T8_Mow(:,1) - tWw_T8_Mow(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T8 = L.^3 * (1 + f * ome);
% 
%   % time-weight data from Handeland 2008
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = (W0_Handeland2008./ (1 + f * ome))^(1/3); % cm, structural length at t initial
%   % T6 
%   rT_B = TC_tWw_T6 * rho_B * k_M; rT_j = TC_tWw_T6 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T6_AqG(:,1) - tWw_T6_AqG(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T6 = L.^3 * (1 + f * ome);
%   % T10
%   rT_B = TC_tWw_T10 * rho_B * k_M; rT_j = TC_tWw_T10 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T10_AqG(:,1) - tWw_T10_AqG(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T10 = L.^3 * (1 + f * ome);
%   % T14 
%   rT_B = TC_tWw_T14 * rho_B * k_M; rT_j = TC_tWw_T14 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T14_AqG(:,1) - tWw_T14_AqG(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T14 = L.^3 * (1 + f * ome);
%   % T18
%   rT_B = TC_tWw_T18 * rho_B * k_M; rT_j = TC_tWw_T18 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tWw_T18_AqG(:,1) - tWw_T18_AqG(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EWw_T18 = L.^3 * (1 + f * ome);
%   
  
  %%t-L & t-Ww Ireland
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_0 = 1e-15;  %L0 naissance et non pas début experience (Lb)
  InitCond = [L_0; E_0; 0; 0; 0]; % concatenate initial conditions
  t0 = data.tL(1,1);
%   t0 = tL_scoAa(1,1); % time since birth at start of experiment
  s_M  = L_j/ L_b; % -, acceleration factor for f
  [t, LEHR] = ode45(@ode_LEHR, [0 t0], InitCond,[], par, cPar, f, s_M, temp.tL(:,1), temp.tL(:,2));%from fecondation to start of experiment
  
  LEHRf = deval(ode45(@ode_LEHR, [data.tL(1,1) data.tL(end,1)], LEHR(end,:),[], par, cPar, f, s_M, temp.tL(:,1), temp.tL(:,2)), data.tL(:,1)); %from t0 to tmax
  Lire  = LEHRf(1,:)';
  EWwire = Lire.^3 * (1 + f * ome);
  % output
  ELire = Lire / del_M; % cm, physical lengthy

  
  % time-length 
  
  %test croissance
%    L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0test = L_b; % cm, structural length at t initial
%   % T7
%   rT_B = tempcorr(C2K(7), T_ref, T_A) * rho_B * k_M; 
%   rT_j = tempcorr(C2K(7), T_ref, T_A) * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = 0:1:3000 ; % correction so that t initial = 0
%   if L_0test < L_j
%     tj = log(L_j/ L_0test) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t < tj); % select times between birth & metamorphosis
%     L_bj = L_0test * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t >= tj); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj, L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0test) * exp( - rT_B * t); % cm, expected length at time
%   end
% plot(t,L/del_M)
% title('croissance en longueur')
% xlabel('age')
% ylabel('longueur')
% Tableau=[t;L/del_M];
% writematrix(Tableau,'tableaufarm.txt')
 
 
%   
%    L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = L0_Bjornsson1989*SNFtoTOT*del_M; % cm, structural length at t initial
%   % T11 
%   rT_B = TC_tL_iceT11 * rho_B * k_M; rT_j = TC_tL_iceT11 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tL_iceT11(:,1) - tL_iceT11(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EL_iceT11 = L / del_M;
% 
%   % T6 
%   rT_B = TC_tL_iceT611 * rho_B * k_M; rT_j = TC_tL_iceT611 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tL_iceT611(:,1) - tL_iceT611(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EL_iceT611 = L / del_M;
% 
%   
%   % time-length data from Glover 2009
% %   kT_M = k_M * TC_tL_norM; %%%km corrected
% %   rT_j = rho_j * kT_M; %%%rhoj corrected
% %   rT_B = rho_B * kT_M; %%%%rhoB corrected
% %   tT_j = (tau_j - tau_b)/ kT_M;   
% %   L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
% %   L_bj = L_b * exp(tL_norM(tL_norM(:,1) < tT_j,1) * rT_j/3); % cm, struc length
% %   L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_norM(tL_norM(:,1) >= tT_j,1) - tT_j)); % cm, struc length
% %   EL_norM = [L_bj; L_ji]/ del_M; % cm, total length
%   % 2003 experiment 
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = L0_norM2003*SNFtoTOT*del_M; % cm, structural length at t initial
%   rT_B = TC_tL_norM2003 * rho_B * k_M; rT_j = TC_tL_norM2003 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tL_norM2003(:,1) - tL_norM2003(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EL_norM2003 = L / del_M;
%   % 2004 experiment 
%   L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
%   L_0 = L0_norM2004*SNFtoTOT*del_M; % cm, structural length at t initial
%   rT_B = TC_tL_norM2004 * rho_B * k_M; rT_j = TC_tL_norM2004 * rho_j * k_M; % 1/d, von Bert, exponential growth rate
%   t = tL_norM2004(:,1) - tL_norM2004(1,1); % correction so that t initial = 0
%   if L_0 < L_j
%     tj = log(L_j/ L_0) * 3/ rT_j ; % time at metamorphosis relative to transfer to seawater
%     t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
%     L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
%     t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
%     L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
%     L = [L_bj; L_ji]; % catenate lengths
%   else 
%     L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
%   end
%   EL_norM2004 = L / del_M;
% 
%   % length-weight   %%%%
%   EWw_AqG = (LWw_AqG(:,1) * SNFtoTOT * del_M).^3 * (1 + f * ome); % g, wet weight
%   EWw_norM = (LWw_norM(:,1) * SNFtoTOT * del_M).^3 * (1 + f * ome); % g, wet weight

  % temperature-age at birth
%   TC_Tab = tempcorr(Tab(:,1), T_ref, T_A); 
%   Eab = tau_b/ k_M ./ TC_Tab;        % d, age at birth at f and T
  
  % pack to output
% prdData.tWwVe_T8 = EWw_e8;
%   prdData.tWwYe_T8 = EV_e8;
%   prdData.tWwVe_T10 = EWw_e10;
%   prdData.tWwYe_T10 = EV_e10;
%   prdData.tWwVe_T12 = EWw_e12;
%   prdData.tWwYe_T12 = EV_e12;
%   prdData.tL_iceT11 = EL_iceT11 / SNFtoTOT;
%   prdData.tL_iceT611 = EL_iceT611 / SNFtoTOT;
%   prdData.tL_norM2003 = EL_norM2003 / SNFtoTOT;
%   prdData.tL_norM2004 = EL_norM2004 / SNFtoTOT;
  prdData.tL = ELire / SNFtoTOT;
  prdData.tWw = EWwire;
%   prdData.tWw_norB = EWw_norB;
%   prdData.tWw_T4_Mow = EWw_T4;
%   prdData.tWw_T8_Mow = EWw_T8;
%   prdData.tWw_T6_AqG = EWw_T6;
%   prdData.tWw_T10_AqG = EWw_T10;
%   prdData.tWw_T14_AqG = EWw_T14;
%   prdData.tWw_T18_AqG = EWw_T18;
%   prdData.LWw_AqG = EWw_AqG;
%   prdData.LWw_norM = EWw_norM;
  %lack of T-JX
%   prdData.Tab = Eab;
end

function dLEHR = ode_LEHR(t, LEHR, p, c, f, s_M, Tt, T)


% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% T, scalar or function, -, temperature in K, constant or as a function of time

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEHR(1)); % cm, volumetric structural length
E   =  max(0,LEHR(2)); % J,   energy in reserve 
EH  =  min(p.E_Hp,LEHR(3)); % J, E_H maturity
ER  =  max(0,LEHR(4)); % J, E_R reproduction buffer
ER1  =  max(0,LEHR(5)); % J, E_R reproduction buffer

% Temperature correct the relevant paramters
TC = tempcorr(interp1(Tt, T, t), p.T_ref, p.T_A);

vT = p.v * TC; pT_M = p.p_M * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC;
pA   = f * pT_Am * L^2 * s_M * (EH >= p.E_Hb);           % J/d, assimilation

if EH < p.E_Hp % juveniles cannot cover somatic maintenance with the buffer   
    r  = (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap) * ...
        (E >= pT_M * L^4/ (p.kap * vT * s_M)) + ...
         (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ (E + c.kap_G * p.E_G * L^3/ p.kap) ...
         * (E < pT_M * L^4/ (p.kap * vT * s_M));

pC   = E * (vT * s_M/ L - r); % J/d, mobilisation
dE   = pA - pC;                                          % J/d, change in energy in reserve
dL   = r/ 3 * L;                                         % cm/d, change in structural length
dEH  = max(0, (1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
dER  = 0; 
dER1 = 0;
    
else % EH = EHp: adults  
    
 pC = E * (p.E_G * vT * s_M * L^2 + pT_M * L^3)/ (p.kap * E + p.E_G * L^3);    
 pCm  = c.E_m * (p.E_G * vT * L^2 + pT_M * L^3)/ (p.kap * c.E_m + p.E_G);
   
 
    if p.kap * pC >= pT_M * L^3   % enough energy in reserve to cover somatic maintenance and enough to make a batch   
        r    = (E * vT * s_M/ L^4 - pT_M/ p.kap)/ (E/ L^3 + p.E_G/ p.kap); % d^-1, specific growth rate  
        dE   = pA - pC;                                          % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                         % cm/d, change in structural length
        dEH  = 0;    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        
        % Buffer handling rules:
        dER1 = p.kap_R *((1 - p.kap) * pCm - kT_J * p.E_Hp); % J/d, change in energy in ripe buffer
        dER1 = max(0, dER1);
        dER  = ((1 - p.kap) * pC - kT_J * p.E_Hp)  - dER1;       % J, change in cumulated energy invested in the unripe reproduction buffer
%         dER  = dER * (ER > 0);
   
    else  % not enough energy in reserve to cover somatic maintenance

        if ER > 0
            r = 0;
        else
             r    =  (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ ...
            (E + c.kap_G * p.E_G  * L^3/ p.kap); % d^-1, specific growth rate
   
        end
        dE   = pA - pC;                                         % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                        % cm/d, change in structural length
        dEH  = 0;                                               % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = (1 - p.kap) * pC - kT_J * p.E_Hp;
        dER  = (dER  - (pT_M * L^3 - p.kap * pC)) * (ER > 0) ;
        dER1 = 0;
    
    end
     
end
 

% pack dLEHR
dLEHR = [dL; dE; dEH; dER; dER1];    

end