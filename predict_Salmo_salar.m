function [prdData, info] = predict_Salmo_salar(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); %%%%Computes compound parameters
  vars_pull(par); 
  vars_pull(cPar);  
  vars_pull(data);  
  vars_pull(auxData);%%%unpacking of structures

  % compute temperature correction factors for each stage
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];  %%%%%values computed l 4
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %%%%%%%%%% Obtains scaled ages at metamorphosis, puberty, birth and the scaled lengths at these ages
  if info ~= 1 % numerical procedure failed
    info = 0; prdData = []; return;
  end
  
  % initial
%   pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector 
%   U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
%  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f    %%%%%%Max length * scaled length at birth
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f
  Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
  % tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
  tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam
 
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  tT_p = (tau_p - tau_b) / k_M/ TC_tp;   % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R, L_b);
  RT_i = TC_Ri * R_i;% #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
% prdData.ah = aT_h;
  prdData.ab = aT_b;
% prdData.tj = tT_j;
  prdData.tj = tT_j;
% prdData.tp = tT_p;
  prdData.tp = tT_p;
  prdData.am = aT_m;
% prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
% prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
% prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
% prdData.Wwp = Ww_p;
% prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;   
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw = [L_bj; L_ji]/ del_M; % cm, total length

  % length-weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
