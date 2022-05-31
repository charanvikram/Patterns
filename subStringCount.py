string = input()

sub_string = input()
count = 0

for i in range(len(string)-len(sub_string)+1):
    j=0
    for k in range(len(sub_string)):
        if string[i+j] == sub_string[k]:
            j+=1
        else:
            break
    if j==len(sub_string):
        count+=1
print(sub_string,'repeated for',count,'times')
            
