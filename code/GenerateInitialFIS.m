function fis = GenerateInitialFIS(x,y,nCluster)
    
    % genfis3 in Function CreateInitialFIS will be removed 
    % Here we try to use genfis to generate FIS using FCM Clustering
    % Here the type of FIS is 'mamdani'， not 'Sugeno'
%     opt = genfisOptions('FCMClustering','FISType','mamdani');
%     opt.NumClusters = nCluster; % nCluster
%     opt.Verbose = 0; % fcm_Display
    options = genfisOptions('GridPartition');
    options.NumMembershipFunctions = nCluster;
    % Generate the FIS
    fis = genfis(x,y,options);
    % Show the rules for each cluster of generated FIS
    showrule(fis)
    % Plot the input membership funtions
    [x,mf] = plotmf(fis,'input',1);
    plot(x,mf)
    xlabel('input (gaussmf)')
%     [x,mf] = plotmf(fis,'input',2);
%     subplot(2,1,2)
%     plot(x,mf)
%     xlabel('input 2 (trimf)')
end