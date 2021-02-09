import QtQuick 2.2
import QtQuick.Controls 2.5

Page {
    width: 350
    height: 640

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Repeater {
        id: _rep

        model: ListModel{
            ListElement{
                chatname: "Prozor1"
            }
            ListElement{
                chatname: "Prozor2"
            }
            ListElement{
                chatname: "Prozor3"
            }
            ListElement{
                chatname: "Prozor4"
            }
            ListElement{
                chatname: "Prozor5"
            }
            ListElement{
                chatname: "Prozor6"
            }
        }
        delegate: _delegate
    }

    Component {
        id: _delegate


        MouseArea{
            id: dragArea
            property int indexVal: index
            property bool held: false

            anchors.margins: Style.smallSpacing
            width: 175
            height: 175

            drag.target: held ? content : undefined
            drag.axis: Drag.XAndYAxis

            onClicked: {
                dc.getChatWithClient(chatname)
            }

            onPressAndHold: {
                z = 10
                held = true
            }

            onReleased: held = false

            Behavior on x {
                enabled: dragArea.state !== "active"
                NumberAnimation { duration: 4000; easing.type: Easing.OutBack }
            }

            Behavior on y {
                enabled: dragArea.state !== "active"
                NumberAnimation { duration: 4000; easing.type: Easing.OutBack }
            }

            Image{
                id: content
                width: parent.width
                height: parent.height
                source: "qrc:/new/photos/C:/Users/dimas/Desktop/Polygraf/admin.png"

                Drag.active:  held
                Drag.source: dragArea
                Drag.hotSpot.x: width / 2
                Drag.hotSpot.y: height / 2

                SequentialAnimation on rotation {
                    NumberAnimation { to:  2; duration: 120 }
                    NumberAnimation { to: -2; duration: 120 }
                    NumberAnimation { to:  0; duration: 120 }
                    running: held
                    loops: Animation.Infinite; alwaysRunToEnd: true
                }

                states: State{
                    when: held

                    ParentChange {target: content}
                    AnchorChanges{
                        target: content
                        anchors { horizontalCenter: undefined; verticalCenter: undefined }
                    }
                }

                transitions: Transition { NumberAnimation { property: "scale"; easing.type: Easing.InCubic; duration: 200} }

                Text{
                    id: peopleText
                    anchors.margins: 7
                    text: chatname
                    font.pointSize: 12
                    anchors.bottom: parent.bottom
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            State{
                name: "active"; when: held
                PropertyChanges{ target: content;  scale: 0.9 }
            }

            DropArea{
                id: dropArea

                property bool isMoving: false
                anchors.fill: parent

                onEntered: {
                    isMoving = true

                    visualModel.items.move(
                                drag.source.DelegateModel.itemsIndex,
                                dragArea.DelegateModel.itemsIndex)
                }
                onExited: {
                    isMoving = false
                }
            }
        }
    }
}

