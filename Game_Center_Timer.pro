TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    database.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    database.h

RC_ICONS = game_icon.ico
