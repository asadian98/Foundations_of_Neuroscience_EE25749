load Neuron.mat

psth_premotor_SGHF = [];
for i = 1:271
    if npre(i) == 1
        psth_premotor_SGHF = [psth_premotor_SGHF; psth_data{i, 1}];
    end
end

psth_premotor_PGHF = [];
for i = 1:271
    if npre(i) == 1
        psth_premotor_PGHF = [psth_premotor_PGHF; psth_data{i, 2}];
    end
end

psth_premotor_SGLF = [];
for i = 1:271
    if npre(i) == 1
        psth_premotor_SGLF = [psth_premotor_SGLF; psth_data{i, 3}];
    end
end

psth_premotor_PGLF = [];
for i = 1:271
    if npre(i) == 1
        psth_premotor_PGLF = [psth_premotor_PGLF; psth_data{i, 4}];
    end
end

%%

psth_motor_SGHF = [];
for i = 1:271
    if nm(i) == 1
        psth_motor_SGHF = [psth_motor_SGHF; psth_data{i, 1}];
    end
end

psth_motor_PGHF = [];
for i = 1:271
    if nm(i) == 1
        psth_motor_PGHF = [psth_motor_PGHF; psth_data{i, 2}];
    end
end

psth_motor_SGLF = [];
for i = 1:271
    if nm(i) == 1
        psth_motor_SGLF = [psth_motor_SGLF; psth_data{i, 3}];
    end
end

psth_motor_PGLF = [];
for i = 1:271
    if nm(i) == 1
        psth_motor_PGLF = [psth_motor_PGLF; psth_data{i, 4}];
    end
end
