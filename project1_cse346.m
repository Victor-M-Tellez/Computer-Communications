length = 100000;
probability= .9;
tracker= zeros(1,length);
train = zeros(1,length); % Creates a 1x100000 (=row vector) containing 100000 zeros.
pointer1=1;
counter=0;
while( length >= pointer1 )
     x= rand;
    if x <=probability
       train(pointer1) = 1;
       counter=counter +1 ;
    elseif counter==0 
    else
         tracker(counter)= tracker(counter)+1;
         counter=0;
    end
  pointer1 = pointer1 + 1;
end
bottomFreq=sum(tracker);
totFreq=tracker/bottomFreq;
stem(totFreq)
title('Graph Showing Probability of getting a packet p=0.9')
xlabel('Packet Train Length')
ylabel('Relative Frequency of Packet Train in Percentage')
axis([0 30 0 1])

















