function x=fib_rekursiv(n)
    if n > 2
        x = fib_rekursiv(n-2) + fib_rekursiv(n-1);
        return
    else
        x = 1;
        return
    end
end