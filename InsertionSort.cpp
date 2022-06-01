
#include <iostream>

using namespace std;

int main()
{
    int arr[] = {4,-1,2,21,42,25,10};
    int n = 7;
    int j;
    for(int i=1;i<n;i++){
         int temp = arr[i];
        for(j=i-1;j>=0;j--){
            if(temp<arr[j]){
                arr[j+1] = arr[j];
            }
            else{
                break;
            }
        }
        arr[j+1] = temp;
    }
    
    for(int i=0;i<n;i++){
        cout<<arr[i]<<" ";
    }

    return 0;
}
