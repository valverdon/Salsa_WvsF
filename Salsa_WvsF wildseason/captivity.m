
function [data, auxData, metaData, txtData, weights] = mydata_Salmo_salar 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_salar'; 
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

%% set data
% zero-variate data

%% Age at hatching

data.ah_nor = 88;    units.ah_nor = 'd';    label.ah_nor = 'age at hatching';             bibkey.ah_nor = 'Solberg2014';     comment.ah_nor = 'parents from river Skibotn (protection plan), mean of offsprings time at 50% hatching in 2013';
  temp.ah_nor = C2K(6.3);  units.temp.ah_nor = 'K'; label.temp.ah_nor = 'temperature';

%% Age at 1st feeding

data.ah_norL = 183;    units.ah_norL = 'd';    label.ah_norL = 'age at hatching';             bibkey.ah_norL = 'Glover2009';     comment.ah_norL = 'grandparents from river Laerdal (protection plan Norway), mean of offsprings time at 50% hatching in 2013';
  temp.ah_norL = C2K(6);  units.temp.ah_norL = 'K'; label.temp.ah_norL = 'temperature'; label.temp.comment.ah_norL = 'temp=5 as egg, 12 as fry, approx at t=165';

  %% Age at smoltification
data.aj_norL = 551;    units.aj_norL = 'd';    label.aj_norL = 'time since birth at smoltification';             bibkey.aj_norL = 'Glover2009';     comment.aj_norL = 'grandparents from river Laerdal (protection plan Norway)';
  temp.aj_norL = C2K(12);  units.temp.aj_norL = 'K'; label.temp.aj_norL = 'temperature'; label.temp.comment.aj_norL = 'temp=5 as egg, 12 as fry, approx at t=165, not precise';
data.aj_norL = 1173;    units.aj_norL = 'd';    label.aj_norL = 'time since birth at smoltification';             bibkey.aj_norL = 'Skaala2012';     comment.aj_norL = 'grandparents from river Laerdal (protection plan Norway)';
  temp.aj_norL = C2K(12);  units.temp.aj_norL = 'K'; label.temp.aj_norL = 'temperature'; label.temp.comment.aj_norL = 'temp=5 as egg, 12 as fry, approx at t=165, not precise';

data.aj_usa = 698;    units.aj_usa = 'd';    label.aj_usa = 'time since birth at smoltification';             bibkey.aj_usa = 'Orciari1994';     comment.aj_usa = 'Penobscot strain (USA)';
  temp.aj_usa = C2K(7.5);  units.temp.aj_usa = 'K'; label.temp.aj_usa = 'temperature'; label.temp.comment.aj_usa = 'mean of mean T° for years 1982,1948 and 1985';
data.aj_ice = 723;    units.aj_ice = 'd';    label.aj_ice = 'time since birth at smoltification';             bibkey.aj_ice = 'Orciari1994';     comment.ice = 'Icelandic strain';
  temp.aj_ice = C2K(5.6);  units.temp.aj_ice = 'K'; label.temp.aj_ice = 'temperature'; label.temp.comment.aj_ice = 'mean T° for year 1983';
 
  
%% Length at hatching

data.Lh  = 1.7;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching';   bibkey.Lh  = 'Srivastava1991';  comment.Wwh = 'parents from Broodstock from Exploits River (Canada)';
  temp.Lh = C2K(7);  units.temp.Lh = 'K'; label.temp.Lh = 'temperature';

%% Length at first feeding

data.Lb_CanP  = 2.5;   units.Lb_CanP  = 'cm';  label.Lb_CanP  = 'total length at birth';   bibkey.Lb_CanP  = 'Srivastava1991';  comment.Lb_CanP = 'parents from Broodstock from Exploits River (Canada)';
  temp.Lb_CanP = C2K(7);  units.temp.Lb_CanP = 'K'; label.temp.Lb_CanP = 'temperature';

  
 %% Length at smoltification
data.Lj_usa  = 18.3;   units.Lj_usa  = 'cm';  label.Lj_usa = 'total length at smoltification';   bibkey.Lj_usa  = 'Orciari1994';  comment.Lj_usa = 'Penobscot strain (USA),maen of means for years 1982,1948 and 1985';
  temp.Lj_usa = C2K(7.5);  units.temp.Lj_usa = 'K'; label.temp.Lj_usa = 'temperature';
data.Lj_ice  = 17.4;   units.Lj_ice  = 'cm';  label.Lj_ice = 'total length at smoltification';   bibkey.Lj_ice  = 'Orciari1994';  comment.Lj_ice = 'Icelandic strain, mean for year 1983';
  temp.Lj_ice = C2K(7.5);  units.temp.Lj_ice = 'K'; label.temp.Lj_ice = 'temperature';
 
 
 
 
%% Length at spawning
data.Li_NorSM = 85;   units.Li_NorSM = 'g';   label.Li_NorSM = 'ultimate wet weight';     bibkey.Li_NorSM = 'Solberg2014'; comment.Li_NorSM = 'maximum of parents from Skibotn river -males (n=2)';
data.Li_NorSF = 95;   units.Li_NorSF = 'g';   label.Li_NorSF = 'ultimate wet weight';     bibkey.Li_NorSF = 'Solberg2014';comment.Li_NorSF = 'maximum of parents from Skibotn river - females (n =2)';
 data.Lp_norN  = 61.6 ;   units.Lp_norN  = 'cm';  label.Lp_norN  = 'length at puberty'; bibkey.Lp_norN = 'Jonsson1991';   comment.Lp_norN = 'Nina research station (Norway)'; %T = hatcheries for fries, natural from smolt  f=1

%% Egg volume
data.V0_can = 0.113;  units.V0_can = 'cm^3'; label.V0_can = 'egg volume'; bibkey.V0_can = 'Srivastava1991';  comment.V0_can = 'parents rom Broodstock from Exploits River (Canada),mean(4/3*pi*(diameter/2)^3) (4 females eggs)';

%% Egg weight
data.Ww0_Canbf = 0.095;  units.Ww0_Canbf = 'g'; label.Ww0_Canbf = 'wet egg weight'; bibkey.Ww0_Canbf = 'Srivastava1991';  comment.Ww0_Canbf = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
data.Ww0_Canaf = 0.106;  units.Ww0_Canaf = 'g'; label.Ww0_Canaf = 'wet egg weight'; bibkey.Ww_Canaf0 = 'Srivastava1991';  comment.Ww0_Canaf = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
data.Ww0_norL = 0.110; units.Ww0_norM = 'cm^3'; label.Ww0_norM = 'egg weight'; bibkey.Ww0_norM = 'Glover2009'; comment.Ww0_norM= 'grandparents from Laerdal river (Norway)';

%% Weigt at fertilization
data.Ww0_Nor = 0.110;   units.Wwh_Can = 'g';   label.Wwh_Can = 'wet weight at fertilization';     bibkey.Wwh_Can = 'Skaala2012';  comment.Wwh_Can = 'parents from Laerdal River (Norway)';



%% Weight at hatching
data.Wwh_Can = 0.098;   units.Wwh_Can = 'g';   label.Wwh_Can = 'wet weight at hatching';     bibkey.Wwh_Can = 'Srivastava1991';  comment.Wwh_Can = 'parents from Northeast Placentia River (Newfoundland, Canada)';


%% Weight at first feeding
data.Wwb_Can = 0.109;   units.Wwb_Can = 'g';   label.Wwb_Can = 'wet weight at birth';     bibkey.Wwb_Can = 'Srivastava1991';  comment.Wwb_Can = 'parents from Northeast Placentia River (Newfoundland, Canada)';

%% Weigth at smoltification
data.Wwj_Nor = 22.4;   units.Wwb_Can = 'g';   label.Wwb_Can = 'wet weight at smoltification';     bibkey.Wwb_Can = 'Skaala2012';  comment.Wwb_Can = 'parents from Laerdal River (Norway)';


%% Weigth at spawning
data.Wwi_NorSM = 6670;   units.Wwi_NorSM = 'g';   label.Wwi_NorSM = 'ultimate wet weight';     bibkey.Wwi_NorSM = 'Solberg2014'; comment.Wwi_NorSM = 'maximum of parents from Skibotn river -males (n=2)';
data.Wwi_NorSF = 13130;   units.Wwi_NorSF = 'g';   label.Wwi_NorSF = 'ultimate wet weight';     bibkey.Wwi_NorSF = 'Solberg2014'; comment.Wwi_NorSF = 'maximum of parents from Skibotn river - females (n =2)';


%% Reserve energy in egg (egg = reserve only)

data.E0_Canbf = 821; units.E0_Canbf = 'J'; label.E0_Canbf = 'egg reserve energy'; bibkey.E0_Canbf = 'Srivastava1991';   comment.E0_Canbf = 'before fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';
data.E0_Canaf = 816; units.E0_Canaf = 'J'; label.E0_Canaf = 'egg reserve energy'; bibkey.E0_Canaf = 'Srivastava1991';   comment.E0_Canaf = 'after fertilization - parents from Northeast Placentia River (Newfoundland, Canada)';

% uni-variate data

%% t-L

 data.tL_norL = [ ... %time since fertilization (d) approximation, fork length (cm)
518	16.17
722	37.73
959	51.91
1070	61.42
345	12.57
688	38
947	60.1
1042	70.6];
units.tL_norL  = {'d', 'g'};  label.tL_norL = {'time since fertilization', 'wet weight'};  
temp.tL_norL    = C2K(12);  units.temp.tL_norL = 'K'; label.temp.tL_norL = 'temperature';
bibkey.tL_norL = 'Glover2009'; comment.tL_norL = 'grandparents from Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';

%% t-Ww
data.tWw_nor = [ ... % time since fertilization (d), wet weight (g) at 8Â°C
518	50.18
722	526.88
959	965.95
1070 2007.17
345	25.09
688	551.97
947	1655.91
1042 2835.13];
units.tWw_nor   = {'d', 'g'};  label.tWw_nor = {'time since fertilization', 'wet weight'};  
temp.tL_nor    = C2K(12);  units.temp.tL_nor = 'K'; label.temp.tL_nor = 'temperature';
bibkey.tWw_nor = 'Glover2009'; comment.tWw_nor = 'grandparents from Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';


%% L-Ww

data.LWw_nor = [ ... % time since fertilization (d), wet weight (g) at 8Â°C
15.6	50.18
34.47	526.88
44.82	965.95
53.9	2007.17
10.78	25.09
34.96	551.97
52.37	1655.91
60.1	2835.13];
units.LWw_nor   = {'d', 'g'};  label.LWw_nor = {'time since fertilization', 'wet weight'};  
temp.LWw_nor    = C2K(12);  units.temp.LWw_nor = 'K'; label.temp.LWw_nor = 'temperature';
bibkey.LWw_nor = 'Glover2009'; comment.LWw_nor = 'grandparents from Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';



