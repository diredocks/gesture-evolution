import QtQuick
import org.kde.kwin as KWinComponents

KWinComponents.SceneEffect {
    id: effect

    function isActiveWinMaximized(){
        var activeWindow = KWinComponents.Workspace.activeWindow
        var area = KWinComponents.Workspace.clientArea(KWinComponents.MaximizeArea, activeWindow)
        console.log(activeWindow.width >= area.width && activeWindow.height >= area.height)
        return activeWindow.width >= area.width && activeWindow.height >= area.height
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
        onActivated: swipeUpOnActivated()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Down
        fingerCount: 3
        onActivated: swipeDownOnActivated()
    }

    KWinComponents.PinchGestureHandler {
        direction: KWinComponents.PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        onActivated: pinchOnActivated()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Left
        fingerCount: 3
        onActivated: swipeLeftorRight()
    }

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Right
        fingerCount: 3
        onActivated: swipeLeftorRight()
    }
}
