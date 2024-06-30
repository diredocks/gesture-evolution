import QtQuick
import org.kde.kwin as KWinComponents

KWinComponents.SceneEffect {
    id: effect

    function isActiveWinMaximized(){
        if(KWinComponents.Workspace.activeWindow.width >= 1920
            && KWinComponents.Workspace.activeWindow.height >= 1080
            && KWinComponents.Workspace.activeWindow.x==0
            && KWinComponents.Workspace.activeWindow.y==0){
            return true
        }
        return false
    }

    function pinchOnActivated() {
        //if(effect.configuration.CloseOrMinimize){
        //    KWinComponents.Workspace.slotWindowClose()
        //}
        //if(!effect.configuration.CloseOrMinimize){
        //    KWinComponents.Workspace.slotWindowMinimize()
        //}
        KWinComponents.Workspace.slotWindowClose()
    }

    function swipeLeftorRight() {
        KWinComponents.Workspace.slotWindowLower()
    }

    function swipeUpOnActivated() {

        if(isActiveWinMaximized()){
            KWinComponents.Workspace.slotWindowFullScreen()
        }else{
            KWinComponents.Workspace.slotWindowMaximize()
        }
        //if(effect.configuration.MaximizeOrFullscreen){
        //    KWinComponents.Workspace.slotWindowMaximize()
        //}
        //if(!effect.configuration.MaximizeOrFullscreen){
        //    KWinComponents.Workspace.slotWindowFullScreen()
        //}
    }

    function swipeDownOnActivated() {

        var fullScreenTriger = false

        if(KWinComponents.Workspace.activeWindow.fullScreen){
            KWinComponents.Workspace.slotWindowFullScreen()
            fullScreenTriger = true

        }

        if(!fullScreenTriger){
            if(isActiveWinMaximized()){
                KWinComponents.Workspace.slotWindowMaximize()
            }else{
                KWinComponents.Workspace.slotWindowMinimize()
            }
        }

        //if(effect.configuration.MaximizeOrFullscreen){
        //    KWinComponents.Workspace.slotWindowMaximize()
        //}
        //if(!effect.configuration.MaximizeOrFullscreen){
        //    KWinComponents.Workspace.slotWindowFullScreen()
        //}
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Up
        fingerCount: 3
        //onActivated: (KWinComponents.Workspace.activeWindow.x == 0) ? KWinComponents.Workspace.activeWindow.setMaximize(0,0):KWinComponents.Workspace.activeWindow.setMaximize(1,1)
        onActivated: swipeUpOnActivated()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Down
        fingerCount: 3
        //onActivated: (KWinComponents.Workspace.activeWindow.x == 0) ? KWinComponents.Workspace.activeWindow.setMaximize(0,0):KWinComponents.Workspace.activeWindow.setMaximize(1,1)
        onActivated: swipeDownOnActivated()
    }

    KWinComponents.PinchGestureHandler {
        direction: KWinComponents.PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        //onActivated: KWinComponents.Workspace.activeWindow.closeWindow()
        //onActivated: KWinComponents.Workspace.slotWindowClose()
        onActivated: pinchOnActivated()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Left
        fingerCount: 3
        //onActivated: KWinComponents.Workspace.activeWindow.closeWindow()
        //onActivated: KWinComponents.Workspace.slotWindowClose()
        onActivated: swipeLeftorRight()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Right
        fingerCount: 3
        //onActivated: KWinComponents.Workspace.activeWindow.closeWindow()
        //onActivated: KWinComponents.Workspace.slotWindowClose()
        onActivated: swipeLeftorRight()
    }
}
