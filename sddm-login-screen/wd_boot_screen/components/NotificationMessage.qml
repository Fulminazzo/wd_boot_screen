import QtQuick 2.8

Text {
    id: notification
    property string caps: keyboard.capsLock ? textConstants.capslockWarning : ""
    property string msg
    onCapsChanged: text = caps
    onMsgChanged: { if (msg) { text = msg; reset.start(); }; }
    Timer {
        id: reset ; interval: 3000
        onTriggered: { notification.text = notification.caps ; notification.msg = ""; }
    }
    
    color: conf("text.color")
    font.pointSize: conf("text.size")
    font.italic: conf("text.italic")
    font.bold: conf("text.bold")
    wrapMode: Text.WordWrap
    opacity: text == "" ? 0 : 1
    Behavior on opacity { NumberAnimation { duration: 300 } }
    Component.onCompleted: if (conf("text.font") != "") font.family = conf("text.font")
    
    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "alert.message" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}