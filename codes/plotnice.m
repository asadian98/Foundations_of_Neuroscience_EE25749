function plotnice(TrialType_Name, psth_premotor, psth_motor, t_h_lim, mean_sr, mean_rw_on)

    figure()
    t_h = 0:1/30000:t_h_lim/30000-1/30000;
    ndass_niceplot(psth_premotor, t_h, 1, 1, 0, 0)
    hold on
    ndass_niceplot(psth_motor, t_h, 1, 0, 0, 1)
    xlim([-0.2 3.8])
    ylim([0, .52])
    title(['PETH for all neurons in M1 and PMd - ', TrialType_Name])
    legend('PMd', '', 'M1', 'AutoUpdate','off')

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

end

