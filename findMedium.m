function Cout = findMedium (Cin)
% This function findMedium helps find the medium value of lunar samples.
% Instead of find average, it retains the original value of measurement and
% determine the midest one for calculation.
% Input = Cin, a cell matrix (array)
% (Rows = samples; Columns = compounds)
% Output = Cout, a matrix (array) with no overlapped measurement
% Last Modified: Dec. 07, 2016
% Writeen by: Yaray Ku

Cout = [];
k=1;
[r,c] = size(Cin);
Cin = sortrows(Cin);
while k <= r % get out of the loop as k = #last row
    j = k;
    % within the range, compare j to j+1
    while j+1<=r && strcmpi(char(Cin(j,1)),char(Cin(j+1,1)))
        j = j+1; % continuing comparison
    end
    L = Cin(k:j,:);
    L(:,1)=[];
    [r2,c2] = size(L);
    data = reshape(str2num(char(L)),r2,c2);
    if r2 == 1
        Mdata = data;
    else
    Mdata = median(data);
    end
    Cout = [Cout;Mdata]; % find median value for each compound
    k = j + 1; % start from the next different k
end

end

