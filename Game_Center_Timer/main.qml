import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    title: qsTr("Hello World")
	width: height * 1.618
	height: Screen.desktopAvailableHeight / 1.6
    visible: true
	id: root
}
