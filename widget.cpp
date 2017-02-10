#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    ui->setupUi(this);

    cmd = new QProcess;
    connect(ui->lineEdit, SIGNAL(returnPressed()), this, SLOT(runClicked()));
    connect(ui->pushButton, SIGNAL(clicked(bool)), this, SLOT(runClicked()));
    connect(cmd, SIGNAL(readyRead()), this, SLOT(readOutput()));
}

Widget::~Widget()
{
    delete ui;
}

void Widget::runClicked()
{
    QString input = ui->lineEdit->text();
    cmd->start(input);
    output = tr("");
    ui->textBrowser->setText(output);
}

void Widget::readOutput()
{
    output += cmd->readAll();
    ui->textBrowser->setText(output);
}
