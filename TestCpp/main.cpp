#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml>

#include "testcpp.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView viewer;

    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    viewer.setResizeMode(QQuickView::SizeRootObjectToView);

    viewer.rootContext()->setContextProperty("testCpp", new TestCpp);

    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();

    return app.exec();
}
