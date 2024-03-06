import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#000"

    Item {
        id: content
        anchors.fill: parent
        opacity: 1
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {

            property int sizeAnim: 720

            id: imageSource
            width: 2560
            height: 1440
            color:  "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            clip: true;
 
            AnimatedImage { 
                id: face
                source: "images/plasma_d.gif"
                paused: false 
                width: parent.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                visible: true 
            }
        }
    }
}
