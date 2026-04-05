import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    property int padding: 8

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: content.implicitHeight + padding * 2
    color: "transparent"

    RowLayout {
        id: content

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: padding

        Workspaces {}
        Item { Layout.fillWidth: true }
        Clock {}
    }
}
