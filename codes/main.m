%% Foundations of Neuroscience Final Project
% modified             1400/11/13
% Mahdi Babaei         97101297
% Amirhossein Asadian  96101187
% Alireza Khodaparast  96101573

%% Initialize
clc; clear; close all;

%% Load Dataset

% Please load the dataset manually and skip running this section
load('i140703-001_lfp-spikes.mat');

%% Data Cleaning

fs = 30000;
[segments, lfp, spiketrain, events] = DataCleaning(block);

%% Find TS_ON and Stop

ts_on_Idx = find(str2num(events.labels) == 65296);
stop_Idx = find(str2num(events.labels)== 65312);
ts_on_time = events.times(ts_on_Idx);
stop_time = events.times(stop_Idx);

%% Find trials for each class

neuron_number = 230;

[SGHF, spike_SGHF] = FindTrials('SGHF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
[PGHF, spike_PGHF] = FindTrials('PGHF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
[SGLF, spike_SGLF] = FindTrials('SGLF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
[PGLF, spike_PGLF] = FindTrials('PGLF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);

%% Find SR and RW_ON

[sr_time_SGHF, rw_on_time_SGHF] = Find_SR_and_RW(SGHF, stop_Idx, ts_on_Idx, events);
[sr_time_PGHF, rw_on_time_PGHF] = Find_SR_and_RW(PGHF, stop_Idx, ts_on_Idx, events);
[sr_time_SGLF, rw_on_time_SGLF] = Find_SR_and_RW(SGLF, stop_Idx, ts_on_Idx, events);
[sr_time_PGLF, rw_on_time_PGLF] = Find_SR_and_RW(PGLF, stop_Idx, ts_on_Idx, events);

%% Part 1 - Raster Plots

[mean_sr_SGHF, mean_rw_on_SGHF] = RasterPlot('SGHF', neuron_number, spike_SGHF, SGHF, sr_time_SGHF, rw_on_time_SGHF, ts_on_time, fs, 1);
[mean_sr_PGHF, mean_rw_on_PGHF] = RasterPlot('PGHF', neuron_number, spike_PGHF, PGHF, sr_time_PGHF, rw_on_time_PGHF, ts_on_time, fs, 1);
[mean_sr_SGLF, mean_rw_on_SGLF] = RasterPlot('SGLF', neuron_number, spike_SGLF, SGLF, sr_time_SGLF, rw_on_time_SGLF, ts_on_time, fs, 1);
[mean_sr_PGLF, mean_rw_on_PGLF] = RasterPlot('PGLF', neuron_number, spike_PGLF, PGLF, sr_time_PGLF, rw_on_time_PGLF, ts_on_time, fs, 1);

%% Find Time_Vec for Spike Times

time_vec = zeros(157,123280);

for i = 1:length(ts_on_time)    
    time_vec(i,1:length((ts_on_time(i)):1:(stop_time(i))))  = (ts_on_time(i)):1:(stop_time(i)) ;
end

%% Find Binary Spikes

spikes = zeros(157,123280);

for i = 1:length(spiketrain{1, neuron_number}.times)
    arr = (time_vec == spiketrain{1, neuron_number}.times(i));
    spikes = spikes + arr;
end

%% PSTH on Rasterplot

win_size = 1000;

[mean_sr_SGHF, mean_rw_on_SGHF] = RasterPlot('SGHF', neuron_number, spike_SGHF, SGHF, sr_time_SGHF, rw_on_time_SGHF, ts_on_time, fs, 1);
psth_out_SGHF = PSTH(SGHF, mean_sr_SGHF, mean_rw_on_SGHF, 'SGHF', neuron_number, spikes(SGHF, :), win_size, fs, 1, 1);

[mean_sr_PGHF, mean_rw_on_PGHF] = RasterPlot('PGHF', neuron_number, spike_PGHF, PGHF, sr_time_PGHF, rw_on_time_PGHF, ts_on_time, fs, 1);
psth_out_PGHF = PSTH(PGHF, mean_sr_PGHF, mean_rw_on_PGHF, 'PGHF', neuron_number, spikes(PGHF, :), win_size, fs, 1, 1);

[mean_sr_SGLF, mean_rw_on_SGLF] = RasterPlot('SGLF', neuron_number, spike_SGLF, SGLF, sr_time_SGLF, rw_on_time_SGLF, ts_on_time, fs, 1);
psth_out_SGLF = PSTH(SGLF, mean_sr_SGLF, mean_rw_on_SGLF, 'SGLF', neuron_number, spikes(SGLF, :), win_size, fs, 1, 1);

[mean_sr_PGLF, mean_rw_on_PGLF] = RasterPlot('PGLF', neuron_number, spike_PGLF, PGLF, sr_time_PGLF, rw_on_time_PGLF, ts_on_time, fs, 1);
psth_out_PGLF = PSTH(PGLF, mean_sr_PGLF, mean_rw_on_PGLF, 'PGLF', neuron_number, spikes(PGLF, :), win_size, fs, 1, 1);

%% Part 2 - PETH

win_size = 1000;
psth_out_SGHF = PSTH(SGHF, mean_sr_SGHF, mean_rw_on_SGHF, 'SGHF', neuron_number, spikes(SGHF, :), win_size, fs, 0, 1);
psth_out_PGHF = PSTH(PGHF, mean_sr_PGHF, mean_rw_on_PGHF, 'PGHF', neuron_number, spikes(PGHF, :), win_size, fs, 0, 1);
psth_out_SGLF = PSTH(SGLF, mean_sr_SGLF, mean_rw_on_SGLF, 'SGLF', neuron_number, spikes(SGLF, :), win_size, fs, 0, 1);
psth_out_PGLF = PSTH(PGLF, mean_sr_PGLF, mean_rw_on_PGLF, 'PGLF', neuron_number, spikes(PGLF, :), win_size, fs, 0, 1);

%% Part 3 - ISI

binWidth = 0.01;
ISI(spike_SGHF, 'SGHF', binWidth);
ISI(spike_PGHF, 'PGHF', binWidth);
ISI(spike_SGLF, 'SGLF', binWidth);
ISI(spike_PGLF, 'PGLF', binWidth);


%% Calculate PSTH for all of the neurons - psth_data is available.

for neuron_number = 121
    
    neuron_number
    
    [SGHF, spike_SGHF] = FindTrials('SGHF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
    [PGHF, spike_PGHF] = FindTrials('PGHF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
    [SGLF, spike_SGLF] = FindTrials('SGLF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);
    [PGLF, spike_PGLF] = FindTrials('PGLF', neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);

    % Find SR and RW_ON

    [sr_time_SGHF, rw_on_time_SGHF] = Find_SR_and_RW(SGHF, stop_Idx, ts_on_Idx, events);
    [sr_time_PGHF, rw_on_time_PGHF] = Find_SR_and_RW(PGHF, stop_Idx, ts_on_Idx, events);
    [sr_time_SGLF, rw_on_time_SGLF] = Find_SR_and_RW(SGLF, stop_Idx, ts_on_Idx, events);
    [sr_time_PGLF, rw_on_time_PGLF] = Find_SR_and_RW(PGLF, stop_Idx, ts_on_Idx, events);

    % Raster Plots

    [mean_sr_SGHF, mean_rw_on_SGHF] = RasterPlot('SGHF', neuron_number, spike_SGHF, SGHF, sr_time_SGHF, rw_on_time_SGHF, ts_on_time, fs, 0);
    [mean_sr_PGHF, mean_rw_on_PGHF] = RasterPlot('PGHF', neuron_number, spike_PGHF, PGHF, sr_time_PGHF, rw_on_time_PGHF, ts_on_time, fs, 0);
    [mean_sr_SGLF, mean_rw_on_SGLF] = RasterPlot('SGLF', neuron_number, spike_SGLF, SGLF, sr_time_SGLF, rw_on_time_SGLF, ts_on_time, fs, 0);
    [mean_sr_PGLF, mean_rw_on_PGLF] = RasterPlot('PGLF', neuron_number, spike_PGLF, PGLF, sr_time_PGLF, rw_on_time_PGLF, ts_on_time, fs, 0);

    % Find Time_Vec for Spike Times

    time_vec = zeros(157,123280);

    for i = 1:length(ts_on_time)    
        time_vec(i,1:length((ts_on_time(i)):1:(stop_time(i))))  = (ts_on_time(i)):1:(stop_time(i)) ;
    end

    % Find Binary Spikes

    spikes = zeros(157,123280);

    for i = 1:length(spiketrain{1, neuron_number}.times)
        arr = (time_vec == spiketrain{1, neuron_number}.times(i));
        spikes = spikes + arr;
    end

    % PSTH

    win_size = 1000;
    psth_out_SGHF = PSTH(SGHF, mean_sr_SGHF, mean_rw_on_SGHF, 'SGHF', neuron_number, spikes(SGHF, :), win_size, fs, 0, 0);
    psth_out_PGHF = PSTH(PGHF, mean_sr_PGHF, mean_rw_on_PGHF, 'PGHF', neuron_number, spikes(PGHF, :), win_size, fs, 0, 0);
    psth_out_SGLF = PSTH(SGLF, mean_sr_SGLF, mean_rw_on_SGLF, 'SGLF', neuron_number, spikes(SGLF, :), win_size, fs, 0, 0);
    psth_out_PGLF = PSTH(PGLF, mean_sr_PGLF, mean_rw_on_PGLF, 'PGLF', neuron_number, spikes(PGLF, :), win_size, fs, 0, 0);

    psth_data{neuron_number, 1} = psth_out_SGHF;
    psth_data{neuron_number, 2} = psth_out_PGHF;
    psth_data{neuron_number, 3} = psth_out_SGLF;
    psth_data{neuron_number, 4} = psth_out_PGLF;
%     psth_data{neuron_number, 5} = sr_time_SGHF;
%     psth_data{neuron_number, 6} = sr_time_PGHF;
%     psth_data{neuron_number, 7} = sr_time_SGLF;
%     psth_data{neuron_number, 8} = sr_time_PGLF;
%     psth_data{neuron_number, 9} = rw_on_time_SGHF;
%     psth_data{neuron_number, 10} = rw_on_time_PGHF;
%     psth_data{neuron_number, 11} = rw_on_time_SGLF;
%     psth_data{neuron_number, 12} = rw_on_time_PGLF;
%     psth_data{neuron_number, 13} = mean_sr_SGHF;
%     psth_data{neuron_number, 14} = mean_sr_PGHF;
%     psth_data{neuron_number, 15} = mean_sr_SGLF;
%     psth_data{neuron_number, 16} = mean_sr_PGLF;
%     psth_data{neuron_number, 17} = mean_rw_on_SGHF;
%     psth_data{neuron_number, 18} = mean_rw_on_PGHF;
%     psth_data{neuron_number, 19} = mean_rw_on_SGLF;
%     psth_data{neuron_number, 20} = mean_rw_on_PGLF;

end

%% Plot PETH for Neurons in PMd and M1, different classes

% Do not load psth_data if it is not necessary
% load psth_data

load psth_premotor_PGHF
load psth_premotor_PGLF
load psth_premotor_SGHF
load psth_premotor_SGLF

load psth_motor_PGHF
load psth_motor_PGLF
load psth_motor_SGHF
load psth_motor_SGLF

mean_pre_PGHF = mean(psth_premotor_PGHF, 1);
mean_pre_PGLF = mean(psth_premotor_PGLF, 1);
mean_pre_SGHF = mean(psth_premotor_SGHF, 1);
mean_pre_SGLF = mean(psth_premotor_SGLF, 1);

mean_PGHF = mean(psth_motor_PGHF, 1);
mean_PGLF = mean(psth_motor_PGLF, 1);
mean_SGHF = mean(psth_motor_SGHF, 1);
mean_SGLF = mean(psth_motor_SGLF, 1);

figure()
plot(1/30000:1/30000:length(mean_pre_PGHF)/30000, mean_pre_PGHF, 'color', 'k')
hold on 
plot(1/30000:1/30000:length(mean_pre_PGHF)/30000, mean_pre_PGLF, 'color', 'r')
plot(1/30000:1/30000:length(mean_pre_PGHF)/30000, mean_pre_SGHF, 'color', 'b')
plot(1/30000:1/30000:length(mean_pre_PGHF)/30000, mean_pre_SGLF, 'color', 'g')
title('PETH for all neurons in PMd')
legend('PGHF', 'PGLF', 'SGHF', 'SGLF', 'AutoUpdate','off')
ylim([0, .52])
xlim([-0.2 3.8])
yli = 0.5;
line([0 0],[0 yli],'color','r');
line([0.4 0.4],[0 yli],'color','b');
line([0.8 0.8],[0 yli],'color','m');
line([1.1 1.1],[0 yli],'color','r');
line([2.1 2.1],[0 yli],'color','b');

text(0-0.1,yli,'TS ON','color','r')
text(0.4-0.1,yli,'WS ON','color','b')
text(0.8-0.1,yli,'CUE ON','color','m')
text(1.1-0.1,yli,'CUE OFF','color','r')
text(2.1-0.1,yli,'GO ON','color','b')

mean_sr = 2.3609;% mean(psth_data{1, 13:16};
mean_rw_on = 3.3975; %mean(psth_data{1, 17:20});
line([mean_sr mean_sr],[0 yli],'color','m');
text(mean_sr-0.1,yli,'SR ON','color','m')
line([mean_rw_on mean_rw_on],[0 yli],'color','r'); 
text(mean_rw_on-0.1,yli,'RW ON','color','r')

line([mean_rw_on-0.5 mean_rw_on-0.5],[0 yli],'color','g'); 
text(mean_rw_on-0.1-0.5,yli,'HS ON','color','g')

figure()
plot(1/30000:1/30000:length(mean_PGHF)/30000, mean_PGHF, 'color', 'k')
hold on 
plot(1/30000:1/30000:length(mean_PGHF)/30000, mean_PGLF, 'color', 'r')
plot(1/30000:1/30000:length(mean_PGHF)/30000, mean_SGHF, 'color', 'b')
plot(1/30000:1/30000:length(mean_PGHF)/30000, mean_SGLF, 'color', 'g')
ylim([0, .52])
title('PETH for all neurons in M1')
legend('PGHF', 'PGLF', 'SGHF', 'SGLF', 'AutoUpdate','off')
xlim([-0.2 3.8])
yli = 0.5;
line([0 0],[0 yli],'color','r');
line([0.4 0.4],[0 yli],'color','b');
line([0.8 0.8],[0 yli],'color','m');
line([1.1 1.1],[0 yli],'color','r');
line([2.1 2.1],[0 yli],'color','b');

text(0-0.1,yli,'TS ON','color','r')
text(0.4-0.1,yli,'WS ON','color','b')
text(0.8-0.1,yli,'CUE ON','color','m')
text(1.1-0.1,yli,'CUE OFF','color','r')
text(2.1-0.1,yli,'GO ON','color','b')

line([mean_sr mean_sr],[0 yli],'color','m');
text(mean_sr-0.1,yli,'SR ON','color','m')
line([mean_rw_on mean_rw_on],[0 yli],'color','r'); 
text(mean_rw_on-0.1,yli,'RW ON','color','r')

line([mean_rw_on-0.5 mean_rw_on-0.5],[0 yli],'color','g'); 
text(mean_rw_on-0.1-0.5,yli,'HS ON','color','g')

%% Plot PMd and M1 for all of the trial types

PMd = mean([mean_pre_PGHF;mean_pre_PGLF;mean_pre_SGHF;mean_pre_SGLF]);
M1 = mean([mean_PGHF;mean_PGLF;mean_SGHF;mean_SGLF]);
figure()
plot(1/30000:1/30000:length(mean_PGHF)/30000, PMd)
hold on
plot(1/30000:1/30000:length(mean_PGHF)/30000, M1)
ylim([0, .52])
title('PETH for all neurons in M1 and PMd')
legend('PMd', 'M1', 'AutoUpdate','off')
xlim([-0.2 3.8])

yli = 0.5;
line([0 0],[0 yli],'color','r');
line([0.4 0.4],[0 yli],'color','b');
line([0.8 0.8],[0 yli],'color','m');
line([1.1 1.1],[0 yli],'color','r');
line([2.1 2.1],[0 yli],'color','b');

text(0-0.1,yli,'TS ON','color','r')
text(0.4-0.1,yli,'WS ON','color','b')
text(0.8-0.1,yli,'CUE ON','color','m')
text(1.1-0.1,yli,'CUE OFF','color','r')
text(2.1-0.1,yli,'GO ON','color','b')

line([mean_sr mean_sr],[0 yli],'color','m');
text(mean_sr-0.1,yli,'SR ON','color','m')
line([mean_rw_on mean_rw_on],[0 yli],'color','r'); 
text(mean_rw_on-0.1,yli,'RW ON','color','r')

line([mean_rw_on-0.5 mean_rw_on-0.5],[0 yli],'color','g'); 
text(mean_rw_on-0.1-0.5,yli,'HS ON','color','g')

%% Nice Plots

% Plot for M1 and PMd nicely !
plotnice('SGHF', psth_premotor_SGHF, psth_motor_SGHF, 123280, 2.3376, 3.3535)
plotnice('SGLF', psth_premotor_SGLF, psth_motor_SGLF, 123280, 2.3872, 3.4496)
plotnice('PGHF', psth_premotor_PGHF, psth_motor_PGHF, 123280, 2.3350, 3.3584)
plotnice('PGLF', psth_premotor_PGLF, psth_motor_PGLF, 123280, 2.3840, 3.4287)

plotnice('All Trial Types', [psth_premotor_PGHF;psth_premotor_PGLF;psth_premotor_SGLF;...
    psth_premotor_SGHF],[psth_motor_PGHF;psth_motor_PGLF;psth_motor_SGLF;psth_motor_SGHF]...
    , 123280, mean_sr, mean_rw_on)

%% Bootstrap

t_h = 0:1/30000:length(mean_PGHF)/30000-1/30000;
% For SR-ON Event
t_h_b = find((t_h > mean_sr) == 1);

% Window size before and after the event
win = 0.15;
psth_premotor = [psth_premotor_PGHF;psth_premotor_PGLF;psth_premotor_SGHF;psth_premotor_SGLF];
pre_after_SR = psth_premotor(:, t_h_b(1):(t_h_b(1)+win*fs));
pre_before_SR = psth_premotor(:, (t_h_b(1)-win*fs):t_h_b(1));
pre_mean_after_SR = mean(pre_after_SR, 2);
pre_mean_before_SR = mean(pre_before_SR, 2);

psth_motor = [psth_motor_PGHF;psth_motor_PGLF;psth_motor_SGHF;psth_motor_SGLF];
motor_after_SR = psth_motor(:, t_h_b(1):(t_h_b(1)+win*fs));
motor_before_SR = psth_motor(:, (t_h_b(1)-win*fs):t_h_b(1));
motor_mean_after_SR = mean(motor_after_SR, 2);
motor_mean_before_SR = mean(motor_before_SR, 2);

nboot = 1000;
[bootstat bootsam] = bootstrp(nboot,@func1,pre_mean_after_SR,pre_mean_before_SR);
deltamean = mean(pre_mean_after_SR) - mean(pre_mean_before_SR);
disp(['PMd P-value = ', num2str(length(find(bootstat<0))/nboot)])

[bootstat bootsam] = bootstrp(nboot,@func1,motor_mean_after_SR,motor_mean_before_SR);
deltamean = mean(motor_mean_after_SR) - mean(motor_mean_before_SR);
disp(['M1 P-value = ', num2str(length(find(bootstat<0))/nboot)])

FanoFactor_motor_after_SR = var(motor_after_SR, 0, 2)./mean(motor_after_SR, 2);
FanoFactor_motor_before_SR = var(motor_before_SR, 0, 2)./mean(motor_before_SR, 2);
FanoFactor_pre_after_SR = var(pre_after_SR, 0, 2)./mean(pre_after_SR, 2);
FanoFactor_pre_before_SR = var(pre_before_SR, 0, 2)./mean(pre_before_SR, 2);

% Remove NaN
FanoFactor_motor_after_SR = FanoFactor_motor_after_SR(~isnan(FanoFactor_motor_after_SR'))';
FanoFactor_motor_before_SR = FanoFactor_motor_before_SR(~isnan(FanoFactor_motor_before_SR'))';
FanoFactor_pre_after_SR = FanoFactor_pre_after_SR(~isnan(FanoFactor_pre_after_SR'))';
FanoFactor_pre_before_SR = FanoFactor_pre_before_SR(~isnan(FanoFactor_pre_before_SR'))';

% PMd FanoFactor Comparison
figure()
histogram(FanoFactor_pre_before_SR, 100)
hold on
histogram(FanoFactor_pre_after_SR, 100)
legend('FanoFactor Distribution before SR-ON', 'FanoFactor Distribution after SR-ON')

% M1 FanoFactor Comparison
figure()
histogram(FanoFactor_motor_before_SR, 100)
hold on
histogram(FanoFactor_motor_after_SR, 100)
legend('FanoFactor Distribution before SR-ON', 'FanoFactor Distribution after SR-ON')
title('FanoFactor Distribution before and after SR-ON Event')


% Mean
nboot = 1000;
siz = min(length(FanoFactor_motor_after_SR), length(FanoFactor_motor_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func1,FanoFactor_motor_after_SR(1:siz),FanoFactor_motor_before_SR(1:siz));
disp(['M1 P-value for Mean of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

nboot = 1000;
siz = min(length(FanoFactor_pre_after_SR), length(FanoFactor_pre_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func1,FanoFactor_pre_after_SR(1:siz),FanoFactor_pre_before_SR(1:siz));
disp(['PMd P-value for Mean of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

% Var
nboot = 1000;
siz = min(length(FanoFactor_motor_after_SR), length(FanoFactor_motor_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func2,FanoFactor_motor_after_SR(1:siz),FanoFactor_motor_before_SR(1:siz));
disp(['M1 P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

nboot = 1000;
siz = min(length(FanoFactor_pre_after_SR), length(FanoFactor_pre_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func2,FanoFactor_pre_after_SR(1:siz),FanoFactor_pre_before_SR(1:siz));
disp(['PMd P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

% Skewness
nboot = 1000;
siz = min(length(FanoFactor_motor_after_SR), length(FanoFactor_motor_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func3,FanoFactor_motor_after_SR(1:siz),FanoFactor_motor_before_SR(1:siz));
disp(['M1 P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

nboot = 1000;
siz = min(length(FanoFactor_pre_after_SR), length(FanoFactor_pre_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func3,FanoFactor_pre_after_SR(1:siz),FanoFactor_pre_before_SR(1:siz));
disp(['PMd P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

% Kurtosis
nboot = 1000;
siz = min(length(FanoFactor_motor_after_SR), length(FanoFactor_motor_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func4,FanoFactor_motor_after_SR(1:siz),FanoFactor_motor_before_SR(1:siz));
disp(['M1 P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])

nboot = 1000;
siz = min(length(FanoFactor_pre_after_SR), length(FanoFactor_pre_before_SR));
[bootstat bootsam] = bootstrp(nboot,@func4,FanoFactor_pre_after_SR(1:siz),FanoFactor_pre_before_SR(1:siz));
disp(['PMd P-value for Variance of the FanoFactor Distribution = ', num2str(length(find(bootstat<0))/nboot)])