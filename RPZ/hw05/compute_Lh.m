function Lh = compute_Lh(itrn, itst, x, h)
% Lh = compute_Lh(itrn, itst, x, h)
%
%   Computes the average log-likelihood over training/test splits generated
%   by crossval for a fixed kernel bandwidth h.
%
%   Parameters:
%       itrn, itst - data splits (indices) generated by crossval()
%       x - the data itself
%       h - kernel bandwidth
%
%   Returns:
%       Lh - average log-likelihood over training/test splits
for i = 1:length(h)
    now = 0;
    for u = 1:length(itrn)
        now = now + sum(log(my_parzen(x(itst{u}), x(itrn{u}), h(i))));
    end
    Lh(i) = now/length(itrn);
end