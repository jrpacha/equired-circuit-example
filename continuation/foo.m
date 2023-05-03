clearvars 
close all

j = 0;
while j < 4
    fprintf("** J = %2d\n", j)
    i = 0;
    while 1
        if i < 10
            fprintf("%3s** I = %2d\n", "", i)
            i=i+1;
            continue
        else
            fprintf("%3sExit inner loop (%d)\n", "", j)
            break
        end
    end
    j = j+1; 
end
