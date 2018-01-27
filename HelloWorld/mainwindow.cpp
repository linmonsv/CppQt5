#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showWorld()
{
    static bool bFlag = false;
    if(bFlag) {
        ui->lineEdit->setText("");
    } else {
        ui->lineEdit->setText("World");
    }
    bFlag = !bFlag;
}
