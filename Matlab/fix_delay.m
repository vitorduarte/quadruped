function [time_fixed, values_fixed] = fix_delay(time, values, delay)
    values_fixed = values(1+delay:end);
    time_fixed = time(1:end-delay);
end