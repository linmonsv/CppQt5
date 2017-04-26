import QtQuick 2.6
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    width: 800;
    height: 360;

    Text {
        id: timeLabel;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        font.pixelSize: 26;
        text: ""
    }

    Timer {
        property int cout: 0
        id: coutTimer
        interval: 5000
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if(cout % 2)
                repeater.itemAt(1).bkColor = "blue"
            else
                repeater.itemAt(1).bkColor = "green"

            cout ++
            console.log(qsTr('cout: "' + cout + '"'))
        }
    }

    Row {
        anchors.centerIn: parent;
        spacing: 8;
        Repeater {
            id: repeater
            model: ["Hello", "Qt", "Quick"];

            TextArea {
                property color bkColor: "red"

                style: TextAreaStyle {
                    backgroundColor : bkColor
                }

                font.pointSize: 18;
                font.bold: true;
                verticalAlignment: Text. AlignVCenter;
                horizontalAlignment: Text. AlignHCenter;
                text: modelData;

                Behavior on bkColor {

                    ColorAnimation {
                        duration: 2500
                    }
                }
            }

        }
    }

    Button {
        id: bigger;
        text: "Bigger";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {

            console.log(qsTr('Clicked on background. Text: "' + timeLabel.text + '"'))

            testCpp.HeHeDa()

            testCpp.SetSomethings("lalala")

            if(repeater.itemAt(1).font.pointSize < 64)
                repeater.itemAt(1).font.pointSize += 4

            repeater.itemAt(1).bkColor = "grey"

        }
    }
    Button {
        id: smaller;
        text: "Smaller";
        anchors.left: bigger.right;
        anchors.leftMargin: 4;
        anchors.bottom: bigger.bottom;
        onClicked: {
            //console.log(qsTr('Clicked on background. Text: "' + timeLabel.text + '"'))
            if(repeater.itemAt(1).font.pointSize > 8)
                repeater.itemAt(1).font.pointSize -= 4

        }
    }

    Button {
        id: quit;
        text: "quit";
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.bottom: parent.bottom;
        onClicked: {
            Qt.quit();
        }
    }

    Component.onCompleted: {
        coutTimer.start()
    }

}
