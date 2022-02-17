function [mean_sr, mean_rw_on] = RasterPlot(TrialType_Name, neuron_number, spike_TrialType, TrialType, sr_time_TrialType, rw_on_time_TrialType, ts_on_time, fs, plotON)

    if(plotON)
        figure();
        plotSpikeRaster(spike_TrialType,'PlotType','vertline');
        title([TrialType_Name,' Class for Neuron Number = ',num2str(neuron_number)]);
        hold on
        xlim([-0.2 3.8])
        ylim([-4 length(TrialType)+4])
        line([0 0],[-2 length(TrialType)+3],'color','r');
        line([0.4 0.4],[-2 length(TrialType)+3],'color','b');
        line([0.8 0.8],[-2 length(TrialType)+3],'color','m');
        line([1.1 1.1],[-2 length(TrialType)+3],'color','r');
        line([2.1 2.1],[-2 length(TrialType)+3],'color','b');
        text(0-0.1,-4,'TS ON','color','r')
        text(0.4-0.1,-4,'WS ON','color','b')
        text(0.8-0.1,-4,'CUE ON','color','m')
        text(1.1-0.1,-4,'CUE OFF','color','r')
        text(2.1-0.1,-4,'GO ON','color','b')
        xlabel('T(s)')
        ylabel('Trial id')
    end
    mean_sr = 0;
    mean_rw_on = 0;
    x = [];
    y = [];

    for i = 1:length(TrialType)
        if(sr_time_TrialType(i) > 10 & (sr_time_TrialType(i)-ts_on_time(TrialType(i)))/fs < 4)
            x2 = (sr_time_TrialType(i)-ts_on_time(TrialType(i)))/fs;
            x = [x, x2];
            if(plotON)
                line([x2 x2],[i-0.5 i+0.5],'color','m','LineWidth',1.5); 
            end
        end
        
        
        if(rw_on_time_TrialType(i) > 10 & (rw_on_time_TrialType(i)-ts_on_time(TrialType(i)))/fs < 4)
            y2 = (rw_on_time_TrialType(i)-ts_on_time(TrialType(i)))/fs;
            y = [y, y2];
            if(plotON)
                line([y2 y2],[i-0.5 i+0.5],'color','r','LineWidth',1.5); 
            end
        end
         
    end
    mean_sr = mean(x);
    
    if(plotON)
        line([mean_sr mean_sr],[-2 length(TrialType)+3],'color','m');
        text(mean_sr-0.1,-4,'SR ON','color','m')
    end
    
    mean_rw_on = mean(y);
    
    if(plotON)
        line([mean_rw_on mean_rw_on],[-2 length(TrialType)+3],'color','r'); 
        text(mean_rw_on-0.1,-4,'RW ON','color','r')
        
        line([mean_rw_on-0.5 mean_rw_on-0.5],[-2 length(TrialType)+3],'color','g'); 
        text(mean_rw_on-0.1-0.5,-4, 'HS ON','color','g')
    end
end

