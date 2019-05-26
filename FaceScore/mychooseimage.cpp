#include "mychooseimage.h"

MyChooseImage::MyChooseImage(QObject *target, QObject *parent)
    : QObject(parent)
    , m_target(target)
{

}

QString MyChooseImage::getImagePath() {
    QString imagePath = "Share.jpg";
    qDebug() << "imagePath : " << imagePath;
    imagePath = QFileDialog::getOpenFileName(NULL,
                            tr("Please choose a file"),
                            ".",
                            tr("Image Files (*.jpg *.png)"));
    qDebug() << "imagePath : " << imagePath;

    QObject *imageView = m_target->findChild<QObject *>("imageViewer");
    if(imageView) {
        imageView->setProperty("source", "file://" + imagePath);
    }

    QObject *textImagePath = m_target->findChild<QObject *>("imagePath");
    if(textImagePath) {
        textImagePath->setProperty("text", imagePath);
    }

    return imagePath;
};
