#ifndef MYCHOOSEIMAGE_H
#define MYCHOOSEIMAGE_H

#include <QObject>
#include <QDebug>
#include <QFileDialog>

class MyChooseImage : public QObject
{
    Q_OBJECT
public:
    explicit MyChooseImage(QObject *target, QObject *parent = nullptr);

signals:

public slots:
    QString getImagePath();

private:
    QObject *m_target;
};

#endif // MYCHOOSEIMAGE_H
