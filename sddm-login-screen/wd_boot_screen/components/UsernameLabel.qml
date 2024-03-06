import QtQuick 2.8
import QtGraphicalEffects 1.0 

Text {
    readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software

    color: conf("text.color")
    font.pointSize: conf("text.size")
    font.italic: conf("text.italic")
    font.bold: conf("text.bold")
    font.capitalization: Font.Capitalize
    visible: text === "" ? false : true
    opacity: visible ? 1 : 0
    Component.onCompleted: if (conf("text.font") != "") font.family = conf("text.font")

    // Shadow
    layer.enabled: !softwareRendering
    layer.effect: DropShadow {
        horizontalOffset: 0
        verticalOffset: 0
        samples: 32
        radius: conf("shadow.radius")
        spread: conf("shadow.spread")
        color: conf("shadow.color")
    }


    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "label.username" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}