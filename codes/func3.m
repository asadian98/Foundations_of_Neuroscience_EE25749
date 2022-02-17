function dskew = func3(motor,pre)
    % For bootstrap func
    skewns = @(x) (sum((x-mean(x)).^3)./length(x)) ./ (var(x,1).^1.5);
    dskew = skewns(motor) - skewns(pre);
end
