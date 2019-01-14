%Function for integrator of MSIER model

function[s_values,i_values] = e_d_model(s,i,b)
    initial_s = s;
    initial_i = i;
    for t = 1:500 %500 steps
        s_values(t) = s;
        i_values(t) = i;
        gamma=0.3;
        delta=0.5;
        mu=0.015;
        s_prime = -b * i * s + mu - mu * s; %S equation
        i_prime = b * i * s - (gamma + mu) * i; % I equation 
        s = s + delta * s_prime;  %S->next step
        i = i + delta * i_prime;  %i->next step
    end
    t = 1:500;
    %Plot graph for i vs s
    figure
    plot(t,s_values(t),'g',t,i_values(t),'r'), xlabel('timestep'), ylabel('s,i values'),axis([0 299 0 1])
    title(['MSIER model - s = ',num2str(initial_s),', i = ',num2str(initial_i), ' and \beta = ',num2str(b)])
    legend('s','i')
    return;
end