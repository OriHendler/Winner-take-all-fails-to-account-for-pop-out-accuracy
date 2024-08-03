function [q]=contexual_modulation_strength(M,N,homogeneous,heterogeneous,ratio,uniform_min,uniform_max,mu_for_exp)

if homogeneous
q=ratio*ones(M,N);
end

if heterogeneous
% q= unifrnd(uniform_min,uniform_max,M,N);
 
    q=exprnd_shifted(mu_for_exp,M,N);

end

end