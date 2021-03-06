#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QDebug>
#include <QColor>

#include "changecolor.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject *root = NULL;
    QList<QObject*> rootObjects = engine.rootObjects();
    int count = rootObjects.size();

    for(int i = 0; i < count; i ++){
        if(rootObjects.at(i)->objectName() == "rootObject")
        {
            root = rootObjects.at(i);
            break;
        }
    }

    new ChangeColor(root);

    QObject *quitButton = root->findChild<QObject*>("quitButton");
    if(quitButton)
    {
        QObject::connect(quitButton, SIGNAL(clicked()), &app, SLOT(quit()));
    }

    QObject *textLabel = root->findChild<QObject*>("textLabel");
    if(textLabel)
    {
        bool bRet = QMetaObject::invokeMethod(textLabel, "setText", Q_ARG(QString, "world hello"));
        qDebug() << "call setText return - " << bRet;
        textLabel->setProperty("text", "heheda");

        textLabel->setProperty("color", QColor::fromRgb(255, 0, 0));
        bRet = QMetaObject::invokeMethod(textLabel, "doLayout");
        qDebug() << "call doLayout return - " << bRet;
    }

    return app.exec();
}
