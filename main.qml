import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow
{
    id: main_window
    title: qsTr("سامانه مدیریت کنسول های بازی")
    width: Screen.desktopAvailableWidth / 1.8
	height: Screen.desktopAvailableHeight / 1.6
    visible: true

    property real thePayment: 0
    property int spentTime: 3665
    property int countdownHour: spentTime/3600
    property int countdownMinute: (spentTime-(countdownHour*3600))/60
    property int countdownSecond: spentTime-(countdownHour*3600)-(countdownMinute*60)

    MainForm
    {
        id:main_form
        anchors.fill: parent

        FontLoader { id: font_yekan; source:"qrc:/BYekan.ttf" }
        FontLoader { id: font_traffic; source:"qrc:/BTraffic.ttf" }

        Image
        {
            id:root
            anchors.fill:parent
            source:"qrc:/bg.jpg"

            Text
            {
                id:text_payment
                anchors.top:parent.top
                anchors.topMargin:parent.height/25
                anchors.horizontalCenter: parent.horizontalCenter
                text: "هزینه فعلی : " + thePayment + " تومان"
                font.family: font_traffic.name
                font.pixelSize:parent.height/7.5
                color:"#ffffff"
            }

            Item
            {
                id:item_countdown
                anchors.top:text_payment.bottom
                anchors.topMargin:parent.height/25
                anchors.horizontalCenter: parent.horizontalCenter
                width:text_payment.width
                height:parent.height/3.75

                Text
                {
                    id:text_countdown_hour
                    anchors.top:parent.top
                    anchors.topMargin:-1/4*parent.height
                    anchors.right:parent.right
                    text:((countdownHour>9)?"":"0") + countdownHour
                    font.family: font_yekan.name
                    font.pixelSize: parent.height*3/4
                    color:"#cfd8dc"
                }

                Text
                {
                    id:text_countdown_hour_label
                    anchors.top:text_countdown_hour.bottom
                    anchors.topMargin:-1*font.pixelSize
                    anchors.horizontalCenter: text_countdown_hour.horizontalCenter
                    text:"ساعت"
                    font.family: font_traffic.name
                    font.pixelSize: parent.height/4
                    color:"#cfd8dc"
                }

                Rectangle
                {
                    id:rect_seperate_hour_minute
                    x:parent.width*2/3
                    width:1
                    height:parent.height
                    color:"#cfd8dc"
                }

                Text
                {
                    id:text_countdown_minute
                    anchors.top:parent.top
                    anchors.topMargin:-1/4*parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:((countdownMinute>9)?"":"0") + countdownMinute
                    font.family: font_yekan.name
                    font.pixelSize: parent.height*3/4
                    color:"#cfd8dc"
                }

                Text
                {
                    id:text_countdown_minute_label
                    anchors.top:text_countdown_minute.bottom
                    anchors.topMargin:-1*font.pixelSize
                    anchors.horizontalCenter: text_countdown_minute.horizontalCenter
                    text:"دقیقه"
                    font.family: font_traffic.name
                    font.pixelSize: parent.height/4
                    color:"#cfd8dc"
                }

                Rectangle
                {
                    id:rect_seperate_minute_second
                    x:parent.width/3
                    width:1
                    height:parent.height
                    color:"#cfd8dc"
                }

                Text
                {
                    id:text_countdown_second
                    anchors.top:parent.top
                    anchors.topMargin:-1/4*parent.height
                    anchors.left:parent.left
                    text:((countdownSecond>9)?"":"0") + countdownSecond
                    font.family: font_yekan.name
                    font.pixelSize: parent.height*3/4
                    color:"#cfd8dc"
                }

                Text
                {
                    id:text_countdown_secondlabel
                    anchors.top:text_countdown_second.bottom
                    anchors.topMargin:-1*font.pixelSize
                    anchors.horizontalCenter: text_countdown_second.horizontalCenter
                    text:"ثانیه"
                    font.family: font_traffic.name
                    font.pixelSize: parent.height/4
                    color:"#cfd8dc"
                }
            }

            RadioButton
            {
                id:spRb
                anchors.right:item_countdown.right
                anchors.top:item_countdown.bottom
                anchors.topMargin:item_countdown.height/2
                exclusiveGroup: ExclusiveGroup{id:myGroup; current: spRb}
                width:item_countdown.width/25
                height:width
            }

            RadioButton
            {
                id:mpRb
                anchors.left:item_countdown.left
                anchors.leftMargin: item_countdown.width/2
                anchors.top:item_countdown.bottom
                anchors.topMargin:item_countdown.height/2
                exclusiveGroup: myGroup
                width:item_countdown.width/25
                height:width
            }
        }
    }
}
