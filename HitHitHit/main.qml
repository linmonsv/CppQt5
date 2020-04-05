import QtQuick 2.12
import QtQuick.Window 2.12

import "animalCreation.js" as MyAnimal

Window {
    visible: true
    width: 400
    height: 480
    title: qsTr("Hit Hit Hit")



    Column {
        id: row
        width: 200
        height: 400

        Column {
            id: column
            width: 400
            height: 32

            Text {
                id: element
                text: qsTr("Total : xxx")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 24
            }
        }

        Grid {
            id: grid_zoo
            width: 400
            height: 400
            property Component component: null
        }
    }



    Component.onCompleted: {
        for(var i = 0; i < 16; i ++) {
            MyAnimal.createAnimal();
        }
        console.log("onCompleted");
    }
}
