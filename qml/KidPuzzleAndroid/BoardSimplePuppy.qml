import QtQuick 1.0
import "UI.js" as UI

Board {
    source: "simple_puppy_board.png"

    Bit {
        source: "simple_puppy_ball.png"
        dockX: leftMargin + 15; dockY:15; boardX: leftMargin + 647; boardY: UI.screenHeight - 194; dockW: 100; dockH: 100
    }
    Bit {
        source: "simple_puppy_head.png"
        dockX: leftMargin + 10; dockY:130; boardX: leftMargin + 451; boardY: UI.screenHeight - 445; dockW: 110; dockH: 110
        z: 5
    }
    Bit {
        source: "simple_puppy_rear.png"
        dockX: leftMargin + 30; dockY:240; boardX: leftMargin + 137; boardY: UI.screenHeight - 401; dockW: 83; dockH: 110
        z: 3
    }
    Bit {
        source: "simple_puppy_front.png"
        dockX: leftMargin + 40; dockY:360; boardX: leftMargin + 388; boardY: UI.screenHeight - 401; dockW: 68; dockH: 110
        z: 3
    }

}
