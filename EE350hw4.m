%% Preconditions

%Data packets containing 100 bits
%Each bit equally likely to be a 0 or 1
%sometimes, 0 sent is mistaken for a 1
%someitmes, 1 sent is mistaken for a 0
%when a 1 is sent, it is recieved as a 0 at 0.01
%when a 0 is sent, it is recieved as a 1 at 0.03
%if 5 or fewer bits are recieved in error, packet can be decoded

%%100 packets of 100 bits as a function 

function Success=EE350hw4(n)    %n is number of packets with 5 or fewer errors(since in function can be changed)
    Bits=floor(randi(2, 1, 100)/2); %Bits boolean matrix shows 0 or 1 value of bits
    %disp(Bits)
    
    %now set up new nx100 matrices from Boolean matrix
    
    Prob=0.03-0.02*Bits;         %rewrite matrix == if Bits(i,j)=0 then Prob(i,j)=0.03 // if Bits(i,j)=1, then Prob(i,j)=0.01
    %disp(Prob)
    
    %must introduce second randomized matrix
    
    Error=(rand(n,100)<Prob);   %rewrite matrix again == using rand number compared to previous matrix 
    %disp(Error)                %if bit(i) is 'wrong'(i.e. <Prob), then Error(i,j)=1 // if bit(i) is 'correct'(i.e. >Prob), then Error(i,j)=0
    %disp(sum(Error,2))
    
    Success=sum((sum(Error,2)<=5));%sum across Error, then sum across each array to verify <=5
    %disp(Success)
end
