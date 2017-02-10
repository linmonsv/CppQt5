#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QProcess>

namespace Ui {
class Widget;
}

class Widget : public QWidget
{
    Q_OBJECT

public:
    explicit Widget(QWidget *parent = 0);
    ~Widget();

    QProcess* cmd;
    QString output;

private slots:
    void runClicked();
    void readOutput();

private:
    Ui::Widget *ui;
};

#endif // WIDGET_H
