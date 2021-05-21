%% Presentation 

%% One Dimensional Study
%This study examines the capabilites of the Static Sensor with the
%ability no sensor size switching in a one dimensional grid 50 cells in
%length with 47 cells available for 5 robots, the simulation runs for 100
%iterations and the robots start on the left in a dense distribution. The
%size of the sensor is the varied from size 1 to size 8.
% MaxCovSensorSize = [];
% for SensorStart = 1:1:15
%     [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(5,'left',1,SensorStart,100,false,'off','one-dimensional',50);
%     figure;
%     pcolor(AMD(:,:,1))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/OneDimStaticSwitchOffStartMap%d.jpg',SensorStart));
%     figure;
%     pcolor(AMD(:,:,100))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/OneDimStaticSwitchOffEndMap%d.jpg',SensorStart));
%     figure;
%     pcolor(ACMD(:,:,100))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/OneDimStaticSwitchOffEndMapCoverage%d.jpg',SensorStart));
%     figure;
%     plot(Coverage_Array,'r');
%     xlabel('Iteration');
%     ylabel('Coverage');
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/OneDimStaticSwitchOffCoverageVsIteration%d.jpg',SensorStart));
%     MaxCov = 0;
%     for i = 1:1:100
%         if Coverage_Array(i) > MaxCov
%             MaxCov = Coverage_Array(i);
%             j=i;
%         else
%         end
%     end
%     MaxCovSensorSize(SensorStart,1) = MaxCov;
% end
% figure;
% plot(MaxCovSensorSize);
% xlabel('Sensor Size');
% ylabel('Maximum Coverage');
% saveas(gcf,sprintf('DissertationGraphs/OneDimension/OneDimStaticSwitchOffMaxCovVSSensorSize.jpg'));


% Sensor 2 steps
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(5,'left',1,2,100,false,'off','one-dimensional',50);
% for i = 1:1:100
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/Sensor2Steps/2DStaticSensorCoverageMap%d.jpg',i));
% end
% % Sensor 8 steps
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(5,'left',1,8,100,false,'off','one-dimensional',50);
% for i = 1:1:100
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/OneDimension/Sensor8Steps/2DStaticSensorCoverageMap%d.jpg',i));
% end
%% 2D Centre
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'centre',1,2,100,false,'off','square',40);
% for i = 1:1:100
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Centre/Steps/2DStaticSensorCoverageMap%d.jpg',i));
% end
% MaxCovSensorSize = [];
% for SensorStart = 1:1:15
%     [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'centre',1,SensorStart,100,false,'off','square',40);
%     figure;
%     pcolor(ACMD(:,:,1))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Centre/2DStaticSensorCoverageStartMap%d.jpg',SensorStart));
%     figure;
%     pcolor(ACMD(:,:,100))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Centre/2DStaticSensorCoverage%d.jpg',SensorStart));
%     figure;
%     plot(Coverage_Array,'r');
%     xlabel('Iteration');
%     ylabel('Coverage');
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Centre/2DStaticSensorCoverageVsIteration%d.jpg',SensorStart));
%     MaxCov = 0;
%     for i = 1:1:100
%         if Coverage_Array(i) > MaxCov
%             MaxCov = Coverage_Array(i);
%             j=i;
%         else
%         end
%     end
%     MaxCovSensorSize(SensorStart,1) = MaxCov;
% end
% figure;
% plot(MaxCovSensorSize);
% xlabel('Sensor Size');
% ylabel('Maximum Coverage');
% saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Centre/2DStaticSensorMaxCovVSSensorSize.jpg'));
%% The Corner Problem
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,2,100,false,'off','square',40);
% for i = 1:1:100
%     figure;
%     pcolor(AMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/2DStaticSensorMap%d.jpg',i));
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/2DStaticSensorCoverageMap%d.jpg',i));
% end
% MaxCovSensorSize = [];
% for SensorStart = 1:1:15
%     [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,SensorStart,100,false,'off','square',40);
%     figure;
%     pcolor(ACMD(:,:,1))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Corner/2DStaticSensorCoverageStartMap%d.jpg',SensorStart));
%     figure;
%     pcolor(ACMD(:,:,100))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Corner/2DStaticSensorCoverage%d.jpg',SensorStart));
%     figure;
%     plot(Coverage_Array,'r');
%     xlabel('Iteration');
%     ylabel('Coverage');
%     saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Corner/2DStaticSensorCoverageVsIteration%d.jpg',SensorStart));
%     MaxCov = 0;
%     for i = 1:1:100
%         if Coverage_Array(i) > MaxCov
%             MaxCov = Coverage_Array(i);
%             j=i;
%         else
%         end
%     end
%     MaxCovSensorSize(SensorStart,1) = MaxCov;
% end
% figure;
% plot(MaxCovSensorSize);
% xlabel('Sensor Size');
% ylabel('Maximum Coverage');
% saveas(gcf,sprintf('DissertationGraphs/NoSwitch/Corner/2DStaticSensorMaxCovVSSensorSize.jpg'));

% %% Deterministic vs Probablistic 
% %Deterministic
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,2,200,false,'deterministic','square',40);
% for i = 1:1:200
% %     figure;
% %     pcolor(AMD(:,:,i))
% %     colormap(gray(EC+1))
% %     saveas(gcf,sprintf('DissertationGraphs/Deterministic2/2DStaticSensorMap%d.jpg',i));
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Deterministic2/2DStaticSensorCoverageMap%d.jpg',i));
% end
% figure;
% plot(Coverage_Array,'r');
% xlabel('Iteration');
% ylabel('Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Deterministic2/2DStaticSensorCoverageVsIterationDeterministic.jpg'));
% figure;
% histogram(SensorSizeArray);
% xlabel('Sensor Size');
% ylabel('Count');
% saveas(gcf,sprintf('DissertationGraphs/Deterministic2/2DStaticSensorSensorHistogramDeterministic.jpg'));
% figure;
% hold on;
% for j=1:1:100
%     plot(SensorSizeArray(:,j));
% end
% xlabel('Iteration');
% ylabel('Sensor Size');
% hold off;
% saveas(gcf,sprintf('DissertationGraphs/Deterministic2/2DStaticSensorSensorSizeVsIterationDeterministic.jpg'));
% 
% %Probabilistic
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,2,200,false,'probabilistic','square',40);
% for i = 1:1:200
% %     figure;
% %     pcolor(AMD(:,:,i))
% %     colormap(gray(EC+1))
% %     saveas(gcf,sprintf('DissertationGraphs/Probabilistic2/2DStaticSensorMap%d.jpg',i));
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Probabilistic2/2DStaticSensorCoverageMap%d.jpg',i));
% end
% figure;
% plot(Coverage_Array,'r');
% xlabel('Iteration');
% ylabel('Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Probabilistic2/2DStaticSensorCoverageVsIterationProbabilistic.jpg'));
% figure;
% histogram(SensorSizeArray);
% xlabel('Sensor Size');
% ylabel('Count');
% saveas(gcf,sprintf('DissertationGraphs/Probabilistic2/2DStaticSensorSensorHistogramProbabilistic.jpg'));
% figure;
% hold on;
% for j=1:1:100
%     plot(SensorSizeArray(:,j));
% end
% xlabel('Iteration');
% ylabel('Sensor Size');
% hold off;
% saveas(gcf,sprintf('DissertationGraphs/Probabilistic2/2DStaticSensorSensorSizeVsIterationProbabilistic.jpg'));

%% Flexible vs Static
% %Flexible Probabilistic
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',2,2,200,false,'probabilistic','square',40);
% figure;
% pcolor(AMD(:,:,1))
% colormap(gray(EC+1))
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorMap%d.jpg',1));
% figure;
% pcolor(ACMD(:,:,1))
% colormap(gray(EC+1))
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorCoverageMap%d.jpg',1));
% figure;
% pcolor(AMD(:,:,200))
% colormap(gray(EC+1))
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorMap%d.jpg',100));
% figure;
% pcolor(ACMD(:,:,200))
% colormap(gray(EC+1))
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorCoverageMap%d.jpg',100));
% figure;
% plot(Coverage_Array,'r');
% xlabel('Iteration');
% ylabel('Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorCoverageVsIterationProbabilistic.jpg'));
% figure;
% histogram(SensorSizeArray);
% xlabel('Sensor Size');
% ylabel('Count');
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorSensorHistogramProbabilistic.jpg'));
% figure;
% hold on;
% for j=1:1:100
%     plot(SensorSizeArray(:,j));
% end
% xlabel('Iteration');
% ylabel('Sensor Size');
% hold off;
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Probabilistic/2DFlexibleSensorSensorSizeVsIterationProbabilistic.jpg'));
% 
% %Flexible - Deterministic
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',2,2,200,false,'deterministic','square',40);
% for i = 1:1:200
%     figure;
%     pcolor(AMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Flexible/Deterministic/2DFlexibleSensorMap%d.jpg',i));
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Flexible/Deterministic/2DFlexibleSensorCoverageMap%d.jpg',i));
% end
% figure;
% plot(Coverage_Array,'r');
% xlabel('Iteration');
% ylabel('Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Deterministic/2DFlexibleSensorCoverageVsIterationDeterministic.jpg'));
% figure;
% histogram(SensorSizeArray);
% xlabel('Sensor Size');
% ylabel('Count');
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Deterministic/2DFlexibleSensorSensorHistogramDeterministic.jpg'));
% figure;
% hold on;
% for j=1:1:100
%     plot(SensorSizeArray(:,j));
% end
% xlabel('Iteration');
% ylabel('Sensor Size');
% hold off;
% saveas(gcf,sprintf('DissertationGraphs/Flexible/Deterministic/2DFlexibleSensorSensorSizeVsIterationDeterministic.jpg'));

%Static - Deterministic
% MaxCovSensorSize=[];
% for SensorStart = 1:1:8
%     [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,SensorStart,200,false,'deterministic','square',40);
%     MaxCov = 0;
%     for i = 1:1:200
%         if Coverage_Array(i) > MaxCov
%             MaxCov = Coverage_Array(i);
%             j=i;
%         else
%         end
%     end
%     figure;
%     pcolor(AMD(:,:,j))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/2DStaticDeterministicSensorMapMAX%d.jpg',SensorStart));
%     figure;
%     pcolor(ACMD(:,:,j))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/2DStaticDeterministicSensorCoverageMapMAX%d.jpg',SensorStart));
%     figure;
%     pcolor(AMD(:,:,j))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/2DStaticDeterministicSensorMap200_%d.jpg',SensorStart));
%     figure;
%     pcolor(ACMD(:,:,j))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/2DStaticDeterministicSensorCoverageMap200_%d.jpg',SensorStart));
%     MaxCovSensorSize(SensorStart,1) = MaxCov;
% end
% figure;
% plot(MaxCovSensorSize);
% xlabel('Sensor Size');
% ylabel('Maximum Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/2DStaticDeterministicMaxCovVSSensorSize.jpg'));
% 
% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'corner',1,2,200,false,'deterministic','square',40);
% for i = 1:1:200
%     figure;
%     pcolor(AMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/Sensor2/2DStaticSensorMap%d.jpg',i));
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/Sensor2/2DStaticSensorCoverageMap%d.jpg',i));
% end
% figure;
% plot(Coverage_Array,'r');
% xlabel('Iteration');
% ylabel('Coverage');
% saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/Sensor2/2DStaticSensorCoverageVsIterationDeterministic.jpg'));
% figure;
% histogram(SensorSizeArray);
% xlabel('Sensor Size');
% ylabel('Count');
% saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/Sensor2/2DStaticSensorSensorHistogramDeterministic.jpg'));
% figure;
% hold on;
% for j=1:1:100
%     plot(SensorSizeArray(:,j));
% end
% xlabel('Iteration');
% ylabel('Sensor Size');
% hold off;
% saveas(gcf,sprintf('DissertationGraphs/Static/Deterministic/Sensor2/2DStaticSensorSensorSizeVsIterationDeterministic.jpg'));


%% Narrow Gap
MaxCovGapSize=[];
for GapSize = 1:1:10
    [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'top',1,2,1000,false,'probabilistic','narrow-gap',GapSize);
    figure;
    pcolor(ACMD(:,:,1))
    colormap(gray(EC+1))
    saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexSensorMapGapSize%d.jpg',GapSize));
    figure;
    pcolor(ACMD(:,:,1000))
    colormap(gray(EC+1))
    saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexSensorCoverageMapGapSize%d.jpg',GapSize));
    figure;
    plot(Coverage_Array,'r');
    xlabel('Iteration');
    ylabel('Coverage');
    saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexSensorCoverageVsIterationGapSize%d.jpg',GapSize));
    figure;
    histogram(SensorSizeArray);
    xlabel('Sensor Size');
    ylabel('Count');
    saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexSensorSensorHistogramGapSize%d.jpg',GapSize));
    figure;
    hold on;
    for i=1:1:100
        plot(SensorSizeArray(:,i));
    end
    xlabel('Iteration');
    ylabel('Sensor Size');
    hold off;
    saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexSensorSensorSizeVsIterationGapSize%d.jpg',GapSize));
    
    MaxCov = 0;
    for i = 1:1:1000
        if Coverage_Array(i) > MaxCov
            MaxCov = Coverage_Array(i);
            j=i;
        else
        end
    end
    MaxCovGapSize(GapSize,1) = MaxCov;
end
figure;
plot(MaxCovGapSize);
xlabel('Gap Size');
ylabel('Maximum Coverage');
saveas(gcf,sprintf('DissertationGraphs/NarrowGapP/GapSize/2DFlexDeterministicMaxCovVSGapSize.jpg'));

% [Coverage_Array,AMD,ACMD,SensorSizeArray,EC] = Coverage_Simulator(100,'top',2,2,700,false,'deterministic','narrow-gap',3);
% for i = 1:1:700
%     figure;
%     pcolor(ACMD(:,:,i))
%     colormap(gray(EC+1))
%     saveas(gcf,sprintf('DissertationGraphs/NarrowGap/Gap3Steps/2DFlexibleSensorCoverageMap%d.jpg',i));
% end
