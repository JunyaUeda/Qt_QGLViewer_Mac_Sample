#include "mainwindow.h"
#include <QApplication>
#include "sampleViewer.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

//    SampleViewer viewer;
//    viewer.setWindowTitle("simpleViewer");
//    viewer.show();

    return a.exec();
}
