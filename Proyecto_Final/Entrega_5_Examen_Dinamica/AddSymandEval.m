filename = 'Ce3.m';
new_filename = ['new_' filename];
new_new_filename = ['new_' new_filename];

S = fileread(filename);

S = regexprep(S, 'cos\(pi/2\)','0');
S = regexprep(S, 'cos\(pi\)','-1');
S = regexprep(S, 'sin\(pi/2\)','1');
S = regexprep(S, 'sin\(pi\)','0');

S = ['Ce_3 = ',S,';'];
S = ['syms q1 q2 q3 q4 q5 q6 q1p q2p q3p q4p q5p q6p pi', newline, S];
S = ['g = 9.81;', newline, S ,newline];

fid = fopen(new_filename, 'w');
fwrite(fid, S);
fclose(fid);

run(new_filename)

fid = fopen(new_new_filename, 'wt');
fprintf(fid, '%s\n', char(Ce_3));
fclose(fid);

clearvars -except Ce_3