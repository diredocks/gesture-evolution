import QtQuick
import org.kde.kwin as KWinComponents

KWinComponents.SceneEffect {
    id: effect

    function pinchOnActivated() {
        if(effect.configuration.CloseOrMinimize){
            KWinComponents.Workspace.slotWindowClose()
        }
        if(!effect.configuration.CloseOrMinimize){
            KWinComponents.Workspace.slotWindowMinimize()
        }
    }

    function swipeOnActivated() {
        if(effect.configuration.MaximizeOrFullscreen){
            KWinComponents.Workspace.slotWindowMaximize()
        }
        if(!effect.configuration.MaximizeOrFullscreen){
            KWinComponents.Workspace.slotWindowFullScreen()
        }
    }


    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Up
        fingerCount: 3
        //onActivated: (KWinComponents.Workspace.activeWindow.x == 0) ? KWinComponents.Workspace.activeWindow.setMaximize(0,0):KWinComponents.Workspace.activeWindow.setMaximize(1,1)
        onActivated: swipeOnActivated()
    }

    KWinComponents.PinchGestureHandler {
        direction: PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        //onActivated: KWinComponents.Workspace.activeWindow.closeWindow()
        //onActivated: KWinComponents.Workspace.slotWindowClose()
        onActivated: pinchOnActivated()
    }
}
