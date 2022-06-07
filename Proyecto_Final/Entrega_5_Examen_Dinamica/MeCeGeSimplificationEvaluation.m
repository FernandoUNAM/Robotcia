filename = 'Ge3.m';
new_filename = ['new_' filename];

S = fileread(filename);


% Replaces cos(pi/2) -> 0

S = regexprep(S, 'cos\(pi/2\)','0');

% Replaces cos(pi) -> -1

S = regexprep(S, 'cos\(pi\)','-1');

% Replaces sin(pi/2) -> 1

S = regexprep(S, 'sin\(pi/2\)','1');

% Replaces sin(pi) -> 0
S = regexprep(S, 'sin\(pi\)','0');


fid = fopen(new_filename, 'w');
fwrite(fid, S);
fclose(fid);

