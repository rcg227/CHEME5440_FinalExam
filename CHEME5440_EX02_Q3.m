% CHEME 5440, Prelim 2 
% Question 3a

kf=1; % forward reaction rate
kr=1; % reverse reaction rate
X_tot=[0.2, 0.6, 1.0, 1.4, 1.8, 2.0];
Xtot_labels=["X_t_o_t_a_l = 0.2", "X_t_o_t_a_l = 0.6", "X_t_o_t_a_l = 1.0", ...
    "X_t_o_t_a_l = 1.4", "X_t_o_t_a_l = 1.8", "X_t_o_t_a_l = 2.0"]; 

numpts=100; % number of test points along x-axis 
% initialize variable matricies 
X_star=zeros(6,numpts);
X=zeros(6,numpts);
y1=zeros(6,numpts);
y2=zeros(6,numpts);

intersections=zeros(6,1); 
for i=1:6 % where 6 is the number of different X_tot values 
    
    X_star(i,:)=linspace(0,X_tot(i),numpts); % X* is a vector of arbitrary points between zero and the total X concentration 
    % ie X* varies between 0 and 100% of the total X concentration 
                                                                                    
    for j=1:numpts % number of test points along the x-axis 
        X(i,j)= X_tot(i) - X_star(i,j); % compute unphosphorylated X 
        
        y1(i,j)=kf*X(i,j)*X_star(i,j); % rate of phosphorylation 
        y2(i,j)=kr*X_star(i,j);        % rate of dephosphorylation 
        
    end
    
    %plot phosph and dephosph rates versus X*, given 6 different values of X_total
   figure(1)
   hold on 
   subplot(2,3,i)
   plot(X_star(i,:), y1(i,:),'r-')
   hold on 
   plot(X_star(i,:), y2(i,:),'b-')
   title(Xtot_labels(i))
   xlabel('X*')
   ylabel('Phosphorylation or Dephosphorylation Rate')
   legend('Phosphorylation Rate', 'Dephosphorylation Rate') 
   hold on   
end 
hold off 

%% Now plot X_tot versus stable steady-values of X* 

X_tot=[0.2, 0.6, 1.0, 1.4, 1.8, 2.0];
SS_Xstar=[0, 0, 0, 0.4, 0.8, 1.0]; 

figure(2) 
hold on 
plot(X_tot, SS_Xstar, 'bo-')
title('Stable Steady-States')
xlabel('X_t_o_t_a_l')
ylabel('Stable Steady-State X*') 
ylim([-0.01 1.01])
hold off