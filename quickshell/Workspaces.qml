import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ContainerPill {
    RowLayout {
        property var visibleWorkspaces: Hyprland.workspaces.values
            // Only display workspaces with items on them, or active
            .filter(ws =>
                ws.focused
                || ws.active
                || ws.urgent
                || ws.toplevels.values.length > 0
            )

        Repeater {
            model: parent.visibleWorkspaces

            Text {
                required property var modelData

                property var ws: modelData
                property bool isActive: ws.focused || ws.active
                property bool isUrgent: ws.urgent

                color: isActive ? Colors.peach : isUrgent ? Colors.red: Colors.text
                text: ws.name

                font {
                    pixelSize: isActive ? 18 : 16
                    bold: isActive
                }

                // On click, switch to workspace
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch(`workspace ${parent.ws.id}`)
                }
            }
        }
    }
}
