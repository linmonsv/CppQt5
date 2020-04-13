import QtQuick 2.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 400;
    height: 200;
    color: "#EEEEEE";

    RowLayout {
        anchors.centerIn: parent;
        spacing: 8;
        Repeater {
            model: ["Hello", "Qt", "Quick"];
            Text {
                color: "blue";
                font.pointSize: 18;
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: modelData;
            }
        }
    }
}
