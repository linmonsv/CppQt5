import QtQuick 2.2

Canvas {
    id: root;
    width: 400;
    height: 300;

    Image {
        id: poster;
        source: "http://g2.ykimg.com/0516000053548ED267379F510C0061FA";
        visible: false;
        onStatusChanged: {
            if(status == Image.Ready) {
                root.requestPaint();
            }
        }
    }

    onPaint: {
        var ctx = getContext("2d");
        ctx.drawImage(poster, 50, 0);
    }
}
