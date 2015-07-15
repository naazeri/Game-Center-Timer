import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow
{
    title: qsTr("سامانه مدیریت کنسول های بازی")
    width: Screen.desktopAvailableWidth / 1.8
	height: Screen.desktopAvailableHeight / 1.6
    visible: true
	id: main_window

    property real thePayment: DataBase.payment
    property int spentTime: DataBase.duration
    property int countdownHour: spentTime/3600
    property int countdownMinute: (spentTime-(countdownHour*3600))/60
    property int countdownSecond: spentTime-(countdownHour*3600)-(countdownMinute*60)
    property bool isRunning: false
    property bool isStopped: true

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
                anchors.topMargin:parent.height/50
                anchors.horizontalCenter: parent.horizontalCenter
                text: "قابل پرداخت : " + thePayment + " تومان"
                font.family: font_traffic.name
                font.pixelSize:parent.height/7.5
                color:"white"
            }

            Item
            {
                id:item_countdown
                anchors.top:text_payment.bottom
                anchors.topMargin:parent.height/50
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

                MouseArea
                {
                    id:spRb_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        myGroup.current=spRb
                        DataBase.spActivated()
                        spRb_image.scale=0.75
                        spRb_image.opacity=0.5
                        spRb_image_timer.running=true
                    }
                }
            }

            Image
            {
               id:spRb_image
               anchors.right:spRb.left
               anchors.rightMargin:width/4
               anchors.verticalCenter: spRb.verticalCenter
               width:item_countdown.width/8
               height:width/sourceSize.width*sourceSize.height
               source:"qrc:/sp.png"

               Behavior on scale
               {
                   SpringAnimation
                   {
                       spring:2
                       damping:.2
                       duration:250
                   }
               }

               Behavior on opacity
               {
                   SpringAnimation
                   {
                       spring:2
                       damping:.2
                       duration:250
                   }
               }

               Image
               {
                   id:spRb_image_highlight
                   anchors.fill:parent
                   z:-1
                   source:"qrc:/sp-highlight.png"
               }

               MouseArea
               {
                   id:spRb_image_mouse
                   anchors.fill:parent
                   onClicked:
                   {
                       myGroup.current=spRb
                       DataBase.spActivated()
                       parent.scale=0.75
                       parent.opacity=0.5
                       spRb_image_timer.running=true
                   }
               }

               Timer
               {
                   id:spRb_image_timer
                   interval:250
                   running:false
                   repeat:false
                   onTriggered:
                   {
                       spRb_image.opacity=1
                       spRb_image.scale=1
                       running=false
                   }
               }
            }

            Text
            {
                id:spRb_text
                anchors.right:spRb_image.left
                anchors.verticalCenter: spRb.verticalCenter
                text:" تک نفره"
                font.family: font_yekan.name
                font.pixelSize: spRb_image.height/2
                color:(isRunning==true)?"#cfd8dc":"white"
                scale:spRb_image.scale
                opacity: spRb_image.opacity

                MouseArea
                {
                    id:spRb_text_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        myGroup.current=spRb
                        DataBase.spActivated()
                        spRb_image.scale=0.75
                        spRb_image.opacity=0.5
                        spRb_image_timer.running=true
                    }
                }
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

                MouseArea
                {
                    id:mpRb_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        myGroup.current=mpRb
                        DataBase.mpActivated()
                        mpRb_image.scale=0.75
                        mpRb_image.opacity=0.5
                        mpRb_image_timer.running=true
                    }
                }
            }

            Image
            {
                id:mpRb_image
                anchors.right:mpRb.left
                anchors.verticalCenter: mpRb.verticalCenter
                width:item_countdown.width/4
                height:width/sourceSize.width*sourceSize.height
                source:"qrc:/mp.png"


                Behavior on scale
                {
                    SpringAnimation
                    {
                        spring:2
                        damping:.2
                        duration:250
                    }
                }

                Behavior on opacity
                {
                    SpringAnimation
                    {
                        spring:2
                        damping:.2
                        duration:250
                    }
                }

                Image
                {
                    id:mpRb_image_highlight
                    anchors.fill:parent
                    source:"qrc:/mp-highlight.png"
                    z:-1
                }

               MouseArea
               {
                   id:mpRb_image_mouse
                   anchors.fill:parent
                   onClicked:
                   {
                       myGroup.current=mpRb
                       DataBase.mpActivated()
                       parent.scale=0.75
                       parent.opacity=0.5
                       mpRb_image_timer.running=true
                   }
               }

               Timer
               {
                   id:mpRb_image_timer
                   interval:250
                   running:false
                   repeat:false
                   onTriggered:
                   {
                       mpRb_image.opacity=1
                       mpRb_image.scale=1
                       running=false
                   }
               }
            }

            Text
            {
                id:mpRb_text
                anchors.right:mpRb_image.left
                anchors.verticalCenter: mpRb.verticalCenter
                text:"دو نفره"
                font.family: font_yekan.name
                font.pixelSize: mpRb_image.height/2
                color:(isRunning==true)?"#cfd8dc":"white"
                opacity:mpRb_image.opacity
                scale:mpRb_image.scale

                MouseArea
                {
                    id:mpRb_text_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        myGroup.current=mpRb
                        DataBase.mpActivated()
                        mpRb_image.scale=0.75
                        mpRb_image.opacity=0.5
                        mpRb_image_timer.running=true
                    }
                }
            }

            Rectangle
            {
                id:spButton
                width:item_countdown.width/3
                height:width/3
                anchors.right:item_countdown.right
                anchors.rightMargin: item_countdown.width/9
                anchors.bottom:parent.bottom
                anchors.bottomMargin:parent.height/12.5
                color:((isStopped==false) && (isRunning==false))?"white":"#cfd8dc"

                MouseArea
                {
                    id:spButton_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        if(isRunning==true)
                        {
                            isRunning=false
                            isStopped=false
                            DataBase.pause()
                        }
                        else
                        {
                            isRunning=true
                            DataBase.start()
                        }
                    }
                }
            }

            Rectangle
            {
                id:stopButton
                width:item_countdown.width/3
                height:width/3
                anchors.left:item_countdown.left
                anchors.leftMargin: item_countdown.width/9
                anchors.bottom:parent.bottom
                anchors.bottomMargin:parent.height/12.5
                color:"white"

                MouseArea
                {
                    id:stopButton_mouse
                    anchors.fill:parent
                    onClicked:
                    {
                        if(isRunning==false && isStopped==false)
                        {
                            isRunning=false
                            isStopped=true
                            DataBase.stop()
                        }
                    }
                }
            }
        }
    }
}
