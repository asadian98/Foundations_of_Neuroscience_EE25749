function [segments, lfp, spiketrain, events] = DataCleaning(block)

    block.segments{1, 1}.events{1, 1}.an_trial_timestamp_id(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_timestamp_id(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_timestamp_id(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_timestamp_id(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_timestamp_id(593:598) = [];
    block.segments{1, 1}.events{1, 1}.labels(1317, :) = [];  
    block.segments{1, 1}.events{1, 1}.labels(1265:1269, :) = [];
    block.segments{1, 1}.events{1, 1}.labels(1258:1264, :) = [];
    block.segments{1, 1}.events{1, 1}.labels(1165:1166, :) = [];
    block.segments{1, 1}.events{1, 1}.labels(593:598, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_event_labels(1317, :) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_event_labels(1265:1269, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_event_labels(1258:1264, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_event_labels(1165:1166, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_event_labels(593:598, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_LFC(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_reject_LFC(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_LFC(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_LFC(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_LFC(593:598) = [];
    block.segments{1, 1}.events{1, 1}.an_performance_in_trial(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_performance_in_trial(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_performance_in_trial(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_performance_in_trial(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_performance_in_trial(593:598) = [];
    block.segments{1, 1}.events{1, 1}.times(1317) = [];  
    block.segments{1, 1}.events{1, 1}.times(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.times(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.times(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.times(593:598) = [];
    block.segments{1, 1}.events{1, 1}.an_belongs_to_trialtype(1317, :) = [];  
    block.segments{1, 1}.events{1, 1}.an_belongs_to_trialtype(1265:1269, :) = [];
    block.segments{1, 1}.events{1, 1}.an_belongs_to_trialtype(1258:1264, :) = [];
    block.segments{1, 1}.events{1, 1}.an_belongs_to_trialtype(1165:1166, :) = [];
    block.segments{1, 1}.events{1, 1}.an_belongs_to_trialtype(593:598, :) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_id(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_id(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_id(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_id(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_id(593:598) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_HFC(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_reject_HFC(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_HFC(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_HFC(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_HFC(593:598) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_IFC(1317) = [];  
    block.segments{1, 1}.events{1, 1}.an_trial_reject_IFC(1265:1269) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_IFC(1258:1264) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_IFC(1165:1166) = [];
    block.segments{1, 1}.events{1, 1}.an_trial_reject_IFC(593:598) = [];
    segments = block.segments{1, 1};
    lfp = segments.analogsignals;
    spiketrain = segments.spiketrains;
    events = segments.events{1,1};

end

