import QtQuick 2.5
import QtQuick.VirtualKeyboard 2.1

InputPanel {
    id: inputPanel
    property bool activated: false
    active: activated && Qt.inputMethod.visible
    visible: active
    width: parent.width

    Item {
        id: gripTop
        z: 1000
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 6
        MouseArea {
            anchors.fill: parent
            drag.target: inputPanel; drag.axis: Drag.XAndYAxis
        }
    }
    Item {
        id: gripLeft
        z: 1000
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 36
        MouseArea {
            anchors.fill: parent
            drag.target: inputPanel; drag.axis: Drag.XAndYAxis
        }
    }
    Item {
        id: gripRight
        z: 1000
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 36
        MouseArea {
            anchors.fill: parent
            drag.target: inputPanel; drag.axis: Drag.XAndYAxis
        }
    }
    Item {
        id: gripBottom
        z: 1000
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 26
        MouseArea {
            anchors.fill: parent
            drag.target: inputPanel; drag.axis: Drag.XAndYAxis
        }
    }
}

