import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Window 2.2

Window {
    objectName: "rootObject"

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        objectName: "textLabel"
        text:"Hello World!"
        anchors.centerIn: parent
        font.pixelSize: 26;
    }

    Button {
        anchors.right: parent.right
        anchors.rightMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        text:"quit"
        objectName: "quitButton"
    }
}
