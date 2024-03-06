import QtQuick 2.8

ComboBoxMenu {
    visible: true
    textRole: "longName"
    model: keyboard.layouts
        
    Component.onCompleted: {
        currentIndex = keyboard.currentLayout;
        displayText = keyboard.layouts[currentIndex].longName;
    }

    onActivated: {
        keyboard.currentLayout = currentIndex;
        displayText = keyboard.layouts[currentIndex].longName;
    }
}

