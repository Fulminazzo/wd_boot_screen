import QtQuick 2.8
import QtQuick.Controls 2.0

TextField {
    id: control
    property bool clearButtonShown: true
    property bool revealPasswordButtonShown: false
    property real iconSize: conf("icon.size")

    padding: 8
    topPadding: padding - 7
    bottomPadding: padding - 5
    rightPadding: Math.max(padding + row.implicitWidth + row.anchors.rightMargin)
    verticalAlignment: TextInput.AlignVCenter

    color: mouseArea.containsMouse ? conf("text.color.hover") : conf("text.color.normal")
    selectionColor: conf("text.color.select.bg")
    selectedTextColor: conf("text.color.select")

    font.pointSize: conf("text.size")
    font.italic: conf("text.italic")
    font.bold: conf("text.bold")
    Component.onCompleted: if (conf("text.font") != "") font.family = conf("text.font")

    passwordMaskDelay: 125
    // passwordCharacter: "\u25cf" //●
    passwordCharacter: "\u00D7" //×

    Row {
        id: row
        anchors.verticalCenter: control.verticalCenter
        anchors.right: control.right
        anchors.rightMargin: control.padding
        spacing: 4

        Image {
            id: passwordButton
            height: control.iconSize
            fillMode: Image.PreserveAspectFit
            source: conf_path("textfield.icon.visible")
            sourceSize: Qt.size(control.iconSize, control.iconSize)
            opacity: (control.length > 0 && revealPasswordButtonShown && control.enabled) ? 1 : 0
            visible: opacity > 0
            asynchronous: true
            cache: true
            mipmap: true
            Behavior on opacity {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.InOutQuad
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    control.echoMode = (control.echoMode == TextInput.Normal ? TextInput.Password : TextInput.Normal);
                    control.forceActiveFocus();
                    passwordButton.opacity = (control.echoMode == TextInput.Normal ? 0.8 : 1);
                    passwordButton.source = (control.echoMode == TextInput.Normal ? conf_path("textfield.icon.hidden") : conf_path("textfield.icon.visible"));
                }
            }
        }

        Image {
            id: clearButton
            height: control.iconSize
            fillMode: Image.PreserveAspectFit
            source: conf_path("textfield.icon.clear")
            sourceSize: Qt.size(control.iconSize, control.iconSize)
            opacity: (control.length > 0 && clearButtonShown && control.enabled) ? 1 : 0
            visible: opacity > 0
            asynchronous: true
            cache: true
            mipmap: true
            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                    easing.type: Easing.InOutQuad
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    control.text = "";
                    control.forceActiveFocus();
                }
            }
        }
    } // (row end) 

    background: Rectangle {
        implicitWidth: Math.max(parent.width ? parent.width : (conf("width") - (border.width * 2)))
        implicitHeight: Math.max(conf("height") - (border.width * 2))
        border.width: (mouseArea.containsMouse 
                ? conf("border.size.hover") : control.activeFocus 
                ? conf("border.size.focus") : conf("border.size.normal")
        )
        border.color: (mouseArea.containsMouse 
                ? conf("border.color.hover") : control.activeFocus 
                ? conf("border.color.focus") : conf("border.color.normal")
        )
        color: (mouseArea.containsMouse 
                ? conf("background.color.hover") : control.activeFocus 
                ? conf("background.color.focus") : conf("background.color.normal")
        )
        radius: conf("radius")
    }

    selectByMouse: true
    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.NoButton
    }

    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "textfield" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }

    function conf_path(key) { 
        return config['path/' + key];
    }
}
