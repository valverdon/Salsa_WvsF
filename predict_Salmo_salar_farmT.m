function [prdData, info] = predict_Salmo_salar(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%   if E_Hh > E_Hb
%       info = 0; prdData = []; return
%   end

%   % customized filters for allowable parameters of the standard DEB model (std)
%   % for other models consult the appropriate filter function.
%   filterChecks = k * v_Hp >= f_tL ^3 * s_M^3  || ...         % constraint required for reaching puberty with f_tL
%   
%   if filterChecks  
%     info = 0;
%     prdData = {};
%     return;
%   end  

  % compute temperature correction factors
  TC_Tah = tempcorr(Tah(:,1), T_ref, T_A);
  TC_Tab = tempcorr(Tab(:,1), T_ref, T_A);
  TC_ap = tempcorr(temp.ap_norire, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
%   TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_iceT11, T_ref, T_A);
  
  % zero-variate data
  
  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = p_Am * U_E0;            % J, initial energy content
  Wd_0 = E_0 * w_E/ mu_E;      % g, initial dry weight 
  V_0 = Wd_0/ d_E;             % cm^3, egg volume 
  
  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
% a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3); % cm, structural length at birth at f
  Lw_h = L_h / del_M;  % cm, structural length at birth at f
  Ww_h = L_h^3 * (1 + f * ome);       % g, wet weight at hatching at f 

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
% aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

%   % smoltification 
%   F = f;
%   [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, F);
%   Lw_b = L_m * l_b/ del_M;  Lw_i = L_m * (F - l_T)/ del_M;
%   ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tL/ ir_B;  % d, 1/von Bert growth rate
%   as = 
%   Ls = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * ts); % cm, total length
% 
%   L_p = L_m * l_p;                  % cm, structural length at smoltification at f
%   Lw_p = L_p/ del_M;                % cm, physical length at smoltification at f
%   Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at smoltification 
%   % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at smoltification at f and T
%   aT_p = tau_b/ k_M/ TC_ap + (tau_p - tau_b)/ k_M/ TC_ap;   % d, age at smoltification at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
  % tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  aT_p = tau_p/ k_M/ TC_ap;   % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
% prdData.ah = aT_h;
% prdData.ab = aT_b;
% prdData.tp = tT_p;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
% prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.V0 = V_0;
  prdData.Wd0 = Wd_0;
  prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
% prdData.Wwp = Ww_p;
  prdData.Wwi_F = Ww_i;
  prdData.E0 = E_0;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-Wwe and t-WwVe
  % temperature 8°C
  % compute temperature correction factors
  TC8 = tempcorr(temp.tWwVe_T8, T_ref, T_A);
  vT8 = v * TC8; kT8_J = TC8 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT8_E_Am = TC8 * J_E_Am;
  UT8_E0 = TC8 * U_E0;
  
  % tW-data embryo without yolk
  t = [0; tWwVe_T8(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT8_E0 0], [], kap, vT8, kT8_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  EWw_e8 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
  % tWV-data yolk
  t = [0; tWwYe_T8(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT8_E0 0], [], kap, vT8, kT8_J, g, L_m); 
  LUH(1,:) = []; 
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT8_E_Am;
  EV_e8 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  
  % temperature 10°C
  % compute temperature correction factors
  TC10 = tempcorr(temp.tWwVe_T10, T_ref, T_A);
  vT10 = v * TC10; kT10_J = TC10 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT10_E_Am = TC10 * J_E_Am;
  UT10_E0 = TC10 * U_E0;
  
  % tW-data without yolk
  t = [0; tWwVe_T10(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT10_E0 0], [], kap, vT10, kT10_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  EWw_e10 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
  % tWV-data yolk
  t = [0; tWwYe_T10(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT10_E0 0], [], kap, vT10, kT10_J, g, L_m); 
  LUH(1,:) = []; 
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT10_E_Am;
  EV_e10 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  
  % temperature 12°C
  % compute temperature correction factors
  TC12 = tempcorr(temp.tWwVe_T12, T_ref, T_A);
  vT12 = v * TC12; kT12_J = TC12 * k_J;% kT_M = TC * k_M; pT_M = p_M * TC;
  JT12_E_Am = TC12 * J_E_Am;
  UT12_E0 = TC12 * U_E0;
  
  % tW-data without yolk
  t = [0; tWwVe_T12(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT12, kT12_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  EWw_e12 = L .^ 3 * (1 + f_tWeVe_tWeYe * w); % g, wet weight embryo minus vitellus
  % tWV-data yolk
  t = [0; tWwYe_T12(:,1)]; 
  [t LUH] = ode45(@dget_LUH, t, [1e-10 UT12_E0 0], [], kap, vT12, kT12_J, g, L_m); 
  LUH(1,:) = []; 
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT12_E_Am;
  EV_e12 = max(0, M_E * w_E/ d_E - L3 * f_tWeVe_tWeYe * w); % g, wet weight vitellus
  
  
  
  % time-length 
  F = f_tL;
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, F);
  Lw_b = L_m * l_b/ del_M;  Lw_i = L_m * (F - l_T)/ del_M;
  ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tL/ ir_B;  % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * (tL(:,1) + t0_tL)); % cm, total length
  
  % length-weight
  EWw_parrs = (LWw_parrs(:,1) * del_M).^3 * (1 + f_LWw_parrs * ome); % g, wet weight
  EWw_spawners = (LWw_spawners(:,1) * del_M).^3 * (1 + f_LWw_spawners * ome); % g, wet weight

  % temperature-age at hatching
  Eah = aUL(2,1) ./ TC_Tah; % d, time at hatch
  
  % temperature-age at birth
  Eab = tau_b/ k_M ./ TC_Tab;        % d, age at birth at f and T
  
  % pack to output
  prdData.tL = ELw;
  prdData.tWwVe_T8 = EWw_e8;
  prdData.tWwYe_T8 = EV_e8;
  prdData.tWwVe_T10 = EWw_e10;
  prdData.tWwYe_T10 = EV_e10;
  prdData.tWwVe_T12 = EWw_e12;
  prdData.tWwYe_T12 = EV_e12;
  prdData.LWw_parrs = EWw_parrs;
  prdData.LWw_spawners = EWw_spawners;
  prdData.Tah = Eah;
  prdData.Tab = Eab;
