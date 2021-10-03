function scoreplot(PC,score,vars)
% This function uses PCA analysis data to create a biplot with observations
% and variables vectors. 
% Input = PC (vector), score (matrix), vars(cell array)
% Output = a figure
% Last Modified: Dec. 23, 2016
% Writeen by: Yaray Ku

% plot the normalized the score values
scatter(score(:,1)/max(max(abs(score))),score(:,2)/max(max(abs(score))),...
    'ko','filled','Sizedata',16)
hold on
% plot the variables (compounds)
for l = 1:10
    line([PC(l,1),0],[PC(l,2),0],'color','r','MarkerSize',8,'tag','lines')
    text(PC(l,1)+0.05,PC(l,2)+0.02,vars{l},'color','r','Fontsize',12)
end
legend('Observation','Variable Contribution','location','northoutside')
end