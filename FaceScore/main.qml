import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Face Score")

    Image {
        id: imageViewer;
        asynchronous: true;
        cache: false;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
    }

   Button {
       id: openFile;
       text: "Open";
       anchors.left: parent.left
       anchors.leftMargin: 8;
       anchors.bottom: parent.bottom;
       anchors.bottomMargin: 8;

       onClicked: fileDialog.open();
   }

   Text {
       id: imagePath;
       anchors.left: openFile.right;
       anchors.leftMargin: 8;
       anchors.verticalCenter: openFile.verticalCenter;
       font.pixelSize: 18;
   }

   FileDialog {
       id: fileDialog;
       title: "Please choose a file";
       nameFilters: ["Image Files (*.jpg *.png)"];
       onAccepted: {
           imageViewer.source = fileDialog.fileUrl;
           var imageFile = new String(fileDialog.fileUrl);
           imagePath.text = imageFile.slice(8);
       }
   }
}
