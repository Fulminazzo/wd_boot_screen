import QtQuick 2.8
import QtQuick.Controls 2.0

Switch {
    id: control
    implicitWidth: Math.max(indicator.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(indicator.implicitHeight + bottomPadding + topPadding)

    padding: 6
    spacing: 6
    hoverEnabled: true

    indicator: Rectangle {
        implicitWidth: conf("width")
        implicitHeight: conf("height")
        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        radius: (height / 2)
        border.width: (control.pressed
                ? conf("border.size.press")
                : control.visualFocus
                    ? control.hovered ? conf("border.size.hover") : conf("border.size.focus")
                    : control.hovered ? conf("border.size.hover") : conf("border.size.normal")
                )
        border.color: control.color("border.color")
        color: control.color("background.color")

        Rectangle {
            x: Math.max(0, Math.min(parent.width - width, control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2
            width: conf("indicator.size")
            height: width
            radius: width / 2
            color: control.color("indicator.color")
            border.width: (control.pressed
                    ? conf("indicator.border.size.press")
                    : control.visualFocus
                        ? control.hovered ? conf("indicator.border.size.hover") : conf("indicator.border.size.focus")
                        : control.hovered ? conf("indicator.border.size.hover") : conf("indicator.border.size.normal")
                    )
            border.color: control.color("indicator.border.color")
            Behavior on x {
                enabled: !control.down
                SmoothedAnimation { velocity: 200 }
            }
        }
    }

    function color(item) { 
        var state = control.checked ? ".on" : ".off";
        return (control.pressed
            ? conf(item + state + ".press")
            : control.visualFocus
                ? control.hovered ? conf(item + state + ".hover") : conf(item + state + ".focus")
                : control.hovered ? conf(item + state + ".hover") : conf(item + state + ".normal")
            );
    }

    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "switch" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}
