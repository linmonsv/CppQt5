#include <iostream>
#include "opencv2/opencv.hpp"

using namespace std;

int main(int argc, char *argv[])
{
    cv::Mat img = cv::imread("/Users/water/Documents/GitHub/CppQt5/TestOpenCV/test_lcd.jpg");
    cv::imshow("Image", img);
    //cv::waitKey(0);

    cv::Mat imag, result, result2;
    imag = cv::imread("/Users/water/Documents/GitHub/CppQt5/TestOpenCV/test_lcd.jpg",0);    //将读入的彩色图像直接以灰度图像读入
    cv::namedWindow("原图", 1);
    cv::imshow("原图", imag);
    //cv::waitKey(0);

    result = imag.clone();
    //进行二值化处理，选择30，200.0为阈值
    cv::threshold(imag, result, 150, 500.0, CV_THRESH_BINARY);
    cv::namedWindow("二值化图像");
    cv::imshow("二值化图像", result);
    //cv::waitKey(0);

    result2 = result.clone();
    cv::blur(result, result2, cv::Size(7, 7));
    cv::namedWindow("二值化图像");
    cv::imshow("二值化图像", result2);
    cv::waitKey(0);

    return 0;
}
