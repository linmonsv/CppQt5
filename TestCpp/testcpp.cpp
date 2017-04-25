#include "testcpp.h"

#include <QDebug>

TestCpp::TestCpp(QObject *parent)
    : QObject(parent)
{

}

void TestCpp::HeHeDa()
{
    qDebug() << "HeHeDa";
}

int TestCpp::SetSomethings(QString qStr)
{
    qDebug() << qStr;
    return 0;
}
