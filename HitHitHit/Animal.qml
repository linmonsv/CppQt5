import QtQuick 2.0

import "utils.js" as Utils

Rectangle {
    width: 100
    height: 100

    QtObject{
        id: attrs;
        property int counter;
        Component.onCompleted: {
            attrs.counter = 1;
        }
    }
    QtObject{
        id: animal_status;
        property int counter;
        Component.onCompleted: {
            animal_status.counter = Utils.getRandomNum(5, 10);
            countDown_status.start();
        }
    }

    Image {
        id: image
        width: 100
        height: 100
        fillMode: Image.PreserveAspectFit
        source: "qrc:/Gopher.png"
        visible: false
    }

    MouseArea{
        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton| Qt.RightButton;
        onClicked: {

            if(mouse.button == Qt.RightButton){
                //Qt.quit();
            }

            else if(mouse.button == Qt.LeftButton){
                image.source = "qrc:/AfterHit.jpg"
                attrs.counter = 1;
                countDown.start();
            }
        }

        onDoubleClicked: {
            //color = "gray";
        }

    }
    Timer {
        id: countDown;
        repeat: true;
        interval: 100;
        triggeredOnStart: true;
        onTriggered: {
            attrs.counter -= 1;
            if(attrs.counter < 0) {
                countDown.stop();
                image.visible = false;
                image.source = "qrc:/Gopher.png";
            }
        }
    }

    Timer {
        id: countDown_status;
        repeat: true;
        interval: 300;
        triggeredOnStart: true;
        onTriggered: {
            animal_status.counter -= 1;
            if(animal_status.counter < 0) {
                image.visible = true;
                animal_status.counter = Utils.getRandomNum(5, 10);
            }
        }
    }
}
