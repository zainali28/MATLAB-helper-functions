function out = floatpoint2dec(bin)
    
    sign = (-1) ^ (str2double(bin(1)));

    exponent = 0;
    for i = 2:9

        exponent = exponent + (str2double(bin(i))*2^(9-i));

    end

    exponent = 2 ^ (exponent - 127);

    mantissa = 0;
    for i = 10:32

        mantissa = mantissa + str2double(bin(i))*2^(-(i-9));

    end


    out = sign * exponent * (1 + mantissa);

end
