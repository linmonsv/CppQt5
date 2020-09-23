import QtQuick 2.0
Rectangle
{
    id:root
    width: 400
    height: 400
    property int m_Angle: 270 - 15//0
    property int m_direction: 1
    Timer
    {
            interval: 30
            running: true;
            repeat: true
            onTriggered:
            {
                console.log("root.m_Angle : " + root.m_Angle)
                if(m_direction)
                    root.m_Angle = root.m_Angle + 1 ;
                else
                    root.m_Angle = root.m_Angle - 1 ;
                if(root.m_Angle < 90 || root.m_Angle > (270 - 15))//360)
                {
                    //root.m_Angle = 90//0;
                    m_direction = !m_direction
                    canvas_1.visible = !m_direction
                    canvas_2.visible = m_direction
                }
            }
    }
    color: "black"//"transparent"
    anchors.centerIn: parent
    Rectangle
    {
        anchors.fill: parent
        color: "transparent"
        Canvas
        {
            anchors.fill: parent
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                ctx.strokeStyle = "#00FF00";
                ctx.fillStyle = "#00FF00";
                ctx.globalAlpha = 1.0;
                ctx.beginPath();
                ctx.arc(width/2,width/2,2,0,2*Math.PI);
                ctx.stroke();
                ctx.fill()
                ctx.restore();
                ctx.beginPath();
                ctx.arc(width/2,width/2,width/2-80,0,Math.PI, true);
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.arc(width/2,width/2,width/2-60,0,Math.PI, true);
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.arc(width/2,width/2,width/2-40,0,Math.PI, true);
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.arc(width/2,width/2,width/2-20,0,Math.PI, true);
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.arc(width/2,width/2,width/2-1,0,Math.PI, true);
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.lineTo(0,width/2)
                ctx.lineTo(width,width/2)
                ctx.stroke();
                ctx.restore();
                ctx.beginPath();
                ctx.lineTo(width/2,0)
                ctx.lineTo(width/2,width/2)
                ctx.stroke();
                ctx.restore();
            }
        }
        Canvas{
            id: canvas_1
            anchors.fill: parent
            rotation: root.m_Angle
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                var sectorCnt = 15;
                var startDeg = 90, endDeg;
                var sectorRadius = width/2
                ctx.translate(sectorRadius, sectorRadius);
                ctx.fillStyle = 'rgba(0, 255, 0, 0.05)';
                for(var i = 0; i < sectorCnt; i++)
                {
                    endDeg = startDeg + 15 - 15/ sectorCnt * i;
                    ctx.beginPath();
                    ctx.moveTo(0, 0);
                    //ctx.lineTo(0, -sectorRadius);
                    console.log("000")
                    ctx.arc(0, 0, sectorRadius, Math.PI / 180 * (startDeg), Math.PI / 180 * endDeg);
                    ctx.closePath();
                    ctx.fill();
                }
                ctx.restore();
            }
        }
        Canvas{
            id: canvas_2
            anchors.fill: parent
            rotation: root.m_Angle
            onPaint:
            {
                var ctx = getContext("2d");
                ctx.lineWidth = 2;
                var sectorCnt = 15;
                var startDeg = 90, endDeg;
                var sectorRadius = width/2
                ctx.translate(sectorRadius, sectorRadius);
                ctx.fillStyle = 'rgba(0, 255, 0, 0.05)';
                for(var i = 0; i < sectorCnt; i++)
                {
                    endDeg = startDeg + 15 - 15/ sectorCnt * i;
                    ctx.beginPath();
                    ctx.moveTo(0, 0);
                    ctx.arc(0, 0, sectorRadius, Math.PI / 180 * (startDeg + sectorCnt), Math.PI / 180 * (2 * startDeg + sectorCnt - endDeg), true);
                    ctx.closePath();
                    ctx.fill();
                }
                ctx.restore();
            }
        }
    }
}
