#include <iostream>

#include "people.pb.h"

int main(int argc, char *argv[])
{
    test::People pep;
    pep.set_name("heheda");
    pep.set_age(5);
    pep.set_steps(1304);

    std::string buff;
    pep.SerializeToString(&buff);

    test::People pep2;
    pep2.ParseFromString(buff);

    std::cout << pep2.name() << std::endl;
    std::cout << pep2.age() << std::endl;
    std::cout << pep2.steps() << std::endl;

    int data_len = pep.ByteSize();
    unsigned char data[1024] = "\0";
    pep.SerializeToArray(data, data_len);
    for(auto i = 0; i < data_len; i ++)
        printf("%02X ", data[i]);
    printf("\n");

    test::People pep3;
    pep3.ParseFromArray(data, data_len);

    std::cout << pep3.name() << std::endl;
    std::cout << pep3.age() << std::endl;
    std::cout << pep3.steps() << std::endl;

    return 0;
}
