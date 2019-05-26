#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QObject *root = NULL;
    QList<QObject *> rootObjects = engine.rootObjects();
    int count = rootObjects.size();
    for(int i = 0; i < count; i ++) {
        if(rootObjects.at(i)->objectName() == "rootObject") {
            root = rootObjects.at(i);
            break;
        }
    }

    QObject *openButton = root->findChild<QObject *>("openButton");
    if(openButton) {
        QObject::connect(openButton, SIGNAL(clicked()), &app, SLOT(quit()));
    }

    QObject *imagePath = root->findChild<QObject *>("imagePath");
    if(imagePath) {
        ;
    }

    return app.exec();
}
