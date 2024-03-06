import QtQuick 2.8
import QtGraphicalEffects 1.0 

Item {
    id: background
    property string type: config.type
    property string color: config.color
    property string background: config.background

    readonly property bool isColor: type != "image"

    Rectangle {
        id: colorBG
        anchors.fill: parent
        visible: isColor
        color: "#010101"
    }

    Image {
        id: imageBG
        anchors.fill: parent
        visible: !isColor
        source: "../../" + background.background
        asynchronous: true
        cache: true
        smooth: true
        mipmap: true
        fillMode: Image.PreserveAspectCrop  
    }

    FastBlur {
        anchors.fill: imageBG
        source: imageBG
        visible: isColor ? false : (config["background.blur"] == "true")
        radius: config["background.blur.intensity"]
    }

}