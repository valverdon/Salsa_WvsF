%% <../run_CI.m *run_CI*>
% created by Dina Lika 2018/09/17
%
% 1. Calibration step for the interval estimation.
%          calls get_lf_distribution;
%          saves output to calibrate.mat.
%
% 2. Calculates the profile of the loss function for a parameter.
%          calls get_profile;
%          saves output to profile_nameOFparameter.
%
% 3. Plots the profile of the loss function for a parameter;
%          plots the distribution function of the loss function of Monte
%          Carlo simulations;
%          gives the confidence interval of the parameter.
%
% The working folder must contain the 3 user-defined files of your species
% mydata_my_pet.m, predict_my_pet.m, pars_init_my_pet.m (with the best estimates)
%
% The theory is discussed in Marques et al. 2018. "Fitting Multiple
% Models to Multiple Data Sets". J Sea Research, doi.org/10.1016/j.seares.2018.07.004
%
% For an example of an application see: Stavrakidis-Zachouet al 2018. “A DEB Model for European Sea
% Bass (Dicentrarchus Labrax): Parameterisation and Application in
% Aquaculture.” J  Sea Research, doi.org/10.1016/j.seares.2018.05.008
%
clear
close all
% addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/Dynamic Energy Budget Theory/DEBtool_M'))
% addpath(genpath('C:/Users/crecapet/Documents/Recherche/Modelisation/Dynamic Energy Budget Theory/Salsa_WvsF'))

cd 'C:/Users/vverdon/Documents/MATLAB/Salsa_WvsF/CI_wild/'
global pet pets

% The user must specify:
% species name (line 37);
% name of the parameter for which the profile will be calculated
% and the lower and upper limits of the range of simulations (lines 40-41);
% Specify the confidence level (line 50).
% Choose the step(s) you want to simulate (line58).
pet = 'Salmo_salar_wild';  % replace my_pet, with your species name
pets = {'Salmo_salar_wild'};
% mat2pars_init(pet)

% stepCI - Choose the step(s) you want to simulate
%          0: runs the whole procedure; 
%          a1: runs only the calibration step
%          2: runs only the profile for a parameter step
%          3: computes the CI and graphs the profile
%          4: runs only the profile and graphs it (no calibration step)
stepCI =1; 

% parameter for the profile step
pProfile ={'z'};    % name of the parameter for which the profile will be calculated
% pProfile={'z','v','kap','p_M','E_Hp'};

%borders taken from addmypet all organisms
lowVal = 1000;   % lower value of the profile interval, depends on the parameter
% lowVal=[0.4,0.025,0.8,10,1000];
% upperVal = 1000000;  % upper value of the profile interval, depends on the parameter
upperVal=[10,0.1,0.9999,15000,1000000];
dim = 20;         % increase for a smooth profile (optional)

% input for the calibration step
nTrials = 100;   % number of data sets (can be changed)
% nTrials = 10;   % number of data sets (can be changed)
nCont  = 10;       % increase number of continuations, if necessary

% Specify the confidence level for the confidence interval
clevel =0.95; % e.g. 0.9 for a 90% confidence interval




tic
% -------------------------------------------------------------------------
if stepCI == 0 || stepCI == 1
    fprintf('\n Step 1. Calibration\n\n');
    [lf_calibrate, pars_calibrate, name_par] = get_lf_distribution(nTrials, nCont);
    % lf_calibrate: vector with the values of the loss function
    % pars_calibrate: matrix with the parameter values 
    %                 rows: free parameters; columns: number of datasets
    % name_par: names of free parameters
    save('calibrate', 'lf_calibrate', 'pars_calibrate', 'name_par')
end
toc
%

for nparametre = 1:size(pProfile,2)
    parametre=char(pProfile(nparametre));
    tic
    if stepCI == 0 || stepCI == 2 || stepCI == 4
        fprintf('\n Step 2. Profile for parameter %s \n\n', parametre);
        [lf_profile, pars_profile] = get_profile(parametre,lowVal(nparametre),upperVal(nparametre),dim,nCont);
        % lf_profile: vector with the values of the loss function
        % pars_profile: vector with the parameter values 

        save(['profile_',parametre], 'lf_profile', 'pars_profile')
    end
    toc
 end
%

    if  stepCI == 0 || stepCI == 3 || stepCI == 4
        fprintf('\n Step 3. Show plots and CI\n\n');
        if exist(['profile_',char(pProfile)], 'file') == 0 && exist('calibrate.mat', 'file')== 0
            disp('Execute steps 1 and 2 first')
        else
            load(['profile_',char(pProfile)])
            load('calibrate.mat')
            [lf_thres, ci_low, ci_upper] = plot_profile_CI(pars_profile, lf_profile, lf_calibrate, clevel);
            xlabel(sprintf('%s',char(pProfile)));
            saveas(gcf,strcat('profil_',sprintf('%s',char(pProfile))),'png');
            figure(1)
            saveas(gcf,strcat('survival_',sprintf('%s',char(pProfile))),'png');
            % confidence interval
            fprintf('The CI for %s is from %1.4f to %1.4f \n', char(pProfile), ci_low, ci_upper)
            fprintf('The threshold value for the loss function is %1.3f \n', lf_thres)      
        end
    end

%     if stepCI == 0 || stepCI == 2
%         fprintf('\n Step 2. Profile for parameter %s \n\n', pProfile);
%         [lf_profile, pars_profile] = get_profile(pProfile,lowVal,upperVal,dim,nCont);
%         % lf_profile: vector with the values of the loss function
%         % pars_profile: vector with the parameter values 
% 
%         save(['profile_',pProfile], 'lf_profile', 'pars_profile')
%     end
%     toc

%
%     if  stepCI == 0 || stepCI == 3
%         fprintf('\n Step 3. Show plots and CI\n\n');
%         if exist(['profile_',pProfile], 'file') == 0 && exist('calibrate.mat', 'file')== 0
%             disp('Execute steps 1 and 2 first')
%         else
%             load(['profile_',pProfile])
%             load('calibrate.mat')
%             [lf_thres, ci_low, ci_upper] = plot_profile_CI(pars_profile, lf_profile, lf_calibrate, clevel);
%             xlabel(sprintf('%s',pProfile));
%        
%             % confidence interval
%             fprintf('The CI for %s is from %1.4f to %1.4f \n', pProfile, ci_low, ci_upper)
%             fprintf('The threshold value for the loss function is %1.3f \n', lf_thres)      
%         end
%     end
%    