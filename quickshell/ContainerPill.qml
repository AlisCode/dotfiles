import QtQuick

Rectangle {
    id: root

    default property alias contentData: content.data
    property int horizontalPadding: 16
    property int verticalPadding: 4

    radius: 16
    color: Colors.base

    implicitWidth: content.implicitWidth + horizontalPadding * 2
    implicitHeight: content.implicitHeight + verticalPadding * 2

    Item {
        id: content
        anchors.centerIn: parent
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
    }
}
