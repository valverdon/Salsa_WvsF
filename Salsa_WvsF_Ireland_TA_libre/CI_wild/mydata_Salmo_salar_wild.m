function [data, auxData, metaData, txtData, weights] = mydata_Salmo_salar_wild 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_salar_wild'; 
metaData.species_en = 'Atlantic salmon'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi', 'jiCic', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ah';'ab';'aj';'ap';'am';'Lb';'Lj';'Li';'Wwb';'Wwj';'Ri'}; 
metaData.data_1     = {'L-Ww';'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author   = {'Charlotte Recapet'};    
metaData.date_subm = [2019 03 13];              
metaData.email    = {'charlotte.recapet@univ-pau.fr'};            
metaData.address  = {'ECOBIOP, National Institute for Agronomic Research - University Pau Pays de l''ADour, France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 04 17]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set data
% zero-variate data

%%%%%%%%%%%%%%%%%%%%
%% Age at hatching %
% %%%%%%%%%%%%%%%%%%%%
% data.ah_4_eng = 115;    units.ah_4_eng = 'd';    label.ah_4_eng = 'age at hatching';             bibkey.ah_4_eng = 'Carrick1979';     comment.ah_4_eng = 'parents from River Kent (Cumbria, northern England)';
%   temp.ah_4_eng = C2K(4);  units.temp.ah_4_eng = 'K'; label.temp.ah_4_eng = 'temperature';
% %f=natural (parents)
% data.ah_4_nor = 135;    units.ah_4_nor = 'd';    label.ah_4_nor = 'age at hatching';             bibkey.ah_4_nor = 'Berg2001';     comment.ah_4_nor = 'parents from river Stjørdalselva (Norway), mean of just before hatching and newly hatched';
%   temp.ah_4_nor = C2K(4);  units.temp.ah_4_nor = 'K'; label.temp.ah_4_nor = 'temperature';
% %f=natural (parents)
% data.ah_scocanmix = 110;    units.ah_scocanmix = 'd';    label.ah_scocanmix = 'age at hatching';             bibkey.ah_scocanmix = 'Gilbey2009';     comment.ah_scocanmix = 'mean of Bristol cove river (Scotland) + Don river (Canada) + hybrids, mean of offsprings time at 50% hatching';
%   temp.ah_scocanmix = C2K(5.8);  units.temp.ah_scocanmix = 'K'; label.temp.ah_scocanmix = 'temperature';
% %f=natural (parents)
% data.ah_05_fnor = 220;    units.ah_05_fnor = 'd';    label.ah_05_fnor = 'age at hatching';             bibkey.ah_05_fnor = 'Berg2001';     comment.ah_05_fnor = 'parents from river Teno (Finland/Norway), mean of all eggs';
%   temp.ah_05_fnor = C2K(0.5);  units.temp.ah_05_fnor = 'K'; label.temp.ah_05_nor = 'temperature';
% %f=natural (parents)
%     
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.ah_sco4to13 = 122;    units.ah_sco4to13 = 'd';    label.ah_sco4to13 = 'age at hatching';             bibkey.ah_sco5to13 = 'Berg2001';     comment.ah_sco4to13 = 'parents from river Blackwater (Scotland), spawning 28-30 Nov 2012, hatching uniformly 25 March to 3 April';
%   temp.ah_sco4to13 = C2K(10);  units.temp.ah_sco4to13 = 'K'; label.temp.ah_sco4to13 = 'temperature';
% %f=natural (parents)
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%see uni-variate
%%%%%%%%%%%%%%%%%%%%%%%%%
%% Age at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%
% data.ab_4_nor = 196;    units.ab_4_nor = 'd';    label.ab_4_nor = 'age at birth';             bibkey.ab_4_nor = 'Berg2001';     
%   temp.ab_4_nor = C2K(4);  units.temp.ab_4_nor = 'K'; label.temp.ab_4_nor = 'temperature';
%   comment.ab_4_nor = 'parents from river Stjørdalselva (Norway), immediatly before first feeding';
%   %f=natural (parents)
% % data.ab_sco4to13 = 146;    units.ab_sco4to13 = 'd';    label.ab_sco4to13 = 'age at birth';             bibkey.ab = 'Berg2001';     
% %   temp.ab_sco4to13 = C2K(10);  units.temp.ab_sco4to13 = 'K'; label.temp.ab_sco4to13 = 'temperature';
% %   comment.ab_sco4to13 = 'parents from river Blackwater (Scotland), reached 1st feeding, T� raised from 5 to 13 slowly';
% data.ab_scocanmix = 146;    units.ab_scocanmix = 'd';    label.ab_scocanmix = 'age at birth';             bibkey.ab_scocanmix = 'Gilbey2009';     comment.ab_scocanmix = 'mean of Bristol cove river (Scotland) + Don river (Canada), mean of offsprings time at 50% hatching';
%   temp.ab_scocanmix = C2K(5.8);  units.temp.ab_scocanmix = 'K'; label.temp.ab_scocanmix = 'temperature';
% %f=natural (parents)




%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Age at smoltification % time since birth
%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% data.ts_rus = 1424;    units.ts_rus = 'd';    label.ts_rus = 'time since birth at smoltification'; bibkey.ts_rus = 'Hutchings1998'; 
%   temp.ts_rus = C2K(7);  units.temp.ts_rus = 'K'; label.temp.ts_rus = 'temperature'; 
%   comment.ts_rus = 'River Pizhma (Russia); temperature: rough guess - highly variable temperature throughout life';
% data.ts_ice = 1107;    units.ts_ice = 'd';    label.ts_ice = 'time since birth at smoltification'; bibkey.ts_ice = 'Hutchings1998'; 
%   temp.ts_ice = C2K(7);  units.temp.ts_ice = 'K'; label.temp.ts_ice = 'temperature'; 
%   comment.ts_ice = 'mean of Iceland populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_nor = 1099;    units.ts_nor = 'd';    label.ts_nor = 'time since birth at smoltification'; bibkey.ts_nor = 'Hutchings1998'; 
%   temp.ts_nor = C2K(7);  units.temp.ts_nor = 'K'; label.temp.ts_nor = 'temperature'; 
%   comment.ts_nor = 'mean (high variability) of Norway populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_fin = 964;    units.ts_fin = 'd';    label.ts_fin = 'time since birth at smoltification'; bibkey.ts_fin = 'Hutchings1998'; 
%   temp.ts_fin = C2K(7);  units.temp.ts_fin = 'K'; label.temp.ts_fin = 'temperature'; 
%   comment.ts_fin = 'Simojoki river (Finland); temperature: rough guess of mean value - highly variable temperature throughout life ( 9.8-18°C)';
% data.ts_swe = 891;    units.ts_swe = 'd';    label.ts_swe = 'time since birth at smoltification'; bibkey.ts_swe = 'Hutchings1998'; 
%   temp.ts_swe = C2K(10);  units.temp.ts_swe = 'K'; label.temp.ts_swe = 'temperature'; 
%   comment.ts_swe = 'mean (high variability) of Sweden populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_gbr = 796;    units.ts_gbr = 'd';    label.ts_gbr = 'time since birth at smoltification'; bibkey.ts_gbr = 'Jutila2006'; 
%   temp.ts_gbr = C2K(12);  units.temp.ts_gbr = 'K'; label.temp.ts_gbr = 'temperature'; 
%   comment.ts_gbr = 'mean of Brittish populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_ire = 738;    units.ts_ire = 'd';    label.ts_ire = 'time since birth at smoltification'; bibkey.ts_ire = 'Hutchings1998'; 
%   temp.ts_ire = C2K(12);  units.temp.ts_ire = 'K'; label.temp.ts_ire = 'temperature'; 
%   comment.ts_ire = 'mean (high variability) of Irish populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_fra = 482;    units.ts_fra = 'd';    label.ts_fra = 'time since birth at smoltification'; bibkey.ts_fra = 'Hutchings1998'; 
%   temp.ts_fra = C2K(14);  units.temp.ts_fra = 'K'; label.temp.ts_fra = 'temperature'; 
%   comment.ts_fra = 'mean of French populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_spa = 446;    units.ts_spa = 'd';    label.ts_spa = 'time since birth at smoltification'; bibkey.ts_spa = 'Hutchings1998'; 
%   temp.ts_spa = C2K(14);  units.temp.ts_spa = 'K'; label.temp.ts_spa = 'temperature'; 
%   comment.ts_spa = 'mean of Spannish populations; temperature: rough guess - highly variable temperature throughout life';
% data.ts_norI = 626;    units.ts_norI = 'd';    label.ts_norI = 'time since birth at smoltification'; bibkey.ts_norI = 'Jonsson1998'; 
%   temp.ts_norI = C2K(12);  units.temp.ts_norI = 'K'; label.temp.ts_norI = 'temperature'; 
%   comment.ts_norI = 'mean of Imsa river (Norway) smolt age from 1983 to 1993; temperature: rough guess - highly variable temperature throughout life';
% data.ts_norI2 = 614;    units.ts_norI2 = 'd';    label.ts_norI2 = 'time since birth at smoltification'; bibkey.ts_norI = 'Hindar2006'; 
%   temp.ts_norI2 = C2K(12);  units.temp.ts_norI = 'K'; label.temp.ts_norI2 = 'temperature'; 
%   comment.ts_norI2 = 'mean of Imsa river (Norway); temperature: rough guess - highly variable temperature throughout life 1.68*365.25';
% data.ts_canm = 937;    units.ts_canm = 'd';    label.ts_canm = 'time since birth at male smoltification'; bibkey.ts_canm = 'Bailey1980'; 
%   temp.ts_canm = C2K(10);  units.temp.ts_canm = 'K'; label.temp.ts_canm = 'temperature'; 
%   comment.ts_canm = 'mean of 4 New brunswick rivers(Canada); temperature: rough guess - highly variable temperature throughout life; scalimetry*365.25';
% data.ts_canf = 815;    units.ts_canf = 'd';    label.ts_canf = 'time since birth at female smoltification'; bibkey.ts_canf = 'Bailey1980'; 
%   temp.ts_canf = C2K(10);  units.temp.ts_canf = 'K'; label.temp.ts_canf = 'temperature'; 
%   comment.ts_canf = 'mean of 4 New brunswick rivers(Canada); temperature: rough guess - highly variable temperature throughout life;  scalimetry*365.25';
% data.ts_canmean = 829;    units.ts_canmean = 'd';    label.ts_canmean = 'time since birth at smoltification'; bibkey.ts_canmean = 'Metcalfe1990'; 
%   temp.ts_canmean = C2K(10);  units.temp.ts_canmean = 'K'; label.temp.ts_canmean = 'temperature'; 
%   comment.ts_canmean = 'mean of canadian rivers(Canada); temperature: rough guess - highly variable temperature throughout life;  scalimetry*365.25';
% data.ts_eurmean = 1179;    units.ts_eurmean = 'd';    label.ts_eurmean = 'time since birth at smoltification'; bibkey.ts_eurmean = 'Metcalfe1990'; 
%   temp.ts_eurmean = C2K(10);  units.temp.ts_eurmean = 'K'; label.temp.ts_eurmean = 'temperature'; 
%   comment.ts_eurmean = 'mean of canadian rivers(Canada); temperature: rough guess - highly variable temperature throughout life;  scalimetry*365.25';

  
% data.aj = 1.04*365.25;    units.aj = 'd';    label.aj = 'age at metamorphosis'; bibkey.tj = 'Hutchings1998'; comment.tj = 'Nivelle';
%   temp.aj = C2K();  units.temp.aj = 'K'; label.temp.aj = 'temperature';


%%%%%%%%%%%%%%%%%%%%
%% Age at puberty%  (or age at first spawning minus 1 year) in time since birth
%%%%%%%%%%%%%%%%%%%%

%maturity measurement %temperature adjustments needed.
% data.tp_gbr = (4.58-1-1)*365.25; %1308 
%   units.tp_gbr = 'd';    label.tp_gbr = 'time since birth at puberty';  bibkey.tp_gbr = 'Hutchings1998'; 
%   temp.tp_gbr = C2K(10);  units.temp.tp_gbr = 'K'; label.temp.tp_gbr = 'temperature';
%   comment.tp_gbr = 'Mean of brittish populations; temperature: rough guess - highly variable temperature throughout life ((river age+sea age+1(fertilization to birth as in Hutchings 1998))-1(we remove it)-1(puberty occurs~1year before spawning)) , Table2';
% data.tp_ice = (5.54-1-1)*365.25; %1658
%   units.tp_ice = 'd';    label.tp_ice = 'time since birth at puberty';  bibkey.tp_ice = 'Hutchings1998'; 
%   temp.tp_ice = C2K(10);  units.temp.tp_ice = 'K'; label.temp.tp_ice = 'temperature'; 
%   comment.tp_ice = 'Mean of Icelandic populations; temperature: rough guess - highly variable temperature throughout life ((river age+sea age+1(fertilization to birth as in Hutchings 1998))-1(we remove it)-1(puberty occurs~1year before spawning)) , Table2';
data.tp_nor = (5.71-1-1)*365.25; %1355;  
  units.tp_nor = 'd';    label.tp_nor = 'time since birth at puberty';  bibkey.tp_nor = 'Hutchings1998'; 
  temp.tp_nor = C2K(10);  units.temp.tp_nor = 'K'; label.temp.tp_nor = 'temperature'; 
  comment.tp_nor = 'Mean of Norwegian populations; temperature: rough guess - highly variable temperature throughout life ((river age+sea age+1(fertilization to birth as in Hutchings 1998))-1(we remove it)-1(puberty occurs~1year before spawning)) , Table2';
% data.tp_fraspa = (4.08-1-1)*365.25; %1045;  
%   units.tp_fraspa = 'd';    label.tp_fraspa = 'time since birth at puberty';  bibkey.tp_fraspa = 'Hutchings1998'; 
%   temp.tp_fraspa = C2K(10);  units.temp.tp_fraspa = 'K'; label.temp.tp_fraspa = 'temperature'; 
%   comment.tp_fraspa = 'Mean of French+Spannish populations; temperature: rough guess - highly variable temperature throughout life ((river age+sea age+1(fertilization to birth as in Hutchings 1998))-1(we remove it)-1(puberty occurs~1year before spawning)) , Table2';
% data.tp_ire =(3.86-1-1)*365.25; % 1125;   
%   units.tp_ire = 'd';    label.tp_ire = 'time since birth at puberty';  bibkey.tp_ire = 'Hutchings1998'; 
%   temp.tp_ire = C2K(10);  units.temp.tp_ire = 'K'; label.temp.tp_ire = 'temperature'; 
%   comment.tp_ire = 'Mean of Irish populations; temperature: rough guess - highly variable temperature throughout life ((river age+sea age+1(fertilization to birth as in Hutchings 1998))-1(we remove it)-1(puberty occurs~1year before spawning)) , Table2';
  %f= natural
  
% data.tp_canm = (2.52+1.57-1)*365.25; %1129;   
%   units.tp_canm = 'd';    label.tp_canm = 'time since birth at puberty';  bibkey.tp_canm = 'Bailey1980'; 
%   temp.tp_canm = C2K(10);  units.temp.tp_canm = 'K'; label.temp.tp_canm = 'temperature'; 
%   comment.tp_canm = 'mean of 4 New brunswick rivers(Canada); temperature: rough guess - highly variable temperature throughout life;  scalimetry (smolt age + sea age-1) *365.25, Table2';
% data.tp_canf = (2.23+1.87-1)*365.25; % 1134;  
%   units.tp_canf = 'd';    label.tp_canf = 'time since birth at puberty';  bibkey.tp_canf = 'Bailey1980'; 
%   temp.tp_canf = C2K(10);  units.temp.tp_canf = 'K'; label.temp.tp_canf = 'temperature'; 
%   comment.tp_canf = 'mean of 4 New brunswick rivers(Canada); temperature: rough guess - highly variable temperature throughout life;  scalimetry (smolt age + sea age-1) *365.25, Table2';
    %f= natural
  
% data.tp_rus = (4.74-1)*365.25; %1366;  
%   units.tp_rus = 'd';    label.tp_rus = 'time since birth at puberty';  bibkey.tp_rus = 'Kazakov1981'; 
%   temp.tp_rus = C2K(10);  units.temp.tp_rus = 'K'; label.temp.tp_rus = 'temperature'; 
%   comment.tp_rus = 'Mean of Neva river (Russia); temperature: rough guess - highly variable temperature throughout life, table1';
data.tp_norI =(1.68+1.22-1)*365.25; % 694;  
  units.tp_norI = 'd';    label.tp_norI = 'time since birth at puberty';  bibkey.tp_norI = 'Hindar2006'; 
  temp.tp_norI = C2K(10);  units.temp.tp_norI = 'K'; label.temp.tp_norI = 'temperature'; 
  comment.tp_norI = 'Mean of Imsa river (Norway); temperature: rough guess - highly variable temperature throughout life, Table3';
% data.tp_ire2 = (2+1.04-1)*365.25; % 745;  
%   units.tp_ire2 = 'd';    label.tp_ire2 = 'time since birth at puberty';  bibkey.tp_ire2 = 'Hindar2006'; 
%   temp.tp_ire2 = C2K(10);  units.temp.tp_ire2 = 'K'; label.temp.tp_ire2 = 'temperature'; 
%   comment.tp_ire2 = 'Mean of Burrishoole river (Norway); temperature: rough guess - highly variable temperature throughout life, Table 3';
  %f= natural
  
  %%%%%%%%%%%%%%%%%%%%
  %% Age at spawning %
  %%%%%%%%%%%%%%%%%%%%
%    data.tp_rusb = 1731;    units.tp_rusb = 'd';    label.tp_rusb = 'time since birth at spawning';  bibkey.tp_rusb = 'Kazakov1981'; 
%   temp.tp_rusb = C2K(10);  units.temp.tp_rusb = 'K'; label.temp.tp_rusb = 'temperature'; 
%   comment.tp_rusb = 'Mean of Neva river (Russia); temperature: rough guess - highly variable temperature throughout life; (4.74)*365.25';
%  data.tp_norIb = 1059;    units.tp_norIb = 'd';    label.tp_norIb = 'time since birth at spawning';  bibkey.tp_norIb = 'Hindar2006'; 
%   temp.tp_norIb = C2K(10);  units.temp.tp_norIb = 'K'; label.temp.tp_norIb = 'temperature'; 
%   comment.tp_norIb = 'Mean of Imsa river (Norway); temperature: rough guess - highly variable temperature throughout life(1,68+1.22)*365.25';
%  data.tp_ireb = 1110;    units.tp_ireb = 'd';    label.tp_ireb = 'time since birth at spawning';  bibkey.tp_ireb = 'Hindar2006'; 
%   temp.tp_ireb = C2K(10);  units.temp.tp_ireb = 'K'; label.temp.tp_ireb = 'temperature'; 
%   comment.tp_ireb = 'Mean of Imsa river (Norway); temperature: rough guess - highly variable temperature throughout life(2+1.04)*365.25';

  
% data.ap = (1.04+1.17)*365.25;    units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Hutchings1998'; comment.tj = 'Nivelle';
%   temp.ap = C2K();  units.temp.ap = 'K'; label.temp.ap = 'temperature';

%%%%%%%%%%%%%
%% Lifespan %(mean or maximum?) in time since birth
%%%%%%%%%%%%%
data.am = 3444;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Flower1935';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'maximum lifespan - females caught in loch Maree on 1924; temperature: rough guess - highly variable temperature throughout life, text page 274';

% data.am_sco = (2.265+2.39)*365.25;    units.am_sco = 'd';    label.am_sco = 'life span';  bibkey.am_sco = 'Hutchings1998'; comment.am_sco = 'max of Scottish populations';
%    temp.am_sco = C2K(10);  units.temp.am_sco = 'K'; label.temp.am_sco = 'temperature'; comment.temp.am_sco = 'rough guess - highly variable temperature throughout life, annex';
% data.am_rus = 8*365.25;    units.am_rus = 'd';    label.am_rus = 'life span';  bibkey.am_rus = 'Hutchings1998'; comment.am_rus = 'Max age in river Neva (Russia)';
%    temp.am_rus = C2K(10);  units.temp.am_rus = 'K'; label.temp.am_rus = 'temperature'; comment.temp.am_rus = 'rough guess - highly variable temperature throughout life, annex';
  %f= natural

%%%%%%%%%%%%%%%%%%%%%%%
%% Length at hatching %
%%%%%%%%%%%%%%%%%%%%%%%

data.Lh_Can2  = 2.09;   units.Lh_Can2  = 'cm';  label.Lh_Can2  = 'fork length at hatching';   bibkey.Lh_Can2  = 'Peterson1977';  comment.Lh_Can2 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table5';
  temp.Lh_Can2 = C2K(2);  units.temp.Lh_Can2 = 'K'; label.temp.Lh_Can2 = 'temperature';
data.Lh_Can4  = 2.09;   units.Lh_Can4  = 'cm';  label.Lh_Can4  = 'fork length at hatching';   bibkey.Lh_Can4  = 'Peterson1977';  comment.Lh_Can4 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_Can4 = C2K(4);  units.temp.Lh_Can4 = 'K'; label.temp.Lh_Can4 = 'temperature';
data.Lh_Can6  = 1.90;   units.Lh_Can6  = 'cm';  label.Lh_Can6  = 'fork length at hatching';   bibkey.Lh_Can6  = 'Peterson1977';  comment.Lh_Can6 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_Can6 = C2K(6);  units.temp.Lh_Can6 = 'K'; label.temp.Lh_Can6 = 'temperature';
data.Lh_Can8  = 1.92;   units.Lh_Can8  = 'cm';  label.Lh_Can8  = 'fork length at hatching';   bibkey.Lh_Can8  = 'Peterson1977';  comment.Lh_Can8 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_Can8 = C2K(8);  units.temp.Lh_Can8 = 'K'; label.temp.Lh_Can8 = 'temperature';
data.Lh_Can10  = 1.79;   units.Lh_Can10  = 'cm';  label.Lh_Can10  = 'fork length at hatching';   bibkey.Lh_Can10  = 'Peterson1977';  comment.Lh_Can10 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table 6';
 temp.Lh_Can10 = C2K(10);  units.temp.Lh_Can10 = 'K'; label.temp.Lh_Can10 = 'temperature';
data.Lh_Can12  = 1.66;   units.Lh_Can12  = 'cm';  label.Lh_Can12  = 'fork length at hatching';   bibkey.Lh_Can12  = 'Peterson1977';  comment.Lh_Can12 = 'parents from Dennis Stream (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_Can12 = C2K(12);  units.temp.Lh_Can12 = 'K'; label.temp.Lh_Can12 = 'temperature';
data.Lh_CanM4  = 1.93;   units.Lh_CanM4  = 'cm';  label.Lh_CanM4  = 'fork length at hatching';   bibkey.Lh_CanM4  = 'Peterson1977';  comment.Lh_CanM4 = 'parents from Miramichi River (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_CanM4 = C2K(4);  units.temp.Lh_CanM4 = 'K'; label.temp.Lh_CanM4 = 'temperature';
data.Lh_CanM6  = 1.87;   units.Lh_CanM6  = 'cm';  label.Lh_CanM6  = 'fork length at hatching';   bibkey.Lh_CanM6  = 'Peterson1977';  comment.Lh_CanM6 = 'parents from Miramichi River (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_CanM6 = C2K(6);  units.temp.Lh_CanM6 = 'K'; label.temp.Lh_CanM6 = 'temperature';
data.Lh_CanM8  = 1.84;   units.Lh_CanM8  = 'cm';  label.Lh_CanM8  = 'fork length at hatching';   bibkey.Lh_CanM8  = 'Peterson1977';  comment.Lh_CanM8 = 'parents from Miramichi River (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_CanM8 = C2K(8);  units.temp.Lh_CanM8 = 'K'; label.temp.Lh_CanM8 = 'temperature';
data.Lh_CanM10  = 1.73;   units.Lh_CanM10  = 'cm';  label.Lh_CanM10  = 'fork length at hatching';   bibkey.Lh_CanM10  = 'Peterson1977';  comment.Lh_CanM10 = 'parents from Miramichi River (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_CanM10 = C2K(10);  units.temp.Lh_CanM10 = 'K'; label.temp.Lh_CanM10 = 'temperature';
data.Lh_CanM12  = 1.62;   units.Lh_CanM12  = 'cm';  label.Lh_CanM12  = 'fork length at hatching';   bibkey.Lh_CanM12  = 'Peterson1977';  comment.Lh_CanM12 = 'parents from Miramichi River (New Brunswick - Canada), fork length, Table 6';
  temp.Lh_CanM12 = C2K(12);  units.temp.Lh_CanM12 = 'K'; label.temp.Lh_CanM12 = 'temperature';
data.Lh_CanP  = 1.8;   units.Lh_CanP  = 'cm';  label.Lh_CanP  = 'fork length at hatching';   bibkey.Lh_CanP  = 'Srivastava1991';  comment.Lh_CanP = 'parents from Northeast Placentia River (Newfoundland, Canada), fork length, Fig 2';
  temp.Lh_CanP = C2K(7);  units.temp.Lh_CanP = 'K'; label.temp.Lh_CanP = 'temperature';
data.Lh_Rus  = 1.83;   units.Lh_Rus  = 'cm';  label.Lh_Rus  = 'total length at hatching ?';   bibkey.Lh_Rus  = 'Kazakov1981';  comment.Lh_Rus = 'parents from Neva river (Russia),  total length? "generally accepted biometric method", Table 7';
  temp.Lh_Rus = C2K(5);  units.temp.Lh_Rus = 'K'; label.temp.Lh_Rus = 'temperature';  comment.temp.Lh_Rus = 'rough estimate of Temperature';
data.Lh_scocanmix  = 1.74;   units.Lh_scocanmix  = 'cm';  label.Lh_scocanmix  = 'fork length at hatching';   bibkey.Lh_scocanmix  = 'Gilbey2009';  comment.Lh_scocanmix = 'mean of offsprings from parents from Bristol cove river (Scotland) & Don river (Canada), fork length? "standard length", fig1d';
  temp.Lh_scocanmix = C2K(5.8);  units.temp.Lh_scocanmix = 'K'; label.temp.Lh_scocanmix = 'temperature';  comment.temp.Lh_scocanmix = 'rough estimate of Temperature';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Length at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.Lb_Sco1SWM  = 2.825;   units.Lb_Sco1SWM  = 'cm';  label.Lb_Sco1SWM  = 'fork length at birth';   bibkey.Lb_Sco1SWM  = 'VanLeeuwen2016';  
%   comment.Lb_Sco1SWM = 'parents from River Blackwater (Scotland) - 1SW mother, Fig 1B';
% data.Lb_Sco2SWM  = 2.925;   units.Lb_Sco2SWM  = 'cm';  label.Lb_Sco2SWM  = 'fork length at birth';   bibkey.Lb_Sco2SWM  = 'VanLeeuwen2016';  comment.Lb_Sco2SWM = 'parents from River Blackwater (Scotland) - 2SW mother, Fig 1B';
data.Lb_NorF2011  = 2.88;   units.Lb_NorF2011  = 'cm';  label.Lb_NorF2011  = 'fork length at birth';   bibkey.Lb_NorF2011  = 'Solberg2014';  comment.Lb_NorF2011 = 'parents from river Figgjo (Norway in 2011), Table2';
data.Lb_NorF2012  = 2.83;   units.Lb_NorF2012  = 'cm';  label.Lb_NorF2012  = 'fork length at birth';   bibkey.Lb_NorF2012  = 'Solberg2014';  comment.Lb_NorF2012 = 'parents from river Figgjo (Norway in 2011),Table 2';
data.Lb_NorF2013  = 2.78;   units.Lb_NorF2013  = 'cm';  label.Lb_NorF2013  = 'fork length at birth';   bibkey.Lb_NorF2013  = 'Solberg2014';  comment.Lb_NorF2013 = 'parents from river Figgjo (Norway in 2011), Table 2';
data.Lb_NorV2013  = 2.83;   units.Lb_NorV2013  = 'cm';  label.Lb_NorV2013  = 'fork length at birth';   bibkey.Lb_NorV2013  = 'Solberg2014';  comment.Lb_NorF2013 = 'parents from river Vosso (Norway in 2011), Table 2';

%  data.Lb_Can2D  = 2.81;   units.Lb_Can2D  = 'cm';  label.Lb_Can2D  = 'fork length at birth';   bibkey.Lb_Can2D  = 'Peterson1977';  comment.Lb_Can2D = 'parents from Dennis Stream, fork length, Fig. 6 (New Brunswick - Canada)';
%   temp.Lb_Can2D = C2K(2);  units.temp.Lb_Can2D = 'K'; label.temp.Lb_Can2D = 'temperature';
%  data.Lb_Can6D  = 3.00;   units.Lb_Can6D  = 'cm';  label.Lb_Can6D  = 'fork length at birth';   bibkey.Lb_Can6D  = 'Peterson1977';  comment.Lb_Can6D = 'parents from Dennis Stream, fork length, Fig. 6 (New Brunswick - Canada)';
%   temp.Lb_Can6D = C2K(6);  units.temp.Lb_Can6D = 'K'; label.temp.Lb_Can6D = 'temperature';
%  data.Lb_Can12D  = 2.70;   units.Lb_Can12D  = 'cm';  label.Lb_Can12D  = 'fork length at birth';   bibkey.Lb_Can12D  = 'Peterson1977';  comment.Lb_Can12D = 'parents from Dennis Stream, fork length, Fig. 6 (New Brunswick - Canada)';
%   temp.Lb_Can12D = C2K(12);  units.temp.Lb_Can12D = 'K'; label.temp.Lb_Can12D = 'temperature';
%  data.Lb_Can4M  = 2.89;   units.Lb_Can4M  = 'cm';  label.Lb_Can4M  = 'fork length at birth';   bibkey.Lb_Can4M  = 'Peterson1977';  comment.Lb_Can4M = 'parents from Miramichi River (New Brunswick - Canada), fork length, Fig. 6 ';
%   temp.Lb_Can4M = C2K(4);  units.temp.Lb_Can4M = 'K'; label.temp.Lb_Can4M = 'temperature';
%  data.Lb_Can6M  = 2.90;   units.Lb_Can6M  = 'cm';  label.Lb_Can6M  = 'fork length at birth';   bibkey.Lb_Can6M  = 'Peterson1977';  comment.Lb_Can6M = 'parents from Miramichi River (New Brunswick - Canada), fork length, Fig. 6 ';
%   temp.Lb_Can6M = C2K(6);  units.temp.Lb_Can6M = 'K'; label.temp.Lb_Can6M = 'temperature';
%  data.Lb_Can8M  = 2.86;   units.Lb_Can8M  = 'cm';  label.Lb_Can8M  = 'fork length at birth';   bibkey.Lb_Can8M  = 'Peterson1977';  comment.Lb_Can8M = 'parents from Miramichi River (New Brunswick - Canada), fork length, Fig. 6 ';
%   temp.Lb_Can8M = C2K(8);  units.temp.Lb_Can8M = 'K'; label.temp.Lb_Can8M = 'temperature';
%  data.Lb_Can10M  = 2.80;   units.Lb_Can10M  = 'cm';  label.Lb_Can10M  = 'fork length at birth';   bibkey.Lb_Can10M  = 'Peterson1977';  comment.Lb_Can10M = 'parents from Miramichi River (New Brunswick - Canada),  fork length, Fig. 6 ';
%   temp.Lb_Can10M = C2K(10);  units.temp.Lb_Can10M = 'K'; label.temp.Lb_Can10M = 'temperature';
%  data.Lb_Can12M  = 2.76;   units.Lb_Can12M  = 'cm';  label.Lb_Can12M  = 'fork length at birth';   bibkey.Lb_Can12M  = 'Peterson1977';  comment.Lb_Can12M = 'parents from Miramichi River (New Brunswick - Canada),  fork length, Fig. 6 ';
%   temp.Lb_Can12M = C2K(12);  units.temp.Lb_Can12M = 'K'; label.temp.Lb_Can12M = 'temperature';
% data.Lb_CanP  = 2.5;   units.Lb_CanP  = 'cm';  label.Lb_CanP  = 'fork length at birth';   bibkey.Lb_CanP  = 'Srivastava1991';  comment.Lb_CanP = 'parents from Northeast Placentia River (Newfoundland, Canada),  fork length, Fig 2A';
%   temp.Lb_CanP = C2K(7);  units.temp.Lb_CanP = 'K'; label.temp.Lb_CanP = 'temperature';
% data.Lb_Rus  = 2.55;   units.Lb_Rus  = 'cm';  label.Lb_Rus  = 'total length at birth ?';   bibkey.Lb_Rus  = 'Kazakov1981';  comment.Lb_Rus = 'parents from Neva river (Russia),  total length? "generally accepted biometric method", Table 8';
%   temp.Lb_Rus = C2K(5);  units.temp.Lb_Rus = 'K'; label.temp.Lb_Rus = 'temperature';  comment.temp.Lb_Rus = 'rough estimate of Temperature';
% data.Lb_Usa  = 2.82;   units.Lb_Usa  = 'cm';  label.Lb_Usa  = 'fork length at birth';   bibkey.Lb_Usa  = 'Coughlin1991';  comment.Lb_Usa = 'parents from Conecticut river (USA), t= birth+8days, fork length, Table 2';
%   temp.Lb_Usa = C2K(5);  units.temp.Lb_Usa = 'K'; label.temp.Lb_Usa = 'temperature';  comment.temp.Lb_Usa = 'rough estimate of Temperature';
% data.Lb_ScoA  = 2.74;   units.Lb_ScoA  = 'cm';  label.Lb_ScoA  = 'fork length at birth';   bibkey.Lb_ScoA  = 'Metcalfe1992';  comment.Lb_ScoA = 'parents from River Almond (Scotland), fork length, Table 2';


%% Length at precocious maturation %(males only)

% data.Lpp  = ;   units.Lpp  = 'cm';  label.Lpp  = 'total length at precocious puberty'; bibkey.Lpp  = ''; comment.Lpp = 'males only';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Length at smoltification %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.Ls_gbr  = 12.4;   units.Ls_gbr  = 'cm';  label.Ls_gbr  = 'total length at smoltification'; bibkey.Ls_gbr  = 'Hutchings1998'; 
%  comment.Ls_gbr = 'mean of Brittish populations';
% data.Ls_rus  = 14;   units.Ls_rus  = 'cm';  label.Ls_rus  = 'total length at smoltification'; bibkey.Ls_rus  = 'Hutchings1998'; 
%   comment.Ls_rus = 'River Pizhma (Russia)';
% data.Ls_ice  = 12.5;   units.Ls_ice  = 'cm';  label.Ls_ice  = 'total length at smoltification'; bibkey.Ls_ice  = 'Hutchings1998'; 
%   comment.Ls_ice = 'mean of Icelandic populations';
% data.Ls_nor  = 13.1;   units.Ls_nor  = 'cm';  label.Ls_nor  = 'total length at smoltification'; bibkey.Ls_nor  = 'Hutchings1998'; 
%   comment.Ls_nor = 'mean of Norwegian populations';
% data.Ls_ire  = 13.6;   units.Ls_ire  = 'cm';  label.Ls_ire  = 'total length at smoltification'; bibkey.Ls_ire  = 'Hutchings1998'; 
%   comment.Ls_ire = 'mean of Irish populations';
% data.Ls_fra  = 18.1;   units.Ls_fra  = 'cm';  label.Ls_fra  = 'total length at smoltification'; bibkey.Ls_fra  = 'Hutchings1998'; 
%   comment.Ls_fra = 'mean of French populations';
% data.Ls_spa  = 17.2;   units.Ls_spa  = 'cm';  label.Ls_spa  = 'total length at smoltification'; bibkey.Ls_spa  = 'Hutchings1998'; 
%   comment.Ls_spa = 'mean of Spannish populations';
% data.Ls_finS1980  = 15.2;   units.Lj  = 'cm';  label.Lj  = 'total length at smoltification'; bibkey.Lj  = 'Jutila2006'; comment.Lj = 'Simojoki (Baltic Sea, Finland) - mean from 1972 to 1991';
% data.Ls_finS1990  = 15.5;   units.Lj  = 'cm';  label.Lj  = 'total length at smoltification'; bibkey.Lj  = 'Jokikkoko2006'; comment.Lj = 'Simojoki (Baltic Sea, Finland) - mean from 1986 to 1992';
% data.Ls_norI  = 16.3;   units.Lj  = 'cm';  label.Lj  = 'total length at smoltification'; bibkey.Lj  = 'Jonsson1991'; comment.Lj = 'Imsa (Norway)';

% data.Lj  = 18.7;   units.Lj  = 'cm';  label.Lj  = 'total length at smoltification'; bibkey.Lj  = 'Hutchings1998'; comment.Lj = 'Nivelle';

%%%%%%%%%%%%%%%%%%%%%%%
%% Length at maturity %            (or 1 year before first spawning)
%%%%%%%%%%%%%%%%%%%%%%%

%direct


%need calculation

%from grilse length
% data.Lp_spa  = 70 ;   units.Lp_spa  = 'cm';  label.Lp_spa  = 'total length at puberty (grilse)'; bibkey.Lp_spa  = 'Hutchings1998';   
%   comment.Lp_spa = 'river Narcea (Spain)';
% data.Lp_fra  = 63.5 ;   units.Lp_spa  = 'cm';  label.Lp_spa  = 'total length at puberty (grilse)'; bibkey.Lp_spa  = 'Hutchings1998';   
%   comment.Lp_spa = 'mean of French population';
% data.Lp_ire  = 61.8 ;   units.Lp_ire  = 'cm';  label.Lp_ire  = 'total length at puberty (grilse)'; bibkey.Lp_ire  = 'Hutchings1998';   
%   comment.Lp_ire = 'mean of Irish population';
% data.Lp_gbr  = 62 ;   units.Lp_gbr  = 'cm';  label.Lp_gbr  = 'total length at puberty (grilse)'; bibkey.Lp_gbr  = 'Hutchings1998';   
%   comment.Lp_gbr = 'mean of Brittish population';
% data.Lp_nor  = 59.5 ;   units.Lp_nor  = 'cm';  label.Lp_nor  = 'total length at puberty (grilse)'; bibkey.Lp_nor  = 'Hutchings1998';   
%   comment.Lp_nor = 'mean of Norwegian population';

%from spawning length
%data.Lp_norS  = 78 ;   units.Lp_norS  = 'cm';  label.Lp_norS  = 'total length at puberty'; bibkey.Lp_norS  = 'Berg2001';   comment.Lp_norS = 'mean of 6 females length at spawning, river Stjørdalselva';
% data.Lp_sco  = 70 ;   units.Lp_sco  = 'cm';  label.Lp_sco  = 'total length at puberty'; bibkey.Lp_sco  = 'Fleming1996';   comment.Lp_sco = 'mean of scottish river spawning females';
% data.Lp_norI  = 67.5 ;   units.Lp_norI  = 'cm';  label.Lp_norI  = 'total length at puberty'; bibkey.Lp_norI  = 'Fleming1996';   comment.Lp_norI = 'mean females at spawning, river Imsa (Norway)';
% data.Lp_spaNM  = 74.8 ;   units.Lp_spaNM  = 'cm';  label.Lp_spaNM  = 'total length at puberty'; bibkey.Lp_spaNM  = 'Fleming1996';   comment.Lp_spaNM = 'mean females at spawning, rivers Narraguagus & Machias (Spain)';
% data.Lp_canM  = 66.4 ;   units.Lp_canM  = 'cm';  label.Lp_canM  = 'total length at puberty'; bibkey.Lp_canM  = 'Fleming1996';   comment.Lp_canM = 'mean females at spawning, river Mirachimi (Canada)';
% data.Lp_canR  = 84.8 ;   units.Lp_canR  = 'cm';  label.Lp_canR  = 'total length at puberty'; bibkey.Lp_canR  = 'Fleming1996';   comment.Lp_canR = 'mean females at spawning, river Restigouche (Canada)';
% data.Lp_norSf  = 52.7 ;   units.Lp_norSf  = 'cm';  label.Lp_norSf  = 'postorbital-hypural length at puberty'; bibkey.Lp_norSf  = 'Fleming1996b';   comment.Lp_norSf = 'mean females at spawning, river Imsa (Canada)';
% data.Lp_norSm  = 47.7 ;   units.Lp_norSm  = 'cm';  label.Lp_norSm  = 'postorbital-hypural length at puberty'; bibkey.Lp_norSm  = 'Fleming1996b';   comment.Lp_norSm = 'mean males at spawning, river Imsa (Canada)';
% data.Lp_rus  = 81.9 ;   units.Lp_rus  = 'cm';  label.Lp_rus  = 'total length at puberty'; bibkey.Lp_rus  = 'Kazakov1981';   comment.Lp_rus = 'mean females at 1st spawning, river Neva (Russia)';
%data.Lp_usa  = 79.0 ;   units.Lp_usa  = 'cm';  label.Lp_usa  = 'total length at puberty'; bibkey.Lp_usa  = 'Baum1971';   comment.Lp_usa = 'mean females at 1st spawning, rivers Machias & Narraguagus (Usa)';


%%%%%%%%%%%%%%%%%%%%%%%
%% Length at 1st spawning %
%%%%%%%%%%%%%%%%%%%%%%%
%f=natural
%data.Lp_spa  = 70 ;   units.Lp_spa  = 'cm';  label.Lp_spa  = 'total length at puberty (grilse)'; bibkey.Lp_spa  = 'Hutchings1998';   
%   comment.Lp_spa = 'river Narcea (Spain)';
% data.Lp_fra  = 63.5 ;   units.Lp_spa  = 'cm';  label.Lp_spa  = 'total length at puberty (grilse)'; bibkey.Lp_spa  = 'Hutchings1998';   
%   comment.Lp_spa = 'mean of French population';
% data.Lp_ire  = 61.8 ;   units.Lp_ire  = 'cm';  label.Lp_ire  = 'total length at puberty (grilse)'; bibkey.Lp_ire  = 'Hutchings1998';   
%   comment.Lp_ire = 'mean of Irish population';
% data.Lp_gbr  = 62 ;   units.Lp_gbr  = 'cm';  label.Lp_gbr  = 'total length at puberty (grilse)'; bibkey.Lp_gbr  = 'Hutchings1998';   
%   comment.Lp_gbr = 'mean of Brittish population';
% data.Lp_nor  = 59.5 ;   units.Lp_nor  = 'cm';  label.Lp_nor  = 'total length at puberty (grilse)'; bibkey.Lp_nor  = 'Hutchings1998';   
%   comment.Lp_nor = 'mean of Norwegian population';
data.Lsp_norS  = 78 ;   units.Lsp_norS  = 'cm';  label.Lsp_norS  = 'total length at 1st spawning?'; bibkey.Lsp_norS  = 'Berg2001';   comment.Lsp_norS = 'mean of 6 females length at spawning, river Stj�rdalselva, "length" no further precision, Table 1';
    temp.Lsp_norS = C2K(9.4);  units.temp.Lsp_norS = 'K'; label.temp.Lsp_norS = 'temperature'; label.temp.comment.Lsp_norS = 'estimation for 1999 from Eivind Vae Master thesis 2015';
% data.Lsp_sco  = 70 ;   units.Lsp_sco  = 'cm';  label.Lsp_sco  = 'fork length at 1st spawning'; bibkey.Lsp_sco  = 'Fleming1996';   comment.Lsp_sco = 'mean of scottish river spawning females, fork length,  Table 2';
data.Lsp_norI  = 67.5 ;   units.Lsp_norI  = 'cm';  label.Lsp_norI  = 'fork length at 1st spawning'; bibkey.Lsp_norI  = 'Fleming1996';   comment.Lsp_norI = 'mean females at spawning, river Imsa (Norway), fork length, Table 2';
    temp.Lsp_norI = C2K(8.59);  units.temp.Lsp_norI = 'K'; label.temp.Lsp_norI = 'temperature'; label.temp.comment.Lsp_norI = 'data from 1976 to 1980 from Jonsson et al. 2001';
% data.Lsp_spaNM  = 74.8 ;   units.Lsp_spaNM  = 'cm';  label.Lsp_spaNM  = 'fork length at 1st spawning'; bibkey.Lsp_spaNM  = 'Fleming1996';   comment.Lsp_spaNM = 'mean females at spawning, rivers Narraguagus & Machias (Spain), fork length, Table 2';
% data.Lsp_canM  = 66.4 ;   units.Lsp_canM  = 'cm';  label.Lsp_canM  = 'fork length at 1st spawning'; bibkey.Lsp_canM  = 'Fleming1996';   comment.Lsp_canM = 'mean females at spawning, river Mirachimi (Canada), fork length, Table 2';
% data.Lsp_canR  = 84.8 ;   units.Lsp_canR  = 'cm';  label.Lsp_canR  = 'fork length at 1st spawning'; bibkey.Lsp_canR  = 'Fleming1996';   comment.Lsp_canR = 'mean females at spawning, river Restigouche (Canada), fork length, Table 2';
data.Lsp_norSf  = 52.7 ;   units.Lsp_norSf  = 'cm';  label.Lsp_norSf  = 'postorbital-hypural length at 1st spawning'; bibkey.Lsp_norSf  = 'Fleming1996b';   comment.Lsp_norSf = 'mean females at spawning, river Imsa (Norway) table 1';
data.Lsp_norSm  = 47.7 ;   units.Lsp_norSm  = 'cm';  label.Lsp_norSm  = 'postorbital-hypural length at 1st spawning'; bibkey.Lsp_norSm  = 'Fleming1996b';   comment.Lsp_norSm = 'mean males at spawning, river Imsa (Norway) table 1';
    temp.Lsp_norSf = C2K(8.59);  units.temp.Lsp_norSf = 'K'; label.temp.Lsp_norSf = 'temperature'; label.temp.comment.Lsp_norSf = 'data from 1976 to 1980 from Jonsson et al. 2001';
% data.Lsp_rus  = 81.9 ;   units.Lsp_rus  = 'cm';  label.Lsp_rus  = 'fork length at 1st spawning?'; bibkey.Lsp_rus  = 'Kazakov1981';   comment.Lsp_rus = 'mean females at 1st spawning, river Neva (Russia), total length? "generally accepted biometric method", Table5';
% data.Lsp_usa  = 79.0 ;   units.Lsp_usa  = 'cm';  label.Lsp_usa  = 'fork length at 1st spawning'; bibkey.Lsp_usa  = 'Baum1971';   comment.Lsp_usa = 'mean females at spawning, rivers Machias & Narraguagus (Usa), converted from inches, table 1';
%reared to smolt
% data.Lsp_norI2  = 62.7 ;   units.Lsp_norI2  = 'cm';  label.Lsp_norI2  = 'total length at 1st spawning'; bibkey.Lsp_norI2  = 'Jonsson1991';   comment.Lsp_norI2 = 'River Imsa, Smolt length + 1 year increment at sea (grilse), Table3'; 




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Maximal length  (max length at spawning)   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.Li_ScoMax  = 95;   units.Li_ScoMax  = 'cm';  label.Li_ScoMax  = 'ultimate fork length';   bibkey.Li_ScoMax  = 'Fleming1996'; 
%   comment.Li_ScoMax = 'maximum of Scottish populations maxima - females, fork length Table 2';
data.Li_NorFM = 86;   units.Li_NorFM = 'cm';   label.Li_NorFM = 'ultimate fork length';     bibkey.Li_NorFM = 'Solberg2014'; comment.Li_NorFM = 'maximum of Figgjo river -males (n<10),Table1';
data.Li_NorFF = 80;   units.Li_NorFF = 'cm';   label.Li_NorFF = 'ultimate fork length';     bibkey.Li_NorFF = 'Solberg2014'; comment.Li_NorFF = 'maximum of Figgjo river - females (n<10),Table1';
data.Li_NorVM = 109;   units.Li_NorVM = 'cm';   label.Li_NorVM = 'ultimate fork length';     bibkey.Li_NorVM = 'Solberg2014'; comment.Li_NorVM = 'maximum of Vosso river -males (n<10),Table1';
data.Li_NorVF = 89;   units.Li_NorVF = 'cm';   label.Li_NorVF = 'ultimate fork length';     bibkey.Li_NorVF = 'Solberg2014'; comment.Li_NorVF = 'maximum of Vosso river - females (n<10),Table1';
data.Li_NorAM = 96;   units.Li_NorAM = 'cm';   label.Li_NorAM = 'ultimate fork length';     bibkey.Li_NorAM = 'Solberg2014'; comment.Li_NorAM = 'maximum of Arna river -males (n<10),Table1';
data.Li_NorAF = 96;   units.Li_NorAF = 'cm';   label.Li_NorAF = 'ultimate fork length';     bibkey.Li_NorAF = 'Solberg2014'; comment.Li_NorAF = 'maximum of Arna river - females (n<10),Table1';
data.Li_norI = 82.7;   units.Li_norI = 'cm';   label.Li_norI = 'ultimate fork length';     bibkey.Li_norI = 'Fleming1996'; comment.Li_norI = 'maximum of Imsa river - females,Table2 ';
% data.Li_spaNM = 100.1;   units.Li_spaNM = 'cm';   label.Li_spaNM = 'ultimate fork length';     bibkey.Li_spaNM = 'Fleming1996'; comment.Li_spaNM = 'maximum of Narraguagus & Machias rivers - females,Table2';
% data.Li_canBS = 87;   units.Li_canBS = 'cm';   label.Li_canBS = 'ultimate fork length';     bibkey.Li_canBS = 'Fleming1996'; comment.Li_canBS = 'maximum of Big Salmon river (Canada) - females,Table2';
% data.Li_rusN = 92.3;   units.Li_rusN = 'cm';   label.Li_rusN = 'ultimate fork length';     bibkey.Li_rusN = 'Kazakov1981'; comment.Li_rusN = 'maximum of Neva river (Russia) - females, Table5';
% data.Li_rusO = 84.8;   units.Li_rusO = 'cm';   label.Li_rusO = 'ultimate fork length';     bibkey.Li_rusO = 'Kazakov1981'; comment.Li_rusO = 'maximum of Oyat river (Russia) - females, Table 5';
% data.Li_rusS = 76.9;   units.Li_rusS = 'cm';   label.Li_rusS = 'ultimate fork length';     bibkey.Li_rusS = 'Kazakov1981'; comment.Li_rusS = 'maximum of Svir river (Russia) - females, Table 5';
% data.Li_usa = 104.9;   units.Li_usa = 'cm';   label.Li_usa = 'ultimate fork length';     bibkey.Li_usa = 'Baum1971'; comment.Li_usa = 'maximum of rivers Machias & Narraguagus (Usa) - females converted from inches, Table1';


% data.Li  = 67.7;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Hutchings1998'; comment.Li = 'Nivelle';


%%%%%%%%%%%%%%%
%% Egg volume %
%%%%%%%%%%%%%%%
data.V0_nor = 0.090;  units.V0_nor = 'cm^3'; label.V0_nor = 'egg volume'; bibkey.V0_nor = 'Berg2001';  comment.V0_nor = 'parents from river Stj�rdalselva (Norway),mean(4/3*pi*(diameter/2)^3) (6 females eggs), Table1';
% data.V0_can = 0.123;  units.V0_can = 'cm^3'; label.V0_can = 'egg volume'; bibkey.V0_can = 'Srivastava1991';  comment.V0_can = 'parents from river Placentia (Canada),mean(4/3*pi*(diameter/2)^3) (4 females eggs), Text/results ';
data.V0_norF2011 = 0.104;  units.V0_norF2011 = 'cm^3'; label.V0_norF2011 = 'egg volume'; bibkey.V0_norF2011 = 'Solberg2014';  comment.V0_norF2011 = 'parents from river Figgjo (Norway),mean(4/3*pi*(diameter/2)^3), Table2';
data.V0_norF2012 = 0.129;  units.V0_norF2012 = 'cm^3'; label.V0_norF2012 = 'egg volume'; bibkey.V0_norF2012 = 'Solberg2014';  comment.V0_norF2012 = 'parents from river Figgjo (Norway),mean(4/3*pi*(diameter/2)^3), Table2';
% data.V0_rus = 0.144;  units.V0_rus = 'cm^3'; label.V0_rus = 'egg volume'; bibkey.V0_rus = 'Kazakov1981';  comment.V0_rus = 'parents from river Neva (Russia),mean(4/3*pi*(diameter/2)^3), Table3';
% data.V0_sco = 0.098;  units.V0_sco = 'cm^3'; label.V0_sco = 'egg volume'; bibkey.V0_sco = 'Thorpe1984';  comment.V0_sco = 'parents from river Almond (Scotland),mean(4/3*pi*(diameter/2)^3), Table 3';
% data.V0_usa = 0.091;  units.V0_usa = 'cm^3'; label.V0_usa = 'egg volume'; bibkey.V0_usa = 'Baum1971';  comment.V0_usa = 'parents from rivers Machias & Narraguagus (USA),mean(4/3*pi*(diameter(inch)*2.54/2)^3), Table1';
% data.V0_scoBC = 0.141;  units.V0_scoBC = 'cm^3'; label.V0_scoBC = 'egg volume'; bibkey.V0_scoBC = 'Gilbey2009';  comment.V0_scoBC = 'parents from Bristol Cove river(Scotland), calculated from 2 diameters and ovoid model. Table1';
% data.V0_canD = 0.092;  units.V0_canD = 'cm^3'; label.V0_canD = 'egg volume'; bibkey.V0_canD = 'Gilbey2009';  comment.V0_canD = 'parents from Don river (Canada), calculated from 2 diameters and ovoid model, Table1.';
data.V0_fnor = 0.078;  units.V0_fnor = 'cm^3'; label.V0_fnor = 'egg volume'; bibkey.V0_fnor = 'Heinimaa2004';  comment.V0_usa = 'parents from Teno river (Finland/Norway), mean(4/3*pi*(diameter(inch)*2.54/2)^3). Figure3';


%%%%%%%%%%%%%%%
%% Egg weight %
%%%%%%%%%%%%%%%
% data.Ww0_ScoB = 0.10;  units.Ww0_ScoB = 'g'; label.Ww0_ScoB = 'wet egg weight'; bibkey.Ww0_ScoB = 'VanLeeuwen2016';  comment.Ww0_ScoB = 'parents from River Blackwater (Scotland) - 1SW mother';
% data.Ww0_ScoB2 = 0.12;  units.Ww0_ScoB2 = 'g'; label.Ww0_ScoB2 = 'wet egg weight'; bibkey.Ww0_ScoB2 = 'VanLeeuwen2016';  comment.Ww0_ScoB2 = 'parents from River Blackwater (Scotland) - 2SW mother';
% data.Ww0_ScoA = 0.094;  units.Ww0_ScoA = 'g'; label.Ww0_ScoA = 'wet egg weight'; bibkey.Ww0_ScoA = 'Fleming1996';  comment.Ww0_ScoA = 'mean of River Almon (Scotland)';
% data.Ww0_Fra = 0.109;  units.Ww0_Fra = 'g'; label.Ww0_Fra = 'wet egg weight'; bibkey.Ww0_Fra = 'Fleming1996';  comment.Ww0_Fra = 'mean of River Elorn (France)';
% data.Ww0_Nor = 0.1025;  units.Ww0_Nor = 'g'; label.Ww0_Nor = 'wet egg weight'; bibkey.Ww0_Nor = 'Fleming1996';  comment.Ww0_Nor = 'mean of River Imsa (Norway)';
% data.Ww0_SweS = 0.109;  units.Ww0_SweS = 'g'; label.Ww0_SweS = 'wet egg weight'; bibkey.Ww0_SweS = 'Fleming1996';  comment.Ww0_SweS = 'mean of River Skellefte (Sweden)';
% data.Ww0_SweL = 0.109;  units.Ww0_SweL = 'g'; label.Ww0_SweL = 'wet egg weight'; bibkey.Ww0_SweL = 'Fleming1996';  comment.Ww0_SweL = 'mean of River Lule (Sweden)';
% data.Ww0_SweU = 0.103;  units.Ww0_SweU = 'g'; label.Ww0_SweU = 'wet egg weight'; bibkey.Ww0_SweU = 'Fleming1996';  comment.Ww0_SweU = 'mean of River Ume (Sweden)';
% data.Ww0_SweV = 0.097;  units.Ww0_SweV = 'g'; label.Ww0_SweV = 'wet egg weight'; bibkey.Ww0_SweV = 'Fleming1996';  comment.Ww0_SweV = 'mean of River Vindeln (Sweden)';
% data.Ww0_RusN = 0.1272;  units.Ww0_RusN = 'g'; label.Ww0_RusN = 'wet egg weight'; bibkey.Ww0_RusN = 'Fleming1996';  comment.Ww0_RusN = 'mean of River Narva (Russia)';
% data.Ww0_RusU = 0.0978;  units.Ww0_RusU = 'g'; label.Ww0_RusU = 'wet egg weight'; bibkey.Ww0_RusU = 'Fleming1996';  comment.Ww0_RusU = 'mean of River Umba (Russia)';
% data.Ww0_RusNe = 0.1616;  units.Ww0_RusNe = 'g'; label.Ww0_RusNe = 'wet egg weight'; bibkey.Ww0_RusNe = 'Kazakov1981';  comment.Ww0_RusNe = 'mean of River Neva (Russia)';
% % data.Ww0_Canbf = 0.113;  units.Ww0_Canbf = 'g'; label.Ww0_Canbf = 'wet egg weight'; bibkey.Ww0_Canbf = 'Srivastava1991';  comment.Ww0_Canbf = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Ww0_Canaf = 0.131;  units.Ww0_Canaf = 'g'; label.Ww0_Canaf = 'wet egg weight'; bibkey.Ww_Canaf0 = 'Srivastava1991';  comment.Ww0_Canaf = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
% data.Ww0_norbf = 0.104;  units.Ww0_norbf = 'g'; label.Ww0_norbf = 'wet egg weight'; bibkey.Ww0_norbf = 'Berg2001';  comment.Ww0_norbf = 'mean of 6 females eggs before fertilization - parents from river Stjørdalselva (Norway)';


%data.Wd0 = 0.035;  units.Wd0 = 'g'; label.Ww0 = 'dry egg weight'; bibkey.Wd0 = 'Berg2001';  comment.Wd0 = 'mean of 6 females eggs before fertilization - parents from river Stjørdalselva (Norway)';

%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at hatching %
%%%%%%%%%%%%%%%%%%%%%%%

% data.Wwh_Eng = 0.0552*100/(100-62.9);   units.Wwh_Eng = 'g';   label.Wwh_Eng = 'wet weight at hatching';     bibkey.Wwh_Eng = 'Carrick1979';  comment.Wwh_Eng = 'at 4°C - parents from River Kent (Cumbria, northern England), Table 3';
% data.Wwh_Can = 0.117;   units.Wwh_Can = 'g';   label.Wwh_Can = 'wet weight at hatching';     bibkey.Wwh_Can = 'Srivastava1991';  comment.Wwh_Can = 'parents from Northeast Placentia River (Newfoundland, Canada), Fig 1';
% data.Wwh_Rus = 0.160;   units.Wwh_Rus = 'g';   label.Wwh_Rus = 'wet weight at hatching';     bibkey.Wwh_Rus = 'Kazakov1981';  comment.Wwh_Rus = 'parents from Neva river (Russia), Table7';
% data.Wwh_Sco = 0.273;   units.Wwh_Sco = 'g';   label.Wwh_Sco = 'wet weight at hatching';     bibkey.Wwh_Sco = 'Thorpe1984';  comment.Wwh_Sco = 'parents from Almond river (Scotland), Table 7';
data.Wwh_FNor = 0.139;   units.Wwh_FNor = 'g';   label.Wwh_FNor = 'wet weight at hatching';     bibkey.Wwh_FNor = 'Heinimaa2004';  comment.Wwh_FNor = 'parents from Teno river (Finland/Norway), Fig 4';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.Wwb_Sco1SWM = 0.16;   units.Wwb_Sco1SWM = 'g';   label.Wwb_Sco1SWM = 'wet weight at birth';     bibkey.Wwb_Sco1SWM = 'VanLeeuwen2016';  
  comment.Wwb_Sco1SWM = 'parents from River Blackwater (Scotland) - 1SW mother, Fig 1A';
data.Wwb_Sco2SWM = 0.195;   units.Wwb_Sco2SWM = 'g';   label.Wwb_Sco2SWM = 'wet weight at birth';     bibkey.Wwb_Sco2SWM = 'VanLeeuwen2016';  comment.Wwb_Sco2SWM = 'parents from River Blackwater (Scotland) - 2SW mother, Fig 1A';
data.Wwb_Can = 0.123;   units.Wwb_Can = 'g';   label.Wwb_Can = 'wet weight at birth';     bibkey.Wwb_Can = 'Srivastava1991';  comment.Wwb_Can = 'parents from Northeast Placentia River (Newfoundland, Canada), Fig 1';
data.Wwb_Rus = 0.195;   units.Wwb_Rus = 'g';   label.Wwb_Rus = 'wet weight at birth';     bibkey.Wwb_Rus = 'Kazakov1981';  comment.Wwb_Rus = 'parents from Neva river (Russia), Table 8';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at smoltification %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.WwsI = 24;   units.WwsI = 'g';   label.WwsI = 'wet weight at puberty';   bibkey.WwsI = 'Jonsson1998';  comment.WwsI = 'Imsa River (Norway) - mean of 165 individuals from 1983 to 1993 - s.d. = 6.6';
% data.WwsS = 26;   units.WwsS = 'g';   label.WwsS = 'wet weight at puberty';   bibkey.WwsS = 'Jutila2006';  comment.Wws = 'Simojoki (Baltic Sea, Finland) - mean from 1972 to 2004';


%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Weight at puberty  %(or 1 year before first spawning)
%%%%%%%%%%%%%%%%%%%%%%%%%
%direct measurement

%need calculation
% data.Wwp_norf = 2856;   units.Wwp_norf = 'g';   label.Wwp_norf = 'wet weight at puberty';   bibkey.Wwp_norf = 'Fleming1996b';   comment.Wwp_nor_norf = 'Imsa river(Norway), mean of females at spawning';
% data.Wwp_norm = 1920;   units.Wwp_norm = 'g';   label.Wwp_norm = 'wet weight at puberty';   bibkey.Wwp_norm = 'Fleming1996b';   comment.Wwp_nor_norm = 'Imsa river(Norway), mean of males at spawning';
% data.Wwp_rus = 6240;   units.Wwp_rus = 'g';   label.Wwp_rus = 'wet weight at puberty';   bibkey.Wwp_rus = 'Kazakov1981';   comment.Wwp_rus = 'Neva river(Russia), mean of females at spawning';
%data.Wwp_usa = 4246;   units.Wwp_usa = 'g';   label.Wwp_usa = 'wet weight at puberty';   bibkey.Wwp_usa = 'Baum1971';   comment.Wwp_usa = 'Neva river(Russia), mean of females at spawning, converted from pounds';



%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Weight at 1st spawning %
%%%%%%%%%%%%%%%%%%%%%%%%%%
data.Wwsp_norf = 2856;   units.Wwsp_norf = 'g';   label.Wwsp_norf = 'wet weight at first spawning';   bibkey.Wwsp_norf = 'Fleming1996b';   comment.Wwsp_norf = 'Imsa river(Norway), mean of females at spawning, Table 1';
data.Wwsp_norm = 1920;   units.Wwsp_norm = 'g';   label.Wwsp_norm = 'wet weight at first spawning';   bibkey.Wwsp_norm = 'Fleming1996b';   comment.Wwsp_norm = 'Imsa river(Norway), mean of males at spawning, Table 1';
% data.Wwp_rus = 6240;   units.Wwp_rus = 'g';   label.Wwp_rus = 'wet weight at puberty';   bibkey.Wwp_rus = 'Kazakov1981';   comment.Wwp_rus = 'Neva river(Russia), mean of females at spawning, Table 3, Attention, may contain female that had multiple spawning events';
% data.Wwp_usa = 4246;   units.Wwp_usa = 'g';   label.Wwp_usa = 'wet weight at puberty';   bibkey.Wwp_usa = 'Baum1971';   comment.Wwp_usa = 'Machias & NArraguagus rivers (USA), mean of females at spawning, converted from pounds, Table 1';



%%%%%%%%%%%%%%%%%%%%%%%
%% Max weight %
%%%%%%%%%%%%%%%%%%%%%%%
data.Wwi = 5200  ;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Berg2001'; comment.Wwi = 'mean wet weight of 6 spawning females,parents from river Stjørdalselva (Norway), table 1';
data.Wwi_NorFM = 5380;   units.Wwi_NorFM = 'g';   label.Wwi_NorFM = 'ultimate wet weight';     bibkey.Wwi_NorFM = 'Solberg2014'; comment.Wwi_NorFM = 'maximum of Figgjo river -males (n<10), table 1';
data.Wwi_NorFF = 4980;   units.Wwi_NorFF = 'g';   label.Wwi_NorFF = 'ultimate wet weight';     bibkey.Wwi_NorFF = 'Solberg2014'; comment.Wwi_NorFF = 'maximum of Figgjo river - females (n<10),table 1';
data.Wwi_NorVM = 12700;   units.Wwi_NorVM = 'g';   label.Wwi_NorVM = 'ultimate wet weight';     bibkey.Wwi_NorVM = 'Solberg2014'; comment.Wwi_NorVM = 'maximum of Vosso river -males , table 1';
data.Wwi_NorVF = 6800;   units.Wwi_NorVF = 'g';   label.Wwi_NorVF = 'ultimate wet weight';     bibkey.Wwi_NorVF = 'Solberg2014'; comment.Wwi_NorVF = 'maximum of Vosso river - females (n<10), table 1';
data.Wwi_NorAM = 8300;   units.Wwi_NorAM = 'g';   label.Wwi_NorAM = 'ultimate wet weight';     bibkey.Wwi_NorAM = 'Solberg2014'; comment.Wwi_NorAM = 'maximum of Arna river -males (n<10),table 1';
data.Wwi_NorAF = 9100;   units.Wwi_NorAF = 'g';   label.Wwi_NorAF = 'ultimate wet weight';     bibkey.Wwi_NorAF = 'Solberg2014'; comment.Wwi_NorAF = 'maximum of Arna river - females (n<10), table 1';
% data.Wwi_RusN = 8200;   units.Wwi_RusN = 'g';   label.Wwi_RusN = 'ultimate wet weight';     bibkey.Wwi_RusN = 'Kazakov1981'; comment.Wwi_RusN = 'maximum of Neva river (Russia) - females (n<10); table 3';
% data.Wwi_RusO = 5000;   units.Wwi_RusO = 'g';   label.Wwi_RusO = 'ultimate wet weight';     bibkey.Wwi_RusO = 'Kazakov1981'; comment.Wwi_RusO = 'maximum of Oyat river (Russia) - females (n<10), table 3';
% data.Wwi_RusS = 3900;   units.Wwi_RusS = 'g';   label.Wwi_RusS = 'ultimate wet weight';     bibkey.Wwi_RusS = 'Kazakov1981'; comment.Wwi_RusS = 'maximum of Svir river (Russia) - females (n<10); table 3';
% data.Wwi_usa = 9866;   units.Wwi_usa = 'g';   label.Wwi_usa = 'ultimate wet weight';     bibkey.Wwi_usa = 'Baum1971'; comment.Wwi_usa = 'Machias & NArraguagus rivers (USA), max of females at spawning, converted from pounds, table 1';
data.Wwi_FNor = 16350;   units.Wwi_FNor = 'g';   label.Wwi_FNor = 'ultimate wet weight';     bibkey.Wwi_FNor = 'Heinimaa2004'; comment.Wwi_usa = 'Teno river (Finland/Norway), max of females at spawning, converted from pounds, Fig1';


%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reserve energy in egg %(egg = reserve only)
%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.E0_Canbf = 1117; units.E0_Canbf = 'J'; label.E0_Canbf = 'egg reserve energy'; bibkey.E0_Canbf = 'Srivastava1991';   comment.E0_Canbf = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada), fig 1';
% data.E0_Canaf = 1033; units.E0_Canaf = 'J'; label.E0_Canaf = 'egg reserve energy'; bibkey.E0_Canaf = 'Srivastava1991';   comment.E0_Canaf = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada), fig 1';
data.E0_Nor = 757; units.E0_Nor = 'J'; label.E0_Nor = 'egg reserve energy'; bibkey.E0_Nor = 'Berg2001';   comment.E0_Nor = 'mean of 6 females eggs before fertilization - parents from river Stjørdalselva (Norway), table 1';

%%%%%%%%%%%%%%%%%
%% Total energy 
% data.E = 845; units.E = 'J'; label.E = 'total energy content'; bibkey.E = 'Srivastava1991';   comment.Wdb = 'hatching - parents from Northeast Placentia River (Newfoundland, Canada)';
%  length.E = 1.8; units.length.E = 'cm'; label.length.E = 'total length';
% data.E = 639; units.E = 'J'; label.E = 'total energy content'; bibkey.E = 'Srivastava1991';   comment.Wdb = 'first feeding - parents from Northeast Placentia River (Newfoundland, Canada)';
%  length.E = 2.5; units.length.E = 'cm'; label.length.E = 'total length';


%%%%%%%%%%%%%%%%%%%%%%
%% Reproductive rate % number of egg per female
%%%%%%%%%%%%%%%%%%%%%%
% data.R_scoNE = 4600/365.25; units.R_scoNE='#/d'; label.R_scoNE = 'reproductive rate'; bibkey.R_scoNE = "Fleming1996"; comment.R_scoNE = 'mean of females from river North Esk (Scotland)';
% data.R_scoM = 6067/365.25; units.R_scoM = '#/d'; label.R_scoM = 'reproductive rate'; bibkey.R_scoM = "Fleming1996"; comment.R_scoM = 'mean of females from river Meig (Scotland)';
% data.R_scoL = 4943/365.25; units.R_scoL = '#/d'; label.R_scoL = 'reproductive rate'; bibkey.R_scoL = "Fleming1996"; comment.R_scoL = 'mean of females from river Lyon (Scotland)';
% data.R_scoB = 5117/365.25; units.R_scoB = '#/d'; label.R_scoB = 'reproductive rate'; bibkey.R_scoB = "Fleming1996"; comment.R_scoB = 'mean of females from river Blackwater (Scotland)';
% data.R_scoG = 5370/365.25; units.R_scoG = '#/d'; label.R_scoG = 'reproductive rate'; bibkey.R_scoG = "Fleming1996"; comment.R_scoG = 'mean of females from river Garry (Scotland)';
% data.R_scoD = 5495/365.25; units.R_scoD = '#/d'; label.R_scoD = 'reproductive rate'; bibkey.R_scoD = "Fleming1996"; comment.R_scoD = 'mean of females from river Dee (Scotland)';
% data.R_scoC = 5572/365.25; units.R_scoC = '#/d'; label.R_scoC = 'reproductive rate'; bibkey.R_scoC = "Fleming1996"; comment.R_scoC = 'mean of females from river Conon (Scotland)';
% data.R_nor = 5109/365.25; units.R_nor = '#/d'; label.R_nor = 'reproductive rate'; bibkey.R_nor = "Fleming1996"; comment.R_nor = 'mean of females from river Imsa (Norway)';
% data.R_spa = 8286/365.25; units.R_spa = '#/d'; label.R_spa = 'reproductive rate'; bibkey.R_spa = "Fleming1996"; comment.R_spa = 'mean of females from rivers Narraguagus & Machias (Spain)';
% data.R_canM = 5665/365.25; units.R_canM = '#/d'; label.R_canM = 'reproductive rate'; bibkey.R_canM = "Fleming1996"; comment.R_canM = 'mean of females from river Mirachimi (Canada)';
% data.R_canR = 10415/365.25; units.R_canR = '#/d'; label.R_canR = 'reproductive rate'; bibkey.R_canR = "Fleming1996"; comment.R_canR = 'mean of females from river Restigouche (Canada)';
% data.R_usa = 8012/365.25; units.R_canR = '#/d'; label.R_canR = 'reproductive rate'; bibkey.R_canR = "Baum1971"; comment.R_canR = 'mean of females from rivers Machias & Narraguagus(USA), mean of two measurement methods.';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Maximum reproductive rate %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% data.Ri_sco  = 14499/365.25;   units.Ri_sco  = '#/d'; label.Ri_sco  = 'maximum reprod rate';     bibkey.Ri_sco  = 'Thorpe1984';   
%   temp.Ri_sco = C2K(10);    units.temp.Ri_sco = 'K'; label.temp.Ri_sco = 'temperature';
%   comment.Ri_sco = 'maximum at River Almond (Scotland); temperature: highly variable temperature throughout life, text results';
% data.Ri_spa  = 18847/365.25;   units.Ri_spa  = '#/d'; label.Ri_spa  = 'maximum reprod rate';     bibkey.Ri_spa  = 'Fleming1996';   
%   temp.Ri_spa = C2K(15);    units.temp.Ri_spa = 'K'; label.temp.Ri_spa = 'temperature';
%   comment.Ri_spa = 'maximum female length at spawning at River Narraguagus & Machias (Spain); temperature: rough approximation, highly variable temperature throughout life, table 3';
% data.Ri_can  = 11800/365.25;   units.Ri_can  = '#/d'; label.Ri_can  = 'maximum reprod rate';     bibkey.Ri_can  = 'Fleming1996';   
%   temp.Ri_can = C2K(10);    units.temp.Ri_can = 'K'; label.temp.Ri_can = 'temperature';
%   comment.Ri_can = 'maximum female length at spawning at River Big Salmon (Canada); temperature: rough approximation, highly variable temperature throughout life, table 3';
data.Ri_nor  = 9576/365.25;   units.Ri_nor  = '#/d'; label.Ri_nor  = 'maximum reprod rate';     bibkey.Ri_nor  = 'Fleming1996';   
  temp.Ri_nor = C2K(10);    units.temp.Ri_nor = 'K'; label.temp.Ri_nor = 'temperature';
  comment.Ri_nor = 'maximum female length at spawning at River Imsa (Norway); temperature: rough approximation, highly variable temperature throughout life, table 3';






%%%%%%%%%%%%%%%%%%%%%%%
%% uni-variate data %%%
%%%%%%%%%%%%%%%%%%%%%%%
%% T-ah data%%
%%%%%%%%%%%%%%
data.Tah_Dennis_Peterson1977 =[... % age at hatching (d)
2  157
4  123
6  83
8  62
10 50
12 40];
data.Tah_Dennis_Peterson1977(:,1)=C2K(data.Tah_Dennis_Peterson1977(:,1));
units.Tah_Dennis_Peterson1977   = {'K', 'd'};  label.Tah_Dennis_Peterson1977 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Dennis_Peterson1977 = 'Peterson1977'; comment.Tah_Dennis_Peterson1977 = 'parents from Dennis Stream (New Brunswick - Canada, Table1)';

data.Tah_Mirachimi_Peterson1977 =[... % age at hatching (d)
4	113
6	74
8	57
10	44
12	34];
data.Tah_Mirachimi_Peterson1977(:,1)=C2K(data.Tah_Mirachimi_Peterson1977(:,1));
units.Tah_Mirachimi_Peterson1977   = {'K', 'd'};  label.Tah_Mirachimi_Peterson1977 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Mirachimi_Peterson1977 = 'Peterson1977'; comment.Tah_Peterson1977 = 'parents from Mirachimi river (Canada), table1';

data.Tah_Wallace1988=[...% age at hatching (d)
0.2 255
1   210.75];
data.Tah_Wallace1988(:,1)=C2K(data.Tah_Wallace1988(:,1));
units.Tah_Wallace1988   = {'K', 'd'};  label.Tah_Wallace1988 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Wallace1988 = 'Wallace1988'; comment.Tah_Wallace1988 = 'median of four wild Norwegian stocks, table 1';
%f=natural (parents)

data.Tah_norF=[...% age at hatching (d)
4.8 115
6   91
6.3 87];
data.Tah_norF(:,1)=C2K(data.Tah_norF(:,1));
units.Tah_norF   = {'K', 'd'};  label.Tah_norF = {'temperature', 'age at hatching'}; 
bibkey.Tah_norF = 'Solberg2014'; comment.Tah_norF = 'parents from river Figgjo (Norway), mean of offsprings time at 50% hatching from 2011 to 2013, fig 3';
%Note : the 3 temperatures are from the same place at different time (2011
%to 2013 : mean natural temperature during the experiment)
%f=natural (parents)

data.Tah_norV=[...% age at hatching (d)
6   93
6.3 88];
data.Tah_norV(:,1)=C2K(data.Tah_norV(:,1));
units.Tah_norV   = {'K', 'd'};  label.Tah_norV = {'temperature', 'age at hatching'}; 
bibkey.Tah_norV = 'Solberg2014'; comment.Tah_norV = 'parents from river Vosso (Norway), mean of offsprings time at 50% hatching from 2011 to 2013, fig 3';
%Note : the temperatures are from the same place at different time (2011-2012 : mean natural temperature during the experiment)
%f=natural (parents)

data.Tah_norA=[...% age at hatching (d)
6   93
6.3 88];
data.Tah_norA(:,1)=C2K(data.Tah_norA(:,1));
units.Tah_norA   = {'K', 'd'};  label.Tah_norA = {'temperature', 'age at hatching'}; 
bibkey.Tah_norA = 'Solberg2014'; comment.Tah_norA = 'parents from river Arna (Norway), mean of offsprings time at 50% hatching from 2011 to 2013, fig 3';
%Note : the temperatures are from the same place at different time (2011-2012 : mean natural temperature during the experiment)
%f=natural (parents)

data.Tah_Berg1999=[...% age at hatching (d)
7.3 76
9.4 54];
data.Tah_Berg1999(:,1)=C2K(data.Tah_Berg1999(:,1));
units.Tah_Berg1999  = {'K', 'd'};  label.Tah_Berg1999 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Berg1999 = 'Berg1999'; comment.Tah_Berg1999 = 'mean of norwegian rivers, mean of offsprings time at 50% hatching, fig 1';
%f=natural (parents)

data.Tah_Johnston1997 =[...% age at hatching (d)
8.1 62
4.8 109];
data.Tah_Johnston1997(:,1)=C2K(data.Tah_Johnston1997(:,1));
units.Tah_Johnston1997  = {'K', 'd'};  label.Tah_Johnston1997 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Johnston1997 = 'Johnston1997'; comment.Tah_Johnston1997 = 'parents from river Shin (Scotland), mean of all eggs, text M&M';
%f=natural (parents)

%%%%%%%%%%%%%%
%% T-ab data %
%%%%%%%%%%%%%%
data.TabC = [ ... % temperature (�C), age at yolk exhaustion (d)
2 238
6 177
12  64];
data.TabC(:,1)=C2K(data.TabC(:,1));
units.TabC   = {'K', 'd'};  label.TabC = {'temperature', 'age at birth'}; 
bibkey.TabC = 'Peterson1977'; comment.TabC = 'parents from Dennis Stream (New Brunswick - Canada), fig 5';

% data.Tab_sco = [ ... % temperature (°C), age at yolk exhaustion (d)
% 8.1 105
% 4.8 173];
% data.Tab_sco(:,1)=C2K(data.Tab_sco(:,1));
% units.Tab_sco   = {'K', 'd'};  label.Tab_sco = {'temperature', 'age at birth'}; 
% bibkey.Tab_sco = 'Johnston1997'; comment.Tab_sco = 'parents from river Shin (Scotland), age at first feeding, fig 1';

%%%%%%%%%%%%%
%% T-Lh data %
%%%%%%%%%%%%%
% data.TLh_dennis =[... % length at hatching (cm)
% 4	2.09
% 6	1.90
% 8	1.92
% 10	1.79
% 12	1.66];
% data.TLh_dennis(:,1)=C2K(data.TLh_dennis(:,1));
% units.TLh_dennis   = {'K', 'cm'};  label.TLh_dennis = {'temperature', 'length at hatching'}; 
% bibkey.TLh_dennis = 'Peterson1977'; comment.TLh_dennis = 'parents from Dennis Stream (New Brunswick - Canada)';
% 
% data.TLh_Mirachimi =[... % length at hatching (cm)
% 4	1.93
% 6	1.87
% 8	1.84
% 10	1.73
% 12	1.62];
% data.TLh_Mirachimi(:,1)=C2K(data.TLh_Mirachimi(:,1));
% units.TLh_Mirachimi   = {'K', 'd'};  label.TLh_Mirachimi = {'temperature', 'length at hatching'}; 
% bibkey.TLh_Mirachimi = 'Peterson1977'; comment.Tah = 'parents from Mirachimi river (Canada)';
% 


%%%%%%%%%%%%%%
%% T-Lb data %
%%%%%%%%%%%%%%
% data.TLb =[... % length at yolk exhaustion (cm)
% 4	2.89
% 6	2.9
% 8	2.86
% 10	2.8
% 12	2.76];
% data.TLb(:,1)=C2K(data.TLb(:,1));
% units.TLb   = {'K', 'd'};  label.TLb = {'temperature', 'length at yolk exhaustion'}; 
% bibkey.TLb = 'Peterson1977'; comment.TLb = 'parents from Dennis Stream (Canada)';




%%%%%%%%%%%%%
%% t-L data %
%%%%%%%%%%%%%
% data.tL_usa = [ ... % time since first feeding (d), length (cm)
% 434  19.7
% 448  20.9
% 463  22.6
% 477  21.1
% 491  24.1
% 506  24.1
% 526  23.7
% 540  23.8
% 568  27.6];
% units.tL_usa   = {'d', 'cm'};  label.tL_usa = {'time since birth', 'total length'};  
% temp.tL_usa    = C2K(10);  units.temp.tL_usa = 'K'; label.temp.tL_usa = 'temperature'; comment.temp.tL_usa = 'temperature between 8 and 12�C. Time since first feed. directly in pub.';
% bibkey.tL_usa = 'Rottiers1993'; comment.tL_usa = 'Penobscot River (USA), "length",  table 1, f=ad lib';


data.tL_norI = [ ... % time since first feeding (d), total length (cm)
0  2.8
0  2.9
0  2.9
0  3.0
6  3.0
11 3.3
12 3.2
14 3.2
14 3.2
15 3.4
15  3.2
16  3.4
16  3.5
17  3.4
19  3.4
19  3.7
22  3.4
22  3.6
33  3.7
38  4.2
39  3.9
41  4.2
41  4.2
42  4.4
42  4.1
43  4.3
43  4.4
44  4.1
46  4.4
46  4.4
49  4.3
49  4.6];
units.tL_norI   = {'d', 'cm'};  label.tL_norI = {'time since birth', 'total length'};  
temp.tL_norI    = C2K(12);  units.temp.tL_norI = 'K'; label.temp.tL_norI = 'temperature'; comment.temp.tL_norI = 'temperature increasing from 10.4�C to 14.1�C throughout the experiment, ';
bibkey.tL_norI = 'Einum2000'; comment.tL_norI = 'Imsa River (Norway), fig 6';


data.tL_nor4 = [ ... % time since emergence (d), fork length (cm)
56	5
232	5.8
360	6.4
56	4.7
232	5.4
360	6.4
45	4.8
221	5.6
349	6.4];
units.tL_nor4   = {'d', 'cm'};  label.tL_nor4 = {'time since birth', 'total length'};  
temp.tL_nor4    = C2K(4.2);  units.temp.tL_nor4 = 'K'; label.temp.tL_nor4 = 'temperature'; comment.temp.tL_nor4 = 'T=7.9 for t=0-45(last part) or 0-56 (two first parts)';
bibkey.tL_nor4 = 'Imsland2016'; comment.tL_nor4 = 'Suldsalagen River + Ardal River +  Stryn river (Norway), fork length, fig 1';

data.tL_nor5 = [ ... % time since emergence (d), fork length (cm)
56	5
232	6.3
360	7.6
56	4.7
232	5.8
360	7.1
45	4.8
221	6.7
349	8.4];
units.tL_nor5   = {'d', 'cm'};  label.tL_nor5 = {'time since birth', 'total length'};  
temp.tL_nor5    = C2K(5.6);  units.temp.tL_nor5 = 'K'; label.temp.tL_nor5 = 'temperature'; comment.temp.tL_nor5 = 'T=7.9 for t=0-45(last part) or 0-56 (two first parts)';
bibkey.tL_nor5 = 'Imsland2016'; comment.tL_nor5 = 'Suldsalagen River + Ardal River +  Stryn river (Norway), fork length, fig 1';

data.tL_nor7 = [ ... % time since emergence (d), fork length (cm)
56	5
232	6.6
360	9.4
56	4.7
232	6.4
360	9
45	4.8
221	6.9
349	10.3];
units.tL_nor7   = {'d', 'cm'};  label.tL_nor7 = {'time since birth', 'total length'};  
temp.tL_nor7    = C2K(7);  units.temp.tL_nor7 = 'K'; label.temp.tL_nor7 = 'temperature'; comment.temp.tL_nor7 = 'T=7.9 for t=0-56';
bibkey.tL_nor7 = 'Imsland2016'; comment.tL_nor7 = 'Suldsalagen River (Norway), fork length, fig 1';

data.tL_nor57 = [ ... % time since emergence (d), fork length (cm)
56	5
232	7.6
360	9.1
56	4.7
232	7.6
360	8.1
45	4.8
221	7.7
349	8.8];
units.tL_nor57   = {'d', 'cm'};  label.tL_nor57 = {'time since birth', 'total length'};  
temp.tL_nor57    = C2K(5.7);  units.temp.tL_nor57 = 'K'; label.temp.tL_nor57 = 'temperature'; comment.temp.tL_nor57 = 'T=7.9 for t=0-45(last part) or 0-56 (two first parts)';
bibkey.tL_nor57 = 'Imsland2016'; comment.tL_nor57 = 'Suldsalagen River + Ardal River +  Stryn river (Norway), fork length, fig 1';

% data.tL_scoA = [ ... % time since first feeding (d), fork length (cm). Time calculated from dates in publication
% 0	2.74 % 28 apr. Grp 1 = 1st feeding on 28 apr
% 3	2.75 % 1 may
% 7	2.81 % 5 may
% 11	2.88 % 9 May
% 38	3.83 % 5 June
% 67	4.5  % 4 Jul
% 102	5.36 % 8 Aug
% -3	2.75 % 28 apr % Grp 2 = 1st feeding on 1 may
% 0	2.74 % 1 may
% 4	2.77 % 5May
% 8	2.84 % 9 may
% 35	3.7  % 5 June
% 64	4.19 % 4Jul
% 99	5.03 % 8 aug
% -7	2.73 % 28 apr % grp 3 = 1st feeding on 5 May
% -4	2.75 % 1 may
% 0	2.76 % 5 May
% 4	2.84 % 9 May
% 31	3.67 % 5 June
% 60	4.33 % 4 Jul
% 95	5.03];%8 aug
% units.tL_scoA   = {'d', 'cm'};  label.tL_scoA = {'time since birth', 'total length'};  
% temp.tL_scoA    = C2K(10);  units.temp.tL_scoA = 'K'; label.temp.tL_scoA = 'temperature'; comment.temp.tL_scoA = 'rough guess, T� in Almond river from May to August, see Rowe1990';
% bibkey.tL_scoA = 'Metcalfe1992'; comment.tL_scoA = 'Almond River (Scotland), early 1st feeding group vs late 1st feeding group, fork length, table2';

% data.tL_scoS = [ ... % time since birth (rough estim) = time since hatching (11 mar) - 35 (d), fork length (cm)
% 92	3.75 % 16 Jul , 127-35
% 208	8.65 % 9 Nov , 243-35
% 247	8.89 % 18 Dec , 282-35
% 295	9.12 % 4 Feb , 330-35
% 319	9.67 % 28 Feb , 354-35
% 360	9.93];%9 Apr , 395-35
% units.tL_scoS   = {'d', 'cm'};  label.tL_scoS = {'time since birth', 'total length'};  
% temp.tL_scoS    = C2K(14);  units.temp.tL_scoS = 'K'; label.temp.tL_scoS = 'temperature'; comment.temp.tL_scoS = 'T� from shin river until eye stage, then from spain water, mean=9';
% bibkey.tL_scoS = 'Nicieza1994'; comment.tL_scoS = 'Shin River (Scotland), fig 1';

% data.tL_spa = [ ... % time since birth (rough estim) = time since hatching (7 mar) - 35 (d), fork length (cm)
% 96	3.77 % 16 Jul , 131-35
% 212	7.68 % 9 Nov , 247-35
% 251	8.56 % 18 Dec , 286-35
% 299	8.87 % 4 Feb , 334-35
% 323	8.95 % 28 Feb , 358-35
% 364	9.28];%9 Apr , 399-35
% units.tL_spa   = {'d', 'cm'};  label.tL_spa = {'time since birth', 'total length'};  
% temp.tL_spa    = C2K(14);  units.temp.tL_spa = 'K'; label.temp.tL_spa = 'temperature'; comment.temp.tL_spa = 'T� in Narcea river river from 6 to 22';
% bibkey.tL_spa = 'Nicieza1994'; comment.tL_spa = 'Narcea River (Spain), fig 1';

data.tL_scoAa = [ ... % time since birth ( 2May) (d), fork length (cm)
270	6.50 % 1 Feb 30*9
300	6.50 % 1 MAr 30*10
330	6.59 % 1 apr 30*11
360	7.11 % 1 May 30*12
390	7.78 % 1 Jun 30*13
420	8.71 % 1 Jul 30*14
450	9.6  % 1 Aug 30*15
480	10.47 %1 Sep 30*16
510	10.83 %1 Oct 30*17
540	11.46 %1 Nov 30*18
570	11.70];%1Dec 30*19
units.tL_scoAa   = {'d', 'cm'};  label.tL_scoAa = {'time since birth', 'total length'}; 
bibkey.tL_scoAa = 'Rowe1990'; comment.tL_scoAa = 'Shin River (Scotland), only lower modal group, fork length, fig 3, food restricted with ration = 1% of their biomass/day';
temp.tL_scoAa    = [    
-122	0.014
-116	-0.173
-111	-0.181
-108	0.596
-103	1.344
-98	1.215
-93	1.767
-88	2.029
-82	1.243
-76	1.068
-72	1.459
-67	2.185
-61	2.204
-56	2.12
-50	2.185
-44	2.164
-39	2.737
-34	3.477
-29	4.306
-24	4.606
-20	5.099
-18	6.014
-16	6.966
-15	7.802
-13	8.539
-11	9.411
-8	10.115
-4	10.916
-1	11.798
4	12.118
9	11.233
10	10.891
13	11.883
16	12.665
20	13.406
25	13.335
31	13.14
35	12.472
38	11.718
42	11.495
47	12.515
51	13.116
55	13.567
57	14.521
59	15.399
63	16.425
63.5	16.963
67	15.827
72	15.323
76	16.262
80	16.689
85	16.251
89	15.497
94	15.011
100	15.769
106	16.23
111	15.992
114	15.241
118	14.697
123	14.506
127	13.645
129	12.907
132	12.102
135	11.418
140	10.571
145	10.035
150	9.294
153	8.521
156	7.764
161	7.039
166	7.006
171	6.728
176	5.963
182	6.205
186	6.024
190	5.154
194	5.016
199	5.549
203	4.394
204	3.621
207	2.733
210	2.54
215	2.522
219	1.577
223	1.225
227	2.186
230	2.923
232	3.76
234	4.676
236	5.32
243	0.014
249	-0.173
254	-0.181
257	0.596
262	1.344
267	1.215
272	1.767
277	2.029
283	1.243
289	1.068
293	1.459
298	2.185
304	2.204
309	2.12
315	2.185
321	2.164
326	2.737
331	3.477
336	4.306
341	4.606
345	5.099
347	6.014
349	6.966
350	7.802
352	8.539
354	9.411
357	10.115
361	10.916
364	11.798
369	12.118
374	11.233
375	10.891
378	11.883
381	12.665
385	13.406
390	13.335
396	13.14
400	12.472
403	11.718
407	11.495
412	12.515
416	13.116
420	13.567
422	14.521
424	15.399
428	16.425
428.5	16.963
432	15.827
437	15.323
441	16.262
445	16.689
450	16.251
454	15.497
459	15.011
465	15.769
471	16.23
476	15.992
479	15.241
483	14.697
488	14.506
492	13.645
494	12.907
497	12.102
500	11.418
505	10.571
510	10.035
515	9.294
518	8.521
521	7.764
526	7.039
531	7.006
536	6.728
541	5.963
547	6.205
551	6.024
555	5.154
559	5.016
564	5.549
568	4.394
569	3.621
572	2.733
575	2.54
580	2.522
584	1.577
588	1.225
592	2.186
595	2.923
597	3.76
599	4.676
601	5.32];
temp.tL_scoAa(:,2) = C2K(temp.tL_scoAa(:,2));
units.temp.tL_scoAa = 'K'; label.temp.tL_scoAa = 'temperature'; comment.temp.tL_scoAa = 'T� in Almond river from May to August, Fig1';

%%%%%%%%%%%%%%%%%%%%%%%%
%% t-W data in embryos %
%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% t-W data in juveniles %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% data.tWw_sco = [ ... %time since birth (mean) (d), wet weight (g)
% 17	0.28
% 43.2	1.03
% 93.3	4.7
% 142.4	12.5
% 186.4	17.6
% 238.4	24.1];
% units.tWw_sco   = {'d', 'g'};  label.tWw_sco = {'time since birth', 'wet weight'};  
% temp.tWw_sco = C2K(10.4); units.temp.tWw_sco = 'K'; label.temp.tWw_sco = 'temperature'; comment.temp.tWw_sco = 'temperature =4 (egg) ; T�=10.4 fry+';
% bibkey.tWw_sco = 'McCarthy2003'; comment.tWw_sco = 'Shin River(Scotland)';


%%%%%%%%%%%%%%%%%%%%%%%%%
%% t-W data in seawater %
%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%
%% t-E data %
%%%%%%%%%%%%%
% data.tE_nor=[... % time(d), energy(J)
% 16	380
% 99	320
% 127	340
% 146	280
% 176	240
% 196	210
% 12	370
% 96	360
% 124	340
% 142	270
% 173	240
% 194	210
% 18	830
% 101	790
% 128	810
% 147	750
% 177	600
% 199	410
% 12	910
% 95	820
% 122	810
% 141	670
% 172	610
% 193	580
% 14	920
% 98	870
% 124	840
% 143	620
% 173	660
% 195	610
% 17	1070
% 99	1040
% 127	1030
% 146	850
% 176	810
% 196	600];
% units.tE_nor   = {'d', 'J'};  label.tE_nor = {'time from fertilization', 'egg Energy'};  
% temp.tE_nor    = C2K(4);  units.temp.tE_nor = 'K'; label.temp.tE_nor = 'temperature';
% bibkey.tE_nor = 'Berg2001'; comment.tWd_nor = 'mean of eggs from each of 6 females, river Stjørdalselva';

%%%%%%%%%%%%%
%% L-W data %
%%%%%%%%%%%%%

data.LWw_nor = [ ... % total length (d), wet weight (g)
2.9  0.16 % 132-132
3.6  0.35 % 151-132
3.9 0.47]; % 160-132
units.LWw_nor   = {'cm', 'g'};  label.LWw_nor = {'total length', 'wet weight'};  
temp.LWw_nor    = C2K(12);  units.temp.LWw_nor = 'K'; label.temp.LWw_nor = 'temperature'; comment.temp.LWw_nor = 'temperature increasing from 10.4�C to 14.1�C throughout the experiment';
bibkey.LWw_nor = 'Einum2000'; comment.LWw_nor = 'Imsa River (Norway), f= natural, fig 4';

% data.LWw_scoA = [ ... fork length (cm), wet weight (g)
% 6.50	2.8 % 1 Feb
% 6.50	2.7 % 1 MAr
% 6.59	2.7 % 1 apr
% 7.11	3.5 % 1 May
% 7.78	4.9 % 1 Jun
% 8.71	7.3 % 1 Jul
% 9.6	10.9 %1 Aug
% 10.47	14.6 %1 Sep
% 10.83	17.2 %1 Oct
% 11.46	18.2 %1 Nov
% 11.70	19.1];%1Dec
% units.LWw_scoA   = {'cm', 'g'};  label.LWw_scoA = {'fork length', 'wet weight'};  
% temp.LWw_scoA = C2K(10); units.temp.LWw_scoA = 'K'; label.temp.LWw_scoA = 'temperature'; comment.temp.LWw_scoA = 'rough guess';
% bibkey.LWw_scoA = 'Rowe1990'; comment.LWw_scoA = 'Almond river(Scotland), fork length, fig 3';
% 
% data.LWw_sco = [ ... % fork length (cm), wet weight (g)
% 7.3  4.7
% 10   12.5
% 10.9 17.6
% 12.2 24.1];
% units.LWw_sco   = {'cm', 'g'};  label.LWw_sco = {'fork length', 'wet weight'};  
% bibkey.LWw_sco = 'McCarthy2003'; comment.LWw_sco = 'Shin River(Scotland), fork length';
% 
% data.LWw_Can = [ ... % fork length (cm), wet weight (g) (parrs)
% 5.5	2.1
% 5.6	2.1
% 5.7	2.0
% 5.9	2.4
% 5.9	2.1
% 6.0	2.9
% 6.0	2.6
% 6.0	2.4
% 6.2	3.0
% 6.2	2.9
% 6.2	2.7
% 6.2	2.6
% 6.3	3.0
% 6.3	2.7
% 6.4	2.9
% 6.4	2.7
% 6.4	3.4
% 6.5	3.4
% 6.5	3.3
% 6.5	3.1
% 6.5	2.7
% 6.5	3.6
% 6.5	3.0
% 6.6	3.3
% 6.6	3.5
% 6.6	2.9
% 6.6	2.8
% 6.6	3.6
% 6.7	3.4
% 6.7	3.3
% 6.7	3.8
% 6.8	3.4
% 6.8	4.1
% 6.8	3.6
% 6.8	3.4
% 6.8	3.3
% 6.9	3.5
% 7.0	4.6
% 7.0	4.3
% 7.0	3.8
% 7.0	3.7
% 7.0	4.4
% 7.0	4.0
% 7.0	4.1
% 7.1	4.5
% 7.1	4.4
% 7.1	4.1
% 7.1	3.9
% 7.2	5.0
% 7.2	4.1
% 7.2	4.9
% 7.2	3.6
% 7.2	3.8
% 7.2	3.5
% 7.2	4.5
% 7.3	5.0
% 7.3	4.4
% 7.3	4.1
% 7.3	4.7
% 7.3	4.2
% 7.3	4.5
% 7.4	4.8
% 7.4	4.9
% 7.4	5.2
% 7.4	4.4
% 7.5	4.5
% 7.5	4.8
% 7.5	5.4
% 7.5	4.9
% 7.5	3.8
% 7.5	4.6
% 7.5	4.5
% 7.6	5.5
% 7.6	4.6
% 7.6	4.8
% 7.6	5.4
% 7.7	4.7
% 7.7	4.2
% 7.7	4.5
% 7.7	4.4
% 7.8	5.3
% 7.8	5.1
% 7.9	5.2
% 7.9	6.0
% 7.9	5.7
% 7.9	5.4
% 7.9	5.1
% 7.9	6.6
% 7.9	4.8
% 8.0	6.9
% 8.0	5.4
% 8.0	5.6
% 8.0	5.0
% 8.0	4.7
% 8.1	5.8
% 8.1	5.0
% 8.1	4.8
% 8.1	6.0
% 8.1	5.4
% 8.2	6.7
% 8.2	6.2
% 8.2	5.0
% 8.2	5.8
% 8.3	7.1
% 8.4	5.0
% 8.4	7.4
% 8.4	7.2
% 8.4	7.0
% 8.4	5.8
% 8.4	7.6
% 8.5	7.4
% 8.5	7.2
% 8.5	8.2
% 8.5	5.5
% 8.5	6.7
% 8.6	6.9
% 8.6	6.8
% 8.6	6.6
% 8.6	6.4
% 8.6	7.9
% 8.6	5.6
% 8.7	8.0
% 8.7	7.1
% 8.8	6.5
% 8.8	7.9
% 8.8	6.8
% 8.8	8.2
% 8.9	8.6
% 8.9	9.3
% 8.9	7.8
% 9.0	8.3
% 9.0	8.0
% 9.0	8.6
% 9.0	7.3
% 9.0	8.9
% 9.1	8.2
% 9.1	8.5
% 9.2	7.6
% 9.2	7.5
% 9.2	9.0
% 9.2	9.9
% 9.3	9.1
% 9.3	8.1
% 9.3	8.4
% 9.4	7.7
% 9.4	9.3
% 9.4	10.2
% 9.5	10.9
% 9.5	10.6
% 9.5	9.9
% 9.5	8.1
% 9.5	7.9
% 9.6	8.5
% 9.6	10.7
% 9.6	8.7
% 9.6	11.1
% 9.6	9.7
% 9.7	8.1
% 9.7	9.3
% 9.7	10.3
% 9.7	7.6
% 9.8	8.5
% 9.8	10.9
% 9.8	9.9
% 9.8	10.3
% 9.9	9.6
% 9.9	10.2
% 10.0	11.8
% 10.1	10.5
% 10.1	11.3
% 10.1	12.2
% 10.1	8.9
% 10.1	8.7
% 10.2	11.8
% 10.2	11.3
% 10.2	12.1
% 10.2	10.1
% 10.3	12.3
% 10.3	11.9
% 10.3	11.6
% 10.3	11.1
% 10.3	12.7
% 10.4	10.0
% 10.4	12.5
% 10.4	12.1
% 10.4	11.7
% 10.5	9.7
% 10.5	11.1
% 10.5	14.2
% 10.5	12.1
% 10.6	10.6
% 10.6	13.0
% 10.6	11.7
% 10.6	11.3
% 10.7	13.2
% 10.7	12.2
% 10.8	11.4
% 10.8	12.9
% 10.8	13.4
% 10.9	13.3
% 10.9	12.7
% 11.0	13.2
% 11.0	15.2
% 11.1	16.7
% 11.1	12.8
% 11.2	14.4
% 11.2	17.7
% 11.2	17.1
% 11.3	12.1
% 11.3	16.6
% 11.3	16.0
% 11.4	16.8
% 11.5	18.5
% 11.7	15.2
% 11.8	15.8
% 11.9	14.5
% 12.0	16.6
% 12.0	18.2
% 12.1	18.9
% 12.1	17.5
% 12.2	15.4
% 12.4	16.5
% 12.5	23.7
% 12.6	21.1
% 12.9	18.9
% 13.5	25.3
% 14.4	27.2];   
% units.LWw_Can = {'cm', 'g'};     label.LWw_Can = {'fork length', 'wet weight'}; 
% bibkey.LWw_Can = 'Sutton2000'; comment.LWw_Can = 'Northeast Brook, Newfoundland, Canada - cross-sectional';
% 
% data.LWw_usa = [ ... % fork length (cm), wet weight (g)
% 19.7 67.7
% 20.9 81.6
% 22.6 100.7
% 21.1 83.5
% 24.1 120.6
% 24.1 121.5
% 23.7 114.1
% 23.8 110.6
% 27.6 188.3];
% units.LWw_usa   = {'cm', 'g'};  label.LWw_usa = {'total length', 'wet weight'};  
% bibkey.LWw_usa = 'Rottiers1993'; comment.LWw_usa = 'Penobscot River (USA) - temperature between 8 and 12°C';

data.LWw_Nor = [ ... % total length (cm), wet weight (g)
60 1500
68 3500
80 6000
84 6000
85 6000
92 8000];
units.LWw_Nor   = {'cm', 'g'};  label.LWw_Nor = {'total length', 'wet weight'}; 
temp.LWw_Nor = C2K(4);  units.temp.LWw_Nor = 'K'; label.temp.LWw_Nor = 'temperature';
bibkey.LWw_Nor = 'Berg2001'; comment.LWw_Nor = 'females from river Stjørdalselva (Norway)';


% data.LWw_Norway_egg = [ ... % diameter (cm), wet weight (g)
% 0.461	0.053
% 0.424	0.059
% 0.595	0.136
% 0.588	0.125
% 0.641	0.142
% 0.57	0.111];
% units.LWw_Norway_egg   = {'cm', 'g'};  label.LWw_Norway_egg = {'total length', 'wet weight'}; 
% temp.LWw_Norway_egg = C2K(4);  units.temp.LWw_Norway_egg = 'K'; label.temp.LWw_Norway_egg = 'temperature';
% bibkey.LWw_Norway_egg = 'Berg2001'; comment.LWw_Norway_egg = 'females from river Stjørdalselva (Norway)';


%%%%%%%%%%%%%
%% L-R data %
%%%%%%%%%%%%%
% data.LR_sco = [ ... % total length (cm), number of eggs (#) 
% 65.2	8249
% 70.3	7422
% 70.7	6763
% 68.1	7177
% 67.2	7419
% 67.1	6516
% 67.8	6239
% 69.7	6380
% 69.1	5893
% 69.3	5477
% 70.9	5687
% 67.7	4052
% 69.1	4505
% 67.8	4400
% 66.8	4503
% 67.3	4850
% 66.6	4919
% 66.4	5162
% 65.9	5473
% 65.2	5681
% 65.8	5959
% 63.7	6686
% 62.6	5782
% 64.6	5264
% 63.9	5055
% 65.2	5021
% 65.0	4709
% 64.5	4222
% 63.9	4569
% 63.3	4776
% 61.6	4948
% 62.4	4775
% 61.8	4427
% 60.2	4807
% 59.4	4633
% 66.0	3877
% 65.1	3737
% 64.2	3528
% 65.7	3460
% 66.9	3427
% 65.7	2870
% 63.6	2555
% 57.2	1472
% 59.1	2446
% 57.9	2549
% 54.5	3378
% 56.5	3172
% 58.8	3105
% 62.0	3248
% 62.1	3977
% 59.8	3384
% 61.1	3663
% 57.5	3381
% 58.2	3660
% 57.3	3936
% 57.3	4110
% 57.0	4422
% 59.1	4008
% 59.3	3730
% 60.4	3836
% 60.4	4217
% 60.9	4565
% 69.2	4158
% 90.0	14456
% 89.5	12130
% 88.0	11573
% 89.0	11261
% 91.1	10535
% 90.6	9875
% 83.1	11741
% 83.5	10977
% 82.1	11045
% 82.1	10872
% 82.1	10768
% 85.4	9869
% 83.5	9728
% 84.0	9104
% 85.1	9001
% 79.0	9549
% 79.2	9029
% 78.1	8750
% 77.8	8368
% 76.7	8297
% 81.6	8407
% 83.1	8339
% 83.7	7958
% 82.5	7957
% 79.8	8370
% 79.2	7988
% 80.3	7711
% 77.8	7222
% 77.2	7222
% 81.6	6672
% 85.0	6085
% 86.6	5011
% 73.7	5656
% 71.6	3675
% 73.7	3573
% 76.8	3126];   
% units.LR_sco = {'cm', '#'};     label.LR_sco = {'total length', 'number of eggs'};  
% bibkey.LR_sco = 'Thorpe1984';    comment.LR_sco = 'River Almond (Scotland)';
% 
% data.LR_sco = [ ... % total length (cm), number of eggs (#) 
% 80.8	7189
% 83.5	8233
% 85.0	5684
% 83.4	11529
% 84.0	13026
% 81.8	13480
% 92.2	12112
% 94.5	14055
% 93.9	15255
% 94.3	16752
% 93.0	16755
% 95.9	13903
% 95.9	11506
% 97.2	11054
% 98.0	11502
% 97.8	13600
% 97.1	14500
% 97.3	15998
% 98.2	17644
% 98.3	18543
% 99.1	17492
% 99.8	17042
% 99.8	15843
% 99.7	13596
% 100.0	13595
% 101.4	12544
% 101.6	11345
% 101.4	17488
% 100.8	19137
% 101.4	18687
% 101.7	18386
% 102.6	18235
% 102.2	16887
% 104.0	18082
% 104.9	21377
% 106.8	18976
% 106.9	17028
% 108.5	13729
% 110.0	21816
% 110.9	21815
% 112.1	25258
% 115.0	28099
% 116.4	22254
% 114.0	35142
% 112.2	33947];
% units.LR_sco = {'cm', '#'};     label.LR_sco = {'total length', 'number of eggs'};  
% bibkey.LR_sco = 'Heinimaa2004';    comment.LR_sco = 'River Teno (Finland/Norway)';
% 
% data.LR_canM = [ ... % fork length (cm), number of eggs (#) 
% 47.0	1339.4
% 48.9	1299.8
% 55.1	1224.1
% 48.4	1587.6
% 50.4	1510.2
% 49.9	1571.8
% 48.9	1669.0
% 49.4	1754.6
% 51.4	1790.1
% 50.9	1844.6
% 53.0	1919.8
% 50.4	2038.6
% 48.9	2186.4
% 51.9	2059.1
% 51.9	2208.3
% 53.0	2253.0
% 53.5	2465.1
% 50.4	2344.9
% 50.9	2440.6
% 50.4	2540.2
% 51.4	2514.9
% 51.9	2514.9
% 53.0	2617.6
% 52.5	2617.6
% 52.5	2670.4
% 52.5	2670.4
% 50.9	2697.3
% 51.4	2724.4
% 50.9	2807.4
% 50.4	2779.4
% 50.9	2864.1
% 50.4	2951.3
% 49.4	3010.9
% 48.9	2807.4
% 48.4	3133.8
% 47.9	3361.0
% 49.9	3428.9
% 50.4	3428.9
% 50.4	3229.2
% 50.4	3133.8
% 50.4	3071.7
% 50.4	3041.2
% 50.9	3010.9
% 51.4	3261.7
% 51.9	3261.7
% 52.5	3428.9
% 53.0	3463.4
% 53.5	3261.7
% 54.1	3327.6
% 54.1	3361.0
% 54.1	3361.0
% 53.5	3010.9
% 55.1	3010.9
% 57.4	2489.9
% 58.6	3714.5
% 58.6	4272.7
% 57.4	4064.3
% 54.6	3568.9
% 54.6	3751.8
% 53.5	3714.5
% 53.0	3866.1
% 51.9	3866.1
% 51.4	3789.5
% 51.4	4023.9
% 51.9	4023.9
% 51.9	4023.9
% 51.9	4146.4
% 51.4	4188.1
% 50.9	4315.6
% 50.9	4359.0
% 50.9	4064.3
% 51.4	3904.9
% 49.9	3751.8
% 49.4	4146.4
% 50.4	4914.8
% 52.5	4272.7
% 52.5	4315.6
% 53.0	4272.7
% 54.1	4272.7
% 54.1	4188.1
% 54.1	4064.3
% 55.1	3983.8
% 55.7	4064.3
% 55.1	4272.7
% 55.7	4272.7
% 57.4	4447.1
% 54.1	4722.1
% 54.6	5271.1
% 55.1	5377.6
% 55.1	5324.1
% 71.5	3827.6
% 70.8	3983.8
% 71.5	4188.1
% 73.7	4315.6
% 70.1	4582.5
% 70.1	4536.9
% 69.4	4447.1
% 68.7	4536.9
% 68.0	4272.7
% 66.7	4722.1
% 68.0	4964.2
% 66.7	5166.8
% 66.7	5271.1
% 65.4	4914.8
% 65.4	5064.4
% 64.7	5218.7
% 66.0	5597.1
% 66.7	5541.4
% 69.4	5597.1
% 71.5	4964.2
% 71.5	5218.7
% 72.2	5166.8
% 73.0	5218.7
% 73.0	5324.1
% 72.2	5431.7
% 73.7	5218.7
% 73.7	5064.4
% 73.7	4914.8
% 75.2	5166.8
% 75.9	5653.3
% 78.3	5884.0
% 79.8	6438.2
% 80.6	6974.4
% 81.5	7405.7
% 83.1	6974.4
% 79.8	7555.3
% 77.5	7115.3
% 75.9	6836.3
% 75.9	7259.0
% 75.9	7785.4
% 76.7	8022.5
% 78.3	8266.8
% 74.4	7631.2
% 74.4	7332.0
% 74.4	7115.3
% 74.4	6974.4
% 74.4	6247.9
% 73.7	6063.2
% 73.7	6247.9
% 73.0	6185.7
% 73.7	6568.2
% 73.0	6700.9
% 71.5	5943.2
% 71.5	5767.5
% 71.5	5825.5
% 70.8	5943.2
% 69.4	5825.5
% 69.4	6063.2
% 68.7	5884.0
% 68.0	5825.5
% 66.7	6002.9
% 66.7	6002.9
% 66.7	6063.2
% 65.4	6185.7
% 62.2	6185.7
% 64.1	6768.3
% 62.8	7631.2
% 60.9	7863.6
% 64.7	8022.5
% 67.4	6374.1
% 68.0	6310.7
% 68.0	6374.1
% 69.4	6374.1
% 68.7	6185.7
% 70.1	6438.2
% 69.4	6568.2
% 70.8	6568.2
% 70.8	6768.3
% 70.1	6905.0
% 69.4	6768.3
% 69.4	6905.0
% 70.8	6905.0
% 70.8	6905.0
% 71.5	6768.3
% 71.5	6905.0
% 71.5	7044.5
% 70.8	7186.8
% 71.5	7259.0
% 71.5	7115.3
% 72.2	7115.3
% 73.0	7044.5
% 73.0	7259.0
% 73.7	7405.7
% 73.7	7405.7
% 72.2	7480.1
% 73.0	7631.2
% 73.0	7942.6
% 73.0	7942.6
% 72.2	8022.5
% 73.0	8184.5
% 73.0	8349.9
% 73.7	8349.9
% 75.2	8349.9
% 75.2	8518.5
% 74.4	8955.3
% 75.2	9045.3
% 75.9	9228.0
% 73.0	9414.4
% 73.0	8955.3
% 71.5	9045.3
% 71.5	8778.0
% 71.5	8518.5
% 71.5	8349.9
% 70.8	8184.5
% 71.5	7942.6
% 71.5	7785.4
% 71.5	7480.1
% 70.1	8955.3
% 69.4	8433.8
% 69.4	8266.8
% 69.4	8103.1
% 70.1	8103.1
% 69.4	7785.4
% 68.7	7942.6
% 68.0	8184.5
% 68.7	7631.2
% 68.0	7405.7
% 68.7	7405.7
% 68.7	7115.3
% 68.0	7115.3
% 68.0	6905.0
% 66.7	6905.0
% 67.4	6974.4
% 66.7	7186.8
% 66.0	6974.4
% 66.0	6700.9
% 66.7	6568.2
% 70.1	10198.5
% 70.8	10198.5
% 73.0	10301.0
% 73.7	10198.5
% 74.4	10301.0
% 75.2	9996.6
% 79.0	11614.4
% 89.1	9136.2
% 90.0	10614.8
% 90.9	11384.4
% 87.4	14044.7];
% units.LR_canM = {'cm', '#'};     label.LR_canM = {'fork length', 'number of eggs'};  
% bibkey.LR_canM = 'Randall1989';    comment.LR_canM = 'River Mirachimi (Canada)';
% 
% data.LR_canR = [ ... % fork length (cm), number of eggs (#) 
% 62.8	5324.1
% 62.8	5377.6
% 63.4	5653.3
% 66.7	5943.2
% 68.7	5825.5
% 68.7	6124.2
% 70.8	5884.0
% 71.5	5884.0
% 71.5	6063.2
% 70.8	6374.1
% 69.4	6247.9
% 69.4	6502.9
% 70.1	6768.3
% 71.5	6568.2
% 73.0	6247.9
% 73.7	6247.9
% 73.0	6502.9
% 73.7	6568.2
% 74.4	6905.0
% 73.0	6836.3
% 76.7	6185.7
% 77.5	6247.9
% 73.7	7405.7
% 70.8	7707.9
% 73.7	7785.4
% 74.4	8184.5
% 75.9	8690.6
% 75.2	7555.3
% 75.2	7785.4
% 75.9	7942.6
% 75.9	7863.6
% 75.9	7480.1
% 76.7	7785.4
% 77.5	8184.5
% 83.1	8103.1
% 80.6	8955.3
% 79.8	9228.0
% 79.8	9320.8
% 79.0	10198.5
% 92.8	8604.2
% 88.2	9897.1
% 88.2	10614.8
% 89.1	10721.4
% 87.4	10721.4
% 88.2	11159.0
% 86.5	11159.0
% 86.5	11849.0
% 84.8	11384.4
% 83.9	11159.0
% 83.9	10721.4
% 90.0	11159.0
% 90.9	11384.4
% 90.0	11384.4
% 90.0	11849.0
% 89.1	12332.6
% 91.8	10829.2
% 94.6	11498.8
% 95.6	12088.4
% 91.8	12581.7
% 91.8	12456.5
% 90.9	12581.7
% 90.0	12964.9
% 88.2	14764.8
% 90.0	14328.4
% 91.8	13766.6
% 92.8	14328.4
% 93.7	16481.6
% 94.6	14764.8
% 94.6	14185.8
% 95.6	14185.8
% 94.6	13494.0
% 96.5	13629.6
% 97.5	13629.6
% 97.5	14044.7
% 99.5	14185.8
% 101.5	13359.7
% 105.6	12835.9
% 105.6	13629.6
% 106.7	15677.8
% 109.9	16647.2
% 111.1	18033.7
% 108.9	19535.7
% 103.5	16481.6
% 102.5	17854.3
% 99.5	18033.7];
% units.LR_canR = {'cm', '#'};     label.LR_canR = {'fork length', 'number of eggs'};  
% bibkey.LR_canR = 'Randall1989';    comment.LR_canR = 'River Restigouche (Canada)';


%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ww-R data
%%%%%%%%%%%%%
% data.WwR = [ ... % wet weight (cm), number of eggs (#) 
% 3920	13383
% 4640	12782
% 4912	11579
% 5010	7970
% 4293	7368
% 5240	5414
% 6167	12481
% 7202	11429
% 7561	11429
% 7966	11128
% 7646	13534
% 7420	14135
% 8094	13835
% 7958	14436
% 7911	15489
% 8224	16241
% 8492	16842
% 8398	18647
% 7280	16692
% 6517	16692
% 8902	13835
% 8905	12481
% 9447	11128
% 10520	13383
% 9751	15789
% 9794	16842
% 10284	18346
% 9926	17895
% 9477	17744
% 9252	18045
% 9385	18797
% 9565	18647
% 11046	18797
% 10546	21805
% 10097	21805
% 13148	22406
% 14136	22105
% 13770	25113
% 13944	27970
% 14510	35489
% 16353	34436];
% units.WwR = {'g', '#'};     label.WwR = {'wet weight', 'number of eggs'};  
% bibkey.WwR = 'Heinimaa2004';    comment.WwR = 'River Teno (Finland/ Norway)';
% 
% data.WwR_nor = [ ... % fork length (cm), wet weight (g) (smolts)
% 1835	305
% 1785	431
% 1398	466
% 1219	542
% 3694	881
% 1815	1024
% 2252	1273
% 2243	1474
% 3505	2588
% 4618	2448
% 4579	3117
% 5692	4642];
% units.WwR_nor   = {'g', 'le'};  label.WwR_nor = {'wet weight', 'number of live embryos'};  
% temp.WwR_nor    = C2K(6);  units.temp.WwR_nor = 'K'; label.temp.WwR_nor = 'temperature';
% bibkey.WwR_nor= 'Fleming1996b'; comment.WwR_nor = 'Sunndalsora strain ; T= rough guess';

%% set weights for all real data
weights = setweights(data, []);
% weights.tp_gbr = weights.tp_gbr/10;%/number of papers/number of measurement in the paper. (review excluded)
% weights.tp_ice = weights.tp_ice/10;
weights.tp_nor = weights.tp_nor/2;
% weights.tp_fraspa = weights.tp_fraspa/10;
% weights.tp_canm = weights.tp_canm/10;
% weights.tp_canf = weights.tp_canf/10;
% weights.tp_rus = weights.tp_rus/10;
weights.tp_norI = weights.tp_norI/2;
% weights.tp_ire2 = weights.tp_ire2/10;
weights.am = weights.am/3;
% weights.am_sco = weights.am_sco/3;
% weights.am_rus = weights.am_rus/3;
weights.Lh_Can2 = weights.Lh_Can2/4/11;% 4 papers 11 codnitions in the paper
weights.Lh_Can4 = weights.Lh_Can4/4/11;
weights.Lh_Can6 = weights.Lh_Can6/4/11;
weights.Lh_Can8 = weights.Lh_Can8/4/11;
weights.Lh_Can10 = weights.Lh_Can10/4/11;
weights.Lh_Can12 = weights.Lh_Can12/4/11;
weights.Lh_CanM4 = weights.Lh_CanM4/4/11;
weights.Lh_CanM6 = weights.Lh_CanM6/4/11;
weights.Lh_CanM8 = weights.Lh_CanM8/4/11;
weights.Lh_CanM10 = weights.Lh_CanM10/4/11;
weights.Lh_CanM12 = weights.Lh_CanM12/4/11;
weights.Lh_CanP = weights.Lh_CanP/4;
weights.Lh_Rus = weights.Lh_Rus/4;
weights.Lh_scocanmix = weights.Lh_scocanmix/4;
% weights.Lb_Sco1SWM = weights.Lb_Sco1SWM/7/2;
% weights.Lb_Sco2SWM = weights.Lb_Sco2SWM/7/2;
% weights.Lb_NorF2011 = weights.Lb_NorF2011/7/4;
% weights.Lb_NorF2012 = weights.Lb_NorF2012/7/4;
% weights.Lb_NorF2013 = weights.Lb_NorF2013/7/4;
% weights.Lb_NorV2013 = weights.Lb_NorV2013/7/4;
weights.Lb_NorF2011 = weights.Lb_NorF2011/4;
weights.Lb_NorF2012 = weights.Lb_NorF2012/4;
weights.Lb_NorF2013 = weights.Lb_NorF2013/4;
weights.Lb_NorV2013 = weights.Lb_NorV2013/4;
% weights.Lb_Can2D = weights.Lb_Can2D/7/8;
% weights.Lb_Can6D = weights.Lb_Can6D/7/8;
% weights.Lb_Can12D = weights.Lb_Can12D/7/8;
% weights.Lb_Can4M = weights.Lb_Can4M/7/8;
% weights.Lb_Can6M = weights.Lb_Can6M/7/8;
% weights.Lb_Can8M = weights.Lb_Can8M/7/8;
% weights.Lb_Can10M = weights.Lb_Can10M/7/8;
% weights.Lb_Can12M = weights.Lb_Can12M/7/8;
% weights.Lb_CanP = weights.Lb_CanP/7;
% weights.Lb_Rus = weights.Lb_Rus/7;
% weights.Lb_Usa = weights.Lb_Usa/7;
% weights.Lb_ScoA = weights.Lb_ScoA/7;
weights.Lsp_norS = weights.Lsp_norS/4;
% weights.Lp_sco = weights.Lp_sco/9;
weights.Lsp_norI = weights.Lsp_norI/4;
% weights.Lp_spaNM = weights.Lp_spaNM/9;
% weights.Lp_canM = weights.Lp_canM/9;
% weights.Lp_canR = weights.Lp_canR/9;
weights.Lsp_norSf = weights.Lsp_norSf/4/2;
weights.Lsp_norSm = weights.Lsp_norSm/4/2;
% weights.Lp_rus = weights.Lp_rus/9;
% weights.Lp_usa = weights.Lp_usa/9;
% weights.Lp_norI2 = weights.Lp_norI2*0; % reared to smolt
% weights.Li_ScoMax = weights.Li_ScoMax/11;
weights.Li_NorFM = weights.Li_NorFM/4/2;
weights.Li_NorFF = weights.Li_NorFF/4/2;
weights.Li_NorVM = weights.Li_NorVM/4/2;
weights.Li_NorVF = weights.Li_NorVF/4/2;
weights.Li_NorAM = weights.Li_NorAM/4/2;
weights.Li_NorAF = weights.Li_NorAF/4/2;
weights.Li_norI = weights.Li_norI/4;
% weights.Li_spaNM = weights.Li_spaNM/11;
% weights.Li_canBS = weights.Li_canBS/11;
% weights.Li_rusN = weights.Li_rusN/11;
% weights.Li_rusO = weights.Li_rusO/11;
% weights.Li_rusS = weights.Li_rusS/11;
% weights.Li_usa = weights.Li_usa/11;
weights.V0_nor = weights.V0_nor/3;
% weights.V0_can = weights.V0_can/9;
weights.V0_norF2011 = weights.V0_norF2011/3/2;
weights.V0_norF2012 = weights.V0_norF2012/3/2;
% weights.V0_rus = weights.V0_rus/9;
% weights.V0_sco = weights.V0_sco/9;
% weights.V0_usa = weights.V0_usa/9;
% weights.V0_scoBC = weights.V0_scoBC/9;
% weights.V0_canD = weights.V0_canD/9;
weights.V0_fnor = weights.V0_fnor/3;
% weights.Wwh_Eng = weights.Wwh_Eng/5;
% weights.Wwh_Can = weights.Wwh_Can/5;
% weights.Wwh_Rus = weights.Wwh_Rus/5;
% weights.Wwh_Sco = weights.Wwh_Sco/5;
weights.Wwh_FNor = weights.Wwh_FNor;
weights.Wwb_Sco1SWM = weights.Wwb_Sco1SWM/3/2;
weights.Wwb_Sco2SWM = weights.Wwb_Sco2SWM/3/2;
weights.Wwb_Can = weights.Wwb_Can/3;
weights.Wwb_Rus = weights.Wwb_Rus/3;
weights.Wwsp_norf = weights.Wwsp_norf/2;
weights.Wwsp_norm = weights.Wwsp_norm/2;
% weights.Wwp_rus = weights.Wwp_rus/3;
% weights.Wwp_usa = weights.Wwp_usa/3;
weights.Wwi = weights.Wwi/5;
weights.Wwi_NorFM = weights.Wwi_NorFM/5/2;
weights.Wwi_NorFF = weights.Wwi_NorFF/5/2;
weights.Wwi_NorVM = weights.Wwi_NorVM/5/2;
weights.Wwi_NorVF = weights.Wwi_NorVF/5/2;
weights.Wwi_NorAM = weights.Wwi_NorAM/5/2;
weights.Wwi_NorAF = weights.Wwi_NorAF/5/2;
% weights.Wwi_RusN = weights.Wwi_RusN/9;
% weights.Wwi_RusO = weights.Wwi_RusO/9;
% weights.Wwi_RusS = weights.Wwi_RusS/9;
% weights.Wwi_usa = weights.Wwi_usa/9;
weights.Wwi_FNor = weights.Wwi_FNor/5;
% weights.E0_Canaf = weights.E0_Canaf/2;
weights.E0_Nor = weights.E0_Nor/2;
% weights.Ri_sco = weights.Ri_sco/4;
% weights.Ri_spa = weights.Ri_spa/4;
% weights.Ri_can = weights.Ri_can/4;
weights.Ri_nor = weights.Ri_nor;
weights.Tah_Dennis_Peterson1977 = weights.Tah_Dennis_Peterson1977/6;
weights.Tah_Mirachimi_Peterson1977 = weights.Tah_Mirachimi_Peterson1977/6;
weights.Tah_Wallace1988 = weights.Tah_Wallace1988/6;
weights.Tah_norF = weights.Tah_norF/6/3;
weights.Tah_norV = weights.Tah_norV/6/3;
weights.Tah_norA = weights.Tah_norA/6/3;
weights.Tah_Berg1999 = weights.Tah_Berg1999/6;
weights.Tah_Johnston1997 = weights.Tah_Johnston1997/6;
weights.TabC = weights.TabC;
% weights.Tab_sco = weights.Tab_sco/2;
% weights.tL_usa = weights.tL_usa/12;
weights.tL_norI = weights.tL_norI/2;
weights.tL_nor4 = weights.tL_nor4/2/3;
weights.tL_nor5 = weights.tL_nor5/2/3;
weights.tL_nor7 = weights.tL_nor7/2/3;
weights.tL_nor57 = 0*weights.tL_nor57/2/4;% same as nor5
% weights.tL_scoA = weights.tL_scoA/12;
% weights.tL_scoS = weights.tL_scoS/6/2*0;
% weights.tL_spa = weights.tL_spa/6/2*0;
weights.tL_scoAa = 0*weights.tL_scoAa/12;% variations de T� + pas d'info sur la nourriture.
% weights.tWw_sco = weights.tWw_sco/12/2;
weights.LWw_nor = weights.LWw_nor/2;
% weights.LWw_scoA = weights.LWw_scoA/12;
% weights.LWw_sco = weights.LWw_sco/12/2;
% weights.LWw_Can = weights.LWw_Can/12;
% weights.LWw_usa = weights.LWw_usa/12;
weights.LWw_Nor = weights.LWw_Nor/2;



%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Tah_Dennis_Peterson1977','Tah_Wallace1988','Tah_Mirachimi_Peterson1977','Tah_norF','Tah_norV','Tah_norA','Tah_Berg1999','Tah_Johnston1997'}; comment1 = {'Age at hatching for different studies'};
% set2 = {'LWw_Nor','LWw_nor'}; comment2 = {'length weigth - different studies'};
set2 = {'tL_nor4','tL_nor5','tL_nor7','tL_nor57'}; comment2 = {'Growth at different temperatures - Imsland 2016'};
% set4 = {'tL_usa','tL_scoAa'}; comment4 = {'Growth - different studies weight =1'};
% set5 = {'tL_norI','tL_scoA'}; comment5 = {'early growth scotland - different studies'};
% set6 = {'tL_scoS','tL_spa'}; comment6 = {'Growth - different studies/countries, weight =0'};
% set7 = {'LWw_scoA','LWw_sco','LWw_Can'}; comment7 = {'length weigth - different studies/countries'};

% set2 = {'TabC','Tab_sco'}; comment2 = {'Age at birth for different studies'};

metaData.grp.sets = {set1, set2};
metaData.grp.comment = {comment1, comment2};

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Discussion points
% D1 = '';
% D2 = '';     
% metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3266ba091601ba86cd408decf2706b85'; % Cat of Life
metaData.links.id_EoL = '46563143'; % Ency of Life
metaData.links.id_Wiki = 'Salmo_salar'; % Wikipedia
metaData.links.id_ADW = 'Salmo_salar'; % ADW
metaData.links.id_Taxo = '42821'; % Taxonomicon
metaData.links.id_WoRMS = '127186'; % WoRMS
metaData.links.id_fishbase = 'Salmo-salar.html'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salmo_salar}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Flower1935'; type = 'Article'; bib = [ ... 
'author = {Flower, Stanley.S.}, ' ... 
'year = {1935}, ' ...
'title = {Further notes on the duration of life in animals. - {I}. {F}ishes: as determined by otolith and scale - readings and direct observations on living animals.}, ' ...
'journal = {Proceedings of the Zoological Society of London}, ' ...
'volume = {265}, ' ...
'pages = {page 274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hutchings1998'; type = 'Article'; bib = [ ... 
'author = {Hutchings, Jeffrey A. and Jones, Megan E. B.}, ' ... 
'year = {1998}, ' ...
'title = {Life history variation and growth rate thresholds for maturity in {A}tlantic salmon, \emph{Salmo salar}}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {55}, ' ...
'number = {S1}, ' ...
'doi = {10.1139/d98-004}, ' ...
'pages = {Table A1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VanLeeuwen2016'; type = 'Article'; bib = [ ... 
'author = {Van Leeuwen, Travis E. and McLennan, Darryl and McKelvey, Simon and Stewart, David C. and Adams, Colin E. and Metcalfe, Neil B.}, ' ... 
'year = {2016}, ' ...
'title = {The association between parental life history and offspring phenotype in {A}tlantic salmon}, ' ...
'journal = {Journal of Experimental Biology}, ' ...
'volume = {219}, ' ...
'number = {3}, ' ...
'doi = {10.1242/jeb.122531}, ' ...
'pages = {Figures 1 and S2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jutila2006'; type = 'Article'; bib = [ ... 
'author = {Jutila, E. and Jokikokko, E. and Julkunen, M.}, ' ... 
'year = {2006}, ' ...
'title = {Long-term changes in the smolt size and age of {A}tlantic salmon, \emph{Salmo salar} {L}., in a northern {B}altic river related to parr density, growth opportunity and postsmolt survival.}, ' ...
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = {15}, ' ...
'number = {}, ' ...
'doi = {10.1111/j.1600-0633.2006.00171.x}, ' ...
'pages = {321-330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fleming1996'; type = 'Article'; bib = [ ... 
'author = {Fleming, Ian A.}, ' ... 
'year = {1996}, ' ...
'title = {Reproductive strategies of {A}tlantic salmon: ecology and evolution}, ' ...
'journal = {Reviews in Fish Biology and Fisheries}, ' ...
'volume = {6}, ' ...
'pages = {Tables 2, 3 and 5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fleming1996b'; type = 'Article'; bib = [ ... 
'author = {Fleming, Ian A. and Jonsson, B. and Gross M.R. and Lamberg A.}, ' ... 
'year = {1996}, ' ...
'title = {An experimental study of the reproductive behaviour and success of farmed and wild {A}tlantic Salmon \emph{Salmo salar} {L}}, ' ...
'journal = {The Journal of Applied Ecology}, ' ...
'volume = {33}, ' ...
'pages = {893-905}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thorpe1984'; type = 'Article'; bib = [ ... 
'author = {Thorpe, J.E. and Miles, M.S. and Keay, D.S.}, ' ... 
'year = {1984}, ' ...
'title = {Developmental rate, fecundity and egg size in {A}tlantic salmon, \emph{Salmo salar} {L}.}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {43}, ' ...
'number = {1-3}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Figure 1, page 294, extracted using WebPlotDigitizer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sutton2000'; type = 'Article'; bib = [ ... 
'author = {Sutton, S.G. and Bult, T.P. and Haedrich, R.L.}, ' ... 
'year = {2000}, ' ...
'title = {Relationship among fat weight, body weight, water weight, and condition factor in wild {A}tlantic salmon parr}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {129}, ' ...
'number = {2}, ' ...
'doi = {10.1577/1548-8659(2000)129<0527:RAFWBW>2.0.C0;2}, ' ...
'pages = {527-538}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jonsson1998'; type = 'Article'; bib = [ ... 
'author = {Jonsson, N. and Jonsson, B. and Hansen, L. P.}, ' ... 
'year = {1998}, ' ...
'title = {Long-term study of the ecology of wild {A}tlantic salmon smolts in a small {N}orwegian river}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {52}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Table 1, page 641}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kazakov1981'; type = 'Article'; bib = [ ... 
'author = {Kazakov, R. V.}, ' ... 
'year = {1981}, ' ...
'title = {The effect of the size of {A}tlantic salmon, \emph{Salmo salar} {L}., eggs on embryos and alevins}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {19}, ' ...
'doi = {10.1016/0044-8486(84)90030-9}, ' ...
'pages = {Tables I and III, page 355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% Kazarkov also has relatioship between egg weight, length and weight at hatching, length and weight at first feeding, but averaged for five classes of size
%
bibkey = 'Peterson1977'; type = 'Article'; bib = [ ... 
'author = {Peterson, R. H. and Spinney, H. C. E. and Sreedharan A.}, ' ... 
'year = {1977}, ' ...
'title = {Development of {A}tlantic Salmon (\emph{Salmo salar}) Eggs and Alevins Under Varied Temperature Regimes}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {34}, ' ...
'number = {1}, ' ...
'doi = {10.1139/f77-004}, ' ...
'pages = {31-43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Srivastava1991'; type = 'Article'; bib = [ ... 
'author = {Srivastava, Rakesh Kumar and Brown, Joseph A.}, ' ... 
'year = {1991}, ' ...
'title = {The biochemical characteristics and hatching performance of cultured and wild {A}tlantic salmon (\emph{Salmo salar}) eggs}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {69}, ' ...
'number = {9}, ' ...
'doi = {10.1139/z91-342}, ' ...
'pages = {2436-2441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Carrick1979'; type = 'Article'; bib = [ ... 
'author = {Carrick, T. R.}, ' ... 
'year = {1979}, ' ...
'title = {The effect of acid water  on the hatching of salmonid eggs}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {14}, ' ...
'doi = {10.1111/j.1095-8649.1979.tb03506.x}, ' ...
'pages = {165-172, Table III}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wallace1988'; type = 'Article'; bib = [ ... 
'author = {Wallace, J. C. and Heggberget, T. G.}, ' ... 
'year = {1988}, ' ...
'title = {Incubation of eggs of {A}tlantic salmon (\emph{Salmo salar})  from different {N}orwegian streams at  temperatures below 1\,C.}, ' ...
'journal = {Journal of Fisheries and Aquatic Science}, ' ...
'volume = {45}, ' ...
'number = {1}, ' ...
'doi = {10.1139/f88-022}, ' ...
'pages = {193-196, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rottiers1993'; type = 'Article'; bib = [ ... 
'author = {Rottiers, Donald V.}, ' ... 
'year = {1993}, ' ...
'title = {Elemental composition of a migratory and a land-locked strain of {A}tlantic salmon \emph{Salmo salar}}, ' ...
'journal = {Comparative Biochemistry and Physiology, Part A: Physiology}, ' ...
'volume = {104A}, ' ...
'number = {1}, ' ...
'doi = {10.1016/0300-9629(93)90014-U}, ' ...
'pages = {93-100, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berg2001'; type = 'Article'; bib = [ ... 
'author = {Berg, O. K. and Hendry, A. P. and Svendsen, B. and Bech, C. and Arnekleiv, J. V. and Lohrmann, A.}, ' ... 
'year = {2001}, ' ...
'title = {Maternal provisioning of offspring and the use of those resources during ontogeny: variation within and between {A}tlantic Salmon families}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {15}, ' ...
'doi = {10.1046/j.1365-2435.2001.00473.x}, ' ...
'pages = {13-23, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Einum2000'; type = 'Article'; bib = [ ... 
'author = {Einum, Sigurd and Fleming, Ian A.}, ' ... 
'year = {2000}, ' ...
'title = {Selection against late emergence and small offspring in {A}tlantic salmon (\emph{Salmo salar})}, ' ...
'journal = {Evolution}, ' ...
'volume = {54}, ' ...
'number = {2}, ' ...
'doi = {10.1111/j.0014-3820.2000.tb00064.x}, ' ...
'pages = {628-639}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/236}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coughlin1991'; type = 'Article'; bib = [ ... 
'author = {Coughlin, David J.},' ...
'title = {Ontogeny of Feeding Behavior of First-Feeding Atlantic Salmon (Salmo salar)},' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences},' ...
'volume = {48},' ...
'number = {10},' ...
'pages = {1896-1904},' ...
'year = {1991},' ...
'doi = {10.1139/f91-225},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gilbey2009'; type = 'Article'; bib = [ ... 
'author = {Gilbey, J. and Cauwelier, E. and Jones, C. S. and Mclay, A. and Noble, L. R. and Verspoor, E.},' ...
'title = {Size-dependent growth of individual Atlantic salmon Salmo salar alevins from hatch to first feeding},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {75},' ...
'number = {10},' ...
'pages = {2820-2831},' ...
'keywords = {egg size, hatch timing, specific growth rate, yolk sac},' ...
'doi = {10.1111/j.1095-8649.2009.02497.x},' ...
'year = {2009}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey='Bailey1980'; type='Article';bib=[...
'author = {Bailey, J. K. and Saunders, R. L. and Buzeta, M. I.},'...
'title = {Influence of Parental Smolt Age and Sea Age on Growth and Smolting of Hatchery-Reared Atlantic Salmon (Salmo salar)},'...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences},'...
'volume = {37},' ...
'number = {9},' ...
'pages = {1379-1386},' ...
'year = {1980},' ....
'doi = {10.1139/f80-177},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berg1999'; type = 'Article'; bib = [ ... 
'author = {Berg, O. K. and Moen, V.},' ...
'title = {Inter- and intrapopulation variation in temperature sum requirements at hatching in Norwegian Atlantic salmon},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {54},' ...
'number = {3},' ...
'pages = {636-647},' ...
'keywords = {Salmo salar, diversity, developmental rate, day-degrees, degree-days, farmed fish, aquaculture, escaped salmon},' ...
'doi = {10.1111/j.1095-8649.1999.tb00642.x},' ...
'year = {1999}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Baum1971'; type='Article';bib=[...
'author = {Baum, E. T. and Meister, A. L.},' ...
'title = {Fecundity of Atlantic Salmon (Salmo salar) from Two Maine Rivers},' ...
'journal = {Journal of the Fisheries Research Board of Canada},' ...
'volume = {28},' ...
'number = {5},' ...
'pages = {764-767},' ...
'year = {1971},' ...
'doi = {10.1139/f71-106},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Heinimaa2004'; type='Article'; bib=[...
'author = {Heinimaa, Sirkka Heinimaa and Petri},' ...
'journal = {BOREAL ENVIRONMENT RESEARCH},' ...
'pages = {55--62},' ...
'title = {{Effect of the female size on egg quality and fecundity of the wild Atlantic salmon in the sub-arctic River Teno}},' ...
'volume = {9},' ...
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Imsland2016'; type='Article'; bib=[...
'author = {Imsland, A. K. and Pettersen, K. and Stefansson, S. O.},' ...
'title = {Growth and Smoltification of Three Norwegian Strains of Atlantic Salmon Salmo salar Reared under Different Thermal Regimes},' ...
'journal = {River Research and Applications},' ...
'volume = {32},' ...
'pages = {1800-1807},' ...
'doi = {10.1002/rra.3011},' ...
'year = {2016}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Johnston1997'; type='Article'; bib=[...
'author = {Johnston, Ian A. and McLay, H. Anne},' ...
'title = {Temperature and family effects on muscle cellularity at hatch and first feeding in Atlantic salmon (Salmo salar L.)},' ...
'journal = {Canadian Journal of Zoology},' ...
'volume = {75},' ...
'pages = {64-74},' ...
'year = {1997},' ...
'doi = {10.1139/z97-008},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% %
% bibkey='Jokikokko2006'; type='Article'; bib=[...
% 'author = {Jokikokko, E. and Kallio-Nyberg, I. and Saloniemi, I. and Jutila, E.},' ...
% 'title = {The survival of semi-wild, wild and hatchery-reared Atlantic salmon smolts of the Simojoki River in the Baltic Sea},' ...
% 'journal = {Journal of Fish Biology},' ...
% 'volume = {68},' ...
% 'pages = {430-442},' ...
% 'doi = {10.1111/j.0022-1112.2006.00892.x},' ...
% 'year = {2006}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% %
bibkey='Jonsson1991'; type='Article'; bib=[...
'title = "Differences in life history and migratory behaviour between wild and hatchery-reared Atlantic salmon in nature",' ...
'journal = "Aquaculture",' ...
'volume = "98",' ...
'number = "1",' ...
'pages = "69 - 78",' ...
'year = "1991",' ...
'doi = {10.1016/0044-8486(91)90372-E},' ...
'author = "Bror Jonsson and Nina Jonsson and Lars P. Hansen",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Hindar2006'; type='Article'; bib=[...
'author = {Hindar, Kjetil and Fleming, Ian A and McGinnity, Philip and Diserud, Ola},' ...
'doi = {10.1016/j.icesjms.2006.04.025},' ...
'journal = {ICES Journal of Marine Science},' ...
'pages = {1234--1247},' ...
'title = {{Genetic and ecological effects of salmon farming on wild salmon: modelling from experimental results}},' ...
'volume = {63},' ...
'year = {2006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Metcalfe1992'; type='Article'; bib=[...
'author = {Metcalfe, N. B. and Thorpe, J. E.},' ...
'title = {Early predictors of life-history events: the link between first feeding date, dominance and seaward migration in Atlantic salmon, Salmo salar L.},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {41},' ...
'pages = {93-99},' ...
'keywords = {Salmo salar, dominance, growth, life histories},' ...
'doi = {10.1111/j.1095-8649.1992.tb03871.x},' ...
'year = {1992}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Nicieza1994'; type='Article'; bib=[...
'author = {Nicieza, Alfredo G. and Reyes-Gavil�n, Felipe G. and Bra�a, Florentino},' ...
'title = {Differentiation in juvenile growth and bimodality patterns between northern and southern populations of Atlantic salmon (Salmo salar L.)},' ...
'journal = {Canadian Journal of Zoology},' ...
'volume = {72},' ...
'pages = {1603-1610},' ...
'year = {1994},' ...
'doi = {10.1139/z94-213},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Rowe1990'; type='Article'; bib=[...
'author = {Rowe, D. K. and Thorpe, J. E.},' ...
'title = {Differences in growth between maturing and non-maturing male Atlantic salmon, Salmo salar L., parr},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {36},' ...
'pages = {643-658},' ...
'doi = {10.1111/j.1095-8649.1990.tb04319.x},' ...
'year = {1990}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Solberg2014'; type = 'Article'; bib = [ ... 
'author = {Solberg, M. F. and Fjelldal, P. G. and Nilsen F. and Glover, K. A.},' ...
'title = {Hatching Time and Alevin Growth Prior to the Onset of Exogenous Feeding in Farmed, Wild and Hybrid Norwegian Atlantic Salmon},' ...
'journal = {PLOS ONE},' ...
'volume = {12},' ...
'number = {9},' ...
'pages = {e113697},' ...
'doi = {10.1371/journal.pone.0113697},' ...
'year = {2014}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='McCarthy2003'; type='Article'; bib=[...
'author = {McCarthy, I. D. and S�nchez, J. A. and Blanco, G.},' ...
'title = {Allozyme heterozygosity, date of first feeding and life history strategy in Atlantic salmon},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {62},' ...
'pages = {341-357},' ...
'doi = {10.1046/j.1095-8649.2003.00026.x},' ...
'year = {2003}'];

metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];