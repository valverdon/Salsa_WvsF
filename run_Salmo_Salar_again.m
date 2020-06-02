clear
close all

%%
%addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/DEB/DEBtool_M-master'))
%addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/DEB/DEB school 2019/Salmo_salar/AmP_Salmo_salar/std model'))
global pets

% pets = {'Salmo_salar_farm'};
pets = {'Salmo_salar_wild'};
% check_my_pet(pets); 

% Read about how to set estimation and output options (estim_options) on the online
% manual: http://www.debtheory.org/wiki/index.php?title=Run_file

estim_options('default'); 
%estim_options('max_step_number',5e3); 
estim_options('max_step_number',500);
estim_options('max_fun_evals',5e3);  

estim_options('pars_init_method', 1);
estim_options('loss_function', 'sb');
estim_options('report', 1);
estim_options('results_output', 0);
estim_options('method', 'nm');
%estim_options('method', 'no');

n=10; % number of repetition
for i=1:n-1
fprintf('N= ',i,'\n')
    estim_pars; 

end

estim_options('results_output', 3);
estim_pars; 