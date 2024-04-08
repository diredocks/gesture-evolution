import QtQuick
import org.kde.kwin as KWinComponents

KWinComponents.SceneEffect {
    id: effect

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Up
        fingerCount: 3
        onActivated: (KWinComponents.Workspace.activeWindow.x == 0) ? KWinComponents.Workspace.activeWindow.setMaximize(0,0):KWinComponents.Workspace.activeWindow.setMaximize(1,1)
    }

    KWinComponents.PinchGestureHandler {
        direction: PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        onActivated: KWinComponents.Workspace.activeWindow.closeWindow()
    }
}
