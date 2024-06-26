function p=GetFISParams(fis)

    p=[];

    nInput=numel(fis.input);%得到输入数据的数量
    for i=1:nInput 
        nMF=numel(fis.input(i).mf);
        for j=1:nMF
            p=[p fis.input(i).mf(j).params]; % 得到初始fis系统中，第i个输入对应的第j个mf结构中的params值。并将其排成矩阵
        end
    end

    nOutput=numel(fis.output);
    for i=1:nOutput
        nMF=numel(fis.output(i).mf);
        for j=1:nMF
            p=[p fis.output(i).mf(j).params];
        end
    end
    
end