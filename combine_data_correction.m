%Copyright © 2019- Sampsa Pursiainen & GPU-ToRRe Development Team
%See: https://github.com/sampsapursiainen/GPU-Torre

load data/mesh_1.mat;
load data/system_data_1.mat;

i_ind = 1;
parameters;

n_p = size(ast_p_ind,1);

data_name = 'field_data_correction';

for k = 1 : n_p

k

load(['./' data_name '/f_data_modulated_' int2str(k) '.mat']);
load(['./' data_name '/u_data_modulated_' int2str(k) '.mat']);

[rec_data, rec_data_quad, rec_amp] = qam_demod(transpose(rec_data),carrier_freq,pulse_length,t_data);
[u_data,u_data_quad] = qam_demod(transpose(u_data),carrier_freq,pulse_length,t_data);
[f_data,f_data_quad] = qam_demod(transpose(f_data),carrier_freq,pulse_length,t_data);

rec_data = transpose(rec_data);
rec_data_quad = transpose(rec_data_quad);
u_data = transpose(u_data);
u_data_quad = transpose(u_data_quad);
f_data = transpose(f_data);
f_data_quad = transpose(f_data_quad);

save(['./' data_name '/f_data_' int2str(k) '.mat'], 'f_data','f_data_quad','t_data');
save(['./' data_name '/u_data_' int2str(k) '.mat'], 'u_data', 'u_data_quad','rec_data','rec_data_quad','t_data');

end
