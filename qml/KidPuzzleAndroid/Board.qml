import QtQuick 1.0
import "UI.js" as UI

Rectangle {
    width: UI.screenWidth
    height: UI.screenHeight
    color: "transparent"
    property alias source : page.source
    property bool gameover: false

    Rectangle {
        id: leftSpacer
        color: "black"
        anchors { left:parent.left; top: parent.top}
        width: leftMargin
        height: datamover.screenHeight()
    }

    Rectangle {
        id: topSpacer
        color: "black"
        anchors { left:leftSpacer.right; top: parent.top}
        width: UI.boardWidth
        height: topMargin
    }

    Image {
        id: page
        anchors {left: leftSpacer.right; top: topSpacer.bottom}
        height: UI.screenHeight
        width: UI.boardWidth
        opacity: 0.0
    }

    Rectangle {
        id: bottomSpacer
        color: "black"
        anchors { left: parent.left; top: page.bottom }
        width: datamover.screenWidth()
        height: bottomMargin
        z: 200
    }

    Rectangle {
        id: rightSpacer
        color: "black"
        anchors { left: topSpacer.right; top: parent.top }
        width: rightMargin
        height: datamover.screenHeight()
    }

    Image {
        id: returnArrow
        source: "back.png"
        anchors { right: page.right; top: page.top }
        z: 99
        MouseArea {
            anchors.fill: returnArrow
            onClicked: { tileLoader.source = "MainSelection.qml" }
        }
    }

    onGameoverChanged: {
        if (gameover) {
            loader.sourceComponent = baloonPopper
        }
    }

    Loader {
        id: loader
        z: 100
    }

    Component {
        id: baloonPopper
        Repeater {
            model: UI.nrBaloons
            Baloon {
                x: Math.floor(Math.random()*UI.screenWidth*0.7 + UI.screenWidth*0.1)
                y: topMargin + UI.screenHeight - 1
                source: UI.baloonColors[Math.floor(Math.random()*UI.nrColors)]
                timeout: Math.floor(Math.random()*UI.seedTime)
            }
        }
    }

    PropertyAnimation { id: fadeIn; target: page; property: "opacity"; to: 1; duration: 300; easing.type: Easing.InOutQuad }

    Component.onCompleted: { fadeIn.running = true; }
}
