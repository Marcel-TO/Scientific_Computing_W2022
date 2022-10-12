function x=F_recursive(n)

    if n == 2
        x = 7;
        return
    end
    
    if n <= 1
        x = 5;
        return
    end

     x = 3 * F_recursive(n-1) + 5 * F_recursive(n-2);
     return
end