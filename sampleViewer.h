#ifndef SAMPLEVIEWER_H
#define SAMPLEVIEWER_H

#include <qglviewer.h>

class SampleViewer : public QGLViewer
{
    Q_OBJECT

public:
    explicit SampleViewer(QWidget *parent = 0);

protected:
    virtual void draw();
    virtual void init();
    virtual QString helpString() const;

signals:

public slots:
};

#endif // SAMPLEVIEWER_H
