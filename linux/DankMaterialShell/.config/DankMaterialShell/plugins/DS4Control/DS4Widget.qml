import QtQuick
import QtQuick.Controls
import Quickshell.Io
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
    id: root
    property string status: "Off"

    Process {
        id: ds4Process
        command: ["/bin/bash", "/home/jblyberg/.config/DankMaterialShell/plugins/DS4Control/ds4_toggle.sh"]
        running: false
        stdout: StdioCollector {
            onStreamFinished: {
                let raw = text.trim();
                // Normalizes output to Off, Hidraw, or Xpad
                root.status = raw.charAt(0).toUpperCase() + raw.slice(1).toLowerCase();
            }
        }
    }

    horizontalBarPill: Component {
        MouseArea {
            id: clickArea
            implicitWidth: contentRow.implicitWidth
            implicitHeight: contentRow.implicitHeight
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (ds4Process.running)
                    ds4Process.running = false;
                ds4Process.running = true;
            }

            Row {
                id: contentRow
                height: parent.height
                spacing: Theme.spacingS
                padding: Theme.spacingS

                DankIcon {
                    // Custom icon names as requested
                    name: root.status === "Hidraw" ? "󰊴" : root.status === "Xpad" ? "󰖺" : "󰊵"

                    size: Theme.iconSize - 6

                    // Custom hex colors as requested
                    color: root.status === "Hidraw" ? "#405a78" : root.status === "Xpad" ? "#617840" : Theme.surfaceText

                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: root.status === "Hidraw" ? "PS4" : root.status === "Xpad" ? "XBox" : "Off"
                    font: Theme.fontS
                    color: Theme.surfaceText
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
