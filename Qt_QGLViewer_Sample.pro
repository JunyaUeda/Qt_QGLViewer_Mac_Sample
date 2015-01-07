#-------------------------------------------------
#
# Project created by QtCreator 2015-01-07T17:40:21
#
#-------------------------------------------------

QT += core gui
QT += xml
QT += opengl
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Qt_QGLViewer_Sample
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    sampleViewer.cpp \
    graphicareawidget.cpp

HEADERS  += mainwindow.h \
    sampleViewer.h \
    graphicareawidget.h

FORMS    += mainwindow.ui


# --------------------------------------------------------------------------------------

# The remaining of this configuration tries to automatically detect the library paths.
# In your applications, you can probably simply use (see doc/compilation.html for details) :

#INCLUDEPATH *= C:/Users/debunne/Documents/libQGLViewer-2.6.0
#LIBS *= -LC:/Users/debunnes/Documents/libQGLViewer-2.6.0/QGLViewer -lQGLViewer2

# Change these paths according to your configuration.

# --------------------------------------------------------------------------------------

### Unix configuration ###

unix {
  CONFIG -= debug debug_and_release
  CONFIG *= release

  isEmpty( PREFIX ) {
  # Try same INCLUDE_DIR and LIB_DIR parameters than for the make install.
  PREFIX=/usr
  }

  # LIB_NAME
  LIB_NAME = libQGLViewer*.so*
  macx|darwin-g++ {
  LIB_NAME = libQGLViewer.$${QMAKE_EXTENSION_SHLIB}
  }
  hpux {
  LIB_NAME = libQGLViewer*.sl*
  }

  !isEmpty( QGLVIEWER_STATIC ) {
  LIB_NAME = libQGLViewer*.a
  }

  # LIB_DIR
  isEmpty( LIB_DIR ) {
  LIB_DIR = $${PREFIX}/lib
  }

  !exists( $${LIB_DIR}/$${LIB_NAME} ) {
        exists( ../libQGLViewer-2.6.0/QGLViewer/$${LIB_NAME} ) {
    #message( The library was found in ../../QGLViewer which will be set as the LIB_DIR )
          LIB_DIR = ../libQGLViewer-2.6.0/QGLViewer
  }
  }

  !exists( $${LIB_DIR}/$${LIB_NAME} ) {
        exists( ../libQGLViewer-2.6.0/QGLViewer-build-desktop/$${LIB_NAME} ) {
    #message( The library was found in ../../QGLViewer-build-desktop which will be set as the LIB_DIR )
          LIB_DIR = ../libQGLViewer-2.6.0/QGLViewer-build-desktop
  }
  }

  macx|darwin-g++ {
  !exists( $${LIB_DIR}/$${LIB_NAME} ) {
    # DYLIB was not found, try to find Framework instead
    LIB_NAME = QGLViewer.framework/QGLViewer
    LIB_DIR = ~/Library/Frameworks
    # qmake does not handle tilde
    LIB_DIR = $$system(cd $${LIB_DIR};pwd)

    !exists( $${LIB_DIR}/$${LIB_NAME} ) {
                exists( ../libQGLViewer-2.6.0/QGLViewer/$${LIB_NAME} ) {
      #message( The framework was found in ../../QGLViewer which will be set as the LIB_DIR )
                  LIB_DIR = ../libQGLViewer-2.6.0/QGLViewer
    }
    }

    !exists( $${LIB_DIR}/$${LIB_NAME} ) {
                exists( ../libQGLViewer-2.6.0/QGLViewer-build-desktop/$${LIB_NAME} ) {
      #message( The framework was found in ../../QGLViewer-build-desktop which will be set as the LIB_DIR )
                  LIB_DIR = ../libQGLViewer-2.6.0/QGLViewer-build-desktop
    }
    }
  }
  }

  !exists( $${LIB_DIR}/$${LIB_NAME} ) {
  message( Unable to find $${LIB_NAME} in $${LIB_DIR}. Make sure you have built it. )
  message( If you have you should run qmake LIB_DIR=/path/to/QGLViewer/$${LIB_NAME} )
  }

  # The actual directory where the library/framework was found
  LIB_DIR_ABSOLUTE_PATH = $$system(cd $${LIB_DIR};pwd)

  # INCLUDE_DIR
  isEmpty( INCLUDE_DIR ) {
  INCLUDE_DIR = $${PREFIX}/include
  }

  macx|darwin-g++ {
    !exists( $${INCLUDE_DIR}/QGLViewer/qglviewer.h ) {
      INCLUDE_DIR=$${LIB_DIR}/QGLViewer.framework
      exists( $${LIB_DIR}/QGLViewer.framework/Headers/QGLViewer/qglviewer.h ) {
       INCLUDE_DIR = $${LIB_DIR}/QGLViewer.framework/Headers
      }
    }
  }

  !exists( $${INCLUDE_DIR}/QGLViewer/qglviewer.h ) {
        exists( ../libQGLViewer-2.6.0/QGLViewer/qglviewer.h ) {
    # message( libQGLViewer header files were not installed in standard $${INCLUDE_DIR} directory )
    # message( Headers were found in ../.. which will be set as the INCLUDE_DIR )
          INCLUDE_DIR = ../libQGLViewer-2.6.0
  }
  }

  !exists( $${INCLUDE_DIR}/QGLViewer/qglviewer.h ) {
  message( Unable to find QGLViewer/qglviewer.h in $${INCLUDE_DIR} )
  message( Use qmake INCLUDE_DIR=/path/to/QGLViewerDir )
  }


  macx|darwin-g++ {
  # On Mac, the lib path can be specified in the executable using install_name_tool
  contains( LIB_NAME, ".*QGLViewer.framework.*" ) {
    # If framework was not found in a standard directory
    !contains( LIB_DIR, ".*/Library/Frameworks/*$" ) {
    QMAKE_LFLAGS += -F$${LIB_DIR}
    !plugin:QMAKE_POST_LINK=install_name_tool -change QGLViewer.framework/Versions/2/QGLViewer $${LIB_DIR_ABSOLUTE_PATH}/QGLViewer.framework/Versions/2/QGLViewer $${TARGET}.app/Contents/MacOS/$${TARGET}
    }
    LIBS += -F$${LIB_DIR} -framework QGLViewer
  } else {
    !plugin:QMAKE_POST_LINK=install_name_tool -change libQGLViewer.2.dylib $${LIB_DIR_ABSOLUTE_PATH}/libQGLViewer.2.dylib $${TARGET}.app/Contents/MacOS/$${TARGET}
    LIBS *= -L$${LIB_DIR} -lQGLViewer
  }
  } else {
  isEmpty(QMAKE_LFLAGS_RPATH) {
    !plugin:QMAKE_LFLAGS += -Wl,-rpath,$${LIB_DIR_ABSOLUTE_PATH}
  } else {
    !plugin:QMAKE_RPATHDIR *= $${LIB_DIR_ABSOLUTE_PATH}
  }
  LIBS *= -L$${LIB_DIR} -lQGLViewer
  }

  # Paths were correctly detected
  INCLUDEPATH += $${INCLUDE_DIR}
  DEPENDPATH  += $${INCLUDE_DIR}

  !isEmpty( QGLVIEWER_STATIC ) {
  LIBS *= $${LIB_DIR}/$${LIB_NAME}
  }

  # Remove debugging options in release mode makes files much smaller
  release:QMAKE_CFLAGS_RELEASE -= -g
  release:QMAKE_CXXFLAGS_RELEASE -= -g

  # Intermediate files are created in an hidden folder
  MOC_DIR = .moc
  OBJECTS_DIR = .obj
}

macx|darwin-g++ {
  ICON = $${INCLUDEPATH}/QGLViewer/qglviewer.icns
}

