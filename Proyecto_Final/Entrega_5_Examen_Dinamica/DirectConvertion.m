filename = 'FromFusion360.txt';
new_filename = ['new_' filename];

S = fileread(filename);

% Takes out any tab spaces
S = regexprep(S, '[\t]', '');

% Adds a Semicolon of the line on lines that start with I
S = regexprep(S,"I..\S{8,10}","$0\;");

% Adds the Component's Number and an Equal Sign
S = regexprep(S,"I..","I() = "); 

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

