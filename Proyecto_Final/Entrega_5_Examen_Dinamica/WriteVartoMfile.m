fid = fopen("PQ_Path1.txt","wt");
fprintf(fid,"%s\n",char(pqpath));
fclose(fid);

%%

diary("PQ_Path.txt")
pqpath
diary off

%%

fileName = 'PQ_Path2.txt';
fid = fopen(fileName, 'wt');
pqpath

[rows, columns] = size(pqpath);
for row = 1 : rows
	for col = 1 : columns
		fprintf(fid, '%f ', pqpath(row, col));
	end
	fprintf(fid, '\n');
end
fclose(fid);