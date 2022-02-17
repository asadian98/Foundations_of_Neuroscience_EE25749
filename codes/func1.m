function dmean = func1(motor,pre)
    % For bootstrap func
    dmean = mean(motor) - mean(pre);
end
