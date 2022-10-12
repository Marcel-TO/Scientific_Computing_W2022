function x=eWachstum(n, m)
    if n > 1
        x = eWachstum(n-1) + m * eWachstum(n-1);
        return
    end

    x = 1;
    return
end