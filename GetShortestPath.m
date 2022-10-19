function [] = GetShortestPath(M)
    temp = 1:size(M,1);
    lowest = [0 0 0 0 0];
    lowestValue = inf;
    permValues = perms(temp(temp~=1));

    for i = 1:size(permValues, 1)
        dist = M(permValues(i, 1), 1); % Aktuelle Distanz
        for j=2:size(permValues,2)
            dist = dist + M(permValues(i,j - 1), permValues(i,j));
        end
        
        dist = dist + M(permValues(i, 4), 1);
        
        if (dist < lowestValue)
            lowestValue = dist;
            lowest = [1, permValues(i, :), 1];
        end
    end
    
    fprintf('Weg: %d\n', lowest);
    fprintf('Distanz: %d\n', lowestValue);
end