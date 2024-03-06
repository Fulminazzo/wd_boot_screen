import QtQuick 2.8

ComboBoxMenu {
    visible: true
    textRole: "name"
    model: sessionModel
        
    Component.onCompleted: {
        currentIndex = sessionModel.lastIndex;   
    }
}