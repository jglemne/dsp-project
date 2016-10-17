function variates = newgen(boolBin,x,df,cdf,nVariates,truncInterval,method)

variates = zeros(1,nVariates);
for counter=1:nVariates
    switch method
        case 'arm'
            if boolBin
                variates(counter) = binvar(df,x,...
                    truncInterval,method);
            else
                variates(counter) = arm(df,x,truncInterval);
            end
        case 'itm'
            if boolBin
                variates(counter) = binvar(cdf,x,truncInterval,method);
            else
                variates(counter) = itm(cdf,x,truncInterval);
            end
        otherwise
            msg = strcat('The method "',method,...
                '" you have given is not a valid method');
            error(msg);
    end
end

return