import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

Window {
    objectName: "rootObject"
    visible: true
    width: 640
    height: 480
    title: qsTr("Face Score")

    Image {
        anchors.top: parent.top;
        anchors.topMargin: 4;
        anchors.left: parent.left;
        anchors.leftMargin: 16

        objectName: "imageViewer"
        id: imageViewer;
        asynchronous: true;
        cache: false;
        //anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;

        width: parent.width - 40
        height: parent.height - 40
    }

    RowLayout {
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        spacing: 4;

        Button {
            objectName: "openButton"
            id: openFile;
            text: "Open";
            //anchors.left: parent.left
            //anchors.leftMargin: 8;
            //anchors.bottom: parent.bottom;
            //anchors.bottomMargin: 8;

            //onClicked: fileDialog.open();
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 70;
                    implicitHeight: 25;
                    color: control.hovered ? "#C0C0C0" : "#A0A0A0";
                    border.width: control.pressed ? 2 : 1;
                    border.color: (control.hovered | control.pressed) ? "green" : "#888888";
                }
            }
        }

        Text {
            objectName: "imagePath"
            id: imagePath;
            //anchors.left: openFile.right;
            //anchors.leftMargin: 8;
            //anchors.verticalCenter: openFile.verticalCenter;
            font.pixelSize: 18;
            font.bold: true
            Layout.fillWidth: true;
        }

        FileDialog {
            objectName: "fileDialog"
            id: fileDialog;
            title: "Please choose a file";
            nameFilters: ["Image Files (*.jpg *.png)"];
            onAccepted: {
                imageViewer.source = fileDialog.fileUrl;
                var imageFile = new String(fileDialog.fileUrl);
                imagePath.text = imageFile.slice(8);
            }
        }

        Button {
            objectName: "quitButton"
            id: quit;
            text: "Quit";
            visible: false
            //anchors.right: parent.right
            //anchors.rightMargin: 8;
            //anchors.bottom: parent.bottom;
            //anchors.bottomMargin: 8;

            //onClicked: fileDialog.open();
        }
    }

}
