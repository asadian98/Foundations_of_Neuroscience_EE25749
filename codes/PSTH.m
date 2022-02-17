function psth_out = PSTH(TrialType, mean_sr, mean_rw_on, TrialType_Name, neuron_number, spikes, win_size, fs, ON, plotON)
        
    psth  = @(x) ndass_smooth(1000*mean(x,1), win_size);
    
    if(ON)
        psth_out = psth(spikes);
        var_h = (-psth_out / max(psth_out)) * length(TrialType);
        var_h = var_h + length(TrialType);
        if(plotON)
            hold on
            plot((1:length(spikes(1, :)))/fs, var_h, 'color', '#A2142F', 'LineWidth', 1)
            xlabel('Time (sec)')
            xlim([-0.2 3.8])
            title(['PSTH and Raster Plot - ', TrialType_Name, ' Class for Neuron Number = ',num2str(neuron_number)]);
        end
    else
        psth_out = psth(spikes);
        if(plotON)
            figure()
            plot((1:length(spikes(1, :)))/fs, psth_out, 'b')
            xlabel('Time (sec)')
            ylabel('PSTH')
            title(['PSTH - ', TrialType_Name, ' Class for Neuron Number = ',num2str(neuron_number)]);
            yli = max(psth_out)+0.1;
            xlim([-0.2 3.8])
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
            
            ylim([0, yli + 0.1])
        end
    end
end

