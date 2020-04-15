import QtQuick 2.2

Canvas {
    width: 400;
    height: 300;

    property var dartlikeWeapon: "dartlike_weapon.png";

    onPaint: {
        var ctx = getContext("2d");
        ctx.drawImage(dartlikeWeapon, 0, 0);
    }
    Component.onCompleted: loadImage(dartlikeWeapon);
    onImageLoaded: requestPaint();
}
