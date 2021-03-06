function [z_GP, Qx_GP, Qy_GP] = get_GP_values_GPs(RP, n, M4, M8)


%
% function [z_GP, Qx_GP, Qy_GP] = get_GP_values_GPs(RP, n, M4, M8)
% 
% Ritorna le incognite z, Qx, Qy nel ghost point (caso in cui il quadrato di interpolazione contiene almeno un GP ma non punti asciutti non GP)
% 
% PARAMETRI D'INGRESSO
%
% RP = [RPx RPy] = punto riflesso;
% n = [nx ny] = versore normale uscente; 
% M4 = matrice 4x5 per il calcolo di Z. M4 = [Matrix 4x4 c] dove c è il
% termine noto;
% M8 = matrice 8x9 per il calcolo di Qx e Qy. M8 = [Matrix 8x8 c];
% 

nx=n(1);
ny=n(2);

Matrix4 = M4(:,1:4);
c4 = M4(:,5);
coeff4 = Matrix4\c4;

z_RP = coeff4(1)*RP(1)*RP(2) + coeff4(2)*RP(1) + coeff4(3)*RP(2) + coeff4(4);

Matrix8 = M8(:,1:8);
c8 = M8(:,9);
coeff8 = Matrix8\c8;

Qx_RP = coeff8(1)*RP(1)*RP(2) + coeff8(3)*RP(1) + coeff8(5)*RP(2) + coeff8(7);
Qy_RP = coeff8(2)*RP(1)*RP(2) + coeff8(4)*RP(1) + coeff8(6)*RP(2) + coeff8(8);

z_GP = z_RP;

Qx_GP = Qx_RP*(-nx^2+ny^2) - Qy_RP*2*nx*ny;
Qy_GP = Qy_RP*(-ny^2+nx^2) - Qx_RP*2*nx*ny;

end