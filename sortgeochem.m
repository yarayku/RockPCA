function cdata= sortgeochem(cfilename)
% This function uses read_csvGUI function to read csv file and fill up the
% empty with 'NaN'
% Input = cfile, name of the csv file. (string)
% Output = cdata, cell array
% Last Modified: Dec. 03, 2016
% Writeen by: Yaray Ku

filename = cfilename;
cdata = read_csvGUI(filename,0,0);
indx = find(cellfun ('isempty',cdata));
cdata(indx)={'NaN'};
end