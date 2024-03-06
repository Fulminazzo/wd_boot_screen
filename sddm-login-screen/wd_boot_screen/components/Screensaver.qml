import QtQuick 2.8
import "style" as Style


Style.Background { 
    id: control
    property real timer: conf("timer.secondes")
    property real chrono: 0

    readonly property bool isRunning: chrono >= timer
    readonly property bool neverVisible: config['enable.primary_screen_only'] == "true" && !primaryScreen

    visible: neverVisible ? true : isRunning
    opacity: visible ? 1 : 0
    Behavior on opacity { NumberAnimation { duration: neverVisible ? 0 : 1000 } }


    Clock { 
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: neverVisible ? false : control.conf("clock.visible")
    }
    
    Timer {
        interval: 1000; running: !neverVisible; repeat: !neverVisible;
        onTriggered: if (!isRunning) parent.chrono += 1
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton
        hoverEnabled: true
        focus: parent.visible ? true : false
        onPositionChanged: parent.chrono = 0
        Keys.onPressed: parent.chrono = 0
    }

    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "screensaver" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}