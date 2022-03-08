#include <iostream>
using namespace std;
int main(){
    int money;
    cout<<"enter the money you have:";
    cin>>money;
    int stored = money;
    int count=0;
    int s=0;
    while(money!=1){
    count = money/2;
    s=s+count;
    int rem = money%2;
    money = count+rem;
    }
    cout<<"the number of chocolates you get is:"<<stored+s;
    
}

OUTPUT:
enter the money you have:20
the number of chocolates you get is:39
