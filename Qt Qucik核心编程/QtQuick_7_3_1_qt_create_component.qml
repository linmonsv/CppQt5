import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    width: 360;
    height: 300;
    id: rootItem;
    property var count: 0;
    property Component component: null;

    Text {
        id: coloredText;
        anchors.centerIn: parent;
        text: "Hello World!";
        font.pixelSize: 32;
    }

    function changeTextColor(clr) {
        coloredText.color = clr;
    }

    function createColorPicker(clr) {
        if(rootItem.component == null) {
            rootItem.component = Qt.createComponent("ColorPicker.qml");
        }
        var colorPicker;
        if(rootItem.component.status == Component.Ready) {
            colorPicker = rootItem.component.createObject(rootItem, {"color" : clr, "x":rootItem.count * 55, "y" : 10});
            colorPicker.colorPicked.connect(rootItem.changeTextColor);
        }
        rootItem.count ++;
    }

    Button {
        id: add;
        text: "add";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        onClicked: {
            createColorPicker(Qt.rgba(Math.random(), Math.random(), Math.random(), 1));
        }
    }

}
