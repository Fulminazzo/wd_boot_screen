import QtQuick 2.8

Rectangle { 
    id: control
    color: conf("background.color.normal")
    opacity: conf("background.opacity")

    // Conf
    function conf(key, section) {
        var sec = (section === undefined ? "menu" : section);
        var val = config[sec + "/" + key];
        if (val === "true") {return true;}
        if (val === "false") {return false;}
        return val;
    }
}
