import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {

    width: 350
    height: 640
    visible: true
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page3{
        }

        Page2{
        }

        Page1{
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page Start")
        }
        TabButton {
            text: qsTr("Profile")
        }
        TabButton {
            text: qsTr("Page 1")
        }
    }
}
