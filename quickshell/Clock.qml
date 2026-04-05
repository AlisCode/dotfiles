import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: clock
    color: "white"

    font {
        pixelSize: 16
    }

    Process {
        id: process_date
        command: ["date", "+%a, %b %d - %H:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: clock.text = this.text.trim()
        }
    }

    Timer {
        interval: 1000

        running: true
        repeat: true

        onTriggered: process_date.running = true
    }
}
