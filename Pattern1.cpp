#include <iostream>

using namespace std;

int main()
{
    int n;
    cin>>n;
    char ch=97;
    int i=1;
    int count = 0;
    while(i<=n){
        int j=1;
        while(j<=n){
            char res = ch + count;
            cout<<res<<" ";
            count++;
            j++;
        }
        cout<<endl;
        i++;
    }

    return 0;
}


output:
3
a b c
d e f
g h i
