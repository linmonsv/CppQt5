import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    width: 360;
    height: 300;

    TableView {
        id: phoneTable;
        anchors.fill: parent;
        TableViewColumn{ role: "name"; title: "Name";
            width: 100; elideMode: Text.ElideRight;}
        TableViewColumn{ role: "cost"; title: "Cost";
            width: 100;}
        TableViewColumn{ role: "manufacturer"; title: "Manufacturer";
            width: 140;}
        model: ListModel {
            id: phoneModel;
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
        }
        focus: true;
    }
}
