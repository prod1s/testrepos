import QtQuick.Controls 2.2 as QC2
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.0

Page{
    id: root
    width: 320
    height: 580

    property var db
    property int rowHeight: 90
    property int len

    //Component.onCompleted: {
    //    db = LocalStorage.openDatabaseSync("test_db", "1.0", "Database", 100000)
    //    loadData()
    //}

    //property var sql_data: []

    //function loadData() {
    //    var sql, rs, i
    //    db.transaction(function(tx) {
    //        tx.executeSql("DROP TABLE IF EXISTS tbl")
    //        tx.executeSql("CREATE TABLE IF NOT EXISTS tbl (
    //            rowId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    //            name TEXT NOT NULL, listOrder INTEGER NOT NULL)")
    //        len = 15
    //        for (i = 0; i < len; i++)
    //            tx.executeSql("INSERT INTO tbl (name, listOrder) VALUES ('Item " + i + "', " + i + ")")
    //        rs = tx.executeSql("SELECT name, listOrder FROM tbl ORDER BY listOrder ASC")
    //    })
    //    len = rs.rows.length
    //    sql_data = new Array(len)
    //    for (i = 0; i < len; i++) {
    //        sql_data[i] = {"name": "", "order": ""}
    //        sql_data[i]["name"] = rs.rows.item(i).name
    //        sql_data[i]["order"] = rs.rows.item(i).listOrder
    //    }
    //    repeater.model = sql_data
    //}


    Flickable {
        id: mainFlick
        anchors.fill: parent
        contentHeight: mainColumn.height
        rebound: Transition {
            NumberAnimation {
                properties: "y"
                duration: 500
                easing.type: Easing.OutCirc
            }
        }

        GridView {
                  id: mainColumn
                  cellWidth: 175
                  cellHeight: 175

        //        width: parent.width

        //        function moveEle(start, end, f) {
        //            if (f === false) {
        //                var p1, p2, ele1, ele2
        //                var c = false
        //                var d1 = new Date().getTime()
        //                ele1 = repeater.itemAt(start)
        //                console.debug(f)
        //                ele2 = repeater.itemAt(end)
        //                root.sql_data[start]["order"] = root.sql_data[end]["order"]
        //                if (end < start) {
        //                    p1 = end
        //                    p2 = start
        //                } else {
        //                    p1 = start
        //                    p2 = end
        //                    c = true
        //                }

        //                root.db.transaction(function(tx) {
        //                    var sql = "UPDATE tbl SET listOrder = " + root.sql_data[p1]["order"] + " "
        //                    sql += "WHERE listOrder = " + (root.sql_data[p2]["order"])
        //                    for (var i = p1; i < p2; i++) {
        //                        if (c === false) {
        //                            if (i !== start) {
        //                                root.sql_data[i]["order"]++
        //                                sql = "UPDATE tbl SET listOrder = " + root.sql_data[i]["order"] + " "
        //                                sql += "WHERE listOrder = " + (root.sql_data[i]["order"] - 1)
        //                                tx.executeSql(sql)
        //                            }
        //                        } else {
        //                            root.sql_data[i]["order"]--
        //                            sql = "UPDATE tbl SET listOrder = " + root.sql_data[i]["order"] + " "
        //                            sql += "WHERE listOrder = " + (root.sql_data[i]["order"] - 1)
        //                            tx.executeSql(sql)
        //                        }
        //                    }
        //                })
        //            } else if (f === true) {
        //                c = false
        //                d1 = new Date().getTime()
        //                ele1 = repeater.itemAt(start)
        //                console.debug(f)
        //                end--
        //                ele2 = repeater.itemAt(end)
        //                root.sql_data[start]["order"] = root.sql_data[end]["order"]
        //                p1 = start
        //                p2 = end
        //                c = true

        //                root.db.transaction(function(tx) {
        //                    var sql = "UPDATE tbl SET listOrder = " + root.sql_data[p1]["order"] + " "
        //                    sql += "WHERE listOrder = " + (root.sql_data[p2]["order"])
        //                    tx.executeSql(sql)
        //                    for (var i = p1; i <= p2; i++) {
        //                        if (i !== start) {
        //                            root.sql_data[i]["order"]--
        //                            sql = "UPDATE tbl SET listOrder = " + root.sql_data[i]["order"] + " "
        //                            sql += "WHERE listOrder = " + (root.sql_data[i]["order"] - 1)
        //                            tx.executeSql(sql)
        //                        }
        //                    }
        //                })
        //            }

        //            sql_data = sql_data.sort(function(a,b) {
        //                return a["order"] - b["order"]
        //            })
        //            repeater.model = sql_data
        //            var d2 = new Date().getTime()
        //            console.debug("Seconds: " + (d2 - d1) / 1000)
        //        }

        Repeater {
            id: repeater
            width: parent.width
            model: ListModel{
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
                ListElement{
                    name: "Ol"
                    order: "Fa"
                }
            }
            delegate: Column {
                id: repeaterItem
                width: 175
                height: 175

                property int pos: index

                DropArea {
                    id: dragTarget
                    width: parent.width
                    height: 15
                    property int ind: index
                    onEntered: {
                        drag.source.ind = index
                        drag.source.f = false
                        if (drag.source.ind !== drag.source.oldInd && drag.source.ind !== drag.source.oldInd + 1)
                            drag.source.caught = true
                    }
                    onExited: drag.source.caught = false

                    Rectangle {
                        id: dropRect
                        anchors.fill: parent
                        border.color: "white"
                        border.width: 2
                        z: dragArea.drag.active ? 2 : 1
                        states: [
                            State {
                                when: dragTarget.containsDrag
                                PropertyChanges {
                                    target: dropRect
                                    color: "grey"
                                }
                                PropertyChanges {
                                    target: dropRectLine
                                    visible: false
                                }
                            }
                        ]
                        Rectangle {
                            id: dropRectLine
                            width: parent.width
                            height: 1
                            anchors.verticalCenter: parent.verticalCenter
                            color: "black"
                        }
                    }
                }
                Row {
                    id: contentRow
                    width: parent.width
                    height: parent.height
                    Drag.active: dragArea.drag.active
                    Drag.source: dragArea
                    Drag.hotSpot.x: width / 2
                    Drag.hotSpot.y: height / 2
                    Column {
                        id: itemColumn
                        width: parent.width - 70
                        Text {
                            text: "Name: " + name
                        }
                        Text {
                            text: "Order: " + order
                        }
                        Text {
                            text: "Repeater Index: " + index
                        }
                    } // itemColumn

                    MouseArea {
                        id: dragArea
                        width: 40 //repeater.width
                        height: itemColumn.height

                        drag.axis: Drag.YAxis
                        drag.target: contentRow
                        property point beginDrag
                        property point dropTarget
                        property bool caught: false
                        property int ind
                        property int oldInd: index
                        property bool f
                        onPressed: {
                            dragArea.beginDrag = Qt.point(contentRow.x, contentRow.y);
                        }
                        onReleased: {
                            if (dragArea.caught) {
                                dropRectFinal.color = "white"
                                dropRectLineFinal.visible = true
                                mainColumn.moveEle(index,dragArea.ind, dragArea.f)
                            } else {
                                backAnimY.from = contentRow.y;
                                backAnimY.to = beginDrag.y;
                                backAnim.start()
                            }
                        }

                        Rectangle {
                            id: dragRect
                            width: 40
                            height: itemColumn.height
                            color: "grey"
                        }
                    } // contentRow
                } // dragArea

                ParallelAnimation {
                    id: backAnim
                    SpringAnimation { id: backAnimY; target: contentRow; property: "y"; duration: 300; spring: 2; damping: 0.2 }
                }
            } // repeaterItem
        } // repeater

        DropArea {
            id: dragTargetFinal
            width: parent.width
            height: 15
            property int ind: root.len
            onEntered: {
                drag.source.ind = ind
                drag.source.f = true
                if (drag.source.ind !== drag.source.oldInd && drag.source.ind !== drag.source.oldInd + 1)
                    drag.source.caught = true
            }
            onExited: drag.source.caught = false

            Rectangle {
                id: dropRectFinal
                anchors.fill: parent
                states: [
                    State {
                        when: dragTargetFinal.containsDrag
                        PropertyChanges {
                            target: dropRectFinal
                            color: "grey"
                        }
                        PropertyChanges {
                            target: dropRectLineFinal
                            visible: false
                        }
                    }
                ]
                Rectangle {
                    id: dropRectLineFinal
                    width: parent.width
                    height: 1
                    anchors.verticalCenter: parent.verticalCenter
                    color: "black"
                }
            }
        }
    } // mainColumn
    QC2.ScrollBar.vertical: QC2.ScrollBar { active: scrollAnim.running ? true : false }
} // mainFlick
DropArea {
    id: scrollUp
    width: parent.width
    height: 50
    anchors.top: parent.top
    visible: {
        var visible = false
        if (mainFlick.contentY > 0)
            visible = true
        visible
    }
    onEntered: {
        scrollAnim.from = mainFlick.contentY
        scrollAnim.to = 0
        scrollAnim.start()
    }
    onExited: scrollAnim.stop()
}
DropArea {
    id: scrollDown
    width: parent.width
    height: 50
    anchors.bottom: parent.bottom
    visible: {
        var visible = false
        if (mainFlick.contentY < mainColumn.height - root.height)
            visible = true
        visible
    }
    onEntered: {
        scrollAnim.from = mainFlick.contentY
        scrollAnim.to = mainColumn.height - root.height
        scrollAnim.start()
    }
    onExited: scrollAnim.stop()
}
SmoothedAnimation {
    id: scrollAnim
    target: mainFlick
    property: "contentY"
    velocity: 400
    loops: 1
    maximumEasingTime: 10
}
} // root
