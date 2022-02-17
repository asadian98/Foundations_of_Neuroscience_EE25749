function ISI(spike_TrialType, spike_TrialType_Name, binWidth)

    ISI = [];
    for i = 1:length(spike_TrialType)
       time_diff{i} = [spike_TrialType{i, 1}, 0] - [0, spike_TrialType{i, 1}];
       ISI = [ISI time_diff{i}(2:length(time_diff{i}) - 1)];
    end
    lastVal = max(ISI);
    binEdges = 0:binWidth:lastVal;
    figure()
    histogram(ISI,binEdges,'Normalization','pdf','FaceColor',[.9 .9 .9])
    hold on

    pdca = fitdist(ISI','Gamma');
    xgrid = linspace(0,lastVal,100);
    pdfest = pdf(pdca,xgrid);
    line(xgrid,pdfest,'color','r');
    ylabel('Count')
    xlabel('Interspike Interval (sec)')
    title([spike_TrialType_Name, ' - Interspike Interval and Fitted Gamma Distribution'])
    legend('Interspike Interval', 'Fitted Gamma Distribution') 

end

