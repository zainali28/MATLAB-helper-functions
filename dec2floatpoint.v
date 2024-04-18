function out = dec2floatpoint(dec)
    
fraction = mod(abs(dec), 1);
integer = floor(abs(dec));

if(dec > 0)
    sign = num2str(0);
else
    sign = num2str(1);
end

mantissa_fraction = [];

while(length(mantissa_fraction) < 25)
    
    mantissa_fraction = [mantissa_fraction, num2str(floor(2*fraction))];

    if ((fraction*2) >= 1)
        fraction = (2*fraction) - 1;
    else
        fraction = 2*fraction;
    end
    
end

mantissa_integer = [];

while(integer ~= 0)

    mantissa_integer = [num2str(mod(integer, 2)), mantissa_integer];
    integer = floor(integer / 2);

end

mantissa = [mantissa_integer, mantissa_fraction];

if(length(mantissa_integer) == 0)
    for i = 1:length(mantissa_fraction)
        if(mantissa_fraction(i) == '1')
            exponent = 127 - i;
            mantissa = mantissa_fraction(i+1:i+23);
            break;
        end
    end
else
    for i = 1:length(mantissa_integer)
        if(mantissa_integer(i) == '1')
            exponent = 127 + length(mantissa_integer) - i;
            mantissa = mantissa(i+1:i+23);
            break;
        end
    end
end

exponent_ = [];
while(exponent ~= 0)

    exponent_ = [num2str(mod(exponent, 2)), exponent_]
    exponent = floor(exponent / 2);

end

if(length(exponent_) < 8)
    for i = 1:(8-length(exponent_))
        exponent = ['0', exponent_];
    end
else
    exponent = exponent_;
end

exponent, mantissa

out = [sign, exponent, mantissa];

end
