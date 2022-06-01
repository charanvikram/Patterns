
#include <iostream>

using namespace std;

int main()
{
    int arr[] = {1,1,2,2,3,0,0,0,5,5,99,100};
    int count[101]={0};
    for(int i=0;i<12;i++){
        count[arr[i]]+=1;
    }
    
    for(int i=0;i<101;i++){
        if(count[i]>0)
        cout<<i<<" repeated "<<count[i]<<" time(s)"<<endl;
    }

    return 0;
}
