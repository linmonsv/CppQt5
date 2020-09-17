#include "mainwindow.h"
#include "ui_mainwindow.h"

//#define ANDROID_DEVICE

#ifdef ANDROID_DEVICE
//设置保存文件的路径
#define SAVE_FILE_PATH "/sdcard/DCIM/Camera/"
#else
//设置保存文件的路径
#define SAVE_FILE_PATH "./"
#endif


/*
 * 设置QT界面的样式
*/
void MainWindow::SetStyle(const QString &qssFile) {
    QFile file(qssFile);
    if (file.open(QFile::ReadOnly)) {
        QString qss = QLatin1String(file.readAll());
        qApp->setStyleSheet(qss);
        QString PaletteColor = qss.mid(20,7);
        qApp->setPalette(QPalette(QColor(PaletteColor)));
        file.close();
    }
    else
    {
        qApp->setStyleSheet("");
    }
}

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    this->SetStyle(":/images/blue.css");     //设置样式表
    this->setWindowIcon(QIcon(":/log.ico")); //设置图标
    this->setWindowTitle("Camera");

    //获取本机可用摄像头
    cameras = QCameraInfo::availableCameras();
       if(cameras.count())
       {
           for(int i=0;i<cameras.count();i++)
           {
               ui->comboBox->addItem(tr("%1").arg(i));
           }
       }
       else
       {
           QMessageBox::warning(this,tr("提示"),"本机没有可用的摄像头!\n");
       }

       ui->pushButton_stop->setEnabled(false); //设置停止按钮不可用
       ui->pushButton_Camera_up->setEnabled(false);


       //创建工作目录
   #ifdef ANDROID_DEVICE
       QDir dir;
       if(!dir.exists("/sdcard/DCIM/Camera/"))
       {
           if(dir.mkpath("/sdcard/DCIM/Camera/"))
           {
               Log_Display("/sdcard/DCIM/Camera/目录创建成功.\n");
           }
           else
           {
               Log_Display("/sdcard/DCIM/Camera/目录创建失败.\n");
           }
       }
   #endif
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::Log_Display(QString text)
{
    ui->plainTextEdit->insertPlainText(text);
}

void MainWindow::on_pushButton_open_camera_clicked()
{
    int i=ui->comboBox->currentText().toInt();
    /*创建摄像头对象，根据选择的摄像头打开*/
    camera = new QCamera(cameras.at(i));

    m_pProbe = new QVideoProbe(this);
    if(m_pProbe != nullptr)
    {
        m_pProbe->setSource(camera); // Returns true, hopefully.
        connect(m_pProbe, SIGNAL(videoFrameProbed(QVideoFrame)), this, SLOT(slotOnProbeFrame(QVideoFrame)), Qt::DirectConnection);
    }

    /*配置摄像头捕获模式为帧捕获模式*/
    //camera->setCaptureMode(QCamera::CaptureStillImage);  //如果在Linux系统下运行就这样设置
     camera->setCaptureMode(QCamera::CaptureVideo);//如果在android系统下运行就这样设置

    /*启动摄像头*/
    camera->start();

    //获取摄像头支持的分辨率、帧率等参数
    QList<QCameraViewfinderSettings > ViewSets = camera->supportedViewfinderSettings();
    qDebug() << "viewfinderResolutions sizes.len = " << ViewSets.length();
    foreach (QCameraViewfinderSettings ViewSet, ViewSets) {
        qDebug() << "max rate=" << ViewSet.maximumFrameRate() << " min rate="<< ViewSet.minimumFrameRate() << " resolution="<<ViewSet.resolution()<<\
                    " Format="<<ViewSet.pixelFormat()<<" "<<ViewSet.pixelAspectRatio();
    }

    /*设置摄像头的采集帧率和分辨率*/
    QCameraViewfinderSettings settings;
    settings.setPixelFormat(QVideoFrame::Format_YUYV); //设置像素格式  Android上只支持NV21格式
    settings.setResolution(QSize(640, 480)); //设置摄像头的分辨率
    camera->setViewfinderSettings(settings);

    //获取摄像头支持的分辨率、帧率等参数
    //获取摄像头支持的分辨率、帧率等参数
    /*
    QList<QCameraViewfinderSettings > ViewSets = camera->supportedViewfinderSettings();
    foreach (QCameraViewfinderSettings ViewSet, ViewSets) {
        //qDebug() << i++ <<" max rate = " << ViewSet.maximumFrameRate() << "min rate = "<< ViewSet.minimumFrameRate() << "resolution "<<ViewSet.resolution();
         Log_Display(tr("Format=%1\n").arg(ViewSet.pixelFormat()));
    }*/

    ui->pushButton_open_camera->setEnabled(false);
    ui->pushButton_stop->setEnabled(true); //设置停止按钮可用
    ui->pushButton_Camera_up->setEnabled(true);
}

/*
 * 摄像头输出的信息
D libandroid_camera_save.so: 32  max rate =  15 min rate =  15 resolution  QSize(640, 480) Format= Format_NV21  QSize(1, 1)
D libandroid_camera_save.so: 33  max rate =  30 min rate =  30 resolution  QSize(640, 480) Format= Format_NV21  QSize(1, 1)
D libandroid_camera_save.so: 34  max rate =  15 min rate =  15 resolution  QSize(640, 480) Format= Format_YV12  QSize(1, 1)
D libandroid_camera_save.so: 35  max rate =  30 min rate =  30 resolution  QSize(640, 480) Format= Format_YV12  QSize(1, 1)
*/
void MainWindow::slotOnProbeFrame(const QVideoFrame &frame)
{
   QVideoFrame cloneFrame(frame);
   cloneFrame.map(QAbstractVideoBuffer::ReadOnly);
   //qDebug()<<"height:"<<cloneFrame.height();
   //qDebug()<<"width:"<<cloneFrame.width();
   //qDebug()<<"bytesPerLine:"<<cloneFrame.bytesPerLine();
   //qDebug()<<"mappedBytes:"<<cloneFrame.mappedBytes();
   //qDebug()<<"pixelFormat:"<<cloneFrame.pixelFormat();

   if(cloneFrame.pixelFormat()==QVideoFrame::Format_NV21)
   {
        unsigned char rgb_buffer[640*480*3];
        NV21_TO_RGB24(cloneFrame.bits(),rgb_buffer,cloneFrame.width(),cloneFrame.height());
        const QImage image(rgb_buffer,
                           cloneFrame.width(),
                           cloneFrame.height(),
                           QImage::Format_RGB888);
        QPixmap my_pixmap;
        my_pixmap.convertFromImage(image);
        ui->label_ImageDisplay->setPixmap(my_pixmap);
   }
   else if(cloneFrame.pixelFormat()==QVideoFrame::Format_YUYV)
   {
       unsigned char rgb_buffer[640*480*3];
       yuyv_to_rgb(cloneFrame.bits(),rgb_buffer,cloneFrame.width(),cloneFrame.height());
       const QImage image(rgb_buffer,
                          cloneFrame.width(),
                          cloneFrame.height(),
                          QImage::Format_RGB888);
       QPixmap my_pixmap;
       my_pixmap.convertFromImage(image);
       ui->label_ImageDisplay->setPixmap(my_pixmap);
   }
   else
   {
       Log_Display(tr("当前格式编码为%1,暂时不支持转换.\n").arg(cloneFrame.pixelFormat()));
   }
    cloneFrame.unmap();
}

void MainWindow::on_pushButton_Camera_up_clicked()
{
   const QPixmap pix=ui->label_ImageDisplay->pixmap()->copy();
   QDateTime dateTime(QDateTime::currentDateTime());
   //时间效果: 2020-03-05 16:25::04 周四
   QString qStr="";
   qStr+=SAVE_FILE_PATH;  //Android 手机的照相机文件夹
   qStr+=dateTime.toString("yyyy-MM-dd-hh-mm-ss");
   qStr+=".jpg";
   pix.save(qStr);
   Log_Display(tr("照片保存路径:%1\n").arg(qStr));
}

void MainWindow::YUV420P_to_RGB24(unsigned char *data, unsigned char *rgb, int width, int height)
{
    int index = 0;
    unsigned char *ybase = data;
    unsigned char *ubase = &data[width * height];
    unsigned char *vbase = &data[width * height * 5 / 4];
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            //YYYYYYYYUUVV
            unsigned char Y = ybase[x + y * width];
            unsigned char U = ubase[y / 2 * width / 2 + (x / 2)];
            unsigned char V = vbase[y / 2 * width / 2 + (x / 2)];
            rgb[index++] = Y + 1.402 * (V - 128); //R
            rgb[index++] = Y - 0.34413 * (U - 128) - 0.71414 * (V - 128); //G
            rgb[index++] = Y + 1.772 * (U - 128); //B
        }
    }
}


/**
 * NV12属于YUV420SP格式,android相机默认格式
 * @param data
 * @param rgb
 * @param width
 * @param height
 */
void MainWindow::NV21_TO_RGB24(unsigned char *yuyv, unsigned char *rgb, int width, int height)
{
        const int nv_start = width * height ;
        int  index = 0, rgb_index = 0;
        uint8_t y, u, v;
        int r, g, b, nv_index = 0,i, j;

        for(i = 0; i < height; i++){
            for(j = 0; j < width; j ++){
                //nv_index = (rgb_index / 2 - width / 2 * ((i + 1) / 2)) * 2;
                nv_index = i / 2  * width + j - j % 2;

                y = yuyv[rgb_index];
                u = yuyv[nv_start + nv_index ];
                v = yuyv[nv_start + nv_index + 1];

                r = y + (140 * (v-128))/100;  //r
                g = y - (34 * (u-128))/100 - (71 * (v-128))/100; //g
                b = y + (177 * (u-128))/100; //b

                if(r > 255)   r = 255;
                if(g > 255)   g = 255;
                if(b > 255)   b = 255;
                if(r < 0)     r = 0;
                if(g < 0)     g = 0;
                if(b < 0)     b = 0;

                index = rgb_index % width + (height - i - 1) * width;
                //rgb[index * 3+0] = b;
                //rgb[index * 3+1] = g;
                //rgb[index * 3+2] = r;

                //颠倒图像
                //rgb[height * width * 3 - i * width * 3 - 3 * j - 1] = b;
                //rgb[height * width * 3 - i * width * 3 - 3 * j - 2] = g;
                //rgb[height * width * 3 - i * width * 3 - 3 * j - 3] = r;

                //正面图像
                rgb[i * width * 3 + 3 * j + 0] = b;
                rgb[i * width * 3 + 3 * j + 1] = g;
                rgb[i * width * 3 + 3 * j + 2] = r;

                rgb_index++;
            }
        }
}

void MainWindow::YUV420P_TO_RGB24(unsigned char *yuv420p, unsigned char *rgb24, int width, int height) {
    int index = 0;
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            int indexY = y * width + x;
            int indexU = width * height + y / 2 * width / 2 + x / 2;
            int indexV = width * height + width * height / 4 + y / 2 * width / 2 + x / 2;

            unsigned char Y = yuv420p[indexY];
            unsigned char U = yuv420p[indexU];
            unsigned char V = yuv420p[indexV];

            rgb24[index++] = Y + 1.402 * (V - 128); //R
            rgb24[index++] = Y - 0.34413 * (U - 128) - 0.71414 * (V - 128); //G
            rgb24[index++] = Y + 1.772 * (U - 128); //B
        }
    }
}

void MainWindow::on_pushButton_stop_clicked()
{
    camera->stop();
    delete  camera;
    delete m_pProbe;

    ui->pushButton_open_camera->setEnabled(true);
    ui->pushButton_stop->setEnabled(false); //设置停止按钮不可用
    ui->pushButton_Camera_up->setEnabled(false);
}

/*
函数功能: 将YUV数据转为RGB格式
函数参数:
unsigned char *yuv_buffer: YUV源数据
unsigned char *rgb_buffer: 转换之后的RGB数据
int iWidth,int iHeight   : 图像的宽度和高度
*/
void MainWindow::yuyv_to_rgb(unsigned char *yuv_buffer,unsigned char *rgb_buffer,int iWidth,int iHeight)
{
    int x;
    int z=0;
    unsigned char *ptr = rgb_buffer;
    unsigned char *yuyv= yuv_buffer;
    for (x = 0; x < iWidth*iHeight; x++)
    {
        int r, g, b;
        int y, u, v;

        if (!z)
        y = yuyv[0] << 8;
        else
        y = yuyv[2] << 8;
        u = yuyv[1] - 128;
        v = yuyv[3] - 128;

        r = (y + (359 * v)) >> 8;
        g = (y - (88 * u) - (183 * v)) >> 8;
        b = (y + (454 * u)) >> 8;

        *(ptr++) = (r > 255) ? 255 : ((r < 0) ? 0 : r);
        *(ptr++) = (g > 255) ? 255 : ((g < 0) ? 0 : g);
        *(ptr++) = (b > 255) ? 255 : ((b < 0) ? 0 : b);

        if(z++)
        {
            z = 0;
            yuyv += 4;
        }
    }
}
