import QtQuick 2.2
Rectangle {
    width: 320;
    height: 240;
    color: "#EEEEEE";
    id: rootItem;

    Rectangle {
        id: rect;
        anchors.centerIn: parent;
        width: 160;
        height: 100;
        color: "red"

        Behavior on width {
            NumberAnimation { duration: 1000; }
        }
        Behavior on height {
            NumberAnimation { duration: 1000;
                                easing.type: Easing.InCubic; }
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                rect.width = Math.random() * rootItem.width;
                rect.height = Math.min(Math.random() * rootItem.height, rect.height * 1.5);
            }
        }
    }
}
