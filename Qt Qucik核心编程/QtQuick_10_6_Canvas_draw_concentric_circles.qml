import QtQuick 2.2

Canvas {
    width: 300;
    height: 300;

    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 2;
        ctx.fillStyle = "red";
        ctx.strokeStyle = "blue";
        ctx.save();

        ctx.translate(width/2, height/2);

        ctx.beginPath();
        ctx.arc(0, 0, 30, 0, Math.PI*2);
        ctx.arc(0, 0, 50, 0, Math.PI*2);
        ctx.arc(0, 0, 70, 0, Math.PI*2);
        ctx.arc(0, 0, 90, 0, Math.PI*2);
        ctx.stroke();
        ctx.restore();

        ctx.save();
        ctx.translate(width/2, 30);
        ctx.font = "26px serif";
        ctx.textAlign = "center";
        ctx.fillText("concentric circles", 0, 0);
        ctx.restore();
    }
}
