function [X, Y] = CreateTimeSeriesData(x, Delays)

    T = size(x,2);%得到x中数据的个数
    
    MaxDelay = max(Delays);%最大延迟
    
    Range = MaxDelay+1:T;%从最大延迟到T，取(T-MaxDelay)个连续的数
    
    X= [];
    for d = Delays
        X=[X; x(:,Range-d)];
        %d=1,X第一列是x从(MaxDelay)到T-1
        %d=2,X第二列是x从(MaxDelay-1)到T-2
        %...
        %d=5,X
    end
    
    Y = x(:,Range);
    X = X(MaxDelay,:);
%     save('PM25-Divided-XY.mat','X','Y')

end
