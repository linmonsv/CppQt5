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

    QObject *root = nullptr;
    QList<QObject *> rootObjects = engine.rootObjects();
    int count = rootObjects.size();
    for(int i = 0; i < count; i ++) {
        if(rootObjects.at(i)->objectName() == "rootObject") {
            root = rootObjects.at(i);
            break;
        }
    }

    QObject *fileDialog = root->findChild<QObject *>("fileDialog");
    QObject *openButton = root->findChild<QObject *>("openButton");
    if(fileDialog && openButton) {
        QObject::connect(openButton, SIGNAL(clicked()), fileDialog, SLOT(open()));
    }

    QObject *imagePath = root->findChild<QObject *>("imagePath");
    if(imagePath) {
        ;
    }

    return app.exec();
}
