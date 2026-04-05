import QtQuick

Rectangle {
    id: root

    default property alias contentData: content.data

    property int horizontalPadding: 16
    property int verticalPadding: 4

    property int borderRadius: 16
    radius: borderRadius

    property color backgroundColor: Colors.base
    color: backgroundColor

    implicitWidth: content.implicitWidth + horizontalPadding * 2
    implicitHeight: content.implicitHeight + verticalPadding * 2

    Item {
        id: content
        anchors.centerIn: parent
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
    }
}
