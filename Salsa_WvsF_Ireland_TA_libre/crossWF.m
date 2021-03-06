
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

data.ah_nor2011 = 116;    units.ah_nor2011 = 'd';    label.ah_nor2011 = 'age at hatching';             bibkey.ah_nor2011 = 'Solberg2014';     comment.ah_nor2011 = 'parents from river Figgjo (Norway) & Mowi strain, mean of offsprings time at 50% hatching in 2011';
  temp.ah_nor2011 = C2K(4.8);  units.temp.ah_nor2011 = 'K'; label.temp.ah_nor2011 = 'temperature';
data.ah_nor2012 = 92;    units.ah_nor2012 = 'd';    label.ah_nor2012 = 'age at hatching';             bibkey.ah_nor2012 = 'Solberg2014';     comment.ah_nor2012 = 'parents from river Figgjo (Norway) & Mowi strain, mean of offsprings time at 50% hatching in 2012';
  temp.ah_nor2012 = C2K(6.0);  units.temp.ah_nor2012 = 'K'; label.temp.ah_nor2012 = 'temperature';
data.ah_nor2013 = 88;    units.ah_nor2013 = 'd';    label.ah_nor2013 = 'age at hatching';             bibkey.ah_nor2013 = 'Solberg2014';     comment.ah_nor2013 = 'parents from river Figgjo (Norway) & Mowi strain, mean of offsprings time at 50% hatching in 2013';
  temp.ah_nor2013 = C2K(6.3);  units.temp.ah_nor2013 = 'K'; label.temp.ah_nor2013 = 'temperature';
data.ah_nor2013V = 93;    units.ah_nor2013V = 'd';    label.ah_nor2013V = 'age at hatching';             bibkey.ah_nor2013V = 'Solberg2014';     comment.ah_nor2013V = 'parents from river Vosso (Norway)& Salmobreed strain, mean of offsprings time at 50% hatching in 2013';
  temp.ah_nor2013V = C2K(6.3);  units.temp.ah_nor2013V = 'K'; label.temp.ah_nor2013V = 'temperature';


%% Age at smoltification
data.aj_nor = 489;    units.aj_nor = 'd';    label.aj_nor = 'age at hatching';             bibkey.aj_nor = 'Hindar2006';     
comment.aj_nor = 'parents from river Imsa (Norway)& National Breeding program, (time since burth), temperature = rough guess - highly variable temperature throughout life (1.34*365.25)';
  temp.aj_nor = C2K(10);  units.temp.aj_nor = 'K'; label.temp.aj_nor = 'temperature';

%% age at maturity

data.ap_nor = 628;    units.ap_nor = 'd';    label.ap_nor = 'age at hatching';             bibkey.ap_nor = 'Hindar2006';     
comment.ap_nor = 'parents from river Imsa (Norway)& National Breeding program, (time since burth), temperature = rough guess - highly variable temperature throughout life (1.34+1.38-1)*365.25';
  temp.ap_nor = C2K(10);  units.temp.ap_nor = 'K'; label.temp.ap_nor = 'temperature';


%% Length at hatching

%% Length at first feeding
data.Lb_NorF2011  = 2.90;   units.Lb_NorF2011  = 'cm';  label.Lb_NorF2011  = 'total length at birth';   bibkey.Lb_NorF2011  = 'Solberg2014';  comment.Lb_NorF2011 = 'parents from river Figgjo (Norway in 2011) & Mowi strain';
data.Lb_NorF2012  = 2.81;   units.Lb_NorF2012  = 'cm';  label.Lb_NorF2012  = 'total length at birth';   bibkey.Lb_NorF2012  = 'Solberg2014';  comment.Lb_NorF2012 = 'parents from river Figgjo (Norway in 2011) & Mowi strain';
data.Lb_NorF2013  = 2.84;   units.Lb_NorF2013  = 'cm';  label.Lb_NorF2013  = 'total length at birth';   bibkey.Lb_NorF2013  = 'Solberg2014';  comment.Lb_NorF2013 = 'parents from river Figgjo (Norway in 2011) & Mowi strain';
data.Lb_NorV2013  = 2.81;   units.Lb_NorV2013  = 'cm';  label.Lb_NorV2013  = 'total length at birth';   bibkey.Lb_NorV2013  = 'Solberg2014';  comment.Lb_NorV2013 = 'parents from river Vosso (Norway in 2011) & Salmobreed strain';

%% Length at smoltification
data.Lj_finS  = 14.3;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis'; bibkey.Lj  = 'Jokikkoko2006'; comment.Lj = 'Simojoki broodstock (Baltic Sea, Finland) - mean from 1986 to 1992';


%% Egg volume
data.V0_norF2011 = 0.113;  units.V0_norF2011 = 'cm^3'; label.V0_norF2011 = 'egg volume'; bibkey.V0_norF2011 = 'Solberg2014';  comment.V0_norF2011 = 'parents from river Figgjo (Norway) & Mowi strain,mean(4/3*pi*(diameter/2)^3)';
data.V0_norF2012 = 0.121;  units.V0_norF2012 = 'cm^3'; label.V0_norF2012 = 'egg volume'; bibkey.V0_norF2012 = 'Solberg2014';  comment.V0_norF2012 = 'parents from river Figgjo (Norway) & Mowi strain,mean(4/3*pi*(diameter/2)^3)';


%% Egg weight


%% Weight at hatching


%% Weight at first feeding

%% Reserve energy in egg (egg = reserve only)







