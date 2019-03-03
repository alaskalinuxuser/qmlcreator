/****************************************************************************
**
** Copyright (C) 2013-2015 Oleg Yadrov
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
** http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
****************************************************************************/

import QtQuick 2.5
import ProjectManager 1.1
import "../components"

BlankScreen {
    id: mainMenuScreen

    property var splitView : null

    CToolBar {
        id: toolBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        CLabel {
            anchors.fill: parent
            anchors.leftMargin: 5 * settings.pixelDensity
            text: appWindow.title
            font.pixelSize: 10 * settings.pixelDensity
        }
    }

    CFlickable {
        id: menuFlickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom
        contentHeight: column.height

        Column {
            id: column
            anchors.left: parent.left
            anchors.right: parent.right

            CNavigationButton {
                text: qsTr("PROJECTS")
                icon: "\uf0f6"
                onClicked: {
                    ProjectManager.baseFolder = ProjectManager.Projects
                    splitView.leftView.push(Qt.resolvedUrl("ProjectsScreen.qml"))
                }
            }

            CNavigationButton {
                text: qsTr("EXAMPLES")
                icon: "\uf1c9"
                onClicked: {
                    ProjectManager.baseFolder = ProjectManager.Examples
                    splitView.leftView.push(Qt.resolvedUrl("ExamplesScreen.qml"))
                }
            }

            CNavigationButton {
                text: qsTr("SETTINGS")
                icon: "\uf0ad"
                onClicked: splitView.rightView.push(Qt.resolvedUrl("SettingsScreen.qml"))
            }

            CNavigationButton {
                text: qsTr("MODULES")
                icon: "\uf085"
                onClicked: splitView.rightView.push(Qt.resolvedUrl("ModulesScreen.qml"))
            }

            CNavigationButton {
                text: qsTr("ABOUT")
                icon: "\uf0e5"
                onClicked: splitView.rightView.push(Qt.resolvedUrl("AboutScreen.qml"))
            }
        }
    }

    CScrollBar {
        flickableItem: menuFlickable
    }
}

