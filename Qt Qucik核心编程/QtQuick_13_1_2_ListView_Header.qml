import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Rectangle {
    width: 360;
    height: 300;
    color: "#EEEEEE";

    Component {
        id: phoneModel;
        ListModel {
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
            ListElement {
                name: "iPhone 3GS";
                cost: "1000";
                manufacturer: "Apple";
            }
        }
    }

    Component {
        id: phoneDelegate;
        Item {
            id: wrapper;
            width: parent.width;
            height: 30;
            MouseArea {
                anchors.fill: parent;
                onClicked: wrapper.ListView.view.currentIndex = index;
            }

            RowLayout {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 8;
                Text {
                    id: coll;
                    text: name;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.preferredWidth: 120
                }
                Text {
                    text: cost;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.preferredWidth: 80;
                }
                Text {
                    text: manufacturer;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.fillWidth: true;
                }
            }
        }
    }

    Component {
        id: headerView;
        Item {
            width: parent.width;
            height: 30;
            RowLayout {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 8
                Text {
                    text: "Name";
                    font.bold: true;
                    font.pixelSize: 20;
                    Layout.preferredWidth: 120;
                }
                Text {
                    text: "Cost";
                    font.bold: true;
                    font.pixelSize: 20;
                    Layout.preferredWidth: 80;
                }
                Text {
                    text: "Manufacturer";
                    font.bold: true;
                    font.pixelSize: 20;
                    Layout.fillWidth: true;
                }
            }
        }
    }

    ListView {
        id: listView;
        anchors.fill: parent;
        delegate: phoneDelegate;
        model: phoneModel.createObject(listView);
        header: headerView;
        focus: true;
        highlight: Rectangle {
            color: "lightblue";
        }
    }
}
