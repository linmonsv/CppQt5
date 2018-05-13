#include "widget.h"
#include <QApplication>

#include <QTranslator>

#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator trans;
     if(trans.load(a.applicationDirPath() + "/../../../zh_CN.qm"))
        a.installTranslator(&trans);

    Widget w;
    w.show();

    return a.exec();
}
