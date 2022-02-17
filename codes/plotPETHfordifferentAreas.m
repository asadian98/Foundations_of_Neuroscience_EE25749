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

mean_sr = psth_data{1, 13};
mean_rw_on = psth_data{1, 17};
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