import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 32
    color: "transparent"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        Workspaces {}
        Item { Layout.fillWidth: true }
        Clock {}
    }
}
