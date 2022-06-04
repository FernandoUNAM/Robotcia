filename = 'Ce2.txt';
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

%% Additional replacements to result in a clean Inertia document

%{
    S = regexprep(S,'\n\s', '');
    S = regexprep(S,'[A-D]\S{0,100}\s{0,25}','')
    S = regexprep(S,'[F-H]\S{0,100}\s{0,25}','')
    S = regexprep(S,'[J-Z]\S{0,100}\s{0,25}','')
    S = regexprep(S,"[a-u]\S{0,2}","")
    S = regexprep(S,'\n\s', '');
    S = regexprep(S,"[E]\d","")
    S = regexprep(S,"[z]\s","")
    S = regexprep(S,"[Á]\d","")
    S = regexprep(S,"\I..\S{9,11}","");
    S = regexprep(S,"","");
%}

