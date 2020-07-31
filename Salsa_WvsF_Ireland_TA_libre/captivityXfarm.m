
function [data, auxData, metaData, txtData, weights] = captivityXfarm

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

%% age at 1st feeding
data.ah_norL = 183;    units.ah_norL = 'd';    label.ah_norL = 'age at hatching';             bibkey.ah_norL = 'Glover2009';     comment.ah_norL = 'grandparents from river Laerdal (protection plan) and Mowi strain, mean of offsprings time at 50% hatching in 2013';
  temp.ah_norL = C2K(6);  units.temp.ah_norL = 'K'; label.temp.ah_norL = 'temperature'; label.temp.comment.ah_norL = 'temp=5 as egg, 12 as fry, approx at t=165, not precise';

  %% age at smoltification
  data.aj_norL = 551;    units.aj_norL = 'd';    label.aj_norL = 'age at hatching';             bibkey.aj_norL = 'Glover2009';     comment.aj_norL = 'grandparents from river Laerdal (protection plan) and Mowi strain, mean of offsprings time at 50% hatching in 2013';
  temp.aj_norL = C2K(12);  units.temp.aj_norL = 'K'; label.temp.aj_norL = 'temperature'; label.temp.comment.aj_norL = 'temp=5 as egg, 12 as fry, approx at t=165, not precise';
  data.aj_norL2 = 1142;    units.aj_norL2 = 'd';    label.aj_norL2 = 'age at hatching';             bibkey.aj_norL2 = 'Skaala2012';     comment.aj_norL2 = 'parents from river Laerdal (protection plan) and Mowi strain, mean of offsprings time at 50% hatching in 2013';
  temp.aj_norL2 = C2K(10);  units.temp.aj_norL2 = 'K'; label.temp.aj_norL2 = 'temperature'; label.temp.comment.aj_norL2 = '';

  

  
  %% Egg Weight
  data.Ww0_norM = 0.146; units.Ww0_norM = 'g'; label.Ww0_norM = 'egg weight'; bibkey.Ww0_norM = 'Glover2009'; comment.Ww0_norM= 'Mowi strain + grandparent s from Laerdal river (Norway)';
  data.Ww0_norM = 0.146; units.Ww0_norM = 'g'; label.Ww0_norM = 'egg weight'; bibkey.Ww0_norM = 'Skaala2012'; comment.Ww0_norM= 'Mowi strain + parents from Laerdal river (Norway)';

    %% Weigth at smoltification
  data.aj_nor = 22.9;    units.aj_norL = 'g';    label.aj_norL = 'length at smoltification';             bibkey.aj_norL = 'Skaala2012';     comment.aj_norL = 'parents from river Laerdal (protection plan) and Mowi strain, mean of offsprings time at 50% hatching in 2013';
 
  % uni-variate data
  
  %% t-L
 data.tL_norM = [ ... %time since fertilization (d) approximation, fork length (cm)
518	16.17
722	37.73
959	51.91
1070	61.42
345	12.57
688	38
947	60.1
1042	70.6];
units.tL_norM  = {'d', 'g'};  label.tL_norM = {'time since fertilization', 'wet weight'};  
temp.tL_norM    = C2K(12);  units.temp.tL_norM = 'K'; label.temp.tL__ice5mw = 'temperature';
bibkey.tL_norM = 'Glover2009'; comment.tL_norM = 'Mowi strain+ Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';

  %% t_Ww
data.tWw_norM = [ ... % time since fertilization (d), wet weight (g) at 8Â°C
518	50.18
722	752.69
959	1555.56
1070	3274.19
345	25.09
688	765.23
947	2659.5
1042	4716.85];
units.tWw_norM   = {'d', 'g'};  label.tWw_norM = {'time since fertilization', 'wet weight'};  
bibkey.tWw_norM = 'Glover2009'; comment.tWw_norM = 'Mowi strain+ Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';



%% L-Ww

data.LWw_nor = [ ... % time since fertilization (d), wet weight (g) at 8Â°C
16.17	50.18
37.73	752.69
51.91	1555.56
61.42	3274.19
12.57	25.09
38	765.23
60.1	2659.5
70.6	4716.85];
units.LWw_nor   = {'d', 'g'};  label.LWw_nor = {'time since fertilization', 'wet weight'};  
temp.LWw_nor    = C2K(12);  units.temp.LWw_nor = 'K'; label.temp.LWw_nor = 'temperature';
bibkey.LWw_nor = 'Glover2009'; comment.LWw_nor = 'Mowi strain+ Laerdal river (Norway), 2 experiments started in 2003 and 2004, T° 12°C for freshwater, natural (mean=11.5) for seawater';


