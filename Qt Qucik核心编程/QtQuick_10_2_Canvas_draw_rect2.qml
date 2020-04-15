import QtQuick 2.2

Canvas {
    width: 400;
    height: 240;
    contextType: "2d"

    onPaint: {
        //var ctx = getContext("2d");
        context.lineWidth = 2;
        context.strokeStyle = "red";
        context.fillStyle = "blue";
        context.beginPath();
        context.rect(100, 80, 120, 80);
        context.fill();
        context.stroke();
    }
}
