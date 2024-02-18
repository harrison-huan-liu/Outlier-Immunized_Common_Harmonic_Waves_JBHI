%% simulated data for Neuroimage on window sizes
%HWF
m1=0.561;  
m2=0.550;  
m3=0.653; 
s1=0.017;  
s2=0.021;  
s3=0.015;
mean1=[m1,m2,m3];
std1=[s1,s2,s3];
%SURV
mm1=0.586;  
mm2=0.587;  
mm3=0.661;
ss1=0.014;
ss2=0.020;
ss3=0.014;
mean2=[mm1,mm2,mm3];
std2=[ss1,ss2,ss3];   

Time=[1 2 3];
ax=gca;
h=barwitherr([std1' std2'], Time, [mean1' mean2']);
set(ax,'XTick',[1 2 3],'XTickLabel',{'CN/EMCI','EMCI/LMCI','CN/LMCI'});
ylabel('AUROC','FontSize',14,'FontName','Times New Roman','fontweight','bold')
% title('Title of Experiment','FontSize',14)
legend('HWF','SURV','FontWeight','bold','Position',[0.7535,0.7545,0.0964,0.1548])

xtips1 = h(1).XEndPoints;
ytips1 = h(1).YEndPoints+std1;
str1=strcat(num2str(h(1).YData(1)*100,'%0.0f%%'));
str2=strcat(num2str(h(1).YData(2)*100,'%0.0f%%'));
str3=strcat(num2str(h(1).YData(3)*100,'%0.0f%%'));
labels1=["","",""];
labels1(1,1)=str1;
labels1(1,2)=str2;
labels1(1,3)=str3;
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom')
xtips2 = h(2).XEndPoints;
ytips2 = h(2).YEndPoints+std2;
str1=strcat(num2str(h(2).YData(1)*100,'%0.0f%%'));
str2=strcat(num2str(h(2).YData(2)*100,'%0.0f%%'));
str3=strcat(num2str(h(2).YData(3)*100,'%0.0f%%'));
labels2=["","",""];
labels2(1,1)=str1;
labels2(1,2)=str2;
labels2(1,3)=str3;
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom')

set(h(1),'FaceColor',[248/255 118/255 109/255],'LineWidth',1.2,'BarWidth',0.8)
set(h(2),'FaceColor',[97/255 156/255 255/255],'LineWidth',1.2,'BarWidth',0.8)
% set(h(1),'FaceColor',[0/255 0/255 0/255],'LineWidth',1.2,'BarWidth',0.8)
% set(h(2),'FaceColor',[255/255 255/255 255/255],'LineWidth',1.2,'BarWidth',0.8)
set(gca,'LineWidth',1,'fontsize',14,'FontName','Times New Roman','YLim',[0,1]);
set(h,'linewidth',1.2);

saveas(gca,'AUCbar.png')
