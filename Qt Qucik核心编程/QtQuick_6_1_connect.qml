import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    id: forwarder;
    width: 320;
    height: 240;
    color: "#C0C0C0";

    signal send();
    onSend: console.log("Send clicked");

    MouseArea {
        id: mouseArea;
        anchors.fill: parent;
        onClicked: console.log("MouseArea clicked");
    }

    Component.onCompleted: {
        mouseArea.clicked.connect(send);
    }
}
