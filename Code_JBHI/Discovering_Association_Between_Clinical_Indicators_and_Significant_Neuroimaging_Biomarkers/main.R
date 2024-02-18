# Title     : mmse_alpha
# Objective : mmse_alpha
# Created by: LH
# Created on: 2021/08/11
setwd("D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results")
#library("latex2exp")
library("ggplot2")
library("R.matlab")
library("lattice")
library("ggpubr")
library("svglite")

windowsFonts(myFont = windowsFont("Times New Roman"))
path<-("D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE")
pathname1<-file.path(path,'alpha_amy.mat')
pathname2<-file.path(path,'alpha_tau.mat')
pathname3<-file.path(path,'alpha_fdg.mat')
pathname4<-file.path(path,'MMSE_amy.mat')
pathname5<-file.path(path,'MMSE_tau.mat')
pathname6<-file.path(path,'MMSE_fdg.mat')
pathname7<-file.path(path,'DX_amy.mat')
pathname8<-file.path(path,'DX_tau.mat')
pathname9<-file.path(path,'DX_fdg.mat')
alpha_amy<-readMat(pathname1)
alpha_tau<-readMat(pathname2)
alpha_fdg<-readMat(pathname3)
MMSE_amy<-readMat(pathname4)
MMSE_tau<-readMat(pathname5)
MMSE_fdg<-readMat(pathname6)
#DX_amy<-readMat(pathname7)
#DX_tau<-readMat(pathname8)
#DX_fdg<-readMat(pathname9)
#print(MMSE_amy[[1]][,1])
#print(alpha_amy[[1]][,1])
DX_amy<-c("CN")
DX_tau<-c("CN")
DX_fdg<-c("CN")
iternum1<-vector("double", 270)
iternum2<-vector("double", 224)
iternum3<-vector("double", 150)
iternum4<-vector("double", 100)
iternum5<-vector("double", 327)
iternum6<-vector("double", 389)
for (a in seq_along(iternum1)){
  DX_amy[a]<-"CN"
}
for (b in seq_along(iternum2)){
  DX_amy[b+270]<-"LMCI"
}
for (c in seq_along(iternum3)){
  DX_tau[c]<-"CN"
}
for (d in seq_along(iternum4)){
  DX_tau[d+150]<-"LMCI"
}
for (e in seq_along(iternum5)){
  DX_fdg[e]<-"CN"
}
for (f in seq_along(iternum6)){
  DX_fdg[f+327]<-"LMCI"
}

seq_num_amy<-vector('double',60)
p_value_amy<-vector('double',60)
r_squared_1_amy<-vector('double',60)
r_squared_2_amy<-vector('double',60)

seq_num_tau<-vector('double',60)
p_value_tau<-vector('double',60)
r_squared_1_tau<-vector('double',60)
r_squared_2_tau<-vector('double',60)

seq_num_fdg<-vector('double',60)
p_value_fdg<-vector('double',60)
r_squared_1_fdg<-vector('double',60)
r_squared_2_fdg<-vector('double',60)

j<-1
repeat{
  rec1<-data.frame(MMSE_amy=MMSE_amy[[1]][,1], alpha_amy=alpha_amy[[1]][,j], DX_amy=DX_amy[]) # 55
  #print(rec1)
  #rec1$DX_amy <- factor(rec1$DX_amy)
  #p1<-ggplot(data = rec1, mapping = aes(x = MMSE_amy, y = alpha_amy, color=DX_amy))+geom_point(alpha = 0.5, size=6)+geom_smooth(method = "lm", se = FALSE)
  linear1<-lm(formula = alpha_amy[[1]][,j]~MMSE_amy[[1]][,1])
  performance1<-summary(linear1)
  seq_num_amy[j]<-j
  p_value_amy[j]<-performance1$coefficients[2,4]
  r_squared_1_amy[j]<-performance1$r.squared
  r_squared_2_amy[j]<-performance1$adj.r.squared
  #print(j)
  #print(performance1$coefficients[2,4])
  #print(performance1$r.squared)
  j<-j+1

  if(j>60){
    break
  }
}

mmsedata_amy<-data.frame(seq_num_amy,p_value_amy,r_squared_1_amy,r_squared_2_amy,stringsAsFactors = FALSE)
#write.table(mmsedata_amy,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/mmsedata_amy.csv',sep = ",", row.names = FALSE)

k<-1
repeat{
  rec2<-data.frame(MMSE_tau=MMSE_tau[[1]][,1], alpha_tau=alpha_tau[[1]][,k], DX_tau=DX_tau[]) # 33,12
  #print(rec2)
  #rec2$DX_tau <- factor(rec2$DX_tau)
  #p2<-ggplot(data = rec2, mapping = aes(x = MMSE_tau, y = alpha_tau, color=DX_tau))+geom_point(alpha = 0.5, size=6)+geom_smooth(method = "lm", se = FALSE)
  linear2<-lm(formula = alpha_tau[[1]][,k]~MMSE_tau[[1]][,1])
  performance2<-summary(linear2)
  seq_num_tau[k]<-k
  p_value_tau[k]<-performance2$coefficients[2,4]
  r_squared_1_tau[k]<-performance2$r.squared
  r_squared_2_tau[k]<-performance2$adj.r.squared
  #print(k)
  #print(performance2$coefficients[2,4])
  #print(performance2$r.squared)
  k<-k+1

  if(k>60){
    break
  }
}

mmsedata_tau<-data.frame(seq_num_tau,p_value_tau,r_squared_1_tau,r_squared_2_tau,stringsAsFactors = FALSE)
#write.table(mmsedata_tau,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/mmsedata_tau.csv',sep = ",", row.names = FALSE)

i<-1
repeat{
  rec3<-data.frame(MMSE_fdg=MMSE_fdg[[1]][,1], alpha_fdg=alpha_fdg[[1]][,i], DX_fdg=DX_fdg[]) # 53  *5+5
  #print(rec3)
  #rec3$DX_fdg <- factor(rec3$DX_fdg)
  #p3<-ggplot(data = rec3, mapping = aes(x = MMSE_fdg, y = alpha_fdg, colour = DX_fdg))+geom_point(alpha = 0.5, size=6)+geom_smooth(method = "lm", se = FALSE)
  linear3<-lm(formula = alpha_fdg[[1]][,i]~MMSE_fdg[[1]][,1])
  performance3<-summary(linear3)
  seq_num_fdg[i]<-i
  p_value_fdg[i]<-performance3$coefficients[2,4]
  r_squared_1_fdg[i]<-performance3$r.squared
  r_squared_2_fdg[i]<-performance3$adj.r.squared
  #print(i)
  #print(performance3$coefficients[2,4])
  #print(performance3$r.squared)
  #print(performance3$adj.r.squared)
  #plot(MMSE_fdg[[1]][,1],alpha_fdg[[1]][,1],abline(linear3))
  i<-i+1

  if(i>60){
    break
  }
}

mmsedata_fdg<-data.frame(seq_num_fdg,p_value_fdg,r_squared_1_fdg,r_squared_2_fdg,stringsAsFactors = FALSE)
#write.table(mmsedata_fdg,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/mmsedata_fdg.csv',sep = ",", row.names = FALSE)

#which(r_squared_1_amy==max(r_squared_1_amy),arr.ind=TRUE)
num_amy<-sort(r_squared_1_amy, decreasing=T)
order_amy<-order(r_squared_1_amy, decreasing=T)
num_p_amy<-sort(p_value_amy, decreasing=F)
order_p_amy<-order(p_value_amy, decreasing=F)
#rank(r_squared_1_amy)

num_tau<-sort(r_squared_1_tau, decreasing=T)
order_tau<-order(r_squared_1_tau, decreasing=T)
num_p_tau<-sort(p_value_tau, decreasing=F)
order_p_tau<-order(p_value_tau, decreasing=F)

num_fdg<-sort(r_squared_1_fdg, decreasing=T)
order_fdg<-order(r_squared_1_fdg, decreasing=T)
num_p_fdg<-sort(p_value_fdg, decreasing=F)
order_p_fdg<-order(p_value_fdg, decreasing=F)

order_num_amy<-data.frame(num_amy,order_amy,stringsAsFactors = FALSE)
#write.table(order_num_amy,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/order_num_amy.csv',sep = ",", row.names = FALSE)

order_num_tau<-data.frame(num_tau,order_tau,stringsAsFactors = FALSE)
#write.table(order_num_tau,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/order_num_tau.csv',sep = ",", row.names = FALSE)

order_num_fdg<-data.frame(num_fdg,order_fdg,stringsAsFactors = FALSE)
#write.table(order_num_fdg,file = 'D:/research/Nonliner Dimensional Reduction/Brian_network_harmonics/MMSE/results/order_num_fdg.csv',sep = ",", row.names = FALSE)

#select_amy<-num_amy[num_amy>0.1]
#select_tau<-num_tau[num_tau>0.1]
#select_fdg<-num_fdg[num_fdg>0.1]
#  num_amy[l]
#  order_amy[l]


#tnr=windowsFont(family = "Times New Roman")


print(DX_amy[1:50])
iternum<-vector("double", 10)
#p_amy<-vector("plot",20)
#linear_amy<-vector("list",20)
for (l in seq_along(iternum)){
  rec_amy<-data.frame(MMSE=MMSE_amy[[1]][,1], Energy=alpha_amy[[1]][,order_amy[l]], DX=DX_amy[]) # 55
  #print(rec_amy)
  #rec_amy$DX <- factor(rec_amy$DX)
  #pvalue<-p_value_amy[order_amy[l]]
  #r2<-num_amy[l]
  p_amy<-ggplot(data = rec_amy, mapping = aes(x = MMSE, y = Energy))+geom_point(alpha = 0.5, size = 0.5, mapping = aes(color=DX))+scale_color_manual(values = c("RED", "BLUE"))+geom_smooth(method = "lm", size=0.5, se = TRUE, fullrange=TRUE)+theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10, color = "black", family = "serif"), axis.title = element_text(face = "bold", family = "serif"))+ggpubr::stat_cor(method = 'pearson', aes(x = MMSE, y=Energy), size=4, label.x=18.5, face = "bold", family = "serif")
  #+labs(title = "Amyloid", face="bold")
  #, panel.grid.major =element_blank(), panel.background = element_blank(), axis.line = element_line(size = 0.3, colour = "black")
  #p_amy+xlim(10,35)+ylim(0,8)+scale_y_sqrt()
  #+annotate(geom = "text", x = 26, y = 1.0, hjust = 0, label = substitute(p==p_value, list(p_value=round(summary(lm(formula = alpha_amy[[1]][,order_amy[l]]~MMSE_amy[[1]][,1]))$coefficients[2,4], 8))))+annotate(geom = "text", x = 26, y = 0.9, hjust = 0, label = substitute(R^2==r_2, list(r_2=round(summary(lm(formula = alpha_amy[[1]][,order_amy[l]]~MMSE_amy[[1]][,1]))$r.squared, 4))))
  #+text(26.5,1.0,adj=0,substitute(p==pvalue, list(p_value=round(summary(lm(formula = alpha_amy[[1]][,order_amy[l]]~MMSE_amy[[1]][,1]))$coefficients[2,4], 4))))+text(26.5,0.9,adj=0,substitute(R^2==r_2, list(r_2=round(summary(lm(formula = alpha_amy[[1]][,order_amy[l]]~MMSE_amy[[1]][,1]))$r.squared, 4))))
  #xyplot(rec_amy$alpha~rec_amy$MMSE, main=substitute(paste("p=", pvalue), list(pvalue=round(summary(lm(rec_amy$alpha~rec_amy$MMSE))$coefficients[2,4],4))))
  filename<-paste("mmse_amy_plot_", order_amy[l], ".svg", sep = "")
  ggsave(filename, width = 4.0, height = 3.0)
  #svglite(filename, width = 4, height = 4)
  #dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
  #qplot(carat, price, data=dsamp, colour=clarity)
  #savePlot(filename = "Rplot",
  #         type ="svg",
  #         device = dev.cur(),
  #         restoreConsole = TRUE)
}

print(DX_tau[1:44])
for (m in seq_along(iternum)){
  rec_tau<-data.frame(MMSE=MMSE_tau[[1]][,1], Energy=alpha_tau[[1]][,order_tau[m]], DX=DX_tau[])
  p_tau<-ggplot(data = rec_tau, mapping = aes(x = MMSE, y = Energy))+geom_point(alpha = 0.5, size = 0.5, mapping = aes(color=DX))+scale_color_manual(values = c("RED", "BLUE"))+geom_smooth(method = "lm", size=0.5, se = TRUE, fullrange=TRUE)+theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10, color = "black", family = "serif"), axis.title = element_text(face = "bold", family = "serif"))+ggpubr::stat_cor(method = 'pearson', aes(x = MMSE, y=Energy), size=4, label.x=20, face = "bold", family = "serif")
  #+labs(title = "Tau", face="bold")
  #, panel.grid.major =element_blank(), panel.background = element_blank(), axis.line = element_line(size = 0.3, colour = "black")
  #p_tau+xlim(20,35)+ylim(2,16)+scale_y_sqrt()
  #+annotate(geom = "text", x = 26, y = 4.0, hjust = 0, label = substitute(p==p_value, list(p_value=round(summary(lm(formula = alpha_tau[[1]][,order_tau[m]]~MMSE_tau[[1]][,1]))$coefficients[2,4], 8))))+annotate(geom = "text", x = 26, y = 3.6, hjust = 0, label = substitute(R^2==r_2, list(r_2=round(summary(lm(formula = alpha_tau[[1]][,order_tau[m]]~MMSE_tau[[1]][,1]))$r.squared, 4))))
  filename<-paste("mmse_tau_plot_", order_tau[m], ".svg", sep = "")
  ggsave(filename, width = 4.0, height = 3.0)
}

print(DX_fdg[1:50])
for (n in seq_along(iternum)){
  rec_fdg<-data.frame(MMSE=MMSE_fdg[[1]][,1], Energy=alpha_fdg[[1]][,order_fdg[n]], DX=DX_fdg[])
  p_fdg<-ggplot(data = rec_fdg, mapping = aes(x = MMSE, y = Energy))+geom_point(alpha = 0.5, size = 0.5, mapping = aes(color=DX))+scale_color_manual(values = c("RED", "BLUE"))+geom_smooth(method = "lm", size = 0.5, se = TRUE, fullrange=TRUE)+theme(plot.title = element_text(hjust = 0.5), axis.text = element_text(size = 10, color = "black", family = "serif"), axis.title = element_text(face = "bold", family = "serif"))+ggpubr::stat_cor(method = 'pearson', aes(x = MMSE, y=Energy), size=4, label.x=25, face = "bold", family = "serif")
  #+labs(title = "FDG", face="bold")
  #, panel.grid.major =element_blank(), panel.background = element_blank(), axis.line = element_line(size = 0.3, colour = "black")
  #p_fdg+xlim(20,35)+ylim(0,8)+scale_y_sqrt()
  #+annotate(geom = "text", x = 26, y = 1.0, hjust = 0, label = substitute(p==p_value, list(p_value=round(summary(lm(formula = alpha_fdg[[1]][,order_fdg[n]]~MMSE_fdg[[1]][,1]))$coefficients[2,4], 8))))+annotate(geom = "text", x = 26, y = 0.9, hjust = 0, label = substitute(R^2==r_2, list(r_2=round(summary(lm(formula = alpha_fdg[[1]][,order_fdg[n]]~MMSE_fdg[[1]][,1]))$r.squared, 4))))
  filename<-paste("mmse_fdg_plot_", order_fdg[n], ".svg", sep = "")
  ggsave(filename, width = 4.0, height = 3.0)
}
