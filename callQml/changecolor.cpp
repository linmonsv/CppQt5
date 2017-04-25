#include "changecolor.h"

#include <QDateTime>
#include <QColor>
#include <QVariant>

ChangeColor::ChangeColor(QObject *target, QObject *parent)
    :QObject(parent)
    ,m_timer(this)
    ,m_target(target)
{
    qsrand(QDateTime::currentDateTime().toTime_t());
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(onTimeout()));
    m_timer.start(1000);
}

ChangeColor::~ChangeColor()
{
    ;
}

void ChangeColor::onTimeout()
{
    QColor color = QColor::fromRgb(qrand() % 256, qrand() % 256, qrand() % 256);
    m_target->setProperty("color", color);
}
