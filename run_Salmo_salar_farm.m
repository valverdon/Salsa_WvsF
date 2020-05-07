clear
close all

%%
%addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/DEB/DEBtool_M-master'))
%addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/DEB/DEB school 2019/Salmo_salar/AmP_Salmo_salar/std model'))
global pets

pets = {'Salmo_salar_farm'};
% check_my_pet(pets); 

% Read about how to set estimation and output options (estim_options) on the online
% manual: http://www.debtheory.org/wiki/index.php?title=Run_file

estim_options('default'); 
%estim_options('max_step_number',5e3); 
estim_options('max_step_number',300);
estim_options('max_fun_evals',5e3);  

estim_options('pars_init_method', 2);% 1 = from from .mat file, 2 = from pars_init file
estim_options('loss_function', 'sb');
estim_options('report', 1);
estim_options('results_output', 3);% 0 = .mat only, 2 = .mat file and print to html, 3 = .mat file and print to html and png, 4 = .mat file and print to html incl. implied traits and png  
estim_options('method', 'nm');
%estim_options('method', 'no');

estim_pars; 