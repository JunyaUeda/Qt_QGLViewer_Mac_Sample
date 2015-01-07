#include "graphicareawidget.h"
#include "sampleViewer.h"

#include <QGridLayout>

GraphicAreaWidget::GraphicAreaWidget(QWidget *parent) :
    QWidget(parent)
{
    SampleViewer *sv = new SampleViewer();
    QGridLayout *layout = new QGridLayout();
    layout->addWidget(sv);

    setLayout(layout);
}
