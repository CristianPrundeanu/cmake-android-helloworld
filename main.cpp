#include <stdio.h>

#include <iostream>
#include <vector>
using namespace std;

int main(int argc, char **argv)
{
	//printf("Hello Android\n");
	cout << "Hello Android STL" << endl;

	vector<int> v;
	int i;
	for(i = 0; i < 5; i++) {
		v.push_back(i);
	}
	cout << "vector size:" << v.size() << endl;
}
