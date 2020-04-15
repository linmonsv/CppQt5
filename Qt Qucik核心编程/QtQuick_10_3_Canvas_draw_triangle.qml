import QtQuick 2.2

Canvas {
    width: 400;
    height: 240;

    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 2;
        ctx.strokeStyle = "red";
        ctx.fillStyle = "blue";
        ctx.beginPath();
        //ctx.rect(100, 80, 120, 80);

        ctx.moveTo(100, 80);
        ctx.lineTo(100, 200);
        ctx.lineTo(300, 200);
        ctx.closePath();

        ctx.fill();
        ctx.stroke();
    }
}
