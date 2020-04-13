import QtQuick 2.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 300;
    height: 200;
    color: "#EEEEEE";

    Column {
        anchors.fill: parent;
        anchors.margins: 4;
        spacing: 4;
        Repeater {
            model: ListModel {
                ListElement {
                    name: "iPhone 3GS";
                    cost: "1000";
                    manufacturer: "Apple";
                }
                ListElement {
                    name: "iPhone 4";
                    cost: "1800";
                    manufacturer: "Apple";
                }
                ListElement {
                    name: "iPhone 5";
                    cost: "4900";
                    manufacturer: "Apple";
                }
                ListElement {
                    name: "B199";
                    cost: "1590";
                    manufacturer: "HuaWei";
                }
                ListElement {
                    name: "Mate 9";
                    cost: "3999";
                    manufacturer: "HuaWei";
                }
                ListElement {
                    name: "GALAXY S5";
                    cost: "4699";
                    manufacturer: "Samsung";
                }
                ListElement {
                    name: "MI 2S";
                    cost: "1999";
                    manufacturer: "XiaoMi";
                }
            }
            Row {
                height: 30
                Text {
                    width: 120;
                    color: "blue";
                    font.pointSize: 14;
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    text: name;
                }
                Text {
                    width: 100;
                    font.pointSize: 14;
                    verticalAlignment: Text.AlignVCenter
                    text: cost;
                }
                Text {
                    width: 100;
                    font.pointSize: 12;
                    verticalAlignment: Text.AlignVCenter
                    text: manufacturer;
                }
            }
        }
    }
}
