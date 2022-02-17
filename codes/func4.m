function dkurtosis = func4(motor,pre)
    % For bootstrap func
    kurtss = @(x) (sum((x-mean(x)).^4)./length(x)) ./ (var(x,1).^2);
    dkurtosis = kurtss(motor) - kurtss(pre);
end
