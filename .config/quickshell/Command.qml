import QtQuick
import QtQuick.Layouts
Rectangle {
    id: root
    width: 400
    height: 40
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    color: "#1e1e2e"
    opacity: 0.95
    radius: 8

    property string commandText: ""

    TextField {
        id: input
        anchors.fill: parent
        anchors.margins: 8
        placeholderText: "Run command..."
        font.pixelSize: 16
        color: "white"
        background: null
        focus: true
        Keys.onReturnPressed: {
            if (input.text.length > 0) {
                Qt.callLater(() => {
                    // Run with shell so it supports things like `ls | less`
                    Qt.createQmlObject('import QtQuick 2.0; QtObject { Component.onCompleted: Qt.openUrlExternally("sh -c \'' + input.text + '\'") }', root);
                });
                input.text = "";
            }
        }
    }
}
