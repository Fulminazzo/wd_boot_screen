import QtQuick 2.8
//import QtGraphicalEffects 1.12

Rectangle { 
    id: control
    property bool isPressed: false
    property bool isMouse: false
    property string menuState //not used atm

    implicitWidth: conf("border.size")
    //implicitWidth: menuState === "mini" ? conf("border.size") * 2 : conf("border.size")

    color: (control.isPressed
            ? conf("border.color.press")
            : control.isMouse ? conf("border.color.hover") : conf("border.color.normal")
    )
    opacity: (control.isPressed
            ? conf("border.opacity.press")
            : control.isMouse ? conf("border.opacity.hover") : conf("border.opacity.normal")
    )

/* 
    LinearGradient {
        id: fx
        property real speed: 500
        height: parent.height
        width: parent.width
        visible: control.isPressed
        start: Qt.point(0, 0)
        end: Qt.point(parent.height, parent.width)
        gradient: Gradient {
          GradientStop {
              SequentialAnimation on color {
                  loops: Animation.Infinite
                  ColorAnimation { from: Qt.rgba(1, 0, 0, 1); to: Qt.rgba(1, 1, 0, 1); duration: fx.speed }
                  ColorAnimation { from: Qt.rgba(1, 1, 0, 1); to: Qt.rgba(0, 1, 0, 1); duration: fx.speed }
                  ColorAnimation { from: Qt.rgba(0, 1, 0, 1); to: Qt.rgba(0, 1, 1, 1); duration: fx.speed }
                  ColorAnimation { from: Qt.rgba(0, 1, 1, 1); to: Qt.rgba(0, 0, 1, 1); duration: fx.speed }
                  ColorAnimation { from: Qt.rgba(0, 0, 1, 1); to: Qt.rgba(1, 0, 1, 1); duration: fx.speed }
                  ColorAnimation { from: Qt.rgba(1, 0, 1, 1); to: Qt.rgba(1, 0, 0, 1); duration: fx.speed }
              }
          }
        }
    }
 */

    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "menu" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}