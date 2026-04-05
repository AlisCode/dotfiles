import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ContainerPill {
    borderRadius: 8
    horizontalPadding: 8

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

            Item {
                id: workspaceItem
                required property var modelData

                property bool isActive: modelData.focused || modelData.active

                implicitWidth: workspaceLoader.implicitWidth
                implicitHeight: workspaceLoader.implicitHeight

                Loader {
                    id: workspaceLoader
                    anchors.centerIn: parent
                    sourceComponent: workspaceItem.isActive
                        ? activeWorkspace
                        : inactiveWorkspace
                }

                Component {
                    id: activeWorkspace

                    ContainerPill {
                            backgroundColor: Colors.green
                            radius: 4
                            horizontalPadding: 8

                            Text {
                                text: workspaceItem.modelData.name
                                color: Colors.base

                                font {
                                    pixelSize: 16
                                }
                            }
                        }
                    }

                Component {
                    id: inactiveWorkspace

                    ContainerPill {
                        backgroundColor: Colors.base
                        horizontalPadding: 8

                        Text {
                            id: inactiveWorkspace

                            text: workspaceItem.modelData.name
                            color: workspaceItem.modelData.urgent ? Colors.red : Colors.text

                            font {
                                pixelSize: 16
                            }
                        }
                    }
                }

                // On click, switch to workspace
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch(`workspace ${parent.modelData.id}`)
                }
            }
        }
    }
}
