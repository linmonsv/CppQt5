#ifndef TESTCPP_H
#define TESTCPP_H

#include <QObject>

class TestCpp : public QObject
{
    Q_OBJECT

public:
    TestCpp(QObject *parent = 0);
    ~TestCpp(){}

    Q_INVOKABLE void HeHeDa();

    Q_INVOKABLE int SetSomethings(QString qStr);
};

#endif // TESTCPP_H
