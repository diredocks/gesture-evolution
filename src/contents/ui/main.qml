import QtQuick
import org.kde.kwin as KWinComponents

KWinComponents.SceneEffect {
    id: effect

    KWinComponents.SwipeGestureHandler {
        direction: KWinComponents.SwipeGestureHandler.Direction.Up
        fingerCount: 3
        onActivated: KWinComponents.Workspace.slotWindowMaximize()
    }

    KWinComponents.PinchGestureHandler {
        direction: PinchGestureHandler.Direction.Contracting
        fingerCount: 3
        onActivated: KWinComponents.Workspace.slotWindowClose()
    }
}
