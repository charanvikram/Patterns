x ='ababababa'
sub = 'aba'
count=0
c,i,j=0,0,0
while(i<len(x) and j<len(sub)):
    if(x[i]==sub[j] and j<3):
        i+=1
        j+=1
        c+=1
    else:
        i+=1
        j=0
        c=0
    if c==len(sub):
        count+=1
    
    
print(count)
        
                
            
