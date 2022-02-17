function [trialType, spikes] = FindTrials(TrialType, neuron_number, events, ts_on_Idx, spiketrain, ts_on_time, stop_time, fs);

    trialType = [];
    for i = 1:157
        trialType(i) = strcmp(events.an_belongs_to_trialtype(ts_on_Idx(i), :), TrialType);
    end
    trialType = find(transpose(trialType) == 1);
    
    spikes = cell(length(trialType),1);
    for j = 1:length(trialType)
        spikes{j} = (spiketrain{1, neuron_number}.times((spiketrain{1, neuron_number}.times>=ts_on_time(trialType(j))) & (spiketrain{1, neuron_number}.times<=stop_time(trialType(j))))-ts_on_time(trialType(j)))/fs; 
    end
end

