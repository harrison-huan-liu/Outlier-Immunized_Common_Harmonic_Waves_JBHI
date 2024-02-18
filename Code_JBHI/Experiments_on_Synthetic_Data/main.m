close all;
clear;
clc;

%% Visulize ground truth
X=[0,0,0];
Y=[0,0,0];
Z=[0,0,0];
U=[1,0,0];
V=[0,1,0];
W=[0,0,1];
% figure(6)
% quiver3(X,Y,Z,U,V,W,0.5,'-g','LineWidth',5)
% xlabel('x')
% ylabel('y')
% zlabel('z')
% view([1,1,1])
% grid off;
% axis off;

ave1=cell(2,1);
sss1=cell(2,1);
ave2=cell(2,1);
sss2=cell(2,1);
toji=cell(2,1);
pvalue=cell(2,1);
d1=cell(34,2);
% d1=zeros(100,2);
%% Generate subjects
% for outliernum=2:3:35
outliernum=8;
% for outliernum=2:35
%     for loop=1:100
        normalnum=100-outliernum;
        EachRotationNum=floor(normalnum/7);
        leftnum=100-EachRotationNum*7-outliernum;
        AllRotationnorNum=100;

        RotationMatrix=cell(100,1);
        u1=[1,1,1]/sqrt(1+1+1);
        maxTheta=0;
        maxThetaindex=0;
        for i=1:EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u1);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u2=[1,1,5]/sqrt(1*1+1*1+5*5);
        for i=EachRotationNum+1:2*EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u2);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u3=[1,5,1]/sqrt(1*1+5*5+1*1);
        for i=2*EachRotationNum+1:3*EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u3);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u4=[5,1,1]/sqrt(5*5+1*1+1*1);
        for i=3*EachRotationNum+1:4*EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u4);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u5=[1,1,2]/sqrt(2*2+1*1+1*1);
        for i=4*EachRotationNum+1:5*EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u5);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u6=[1,2,1]/sqrt(1*1+2*2+1*1);
        for i=5*EachRotationNum+1:6*EachRotationNum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u6);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        u7=[2,1,1]/sqrt(1*1+2*2+1*1);
        for i=6*EachRotationNum+1:7*EachRotationNum+leftnum
            Theta=normrnd(0,pi/8);
            RotationMatrix{i}=Calculate_rotation(Theta,u7);
            if maxTheta<Theta
                maxTheta=Theta;
                maxThetaindex=i;
            end
        end
        uall=cell(7,1);
        uall{1}=u1;
        uall{2}=u2;
        uall{3}=u3;
        uall{4}=u4;
        uall{5}=u5;
        uall{6}=u6;
        uall{7}=u7;

        for i=7*EachRotationNum+1+leftnum:7*EachRotationNum+outliernum+leftnum
            Theta1=0;
            while Theta1>1.0||Theta1<0.7 % abs(Theta1)>0.7||abs(Theta1)<0.5
                Theta1=normrnd(0,pi/3);
            end
            out=randi(7);
            RotationMatrix{i}=Calculate_rotation(Theta1,uall{out}); %out
        end

        % out=1;
        % Theta1=0;
        % while abs(Theta1)>0.8||abs(Theta1)<0.7
        %     Theta1=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta1,u1);
        % out=out+1;
        % Theta2=0;
        % while abs(Theta2)>0.8||abs(Theta2)<0.7
        %     Theta2=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta2,u2);
        % out=out+1;
        % Theta3=0;
        % while abs(Theta3)>0.8||abs(Theta3)<0.7
        %     Theta3=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta3,u3);
        % out=out+1;
        % Theta4=0;
        % while abs(Theta4)>0.8||abs(Theta4)<0.7
        %     Theta4=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta4,u4);
        % out=out+1;
        % Theta5=0;
        % while abs(Theta5)>0.8||abs(Theta5)<0.7
        %     Theta5=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta5,u5);
        % out=out+1;
        % Theta6=0;
        % while abs(Theta6)>0.8||abs(Theta6)<0.7
        %     Theta6=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta6,u6);
        % out=out+1;
        % Theta7=0;
        % while abs(Theta7)>0.8||abs(Theta7)<0.7
        %     Theta7=normrnd(0,pi/5);
        % end
        % RotationMatrix{7*EachRotationNum+out}=Calculate_rotation(Theta7,u7);
        % out=out+1;

        AllRotationNum=size(RotationMatrix,1);
        %% Visulization of all subject
        figure(2)
        for i=1:AllRotationNum
        X=[0,0,0];
        Y=[0,0,0];
        Z=[0,0,0];
        U=RotationMatrix{i}(:,1)';
        V=RotationMatrix{i}(:,2)';
        W=RotationMatrix{i}(:,3)';
        % subplot(4,5,i)
        quiver3(X,Y,Z,U,V,W,0.5,'color','#802A2A','LineWidth',5) % '-b'
        % axis([-1 12 -1 12 -1 12])
        xlabel('x')
        ylabel('y')
        zlabel('z')
        view([1,1,1])
        grid off;
        axis off;
        % I=getimage(f2); % ?????????????
        name=['Subject_new_',mat2str(i),'.png'];
        % imwrite(I,name)%???????
        saveas(gcf,name)
        end

        %% Visulize average rotation
        AverageRotation=zeros(3);
        for i=1:AllRotationNum
            AverageRotation=AverageRotation+RotationMatrix{i};
        end
        AverageRotation=AverageRotation/AllRotationNum;
    %     figure(3)
    %     hold on
    %     plot3([0,AverageRotation(1,1)],[0,AverageRotation(1,2)],[0,AverageRotation(1,3)],'-k','LineWidth',5);
    %     plot3([0,AverageRotation(2,1)],[0,AverageRotation(2,2)],[0,AverageRotation(2,3)],'-k','LineWidth',5);
    %     plot3([0,AverageRotation(3,1)],[0,AverageRotation(3,2)],[0,AverageRotation(3,3)],'-k','LineWidth',5);
    %     xlabel('x')
    %     ylabel('y')
    %     zlabel('z')
    %     view([1,1,1])
    %     grid off;
    %     axis off;

        %% Use our method to calculate Stiefel mean (op)
        NodeNum=3;
        p=3;
        gama=0.002;
        Phi_k=RotationMatrix{maxThetaindex};
        Phi=cell(2,1);
        ax=zeros(300,2);
        ex=cell(2,1);
        iter1=1;
        iter=1;
        err=1;
        while err>0.01&&iter1<100 %
            Phi_increment=zeros(NodeNum,p);
            for i=1:AllRotationNum
                ax(iter1,1)=ax(iter1,1)+p-trace(RotationMatrix{i}'*Phi_k);
                Phi_increment=Phi_increment+(Phi_k*RotationMatrix{i}'*Phi_k-RotationMatrix{i})/sqrt(p-trace(RotationMatrix{i}'*Phi_k)+0.0001);
            end
            ex{iter,1}=ax';
            Phi_increment=-gama*Phi_increment;
            [Q,R]=qr((eye(NodeNum)-Phi_k*Phi_k')*Phi_increment,0);
            A=Phi_k'*Phi_increment;
            BC=expm([A,-R';R,zeros(p)])*[eye(p);zeros(p)];        
            Phi{iter}=Phi_k*BC(1:p,:)+Q*BC(p+1:2*p,:);
            Phi_k=Phi{iter};
            err=norm(Phi_increment,'fro');
            iter1=iter1+1;
            iter=iter+1;
        end

    %%     Visulize our result
    %     figure(4)
    %     X=[0,0,0];
    %     Y=[0,0,0];
    %     Z=[0,0,0];
    %     U=Phi{iter-1}(:,1)';
    %     V=Phi{iter-1}(:,2)';
    %     W=Phi{iter-1}(:,3)';
    %     quiver3(X,Y,Z,U,V,W,0.5,'-r','LineWidth',5)
    %     xlabel('x')
    %     ylabel('y')
    %     zlabel('z')
    %     view([1,1,1])
    %     grid off;
    %     axis off;


        %% Use our method to calculate Stiefel mean
        Phi_k1=RotationMatrix{maxThetaindex};
        Phi1=cell(2,1);
        iter3=1;
        iter2=1;
        err1=1;
        while err1>0.1&&iter3<100 %
            Phi_increment1=zeros(NodeNum,p);
            for i=1:AllRotationNum
                ax(iter3,2)=ax(iter3,2)+p-trace(RotationMatrix{i}'*Phi_k1);
                Phi_increment1=Phi_increment1+Phi_k1*RotationMatrix{i}'*Phi_k1-RotationMatrix{i};
            end
            Phi_increment1=-gama*Phi_increment1;
            [Q,R]=qr((eye(NodeNum)-Phi_k1*Phi_k1')*Phi_increment1,0);
            A=Phi_k1'*Phi_increment1;
            BC=expm([A,-R';R,zeros(p)])*[eye(p);zeros(p)];
            Phi1{iter2}=Phi_k1*BC(1:p,:)+Q*BC(p+1:2*p,:);
            Phi_k1=Phi1{iter2};
            err1=norm(Phi_increment1,'fro');
            iter3=iter3+1;
            iter2=iter2+1;
        end
    %%     Visulize our result
%         figure(5)
%         X=[0,0,0];
%         Y=[0,0,0];
%         Z=[0,0,0];
%         U=Phi1{iter2-1}(:,1)';
%         V=Phi1{iter2-1}(:,2)';
%         W=Phi1{iter2-1}(:,3)';
%         quiver3(X,Y,Z,U,V,W,0.5,'-','color','[0.47 0.25 0.80]','LineWidth',5)
%         xlabel('x')
%         ylabel('y')
%         zlabel('z')
%         view([1,1,1])
%         grid off;
%         axis off;


        %%

%         figure;
%         hold on
        v=[-1,-1,1]/sqrt(3);
        v_transform1=cell(AllRotationNum,1);
        v_transform2=cell(AllRotationNum,1);
        v_transform3=cell(AllRotationNum,1);
%         [x, y, z]=sphere(50);
%         s=surf(x,y,z,'FaceAlpha',0.5);
%         view([0,30])
%         axis([-1 0 -1 0 -0.1 0.9])
        % s.EdgeColor = 'none';,
        % sphere(100);

%         ave_v_transform=AverageRotation*v';
%         plot3(ave_v_transform(1),ave_v_transform(2),ave_v_transform(3),'Marker','d','color','k','MarkerSize',10,'MarkerFaceColor','k');
%         for i=1:2:AllRotationnorNum
%             v_transform1{i}=RotationMatrix{i}*v';
%             plot3(v_transform1{i}(1),v_transform1{i}(2),v_transform1{i}(3),'Marker','.','color','b','MarkerSize',25,'MarkerFaceColor','b');
%             
%         end
%         
%         for i=1:10
%             text(v_transform1{i*3+3}(1)-0.03,v_transform1{i*3+3}(2),v_transform1{i*3+3}(3),mat2str(i),'FontSize',8,'FontName','times new roman','FontWeight','bold');
%         end
% 
%         for i=AllRotationnorNum+1:AllRotationNum-4
%             v_transform1{i}=RotationMatrix{i}*v';
%             plot3(v_transform1{i}(1),v_transform1{i}(2),v_transform1{i}(3),'Marker','.','color','#802A2A','MarkerSize',25,'MarkerFaceColor','y');
%             % text(v_transform1{i}(1),v_transform1{i}(2),v_transform1{i}(3),mat2str(i));
%         end
% 
%         for i=1:iter-1
%             v_transform2{i}=Phi{i}*v';
%             plot3(v_transform2{i}(1),v_transform2{i}(2),v_transform2{i}(3),'Marker','.','color','r','MarkerSize',25,'MarkerFaceColor','r');
%             % text(v_transform2{i}(1)+0.1,v_transform2{i}(2),v_transform2{i}(3),num2str(i));
%         end
% 
%         for i=1:iter2-1
%             v_transform3{i}=Phi1{i}*v';
%             plot3(v_transform3{i}(1),v_transform3{i}(2),v_transform3{i}(3),'Marker','.','color','[0.47 0.25 0.80]','MarkerSize',25,'MarkerFaceColor','[0.47 0.25 0.80]');
%             % text(v_transform3{i}(1)+0.1,v_transform3{i}(2),v_transform3{i}(3),num2str(i));
%         end
%         plot3(v(1),v(2),v(3),'Marker','p','color','g','MarkerSize',10,'MarkerFaceColor','g');
        original_v=[1,1,1];
        original=diag(original_v);
%         original=[1 1 1; 1 1 1; 1 1 1];
%         d1{(outliernum+1)/3,1}=sqrt(3-(v_transform2{iter-1}(1)+1/sqrt(3))^2+(v_transform2{iter-1}(2)+1/sqrt(3))^2+(v_transform2{iter-1}(3)-1/sqrt(3))^2);
%         d1{(outliernum+1)/3,2}=sqrt(3-(v_transform3{iter2-1}(1)+1/sqrt(3))^2+(v_transform3{iter2-1}(2)+1/sqrt(3))^2+(v_transform3{iter2-1}(3)-1/sqrt(3))^2);
        d1{outliernum-1,1}(loop)=sqrt(trace(1-Phi1{iter2-1}.'*original));
        d1{outliernum-1,2}(loop)=sqrt(trace(1-Phi{iter-1}.'*original));

%         xlabel('x')
%         ylabel('y')
%         zlabel('z')
%         grid off;
%         axis off;

        %% check the orthogonality
        c1=cell(2,1);
        for i=1:AllRotationNum
            c1{i}=RotationMatrix{i}'*RotationMatrix{i};
        end
        c2=cell(2,1);
        for i=1:iter1-1
            c2{i}=Phi{i}'*Phi{i};
        end
        c3=cell(2,1);
        for i=1:iter3-1
            c3{i}=Phi1{i}'*Phi1{i};
        end
    
%         filename=['outliers_del_',mat2str(outliernum),'.png'];
%         saveas(gcf,filename)
%     end
    pvalue{outliernum-1,1}=permutationTest(d1{outliernum-1,1},d1{outliernum-1,2},10000);
    ave1{outliernum-1,1}=mean(d1{outliernum-1,1});
    sss1{outliernum-1,1}=std(d1{outliernum-1,1});
    ave2{outliernum-1,1}=mean(d1{outliernum-1,2});
    sss2{outliernum-1,1}=std(d1{outliernum-1,2});
    toji{outliernum-1,1}=ave2;
    toji{outliernum-1,2}=sss2;
    toji{outliernum-1,3}=ave1;
    toji{outliernum-1,4}=sss1;
% end
writecell(d1,'distance.xlsx','Sheet','Temperatures','Range','B2')
writecell(ave1,'ave1.xlsx','Sheet','Temperatures','Range','B2')
writecell(ave2,'ave2.xlsx','Sheet','Temperatures','Range','B2')
writecell(sss1,'sss1.xlsx','Sheet','Temperatures','Range','B2')
writecell(sss2,'sss2.xlsx','Sheet','Temperatures','Range','B2')
