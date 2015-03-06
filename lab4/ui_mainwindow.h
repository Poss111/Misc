/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.4.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QFrame>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>
#include <glwidget.h>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QHBoxLayout *horizontalLayout;
    GLWidget *glwidget;
    QFrame *frame;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QHBoxLayout *horizontalLayout_2;
    QLabel *label_5;
    QSlider *translateX;
    QHBoxLayout *horizontalLayout_3;
    QLabel *label_6;
    QSlider *translateY;
    QHBoxLayout *horizontalLayout_4;
    QLabel *label_7;
    QSlider *translateZ;
    QLabel *label_2;
    QHBoxLayout *horizontalLayout_5;
    QLabel *label_8;
    QSlider *rotateX;
    QHBoxLayout *horizontalLayout_6;
    QLabel *label_9;
    QSlider *rotateY;
    QHBoxLayout *horizontalLayout_7;
    QLabel *label_10;
    QSlider *rotateZ;
    QLabel *label_3;
    QHBoxLayout *horizontalLayout_8;
    QLabel *label_11;
    QSlider *scaleX;
    QHBoxLayout *horizontalLayout_9;
    QLabel *label_12;
    QSlider *scaleY;
    QHBoxLayout *horizontalLayout_10;
    QLabel *label_13;
    QSlider *scaleZ;
    QLabel *label_4;
    QHBoxLayout *horizontalLayout_11;
    QLabel *label_14;
    QSlider *cameraAngle;
    QHBoxLayout *horizontalLayout_12;
    QLabel *label_15;
    QSlider *cameraY;
    QSpacerItem *verticalSpacer;
    QMenuBar *menubar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(800, 600);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        horizontalLayout = new QHBoxLayout(centralwidget);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        glwidget = new GLWidget(centralwidget);
        glwidget->setObjectName(QStringLiteral("glwidget"));

        horizontalLayout->addWidget(glwidget);

        frame = new QFrame(centralwidget);
        frame->setObjectName(QStringLiteral("frame"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(frame->sizePolicy().hasHeightForWidth());
        frame->setSizePolicy(sizePolicy);
        frame->setMinimumSize(QSize(0, 0));
        frame->setMaximumSize(QSize(300, 16777215));
        verticalLayout = new QVBoxLayout(frame);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        label = new QLabel(frame);
        label->setObjectName(QStringLiteral("label"));
        sizePolicy.setHeightForWidth(label->sizePolicy().hasHeightForWidth());
        label->setSizePolicy(sizePolicy);
        label->setMargin(0);

        verticalLayout->addWidget(label);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        label_5 = new QLabel(frame);
        label_5->setObjectName(QStringLiteral("label_5"));

        horizontalLayout_2->addWidget(label_5);

        translateX = new QSlider(frame);
        translateX->setObjectName(QStringLiteral("translateX"));
        translateX->setMinimum(-100);
        translateX->setMaximum(100);
        translateX->setOrientation(Qt::Horizontal);

        horizontalLayout_2->addWidget(translateX);


        verticalLayout->addLayout(horizontalLayout_2);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        label_6 = new QLabel(frame);
        label_6->setObjectName(QStringLiteral("label_6"));

        horizontalLayout_3->addWidget(label_6);

        translateY = new QSlider(frame);
        translateY->setObjectName(QStringLiteral("translateY"));
        translateY->setMinimum(-100);
        translateY->setMaximum(100);
        translateY->setOrientation(Qt::Horizontal);

        horizontalLayout_3->addWidget(translateY);


        verticalLayout->addLayout(horizontalLayout_3);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        label_7 = new QLabel(frame);
        label_7->setObjectName(QStringLiteral("label_7"));

        horizontalLayout_4->addWidget(label_7);

        translateZ = new QSlider(frame);
        translateZ->setObjectName(QStringLiteral("translateZ"));
        translateZ->setMinimum(-100);
        translateZ->setMaximum(100);
        translateZ->setOrientation(Qt::Horizontal);

        horizontalLayout_4->addWidget(translateZ);


        verticalLayout->addLayout(horizontalLayout_4);

        label_2 = new QLabel(frame);
        label_2->setObjectName(QStringLiteral("label_2"));
        sizePolicy.setHeightForWidth(label_2->sizePolicy().hasHeightForWidth());
        label_2->setSizePolicy(sizePolicy);

        verticalLayout->addWidget(label_2);

        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setObjectName(QStringLiteral("horizontalLayout_5"));
        label_8 = new QLabel(frame);
        label_8->setObjectName(QStringLiteral("label_8"));

        horizontalLayout_5->addWidget(label_8);

        rotateX = new QSlider(frame);
        rotateX->setObjectName(QStringLiteral("rotateX"));
        rotateX->setMaximum(360);
        rotateX->setOrientation(Qt::Horizontal);
        rotateX->setTickPosition(QSlider::NoTicks);
        rotateX->setTickInterval(1);

        horizontalLayout_5->addWidget(rotateX);


        verticalLayout->addLayout(horizontalLayout_5);

        horizontalLayout_6 = new QHBoxLayout();
        horizontalLayout_6->setObjectName(QStringLiteral("horizontalLayout_6"));
        label_9 = new QLabel(frame);
        label_9->setObjectName(QStringLiteral("label_9"));

        horizontalLayout_6->addWidget(label_9);

        rotateY = new QSlider(frame);
        rotateY->setObjectName(QStringLiteral("rotateY"));
        rotateY->setMaximum(360);
        rotateY->setOrientation(Qt::Horizontal);

        horizontalLayout_6->addWidget(rotateY);


        verticalLayout->addLayout(horizontalLayout_6);

        horizontalLayout_7 = new QHBoxLayout();
        horizontalLayout_7->setObjectName(QStringLiteral("horizontalLayout_7"));
        label_10 = new QLabel(frame);
        label_10->setObjectName(QStringLiteral("label_10"));

        horizontalLayout_7->addWidget(label_10);

        rotateZ = new QSlider(frame);
        rotateZ->setObjectName(QStringLiteral("rotateZ"));
        rotateZ->setMaximum(360);
        rotateZ->setOrientation(Qt::Horizontal);

        horizontalLayout_7->addWidget(rotateZ);


        verticalLayout->addLayout(horizontalLayout_7);

        label_3 = new QLabel(frame);
        label_3->setObjectName(QStringLiteral("label_3"));
        sizePolicy.setHeightForWidth(label_3->sizePolicy().hasHeightForWidth());
        label_3->setSizePolicy(sizePolicy);

        verticalLayout->addWidget(label_3);

        horizontalLayout_8 = new QHBoxLayout();
        horizontalLayout_8->setObjectName(QStringLiteral("horizontalLayout_8"));
        label_11 = new QLabel(frame);
        label_11->setObjectName(QStringLiteral("label_11"));

        horizontalLayout_8->addWidget(label_11);

        scaleX = new QSlider(frame);
        scaleX->setObjectName(QStringLiteral("scaleX"));
        scaleX->setMinimum(-100);
        scaleX->setMaximum(100);
        scaleX->setValue(10);
        scaleX->setOrientation(Qt::Horizontal);

        horizontalLayout_8->addWidget(scaleX);


        verticalLayout->addLayout(horizontalLayout_8);

        horizontalLayout_9 = new QHBoxLayout();
        horizontalLayout_9->setObjectName(QStringLiteral("horizontalLayout_9"));
        label_12 = new QLabel(frame);
        label_12->setObjectName(QStringLiteral("label_12"));

        horizontalLayout_9->addWidget(label_12);

        scaleY = new QSlider(frame);
        scaleY->setObjectName(QStringLiteral("scaleY"));
        scaleY->setMinimum(-100);
        scaleY->setMaximum(100);
        scaleY->setValue(10);
        scaleY->setOrientation(Qt::Horizontal);

        horizontalLayout_9->addWidget(scaleY);


        verticalLayout->addLayout(horizontalLayout_9);

        horizontalLayout_10 = new QHBoxLayout();
        horizontalLayout_10->setObjectName(QStringLiteral("horizontalLayout_10"));
        label_13 = new QLabel(frame);
        label_13->setObjectName(QStringLiteral("label_13"));

        horizontalLayout_10->addWidget(label_13);

        scaleZ = new QSlider(frame);
        scaleZ->setObjectName(QStringLiteral("scaleZ"));
        scaleZ->setMinimum(-100);
        scaleZ->setMaximum(100);
        scaleZ->setValue(10);
        scaleZ->setOrientation(Qt::Horizontal);

        horizontalLayout_10->addWidget(scaleZ);


        verticalLayout->addLayout(horizontalLayout_10);

        label_4 = new QLabel(frame);
        label_4->setObjectName(QStringLiteral("label_4"));

        verticalLayout->addWidget(label_4);

        horizontalLayout_11 = new QHBoxLayout();
        horizontalLayout_11->setObjectName(QStringLiteral("horizontalLayout_11"));
        label_14 = new QLabel(frame);
        label_14->setObjectName(QStringLiteral("label_14"));

        horizontalLayout_11->addWidget(label_14);

        cameraAngle = new QSlider(frame);
        cameraAngle->setObjectName(QStringLiteral("cameraAngle"));
        cameraAngle->setMaximum(360);
        cameraAngle->setOrientation(Qt::Horizontal);

        horizontalLayout_11->addWidget(cameraAngle);


        verticalLayout->addLayout(horizontalLayout_11);

        horizontalLayout_12 = new QHBoxLayout();
        horizontalLayout_12->setObjectName(QStringLiteral("horizontalLayout_12"));
        label_15 = new QLabel(frame);
        label_15->setObjectName(QStringLiteral("label_15"));

        horizontalLayout_12->addWidget(label_15);

        cameraY = new QSlider(frame);
        cameraY->setObjectName(QStringLiteral("cameraY"));
        cameraY->setMinimum(-200);
        cameraY->setMaximum(200);
        cameraY->setOrientation(Qt::Horizontal);

        horizontalLayout_12->addWidget(cameraY);


        verticalLayout->addLayout(horizontalLayout_12);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout->addItem(verticalSpacer);


        horizontalLayout->addWidget(frame);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QStringLiteral("menubar"));
        menubar->setEnabled(false);
        menubar->setGeometry(QRect(0, 0, 800, 22));
        menubar->setNativeMenuBar(true);
        MainWindow->setMenuBar(menubar);

        retranslateUi(MainWindow);
        QObject::connect(translateX, SIGNAL(valueChanged(int)), glwidget, SLOT(translateX(int)));
        QObject::connect(translateY, SIGNAL(valueChanged(int)), glwidget, SLOT(translateY(int)));
        QObject::connect(translateZ, SIGNAL(valueChanged(int)), glwidget, SLOT(translateZ(int)));
        QObject::connect(rotateX, SIGNAL(valueChanged(int)), glwidget, SLOT(rotateX(int)));
        QObject::connect(rotateY, SIGNAL(valueChanged(int)), glwidget, SLOT(rotateY(int)));
        QObject::connect(rotateZ, SIGNAL(valueChanged(int)), glwidget, SLOT(rotateZ(int)));
        QObject::connect(scaleX, SIGNAL(valueChanged(int)), glwidget, SLOT(scaleX(int)));
        QObject::connect(scaleY, SIGNAL(valueChanged(int)), glwidget, SLOT(scaleY(int)));
        QObject::connect(scaleZ, SIGNAL(valueChanged(int)), glwidget, SLOT(scaleZ(int)));
        QObject::connect(cameraAngle, SIGNAL(valueChanged(int)), glwidget, SLOT(cameraPosition(int)));
        QObject::connect(cameraY, SIGNAL(valueChanged(int)), glwidget, SLOT(cameraY(int)));

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "Lab 4", 0));
        label->setText(QApplication::translate("MainWindow", "Translate", 0));
        label_5->setText(QApplication::translate("MainWindow", "X", 0));
        label_6->setText(QApplication::translate("MainWindow", "Y", 0));
        label_7->setText(QApplication::translate("MainWindow", "Z", 0));
        label_2->setText(QApplication::translate("MainWindow", "Rotate", 0));
        label_8->setText(QApplication::translate("MainWindow", "X", 0));
        label_9->setText(QApplication::translate("MainWindow", "Y", 0));
        label_10->setText(QApplication::translate("MainWindow", "Z", 0));
        label_3->setText(QApplication::translate("MainWindow", "Scale", 0));
        label_11->setText(QApplication::translate("MainWindow", "X", 0));
        label_12->setText(QApplication::translate("MainWindow", "Y", 0));
        label_13->setText(QApplication::translate("MainWindow", "Z", 0));
        label_4->setText(QApplication::translate("MainWindow", "Camera Position", 0));
        label_14->setText(QApplication::translate("MainWindow", "Angle", 0));
        label_15->setText(QApplication::translate("MainWindow", "Y", 0));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
