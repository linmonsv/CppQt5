#include <QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml>
#include "colormaker.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    /*QQuickView viewer;

    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    viewer.setResizeMode(QQuickView::SizeRootObjectToView);

    viewer.rootContext()->setContextProperty("colorMaker", new ColorMaker);

    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();*/

    qmlRegisterType<ColorMaker>("an.qt.ColorMaker", 1, 0, "ColorMaker");
    QQuickView viewer;

    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.show();

    return app.exec();
}
