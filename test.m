% A = [10 19 8 15 19;
%     10 18 7 17 19;
%     13 16 9 14 19;
%     12 19 8 18 19;
%     14 19 10 19 19]
A=[13 24 31 19 40 29;
    18 25 30 15 43 22;
    20 20 27 25 34 33;
    23 26 28 18 37 30;
    28 33 34 17 38 20;
    19 36 25 27 45 24]
B = max(max(A)+1)-A
hungarian(B)
%[x,y,t]=zerocover(A);