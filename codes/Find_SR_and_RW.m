function [sr_time, rw_on_time] = Find_SR_and_RW(TrialType, stop_Idx, ts_on_Idx, events)

    sr_time = zeros(length(TrialType),1);
    rw_on_time = zeros(length(TrialType),1);
    for i = 1:length(TrialType)

        for c = 1:stop_Idx(TrialType(i))-ts_on_Idx(TrialType(i))
            if(strcmp(events.an_trial_event_labels((c + ts_on_Idx(TrialType(i))),:),'SR         ') == 1)
                sr_time(i,1) =  events.times(ts_on_Idx(TrialType(i))+c);
            end
        end

        for c = 1:stop_Idx(TrialType(i))-ts_on_Idx(TrialType(i))
            if(strcmp(events.an_trial_event_labels((c + ts_on_Idx(TrialType(i))),:),'RW-ON      ') == 1)
                rw_on_time(i,1) =  events.times(ts_on_Idx(TrialType(i))+c);
            end
        end

    end

end

