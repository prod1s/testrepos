import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Page {
    id: root
    width: 350
    height: 640



    header: Rectangle {
        Label{
            text: qsTr("Page 2")
            font.pixelSize: Qt.application.font.pixelSize * 2
            padding: 10
        }

        Button{
            id: _drowerBtn
            anchors.right: parent.right
            onClicked: _drower.open()
        }
    }

    Drawer {
        id: _drower
        width: 0.66 * root.width
        height: root.height
        edge: Qt.LeftEdge
    }


    Rectangle{
        id: _staticMainRect
        color: "transparent"
        width: root.width
        height: root.width + 50
        state: "unknown"


        Image{
            id: _imageProfile
            anchors.top: parent.top
            source: "qrc:/new/photos/C:/Users/dimas/Desktop/Polygraf/60957df4erc.jpg"
            width: root.width
            height: root.width
        }

        Rectangle{
            id: _btnGroup
            anchors.top: _imageProfile.bottom
            width: root.width
            height: 50
            color: "transparent"



            Button{
                id: _button1
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.left: parent.left
                width: (parent.width / 3) - 10;
                height: parent.height

                onPressed: {
                    _anim.running = true;
                }

                NumberAnimation {id: _anim; target: _staticMainRect; properties: "y"; easing.type: Easing.InOutQuad; duration: 1000; to: -1000 }

            }
            Button{
                id: _button2
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.left: _button1.right
                width: (parent.width / 3) - 10;
                height: parent.height
            }
            Button{
                id: _button3
                anchors.left: _button2.right
                anchors.rightMargin: 5
                anchors.leftMargin: 5
                width: (parent.width / 3) - 10;
                height: parent.height
            }
        }
    }

    ListView {
        id: _pageView
        clip: true
        anchors.top: _staticMainRect.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        width: parent.width
        model: 20

        delegate: ItemDelegate {
            text: "Item " + index
        }
    }
}

