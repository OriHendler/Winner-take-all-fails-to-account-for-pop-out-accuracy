function [q]=contexual_modulation_strength(M,N,homogeneous,heterogeneous,ratio,uniform_min,uniform_max,mu_for_exp)

if homogeneous
q=ratio*ones(M,N);
end

if heterogeneous
q= unifrnd(uniform_min,uniform_max,M,N);
 
%     pd=makedist('Exponential','mu',mu_for_exp);
%     t=truncate(pd,1,inf);
%     q = random(t,M,N);

end

end