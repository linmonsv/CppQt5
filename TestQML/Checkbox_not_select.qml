import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Tumbler {
        id: firstTumbler
        model: 10
        anchors.left: parent.left
    }

    property bool followFirst: testCheckbox.checked//

    Tumbler {
        id: secondTumbler
        model: 10

        property var m_index: 0//

        anchors.right: parent.right

        currentIndex: testCheckBox.checked === true ? firstTumbler.currentIndex : m_index//

        onCurrentIndexChanged: {

            m_index = currentIndex;
            if (followFirst) { testCheckBox.checked = false }

                //testCheckBox.checked = false
        }
    }

    CheckBox {
        id: testCheckBox
        anchors.left: firstTumbler.right

        onCheckedChanged: {
            if(testCheckBox.checked == true)
            {
                secondTumbler.currentIndex = firstTumbler.currentIndex
            }
        }
    }
}
