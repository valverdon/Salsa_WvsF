function [data, auxData, metaData, txtData, weights] = mydata_Salmo_salar_farm_Ch

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salmo_salar_farm'; 
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
metaData.data_0     = {'ab';'aj';'ap';'am';'Lb';'Lj';'Li';'Wwb';'Wwj';'Ri'}; 
metaData.data_1     = {'L-Ww';'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author_mod_1   = {'Valentin Verdon'};    
metaData.author_mod_2   = {'Charlotte Recapet'};    
metaData.date_subm = [2019 03 13];              
metaData.email_mod_2    = {'charlotte.recapet@univ-pau.fr'};            
metaData.address  = {'ECOBIOP, National Institute for Agronomic Research - University Pau Pays de l''ADour, France'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 04 17]; 

%% set data
% zero-variate data

%%%%%%%%%%%%%%%%%%%%
%% Age at hatching %
%%%%%%%%%%%%%%%%%%%%
% See univariate data.

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Age at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%
data.ab_norM = 182;    units.ab_norM = 'd';    label.ab_norM = 'age at first feeding';             bibkey.ab_norM = 'Glover2009';
  comment.ab_norM = 'Mowi strain, f=1';
  temp.ab_norM = C2K(5);  units.temp.ab_norM = 'K'; label.temp.ab_norM = 'temperature'; label.temp.comment.ab_norM = 'Two temp scenarios: 5°C from fertilization to hatching then 12°C, or 5°C from fertilization to first feeding then 12°C';

  data.ab_norM2 = data.ab_norM;     units.ab_norM2 = 'd';    label.ab_norM2 = 'age at first feeding';             bibkey.ab_norM2 = 'Glover2009';
  comment.ab_norM2 = 'Mowi strain, f=1';
  temp.ab_norM2 = C2K(12);  units.temp.ab_norM2 = 'K'; label.temp.ab_norM2 = 'temperature'; label.temp.comment.ab_norM2 = 'Two temp scenarios: 5°C from fertilization to hatching then 12°C, or 5°C from fertilization to first feeding then 12°C';
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Time between hatching and first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.tb_12_AqG = 700/12;    units.tb_12_AqG = 'd';    label.tb_12_AqG = 'time between hatching and first feeding';             bibkey.tb_12_AqG = 'Handeland2008';     
  comment.tb_12_AqG = 'AquaGen strain (Norway), calculated from age at birth since hatching in degree-days, f=1';
  temp.tb_12_AqG = C2K(12);  units.temp.tb_12_AqG = 'K'; label.temp.tb_12_AqG = 'temperature';

data.tb_norB = 280/13;    units.tb_norB = 'd';    label.tb_norB = 'time between hatching and first feeding';             bibkey.tb_norB = 'Hosfeld2009';     
  comment.tb_norB = 'Bolak strain, calculated from age at birth since hatching in degree-days, f=1';
  temp.tb_norB = C2K(13);  units.temp.tb_norB = 'K'; label.temp.tb_norB = 'temperature'; label.temp.comment.tb_norB = '12-14°C';

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Age at smoltification % in time since birth
%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.as_norM = 551;    units.as_norM = 'd';    label.as_norM = 'age at smoltification';             bibkey.as_norM = 'Glover2009';     comment.as_norM = 'Mowi strain (time since birth), age at moving to seawater';
%   temp.as_norM = C2K(12);  units.temp.as_norM = 'K'; label.temp.as_norM = 'temperature'; label.temp.comment.as_norM = '5°C as egg 12°C as fry, '; %f=1
% data.as_norNBP = 391;    units.as_norNBP = 'd';    label.as_norNBP = 'age at smoltification';             bibkey.as_norNBP = 'Hindar2006';     comment.as_norNBP = 'National breeding program (time since birth)';
%   temp.as_norNBP = C2K(10);  units.temp.as_norNBP = 'K'; label.temp.as_norNBP = 'temperature'; label.temp.comment.as_norNBP = 'T° : rough guess - highly variable temperature throughout life(1.07*365.25)'; %natural T°, natural f.
% data.as_norB = 470;    units.as_norB = 'd';    label.as_norB = 'time since hatching at smoltification';             bibkey.as_norB = 'Hosfeld2009';     comment.as_norNBP = 'Bolak strain (time since hatching; approximation, smoltification has been accelerated )';
%   temp.as_norB = C2K(13);  units.temp.as_norNBP = 'K'; label.temp.as_norNBP = 'temperature'; label.temp.comment.as_norNBP = 'T° : 12-14';%f=1
% 
% data.as_ire = 731;    units.as_ire = 'd';    label.as_ire = 'age at smoltification';             bibkey.as_ire = 'Hindar2006';     comment.as_ire = 'National breeding program (time since birth)1.07+1-1*365.25) n=1';
%   temp.as_ire = C2K(10);  units.temp.as_ire = 'K'; label.temp.as_ire = 'temperature'; label.temp.comment.as_ire = 'T° : rough guess - highly variable temperature throughout life(2+1.93)*365.25';%natural T°, natural f.
% data.as_norM2 = 1164;    units.as_norM2 = 'd';    label.as_norM2 = 'age at smoltification';             bibkey.as_norM2 = 'Skaala2012';     comment.as_norM2 = 'Mowi strain (time since birth)';
%   temp.as_norM2 = C2K(10);  units.temp.as_norM2 = 'K'; label.temp.as_norM2 = 'temperature'; label.temp.comment.as_norM2 = 'rough guess';%natural T°, natural f.
% 

%%%%%%%%%%%%%%%%%%%%
%% Age at puberty % (or age at first spawning minus 1 year) in time since birth
%%%%%%%%%%%%%%%%%%%%data.aj_norNBP = 391;    units.aj_norNBP = 'd';    label.aj_norNBP = 'age at smoltification';             bibkey.aj_norNBP = 'Hindar2006';     comment.aj_norNBP = 'National breeding program (time since birth)';
data.ap_norNBP = 391;    units.ap_norNBP = 'd';    label.ap_norNBP = 'age at puberty';             bibkey.ap_norNBP = 'Hindar2006';     comment.ap_norNBP = 'National breeding program (time since birth)1.07+1-1*365.25) n=1';
  temp.ap_norNBP = C2K(10);  units.temp.ap_norNBP = 'K'; label.temp.ap_norNBP = 'temperature'; label.temp.comment.ap_norNBP = 'T° : rough guess - highly variable temperature throughout life(1.07+1-1)*365.25';%natural T°, natural f.

 data.ap_norire = 1070;    units.ap_norire = 'd';    label.ap_norire = 'age at puberty';             bibkey.ap_norire = 'Hindar2006';     comment.ap_norire = 'National breeding program (time since birth)';
  temp.ap_norire = C2K(10);  units.temp.ap_norire = 'K'; label.temp.ap_norire = 'temperature'; label.temp.comment.ap_norire = 'T° : rough guess - highly variable temperature throughout life(2+1.93-1)*365.25';%natural T°, natural f.

 %% age at first spawning
% data.ap_norNBPb = 756;    units.ap_norNBPb = 'd';    label.ap_norNBPb = 'age at maturity';             bibkey.ap_norNBPb = 'Hindar2006';     comment.ap_norNBPb = 'National breeding program (time since birth)1.07+1-1*365.25) n=1';
%   temp.ap_norNBPb = C2K(10);  units.temp.ap_norNBPb = 'K'; label.temp.ap_norNBPb = 'temperature'; label.temp.comment.ap_norNBPb = 'T° : rough guess - highly variable temperature throughout life(1.07+1)*365.25';
% data.ap_ireb = 1435;    units.ap_ireb = 'd';    label.ap_ireb = 'age at maturity';             bibkey.ap_ireb = 'Hindar2006';     comment.ap_ireb = 'National breeding program (time since birth)1.07+1-1*365.25) n=1';
%   temp.ap_ireb = C2K(10);  units.temp.ap_ireb = 'K'; label.temp.ap_ireb = 'temperature'; label.temp.comment.ap_ireb = 'T° : rough guess - highly variable temperature throughout life(2+1.93)*365.25';

  
%%%%%%%%%%%%%
%% Lifespan %(maximum age at spawning)
%%%%%%%%%%%%%
data.am = 1461;    units.am = 'd';    label.am = 'age at maturity';             bibkey.am = 'Hindar2006';     comment.am = 'National breeding program (time since birth)';
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; label.temp.comment.am = 'T° : rough guess - highly variable temperature throughout life(2+2)*365.25';%natural T°, natural f.

%%%%%%%%%%%%%%%%%%%%%%%
%% Length at hatching %
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Length at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data.Lb_NorM2011  = 2.89;   units.Lb_NorM2011  = 'cm';  label.Lb_NorM2011  = 'total length at birth';   bibkey.Lb_NorM2011  = 'Solberg2014';  comment.Lb_NorM2011 = 'parents from Mowi strain (Norway)';%T° 3.0-6.9 mean 4.8 ; f?
data.Lb_NorM2012  = 2.81;   units.Lb_NorM2012  = 'cm';  label.Lb_NorM2012  = 'total length at birth';   bibkey.Lb_NorM2012  = 'Solberg2014';  comment.Lb_NorM2012 = 'parents from Mowi strain (Norway)';%T° 3.0-6.9 mean 4.8 ; f?
data.Lb_NorM2013  = 2.84;   units.Lb_NorM2013  = 'cm';  label.Lb_NorM2013  = 'total length at birth';   bibkey.Lb_NorM2013  = 'Solberg2014';  comment.Lb_NorM2013 = 'parents from Mowi strain (Norway)';%T° 3.0-6.9 mean 4.8 ; f?
data.Lb_NorS2013  = 2.83;   units.Lb_NorS2013  = 'cm';  label.Lb_NorS2013  = 'total length at birth';   bibkey.Lb_NorS2013  = 'Solberg2014';  comment.Lb_NorS2013 = 'parents from Salmobreed strain (Norway)';%T° 3.0-6.9 mean 4.8 ; f?

%% Length at precocious maturation % (males only)
% data.Lpp  = ;   units.Lpp  = 'cm';  label.Lpp  = 'total length at precocious puberty'; bibkey.Lpp  = ''; comment.Lpp = 'males only';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Length at smoltification %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.Ls_finS  = 17.2;   units.Ls_finS  = 'cm';  label.Ls_finS  = 'total length at metamorphosis'; bibkey.Ls_finS  = 'Jokikkoko2006'; comment.Ls_finS = 'Simojoki broodstock (Baltic Sea, Finland) - mean from 1986 to 1992';%T°? hatcheries ; f=1
% data.Ls_norN  = 16.4;   units.Ls_norN  = 'cm';  label.Ls_norN  = 'total length at metamorphosis'; bibkey.Ls_norN  = 'Jonsson1991'; comment.Ls_norN = 'Nina research station (Norway)';%T°? hatcheries ; f=1

%%%%%%%%%%%%%%%%%%%%%%%
%% Length at puberty % (or 1 year before first spawning)
%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Length at 1st spawning %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
data.Lp_norSf  = 55.4 ;   units.Lp_norSf  = 'cm';  label.Lp_norSf  = 'postorbital-hypural length at first spawning'; bibkey.Lp_norSf  = 'Fleming1996b';   comment.Lp_norSf = 'mean females at spawning, Sunndalsøra strain (Canada)';
data.Lp_norSm  = 57.5 ;   units.Lp_norSm  = 'cm';  label.Lp_norSm  = 'postorbital-hypural length at first spawning'; bibkey.Lp_norSm  = 'Fleming1996b';   comment.Lp_norSm = 'mean males at spawning, Sunndalsøra strain (Canada)';
% Data below are from wild fish
% data.Lp_norN  = 61.6 ;   units.Lp_norN  = 'cm';  label.Lp_norN  = 'length at first spawning'; bibkey.Lp_norN = 'Jonsson1991';   comment.Lp_norN = 'Nina research station (Norway), T = hatchery for fry and natural from smolt,  f=1'; 

%%%%%%%%%%%%%%%%%%%%%%%
%% Max length %
%%%%%%%%%%%%%%%%%%%%%%%
% Data below cannot be found in the cited reference.
% data.Li  = 111 ;   units.Li  = 'cm';  label.Li  = 'length at puberty'; bibkey.Li = 'Jonsson1991';   comment.Li = 'Multiple farmed strains, max of escaped individuals recaptured'; %natural T° and f

  %%%%%%%%%%%%%
%% Egg volume %
%%%%%%%%%%%%%%%
data.V0_norM2011 = 0.111;  units.V0_norM2011 = 'cm^3'; label.V0_norM2011 = 'egg volume'; bibkey.V0_norM2011 = 'Solberg2014';  comment.V0_norM2011 = 'Mowi strain (Norway),mean(4/3*pi*(diameter/2)^3)';%T=natural f=1
data.V0_norM2012 = 0.121;  units.V0_norM2012 = 'cm^3'; label.V0_norM2012 = 'egg volume'; bibkey.V0_norM2012 = 'Solberg2014';  comment.V0_norM2012 = 'Mowi strain (Norway),mean(4/3*pi*(diameter/2)^3)';%T=natural f=1

%%%%%%%%%%%%%%%
%% Egg weight %
%%%%%%%%%%%%%%%
% data.Ww0_norM = 0.144; units.Ww0_norM = 'g'; label.Ww0_norM = 'egg weight'; bibkey.Ww0_norM = 'Glover2009'; comment.Ww0_norM= 'Mowi strain, T=farming conditions, f=1';
% data.Ww0_norM2 = 0.144; units.Ww0_norM2 = 'g'; label.Ww0_norM2 = 'egg weight'; bibkey.Ww0_norM2 = 'Skaala2012'; comment.Ww0_norM2= 'Mowi strain, T=farming conditions, f=1';

%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at hatching %
%%%%%%%%%%%%%%%%%%%%%%%
% data.Wwh_norM = 0.144; units.Wwh_norM = 'g'; label.Wwh_norM = 'egg weight'; bibkey.Wwh_norM = 'Glover2009'; comment.Wwh_norM= 'Mowi strain';
%considering weight doesnt change between 0 and h


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at first feeding %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at smoltification %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data.Wws_nor = 22;   units.Wws_nor = 'g';   label.Wws_nor = 'wet weight at smoltification';   bibkey.Wws_nor = 'Skaala2012';   comment.Wws_nor = 'Mowi strain (Norway)';%T=natural f=natural



%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at maturity % (or 1 year before first spawning)
%%%%%%%%%%%%%%%%%%%%%%%

% need calculation
% data.Wwp_norf = 3696;   units.Wwp_norf = 'g';   label.Wwp_norf = 'wet weight at puberty';   bibkey.Wwp_norf = 'Fleming1996b';   comment.Wwp_nor_norf = 'Sunndalsøra strain (Norway), mean of females at spawning';
% data.Wwp_norm = 4008;   units.Wwp_norm = 'g';   label.Wwp_norm = 'wet weight at puberty';   bibkey.Wwp_norm = 'Fleming1996b';   comment.Wwp_nor_norm = 'Sunndalsøra strain (Norway), mean of males at spawning';

%%%%%%%%%%%%%%%%%%%%%%%
%% Weight at spawning %
%%%%%%%%%%%%%%%%%%%%%%%
data.Wwp_norf = 3696;   units.Wwp_norf = 'g';   label.Wwp_norf = 'wet weight at spawning';   bibkey.Wwp_norf = 'Fleming1996b';   comment.Wwp_norf = 'Sunndalsøra strain (Norway), mean of females at spawning';%T? f?
data.Wwp_norm = 4008;   units.Wwp_norm = 'g';   label.Wwp_norm = 'wet weight at spawning';   bibkey.Wwp_norm = 'Fleming1996b';   comment.Wwp_norm = 'Sunndalsøra strain (Norway), mean of females at spawning';%T? f?


%%%%%%%%%%%%%%
%%max weight %
%%%%%%%%%%%%%%

data.Wwi_norM = 14000;   units.Wwi_norM = 'g';   label.Wwi_norM = 'maximum wet weight';   bibkey.Wwi_norM = 'Skaala2012';   comment.Wwi_norM = 'Mowi strain (Norway), max of female spawners';%T=natural f=natural



%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reserve energy in egg % (egg = reserve only)
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%
%% Total energy %
%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Maximum reproductive rate %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% See univariate data

%% uni-variate data

%% T-ah data

data.Tah_Gunnes1979 = [ ... % temperature (°C), age at hatching (d)
8  504/8
10 492/10
12 453/12];
data.Tah_Gunnes1979(:,1)=C2K(data.Tah_Gunnes1979(:,1));
units.Tah_Gunnes1979   = {'K', 'd'};  label.Tah_Gunnes1979 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Gunnes1979 = 'Gunnes1979'; comment.Tah_Gunnes1979 = 'Norwegian strain (probably Sunndalsøra), f = 1';

data.Tah_Wallace1988 = [ ... % temperature (°C), age at hatching (d)
0.2  267
1.00 207];
data.Tah_Wallace1988(:,1)=C2K(data.Tah_Wallace1988(:,1));
units.Tah_Wallace1988   = {'K', 'd'};  label.Tah_Wallace1988 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Wallace1988 = 'Wallace1988'; comment.Tah_Wallace1988 = 'Sunndalsøra strain, f = 1';

data.Tah_Solberg2014 = [ ... % temperature (°C), age at hatching (d)
4.8  117 % Mowi, year 2011
6.0   92 % Mowi, year 2012
6.3   88 % Mowi, year 2013
6.0   91];  % Salmobreed, year 2012
data.Tah_Solberg2014(:,1)=C2K(data.Tah_Solberg2014(:,1));
units.Tah_Solberg2014   = {'K', 'd'};  label.Tah_Solberg2014 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Solberg2014 = 'Solberg2014'; comment.Tah_Solberg2014 = 'Mowi or Salmobreed strain (Norway), median time at hatching, f = 1';

data.Tah_Berg1999 = [ ... % temperature (°C), age at hatching (d)
7.4  76 
9.4  53];
data.Tah_Berg1999(:,1)=C2K(data.Tah_Berg1999(:,1));
units.Tah_Berg1999   = {'K', 'd'};  label.Tah_Berg1999 = {'temperature', 'age at hatching'}; 
bibkey.Tah_Berg1999 = 'Berg1999'; comment.Tah_Berg1999 = 'Norwegian Salmon breeders strain (Norway), median time at hatching, f = 1';

%% t-L data

data.tL_iceT11 = [ ... %time since fertilization (d) approximation, fork length (cm)
362	13.2
398	13.7
433	14.4
466	15.2
500	17.0
532	18.9
558	20.0
572	20.8
596	22.9
362	13.2
398	13.7
434	14.3
465	15.2
500	16.9
532	18.9
557	20.3
572	22.3
596	23.3];
units.tL_iceT11  = {'d', 'g'};  label.tL_iceT11 = {'time since fertilization', 'wet weight'};  
temp.tL_iceT11    = C2K(11);  units.temp.tL_iceT11 = 'K'; label.temp.tL_iceT11 = 'temperature';
bibkey.tL_iceT11 = 'Bjornsson1989'; comment.tL_iceT11 = 'Vididalsa strain, 1st half has 5 lux nightlight, start of experiment 1st december with 0+ parr';%T constant, f=1


data.tL_iceT611 = [ ... %time since fertilization (d) approximation, fork length (cm)
362	12.8
398	13.7
435	13.8
466	13.9
501	14.3
533	16.0
559	17.1
573	17.6
597	19.6
363	12.9
398	13.5
434	13.6
466	13.9
501	14.2
533	16.2
559	17.8
572	18.6
597	20.2];
units.tL_iceT611  = {'d', 'g'};  label.tL_iceT611 = {'time since fertilization', 'wet weight'};  
temp.tL_iceT611    = C2K(8.5);  units.temp.tL_iceT611 = 'K'; label.temp.tL_iceT611 = 'temperature';
bibkey.tL_iceT611 = 'Bjornsson1989'; comment.tL_iceT611 = 'Vididalsa strain, 1st half has 5 lux nightlight; T°=6°C from t=360 to t=510, then T°=11°C, start of experiment 1st december with 0+ parr';
%T°=6°C from t=360 to t=510 then T°=11°C ; f=1

data.tL_ice1mw = [ ... %time since fertilization (d) approximation, fork length (cm)
362	13.2
384	14.3
393	14.6
406	15.9
423	17.4];
units.tL_ice1mw  = {'d', 'g'};  label.tL_ice1mw = {'time since fertilization', 'wet weight'};  
temp.tL_ice1mw    = C2K(5);  units.temp.tL_ice1mw = 'K'; label.temp.tL_ice1mw = 'temperature';
bibkey.tL_ice1mw = 'Bjornsson1989'; comment.tL_ice1mw = 'Vididalsa, 1 month winter light; T°=guess, start of experiment 1st december with 0+ parr';
%f=1

data.tL_ice3mw = [ ... %time since fertilization (d) approximation, fork length (cm)
362	13.2
383	14.1
401	14.8
422	16.9
440	18.8];
units.tL_ice3mw  = {'d', 'g'};  label.tL_ice3mw = {'time since fertilization', 'wet weight'};  
temp.tL_ice3mw    = C2K(6);  units.temp.tL_ice3mw = 'K'; label.temp.tL_ice3mw = 'temperature';
bibkey.tL_ice3mw = 'Bjornsson1989'; comment.tL_ice3mw = 'Vididalsa, 3 month winter light; T°=guess, start of experiment 1st december with 0+ parr';
%f=1


data.tL_ice5mw = [ ... %time since fertilization (d) approximation, fork length (cm)
362	13.1
384	13.9
401	14.4
422	15.5
440	16.4
453	17.1
462	17.5
477	19.0
485	19.7];
units.tL_ice5mw  = {'d', 'g'};  label.tL_ice5mw = {'time since fertilization', 'wet weight'};  
temp.tL_ice5mw    = C2K(7);  units.temp.tL_ice5mw = 'K'; label.temp.tL_ice5mw = 'temperature';
bibkey.tL_ice5mw = 'Bjornsson1989'; comment.tL_ice5mw = 'Vididalsa, 5 month winter light; T°=guess (range=3-10.5°C), start of experiment 1st december with 0+ parr';
%f=1


data.tL_norM = [ ... %time since fertilization (d) approximation, fork length (cm)
 518	 17.87
 722	 37.73
 959	 59.01
1070     68.65
 345	 13.96
 688	 41.17
 947	 68.39
1042     76.96];
units.tL_norM  = {'d', 'g'};  label.tL_norM = {'time since fertilization', 'wet weight'};  
temp.tL_norM    = C2K(12);  units.temp.tL_norM = 'K'; label.temp.tL__norM = 'temperature';
bibkey.tL_norM = 'Glover2009'; comment.tL_norM = 'Mowi strain, 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater, classical rearing (fresh then seawater)';
%f=1

%% t-W data in eggs

data.tWwVe_T12 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 12°C
38 0.0128
42 0.0301
46 0.0405
50 0.0465
54 0.0533
59 0.0624
63 0.0674];
units.tWwVe_T12   = {'d', 'g'};  label.tWwVe_T12 = {'time since fertilization', 'wet weight excluding yolk'};  
temp.tWwVe_T12    = C2K(12);  units.temp.tWwVe_T12 = 'K'; label.temp.tWwVe_T12 = 'temperature';
bibkey.tWwVe_T12 = 'Gunnes1979'; comment.tWwVe_T12 = 'Norwegian strain (wild or domestic?)';

data.tWwVe_T10 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 10°C
38 0.0138
42 0.0311
46 0.0366
50 0.0465
54 0.0594
59 0.0698
63 0.0687];
units.tWwVe_T10   = {'d', 'g'};  label.tWwVe_T10 = {'time since fertilization', 'wet weight excluding yolk'};  
temp.tWwVe_T10    = C2K(10);  units.temp.tWwVe_T10 = 'K'; label.temp.tWwVe_T10 = 'temperature';
bibkey.tWwVe_T10 = 'Gunnes1979'; comment.tWwVe_T10 = 'Norwegian strain (wild or domestic?)';

data.tWwVe_T8 = [ ... % time since fertilization (d), wet weight excluding yolk (g) at 8°C
38 0.0128
42 0.0270
46 0.0331
50 0.0432
54 0.0457
59 0.0634
63 0.0623];
units.tWwVe_T8   = {'d', 'g'};  label.tWwVe_T8 = {'time since fertilization', 'wet weight excluding yolk'};  
temp.tWwVe_T8    = C2K(8);  units.temp.tWwVe_T8 = 'K'; label.temp.tWwVe_T8 = 'temperature';
bibkey.tWwVe_T8 = 'Gunnes1979'; comment.tWwVe_T8 = 'Norwegian strain (wild or domestic?)';

data.tWwYe_T12 = [ ... % time since fertilization (d), yolk wet weight (g) at 12°C
38 0.0809
42 0.0735
46 0.0784
50 0.0519
54 0.0484
59 0.0479
63 0.0495];
units.tWwYe_T12   = {'d', 'g'};  label.tWwYe_T12 = {'time since fertilization', 'yolk wet weight'};  
temp.tWwYe_T12    = C2K(12);  units.temp.tWwYe_T12 = 'K'; label.temp.tWwYe_T12 = 'temperature';
bibkey.tWwYe_T12 = 'Gunnes1979'; comment.tWwYe_T12 = 'Norwegian strain (wild or domestic?)';

data.tWwYe_T10 = [ ... % time since fertilization (d), yolk wet weight (g) at 10°C
38 0.0786
42 0.0767
46 0.0660
50 0.0721
54 0.0558
59 0.0458
63 0.0521];
units.tWwYe_T10   = {'d', 'g'};  label.tWwYe_T10 = {'time since fertilization', 'yolk wet weight'};  
temp.tWwYe_T10    = C2K(10);  units.temp.tWwYe_T10 = 'K'; label.temp.tWwYe_T10 = 'temperature';
bibkey.tWwYe_T10 = 'Gunnes1979'; comment.tWwYe_T10 = 'Norwegian strain (wild or domestic?)';

data.tWwYe_T8 = [ ... % time since fertilization (d), yolk wet weight (g) at 8°C
38 0.0786
42 0.0765
46 0.0723
50 0.0647
54 0.0619
59 0.0449
63 0.0451];
units.tWwYe_T8   = {'d', 'g'};  label.tWwYe_T8 = {'time since fertilization', 'yolk wet weight'};  
temp.tWwYe_T8    = C2K(8);  units.temp.tWwYe_T8 = 'K'; label.temp.tWwYe_T8 = 'temperature';
bibkey.tWwYe_T8 = 'Gunnes1979'; comment.tWwYe_T8 = 'Norwegian strain (wild or domestic?)';

%% t-W data in juveniles
% data.tWw_norM = [ ... % time since fertilization (d)
% 518	75.27
% 722	978.49
% 959	2358.42
% 1070	4591.4
% 345	37.63
% 688	978.49
% 947	4252.69
% 1042	6259.86];
% units.tWw_norM   = {'d', 'g'};  label.tWw_norM = {'time since fertilization', 'wet weight'};  
% bibkey.tWw_norM = 'Glover2009'; comment.tWw_norM = 'Mowi strain, 2 different experience data';%f=1 T=5°C for incubation, then 12°C


% data.tWw_norB = [ ... % time since fertilization (d)
% 365	71.94
% 410	86.72
% 425	89.51
% 439	92.3
% 466	105.88
% 496	122.65
% 534	172.56
% 580	243.63];
% units.tWw_norB   = {'d', 'g'};  label.tWw_norB = {'time since birth', 'wet weight'};  
% bibkey.tWw_norB = 'Hosfeld2009'; comment.tWw_norB = 'Bolak strain, 2 different experience data';%f=1 T= 12-14

% data.tWw_OF = [ ... % time since fertilization (d)
% 571	451.9
% 605	470.4
% 634	563.0
% 662	701.9
% 690	695.4
% 716	803.7];
% units.tWw_OF   = {'d', 'g'};  label.tWw_OF = {'time since birth', 'wet weight'};  
% bibkey.tWw_OF = 'Thorpe1990'; comment.tWw_OF = 'Otter ferry strain, 2 different experience data';%f different for each point, T=ambient (measured)

%% t-W data in seawater

% data.tWw_T4_Mow = [ ...  % time since transfer in seawater (d), wet weight (g) at 4 Celsius degrees
% -26 51.9
% 22 62.1
% 63 76.7
% 90 83.3];
% data.tWw_T4_Mow(:,1) = data.tWw_T4_Mow(:,1) + 296 % hatching in December
% 2002 and transfer on 7 October 2003
% units.tWw_T4_Mow   = {'d', 'g'};  label.tWw_T4_Mow = {'time since hatching', 'wet weight'};  
% temp.tWw_T4_Mow    = C2K(4);  units.temp.tWw_T4_Mow = 'K'; label.temp.tWw_T4 = 'temperature';
% bibkey.tWw_T4_Mow = 'Handeland1998'; comment.tWw_T4_Mow = 'Mowi strain, mean of S=28 and S= 34, f=1';

% data.tWw_T8_Mow = [ ...  % time since transfer in seawater (d), wet weight (g) at 8Â°C
% -26 54.6
% 22 68.3
% 63 110.5
% 90 135.2];
% units.tWw_T8_Mow   = {'d', 'g'};  label.tWw_T8_Mow = {'time since fertilization', 'wet weight'};  
% temp.tWw_T8_Mow   = C2K(8);  units.temp.tWw_T8_Mow = 'K'; label.temp.tWw_T8_Mow = 'temperature';
% bibkey.tWw_T8_Mow = 'Handeland1998'; comment.tWw_T8_Mow = 'Mowi strain, mean of S=28 and S=34, f=1';
% 
% data.tWw_T6_AqG = [ ... % time since transfer to seawater (d), wet weight (g) at 6Â°C
% 0	75.2
% 14	76.8
% 28	89.1
% 42	104.9
% 56	126.4
% 70	142.9
% 84	153.8];
% units.tWw_T6_AqG   = {'d', 'g'};  label.tWw_T6_AqG = {'time since metamorphosis', 'wet weight'};  
% temp.tWw_T6_AqG   = C2K(6);  units.temp.tWw_T6_AqG = 'K'; label.temp.tWw_T6 = 'temperature';
% bibkey.tWw_T6_AqG = 'Handeland2008'; comment.tWw_T6_AqG = 'AquaGen domestic strain';%f=1
% 
% data.tWw_T10_AqG = [ ... % time since tranfer to seawater (d), wet weight (g) at 10Â°C
% 0	74.5
% 14	84.6
% 28	108.9
% 42	144.2
% 56	189.4
% 70	236.3
% 84	264.9];
% units.tWw_T10_AqG   = {'d', 'g'};  label.tWw_T10_AqG = {'time since metamorphosis', 'wet weight'};  
% temp.tWw_T10_AqG   = C2K(10);  units.temp.tWw_T10_AqG = 'K'; label.temp.tWw_T10_AqG = 'temperature';
% bibkey.tWw_T10_AqG = 'Handeland2008'; comment.tWw_T10_AqG = 'AquaGen domestic strain';%f=1
%   
% data.tWw_T14_AqG = [ ... % time since tranfer to seawater (d), wet weight (g) at 14Â°C
% 0	74.5
% 14	85.3
% 28	115.3
% 42	158.0
% 56	214.9
% 70	266.1
% 84	298.2];
% units.tWw_T14_AqG   = {'d', 'g'};  label.tWw_T14_AqG = {'time since metamorphosis', 'wet weight'};  
% temp.tWw_T14_AqG   = C2K(14);  units.temp.tWw_T14_AqG = 'K'; label.temp.tWw_T14_AqG = 'temperature';
% bibkey.tWw_T14_AqG = 'Handeland2008'; comment.tWw_T14v = 'AquaGen domestic strain';%f=1
% 
% data.tWw_T18_AqG = [ ... % time since tranfer to seawater (d), wet weight (g) at 18Â°C
% 0	76.6
% 14	87.4
% 28	116.0
% 42	151.6
% 56	196.5
% 70	227.8
% 84	252.9];
% units.tWw_T18_AqG   = {'d', 'g'};  label.tWw_T18_AqG = {'time since metamorphosis', 'wet weight'};  
% temp.tWw_T18_AqG   = C2K(18);  units.temp.tWw_T18_AqG = 'K'; label.temp.tWw_T18_AqG = 'temperature';
% bibkey.tWw_T18_AqG = 'Handeland2008'; comment.tWw_T18_AqG = 'AquaGen domestic strain';%f=1
% 
% data.tWw_starv = [ ... % time (d), wet weight (g) during starvation
% 480  81.9
% 494  77.5
% 508  75
% 522  72.9];
% units.tWw_starv   = {'d', 'g'};  label.tWw_starv = {'time since first feeding', 'wet weight'};  
% temp.tWw_starv    = C2K(10);  units.temp.tWw_starv = 'K'; label.temp.tWw_starv = 'temperature';
% bibkey.tWw_starv = 'ElMowafi1997'; comment.tWw_starv = 'probably a domestic strain';%f=1 before, f=0 during experiment.
% 
% data.tWw_norS = [ ... % time (d), wet weight (g)
% 7	0.16
% 35	0.27
% 62	0.48
% 91	0.81
% 119	1.78
% 147	5.28
% 175	15.57
% 203	28.34];
% units.tWw_norS   = {'d', 'g'};  label.tWw_norS = {'time since first feeding', 'wet weight'};  
% bibkey.tWw_norS = 'Storebakken1987'; comment.tWw_norS = 'Sunndalsora strain, ad lib';%t=ambient (measured) f=1
% 
% data.tWw_norS75 = [ ... % time (d), wet weight (g) during starvation
% 7	0.16
% 35	0.27
% 62	0.38
% 91	0.65
% 119	1.29
% 147	3.72
% 175	9.86
% 203	19.12];
% units.tWw_norS75   = {'d', 'g'};  label.tWw_norS75 = {'time since first feeding', 'wet weight'};  
% bibkey.tWw_norS75 = 'Storebakken1987'; comment.tWw_norS75 = 'Sunndalsora strain, starving 75%';%t=ambient (measured) f=0.75
% 
% data.tWw_norS50 = [ ... % time (d), wet weight (g) during starvation
% 7	0.16
% 35	0.16
% 62	0.27
% 91	0.43
% 119	0.7
% 147	2.1
% 175	5.06
% 203	9.91];
% units.tWw_norS50   = {'d', 'g'};  label.tWw_norS50 = {'time since first feeding', 'wet weight'};  
% bibkey.tWw_norS50 = 'Storebakken1987'; comment.tWw_norS50 = 'Sunndalsora strain, starving 50%';%t=ambient (measured) f=0.5


%% t-JX
% data.tJX_6_AqG = [ ... % time since tranfer to seawater (d) , food ingestion (g/gfish), at 6°C
% 0	0.08
% 7	0.2
% 14	0.13
% 21	0.64
% 28	0.81
% 42	1.21
% 56	1.16
% 70	1.07
% 84	1.09];
% units.tJX_6_AqG = {'d', 'g/gfish'};  label.tJX_6_AqG = {'time since tranfer to seawater', 'ingestion rate'};  
% temp.tJX_6_AqG    = C2K(6);  units.temp.tJX_6_AqG = 'K'; label.temp.tJX_6_AqG = 'temperature';
% bibkey.tJX_6_AqG = 'Handeland2008'; comment.tJX_6_AqG = 'AquaGen strain, Energy content of commercial feed unknown';%f=1
% 
% data.tJX_10_AqG = [ ... % time since tranfer to seawater (d) , food ingestion (g/gfish), at 6°C
% 0	0.02
% 7	0.46
% 14	0.55
% 21	1.38
% 28	0.79
% 42	2.18
% 56	1.69
% 70	1.46
% 84	1.8];
% units.tJX_10_AqG = {'d', 'g/gfish'};  label.tJX_10_AqG = {'time since tranfer to seawater', 'ingestion rate'};  
% temp.tJX_10_AqG    = C2K(10);  units.temp.tJX_10_AqG = 'K'; label.temp.tJX_10_AqG = 'temperature';
% bibkey.tJX_10_AqG = 'Handeland2008'; comment.tJX_10_AqG = 'AquaGen strain, Energy content of commercial feed unknown';%f=1
% 
% data.tJX_14_AqG = [ ... % time since tranfer to seawater (d) , food ingestion (g/gfish), at 6°C
% 0	0.24
% 7	0.91
% 14	1.18
% 21	2
% 28	1.66
% 42	2.64
% 56	2.38
% 70	2.54
% 84	2.23];
% units.tJX_14_AqG = {'d', 'g/gfish'};  label.tJX_14_AqG = {'time since tranfer to seawater', 'ingestion rate'};  
% temp.tJX_14_AqG    = C2K(14);  units.temp.tJX_14_AqG = 'K'; label.temp.tJX_14_AqG = 'temperature';
% bibkey.tJX_14_AqG = 'Handeland2008'; comment.tJX_14_AqG = 'AquaGen strain, Energy content of commercial feed unknown';%f=1
% 
% data.tJX_18_AqG = [ ... % time since tranfer to seawater (d) , food ingestion (g/gfish), at 6°C
% 0	0.26
% 7	0.82
% 14	1.6
% 21	2.11
% 28	1.71
% 42	1.37
% 56	1.45
% 70	0.92
% 84	1.22];
% units.tJX_18_AqG = {'d', 'g/gfish'};  label.tJX_18_AqG = {'time since tranfer to seawater', 'ingestion rate'};  
% temp.tJX_18_AqG    = C2K(18);  units.temp.tJX_18_AqG = 'K'; label.temp.tJX_18_AqG = 'temperature';
% bibkey.tJX_18_AqG = 'Handeland2008'; comment.tJX_18_AqG = 'AquaGen strain, Energy content of commercial feed unknown';%f=1



%% L-W data

data.LWw_AqG = [ ... % fork length (cm), wet weight (g) (smolts)
18.32 77
19.25 87.8
20.37 93.8];
units.LWw_AqG = {'cm', 'g'};     label.LWw_AqG = {'fork length', 'wet weight'}; 
bibkey.LWw_AqG = 'Handeland2008'; comment.LWw_AqG = 'AquaGen strain, during smoltification, f=1';

data.LWw_norM = [ ... % fork length (cm), wet weight (g)
17.87	75.27
37.73	978.49
59.01	2358.42
68.65	4591.4
13.96	37.63
41.17	978.49
68.39	4252.69
76.96	6259.86];
units.LWw_norM   = {'cm', 'g'};  label.LWw_norM = {'fork length', 'wet weight'};  
temp.LWw_norM    = C2K(12);  units.temp.LWw_norM = 'K'; label.temp.LWw_norM = 'temperature';
bibkey.LWw_norM = 'Glover2009'; comment.LWw_norM = 'Mowi strain + Laerdal river (Norway), 2 experiments started in 2003 and 2004, T 12°C for freshwater, natural (mean=11.5) for seawater, f=1';

%%%%%%%%%%%%
%%L-R data %
%%%%%%%%%%%%


%%%%%%%%%%%%%
%%Ww-R data %
%%%%%%%%%%%%%
WwR = [ ... % wet weight (g), number of live embryos (#)
2590	343
3177	482
3087	282
3078	157
3465	222
3813	337
4091	135
4757	332
3535	497
3803	947
4111	1063
4201	954];
% units.WwR   = {'g', '-'};  label.WwR = {'wet weight', 'number of live embryos'};  
% temp.WwR    = C2K(6);  units.temp.WwR = 'K'; label.temp.WwR = 'temperature';
% bibkey.WwR= 'Fleming1996b'; comment.LWw_norM = 'Sunndalsora strain ; T= rough guess';

data.Ri=max(WwR(:,2))/365.25; units.Ri = '-/d';    label.Ri = 'maximum number of live embryos';             bibkey.Ri = 'Fleming1996b';
  comment.Ri = 'Sunndalsora strain';
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; label.temp.comment.Ri = 'T = rough guess';
  

%% set weights for all real data
weights = setweights(data, []);
weights.ab_norM = weights.ab_norM/6;
weights.ab_norM2 = weights.ab_norM2/6;
weights.tb_12_AqG = weights.tb_12_AqG/3;
weights.tb_norB = weights.tb_norB/3;
weights.ap_norNBP=weights.ap_norNBP/2;
weights.ap_norire=weights.ap_norire/2;
weights.Lb_NorM2011 = weights.Lb_NorM2011/4;
weights.Lb_NorM2012 = weights.Lb_NorM2012/4;
weights.Lb_NorM2013 = weights.Lb_NorM2013/4;
weights.Lb_NorS2013 = weights.Lb_NorS2013/4;
% weights.Ls_finS = weights.Ls_finS/2;
% weights.Ls_norN = weights.Ls_norN/2;
weights.Lp_norSf = weights.Lp_norSf/2;
weights.Lp_norSm = weights.Lp_norSm/2;
% weights.Lp_norN = weights.Lp_norN/3;
weights.V0_norM2011 = weights.V0_norM2011/2;
weights.V0_norM2012 = weights.V0_norM2012/2;
% weights.Ww0_norM = weights.Ww0_norM/2;
% weights.Ww0_norM2 = weights.Ww0_norM2/2;
weights.Wwp_norf = weights.Wwp_norf/2;
weights.Wwp_norm = weights.Wwp_norm/2;
weights.Tah_Gunnes1979 = weights.Tah_Gunnes1979/3;
weights.Tah_Wallace1988 = weights.Tah_Wallace1988/2;
weights.Tah_Solberg2014 = weights.Tah_Solberg2014/4;
weights.Tah_Berg1999 = weights.Tah_Berg1999/2;
weights.tL_iceT11 = weights.tL_iceT11/6;
weights.tL_iceT611 = weights.tL_iceT611/6;
weights.tL_ice1mw = weights.tL_ice1mw/6;
weights.tL_ice3mw = weights.tL_ice3mw/6;
weights.tL_ice5mw = weights.tL_ice5mw/6;
weights.tL_norM = weights.tL_norM/6;
weights.tWwVe_T12 = weights.tWwVe_T12/3;
weights.tWwVe_T10 = weights.tWwVe_T10/3;
weights.tWwVe_T8 = weights.tWwVe_T8/3;
weights.tWwYe_T12 = weights.tWwYe_T12/3;
weights.tWwYe_T10 = weights.tWwYe_T10/3;
weights.tWwYe_T8 = weights.tWwYe_T8/3;
% weights.tWw_norM = weights.tWw_norM/16;
% weights.tWw_norB = weights.tWw_norB/16;
% weights.tWw_OF = weights.tWw_OF/16;
% weights.tWw_T4_Mow = weights.tWw_T4_Mow/16;
% weights.tWw_T8_Mow = weights.tWw_T8_Mow/16;
% weights.tWw_T6_AqG = weights.tWw_T6_AqG/16;
% weights.tWw_T10_AqG = weights.tWw_T10_AqG/16;
% weights.tWw_T14_AqG = weights.tWw_T14_AqG/16;
% weights.tWw_T18_AqG = weights.tWw_T18_AqG/16;
% weights.tWw_starv = weights.tWw_starv/16;
% weights.tWw_norS = weights.tWw_norS/16;
% weights.tWw_norS75 = weights.tWw_norS75/16;
% weights.tWw_norS50 = weights.tWw_norS50/16;
weights.LWw_AqG = weights.LWw_AqG/2;
weights.LWw_norM = weights.LWw_norM/2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Tah_Gunnes1979','Tah_Wallace1988','Tah_Solberg2014','Tah_Berg1999'}; comment1 = {'Age at hatching for different studies'};
set2 = {'tWwVe_T12','tWwVe_T10','tWwVe_T8'}; comment2 = {'Gunnes1979'};
set3 = {'tWwYe_T12','tWwYe_T10','tWwYe_T8'}; comment3 = {'Gunnes1979'};
set4 = {'tL_iceT11','tL_iceT611','tL_ice1mw','tL_ice3mw','tL_ice5mw'}; comment4 = {'Parr growth at different temperatures and photoperiods - Bjornsson 1989'};

metaData.grp.sets = {set1, set2, set3, set4};
metaData.grp.comment = {comment1, comment2, comment3, comment4};

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
bibkey = 'Fleming1996b'; type = 'Article'; bib = [ ... 
'author = {Fleming, Ian A. and Jonsson, B. and Gross M.R. and Lamberg A.}, ' ... 
'year = {1996}, ' ...
'title = {An experimental study of the reproductive behaviour and success of farmed and wild {A}tlantic Salmon \emph{Salmo salar} {L}}, ' ...
'journal = {The Journal of Applied Ecology}, ' ...
'volume = {33}, ' ...
'pages = {893-905}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Handeland1998'; type = 'Article'; bib = [ ... 
'author = {Handeland, S. O. and Berge, A. and BjÃ¶rnsson, B. T. and Stefansson, S. O.}, ' ... 
'year = {1998}, ' ...
'title = {Effects of temperature and salinity on osmoregulation and growth of {A}tlantic salmon (\emph{Salmo salar} {L}.) smolts in seawater}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {168}, ' ...
'number = {1-4}, ' ...
'doi = {10.1016/S0044-8486(98)00356-1}, ' ...
'pages = {289-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Handeland2008'; type = 'Article'; bib = [ ... 
'author = {Handeland, S. O. and Imsland, A. K. and Stefansson, S. O.}, ' ... 
'year = {2008}, ' ...
'title = {The effect of temperature and fish size on growth, feed intake, food conversion efficiency and stomach evacuation rate of {A}tlantic salmon post-smolts}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {283}, ' ...
'number = {1-4}, ' ...
'doi = {10.1016/j.aquaculture.2008.06.042}, ' ...
'pages = {36-42, Figure 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% Also has data on food intake (in g commercial feed by g of fish) as a function of time since smolting and temperature. Energy content of commercial feed unknown.
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
bibkey = 'ElMowafi1997'; type = 'Article'; bib = [ ... 
'author = {ElMowafi, A. F. A. and Maage, A. and Lorentzen, M. and Hassanein, E. I. and Julshamn, K.}, ' ... 
'year = {1997}, ' ...
'title = {Tissue indicators of element status in {A}tlantic salmon (\emph{Salmo salar}) post-smolts: effect of fasting}, ' ...
'journal = {Aquaculture Nutrition}, ' ...
'volume = {3}, ' ...
'doi = {10.1046/j.1365-2095.1997.00073.x}, ' ...
'pages = {73-80, Table 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gunnes1979'; type = 'Article'; bib = [ ... 
'author = {Gunnes, Knut}, ' ... 
'year = {1979}, ' ...
'title = {Survival and development of {A}tlantic salmon eggs and fry at three different temperatures}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {16}, ' ...
'doi = {10.1016/0044-8486(79)90109-1}, ' ...
'pages = {211-218, Table I and Figure 5a}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bjornsson1989'; type = 'Article'; bib = [ ...
'author = "Björn Th. Björnsson and Helgi Thorarensen and Tetsuya Hirano and Tsuyoshi Ogasawara and Júlíus B. Kristinsson",' ...
'title = "Photoperiod and temperature affect plasma growth hormone levels, growth, condition factor and hypoosmoregulatory ability of juvenile Atlantic salmon (Salmo salar) during parr-smolt transformation",' ...
'journal = "Aquaculture",' ...
'volume = "82",' ...
'number = "1",' ...
'pages = "77 - 91",' ...
'year = "1989",' ...
'doi = "https://doi.org/10.1016/0044-8486(89)90397-9",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Berg1999'; type = 'Article'; bib = [ ...
'author = "Kevin A. Glover and Håkon Otterå and Rolf E. Olsen and Erik Slinde and Geir L. Taranger and Øystein Skaala",' ...
'title = "A comparison of farmed, wild and hybrid Atlantic salmon (Salmo salar L.) reared under farming conditions",' ...
'journal = "Aquaculture",' ...
'volume = "286",' ...
'number = "3",' ...
'pages = "203 - 210",' ...
'year = "2009",' ...
'issn = "0044-8486",' ...
'doi = "https://doi.org/10.1016/j.aquaculture.2008.09.023",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Glover2009'; type = 'Article'; bib = [ ...
'title = "A comparison of farmed, wild and hybrid Atlantic salmon (Salmo salar L.) reared under farming conditions",' ...
'journal = "Aquaculture",' ...
'volume = "286",' ...
'number = "3",' ...
'pages = "203 - 210",' ...
'year = "2009",' ...
'doi = "https://doi.org/10.1016/j.aquaculture.2008.09.023",' ...
'author = "Kevin A. Glover and Håkon Otterå and Rolf E. Olsen and Erik Slinde and Geir L. Taranger and Øystein Skaala",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hindar2006'; type = 'Article'; bib = [ ...
'author = {Hindar, Kjetil and Fleming, Ian A and McGinnity, Philip and Diserud, Ola},' ...
'doi = {10.1016/j.icesjms.2006.04.025},' ...
'journal = {ICES Journal of Marine Science},' ...
'number = {7},' ...
'pages = {1234--1247},' ...
'title = {{Genetic and ecological effects of salmon farming on wild salmon: modelling from experimental results}},' ...
'volume = {63},' ...
'year = {2006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hosfeld2009'; type = 'Article'; bib = [ ...
'title = "Effects of fish density on growth and smoltification in intensive production of Atlantic salmon (Salmo salar L.)",' ...
'journal = "Aquaculture",' ...
'number = "3",' ...
'pages = "236 - 241",' ...
'year = "2009",' ...
'doi = "https://doi.org/10.1016/j.aquaculture.2009.06.003",' ...
'author = "Camilla Diesen Hosfeld and Jannicke Hammer and Sigurd O. Handeland and Sveinung Fivelstad and Sigurd O. Stefansson",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Jokikokko2006'; type='Article'; bib=[...
'author = {Jokikokko, E. and Kallio-Nyberg, I. and Saloniemi, I. and Jutila, E.},' ...
'title = {The survival of semi-wild, wild and hatchery-reared Atlantic salmon smolts of the Simojoki River in the Baltic Sea},' ...
'journal = {Journal of Fish Biology},' ...
'volume = {68},' ...
'pages = {430-442},' ...
'doi = {10.1111/j.0022-1112.2006.00892.x},' ...
'year = {2006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey='Jonsson1991'; type='Article'; bib=[...
'title = "Differences in life history and migratory behaviour between wild and hatchery-reared Atlantic salmon in nature",' ...
'journal = "Aquaculture",' ...
'volume = "98",' ...
'number = "1",' ...
'pages = "69 - 78",' ...
'year = "1991",' ...
'doi = "https://doi.org/10.1016/0044-8486(91)90372-E",' ...
'author = "Bror Jonsson and Nina Jonsson and Lars P. Hansen",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey= 'Skaala2012'; type='Article'; bib=[...
'author = {Skaala, Øystein and Glover, Kevin A. and Barlaup, Bjørn T. and Svåsand, Terje and Besnier, Francois and Hansen, Michael M. and Borgstrøm, Reidar},' ...
'title = {Performance of farmed, hybrid, and wild Atlantic salmon (Salmo salar) families in a natural river environment},' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences},' ...
'volume = {69},' ...
'pages = {1994-2006},' ...
'year = {2012},' ...
'doi = {10.1139/f2012-118},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey= 'Storebakken1987'; type='Article'; bib=[...
'title = "Ration level for salmonids: I. Growth, survival, body composition, and feed conversion in Atlantic salmon fry and fingerlings",'...                      
'journal = "Aquaculture",'...
'volume = "60",'...
'pages = "189 - 206",'...
'year = "1987",'...
'doi = "https://doi.org/10.1016/0044-8486(87)90287-0",'...
'author = "Trond Storebakken and Erland Austreng",'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey= 'Thorpe1990'; type='Article'; bib=[...
'title = "Control of maturation in cultured Atlantic salmon, Salmo salar, in pumped seawater tanks, by restricting food intake",' ...
'journal = "Aquaculture",' ...
'volume = "86",' ...
'number = "2",' ...
'pages = "315 - 326",' ...
'year = "1990",' ...
'doi = "https://doi.org/10.1016/0044-8486(90)90122-4",' ...
'author = "J.E. Thorpe and C. Talbot and M.S. Miles and D.S. Keay"'];
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/236}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

