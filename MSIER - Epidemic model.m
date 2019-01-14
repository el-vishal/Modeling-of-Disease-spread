% MATLAB Code for MSIER Endemic model%

beta=[0.8;0.9;1.0;1.1;1.2;1.3;1.4;1.5;1.6]; %array of beta values
s0 = [0.5,0.4]; %array for s0 initial values
i0 = [0.5,0.4]; %array for i0 initial values

for j = 1 : 9 %Loop for beta values 
    
    for k = 1 : 2 %Loop for s0 and i0 values
        [s_values,i_values] = e_d_model(s0(k),i0(k),beta(j)); %calling e_d_model custom function
        %figure for Phase Portrait of all calculated s and i values
        figure(j+100);hold on 
        plot(s_values,i_values),xlabel('s values / suspects '), ylabel('i values / infected'),axis([0 1 0 1])
        title(['Phase Portrait - \beta =',num2str(beta(j))]) %Title for graph
        legendInfo{k} = ['s0 = ' num2str(s0(k)),', i = ' num2str(i0(k))]; %Legend for graph
    end
    legend(legendInfo)
    hold off
end            