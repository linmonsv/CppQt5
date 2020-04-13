import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Window {
    visible: true
    width: 320
    height: 480
    minimumWidth: 300
    minimumHeight: 480;
    id: root;

    Component {
        id: listDelegate;
        Text {
            id: wrapper;
            width: parent.width;
            height: 32;
            font.pointSize: 15;
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;
            text: content;
            color: ListView.view.currentIndex == index ? "red" : "blue";
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    if(wrapper.ListView.view.currentIndex != index) {
                        wrapper.ListView.view.currentIndex = index;
                    }
                }
            }
        }
    }

    ListView {
        id: dynamicList;
        z: 1;
        anchors.fill: parent;
        anchors.margins: 10;

        delegate: listDelegate;
        model: dynamicModel;

        focus: true;
        activeFocusOnTab: true;
        highlight: Rectangle {
            color: "steelblue";
        }

        property real contextYOnflickStarted: 0;
        onFlickStarted: {
            contentYOnFlickStarted = contentY;
        }
        onFlickEnded: {
            dynamicModel.loadMore(contentY < contentYOnFlickStarted);
        }
    }
}
