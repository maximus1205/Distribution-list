import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.12
import Qt.labs.platform 1.1
import QtQuick.Timeline 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    color: "#00000000"
    title: qsTr("Distribution list")

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    property bool isrun: false;
    property int inx: 0;
    property int inx2: 0;

    flags: Qt.FramelessWindowHint | Qt.Window

    Rectangle {
        id: rectangle
        x: 0
        width: 640
        height: 480
        color: "#1b1b1b"
        radius: 0
        border.color: "#3c3c3c"
        border.width: 2
        anchors.verticalCenter: parent.verticalCenter
        clip: true

        FileDialog
        {
            id: filed
            visible: false
            fileMode: FileDialog.OpenFile
            onAccepted:
            {
                smtp.addFile(filed.file);
                timeline.enabled = true;
                timelineAnimation.running = true;
            }
        }

        Rectangle {
            id: rectanglezxc
            x: 150
            y: 216
            width: 346
            height: 101
            visible: false
            color: "#333333"

            TextField {
                id: textFieldzxc
                x: 51
                y: 0
                width: 244
                height: 44
                horizontalAlignment: Text.AlignLeft
                placeholderText: qsTr("Email")
            }

            Button {
                id: buttonzxc
                x: 88
                y: 50
                width: 171
                height: 39
                text: qsTr("Добавить")
                onReleased:
                {
                    var zxc = {};
                    zxc.email = textFieldzxc.text;
                    listmodel1.append(zxc);
                    rectanglezxc.visible = false;
                    textArea.visible = true;
                    smtp.addEmail(textFieldzxc.text);
                }
            }
        }

        TextField {
            id: textField
            x: 173
            y: 136
            width: 300
            height: 54
            visible: true
            inputMask: ""
            font.pointSize: 13
            placeholderText: qsTr("Ваш Email")

            NumberAnimation on x{
                id: n1
                to: 1000
                duration: 500
                easing.type: Easing.InOutQuad
                running: false
            }
        }


        Text {
            id: text1
            x: 167
            y: 40
            text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\nli.unchecked::marker { content: \"\\2610\"; }\nli.checked::marker { content: \"\\2612\"; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Dubai Medium'; font-size:28pt; font-weight:700; color:#ffffff;\">Рассылка почты</span></p></body></html>"
            font.pixelSize: 12
            rotation: 0
            textFormat: Text.RichText
        }


        TextField {
            id: textField1
            x: 173
            y: 191
            width: 300
            height: 54
            visible: true
            placeholderText: qsTr("Пароль")
            font.pointSize: 13
            NumberAnimation on x{
                id: n2
                to: 1000
                duration: 500
                easing.type: Easing.InOutQuad
                running: false
            }
        }


        TextField {
            id: textField2
            x: 173
            y: 251
            width: 300
            height: 54
            visible: true
            placeholderText: qsTr("SMTP сервер")
            font.pointSize: 13
            NumberAnimation on x{
                id: n3
                to: 1000
                duration: 500
                easing.type: Easing.InOutQuad
                running: false
            }
        }


        Button {
            id: button
            x: 230
            y: 379
            width: 180
            height: 53
            visible: true
            text: qsTr("Авторизация")
            font.family: "Tahoma"
            onReleased: {
                smtp.connect(textField.text, textField1.text, textField2.text, textField3.text);
                timer.running = true;
                n1.running = true;
                n2.running = true;
                n3.running = true;
                n4.running = true;
                n5.running = true;
            }
            NumberAnimation on x{
                id: n5
                to: 1000
                duration: 500
                easing.type: Easing.InOutQuad
                running: false
            }

        }

        Timer
        {
            id: timer; repeat: false; interval: 600; running: false;
            onTriggered: {
                isrun = true;
            }
        }


        MouseArea {
            id: mouseArea
            x: 0
            y: 0
            width: 640
            height: 80
            onPressed: {
                window.startSystemMove();
            }

            MouseArea {
                id: mouseArea1
                x: 595
                y: 8
                width: 37
                height: 37
                hoverEnabled: true

                Rectangle {
                    id: rectangle1
                    x: 0
                    y: 0
                    width: 37
                    height: 37
                    color: "#1b1b1b"

                    Image {
                        id: image
                        x: 8
                        y: 8
                        width: 21
                        height: 21
                        source: "close_icon.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                onHoveredChanged:{
                    if (mouseArea1.containsMouse)
                    {
                        rectangle1.color = "#333333";
                    }
                    else
                    {
                        rectangle1.color = "#1b1b1b";
                    }
                }

                onPressed: {
                    rectangle1.color = "#404040";
                }

                onReleased: {
                    rectangle1.color = "#333333";
                    Qt.quit();
                }
            }

            MouseArea {
                id: mouseArea2
                x: 552
                y: 8
                width: 37
                height: 37
                hoverEnabled: true
                Rectangle {
                    id: rect2
                    x: 0
                    y: 0
                    width: 37
                    height: 37
                    color: "#1b1b1b"
                    Image {
                        x: 8
                        y: 8
                        width: 21
                        height: 21
                        source: "minimize_icon.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                }
                onHoveredChanged:{
                    if (mouseArea2.containsMouse)
                    {
                        rect2.color = "#333333";
                    }
                    else
                    {
                        rect2.color = "#1b1b1b";
                    }
                }
                onPressed: {
                    rect2.color = "#404040";
                }

                onReleased: {
                    rect2.color = "#333333";
                    window.showMinimized();
                }
            }
        }


        TextField {
            id: textField3
            x: 173
            y: 311
            width: 300
            height: 54
            visible: true
            font.pointSize: 13
            placeholderText: qsTr("Порт")
            NumberAnimation on x{
                id: n4
                to: 1000
                duration: 500
                easing.type: Easing.InOutQuad
                running: false
            }
        }


        TextArea {
            id: textArea
            x: 8
            y: 124
            width: 504
            height: 256
            opacity: 0
            font.pointSize: 9
            placeholderText: qsTr("Сообщение")

            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
                onRunningChanged: {
                    inx2++;
                    if (inx2 == 2)
                    {
                        textArea.enabled = true;
                    }
                }
            }
            enabled: false
        }


        Button {
            id: button1
            x: 518
            y: 131
            width: 114
            height: 47
            opacity: 0
            text: qsTr("Отправить")

            onReleased:{
                smtp.send(textArea.text, textField4.text);
            }

            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }
        }


        Button {
            id: button2
            x: 518
            y: 175
            width: 114
            height: 47
            opacity: 0
            text: qsTr("Очистить")
            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }
        }


        ListView{
            x: 518
            y: 238
            width: 114
            height: 166
            opacity: 0
            model: listmodel1
            delegate: Text{
                id: text9
                width: 87
                height: 24
                text: model.email
                color: "#ffffff"
                font.pixelSize: 10
            }
            ListModel
            {
                id: listmodel1;

            }
            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }
        }


        Button {
            id: button3
            x: 518
            y: 410
            width: 114
            height: 30
            opacity: 0
            text: qsTr("Добавить почту")

            onReleased:{
                rectanglezxc.visible = true;
                textArea.visible = false;

            }

            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }

            font.pointSize: 8
        }


        Button {
            id: button4
            x: 518
            y: 436
            width: 114
            height: 30
            opacity: 0
            text: qsTr("Удалить почту")
            font.pointSize: 8
            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }
        }

        TextField {
            id: textField4
            x: 8
            y: 379
            width: 504
            height: 53
            opacity: 0
            visible: true
            enabled: false
            activeFocusOnTab: true
            placeholderText: qsTr("Тема")
            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;

                onRunningChanged: {
                    inx++;
                    if (inx == 2)
                    {
                        textField4.enabled = true;
                    }
                }

            }
            font.pointSize: 10
        }

        Button {
            id: button5
            x: 15
            y: 438
            width: 146
            height: 34
            opacity: 0
            text: qsTr("Прикрепить файлы")
            font.pointSize: 8
            NumberAnimation on opacity{
                duration: 500
                to: 1;
                easing.type: Easing.InOutQuad
                running: isrun;
            }
            onReleased:{
                filed.visible = true;

            }
        }

        Rectangle {
            id: rectangle2
            x: 646
            y: 424
            width: 117
            height: 42
            color: "#282828"

            Rectangle {
                id: rectangle3
                x: 0
                y: 0
                width: 3
                height: 42
                color: "#45f72b"
            }

            Text {
                id: text2
                x: 17
                y: 8
                color: "#fcfafa"
                text: qsTr("Файл добавлен!")
                font.pixelSize: 18
            }
        }

    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 1000
                running: false
                loops: 1
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: false

        KeyframeGroup {
            target: rectangle2
            property: "x"
            Keyframe {
                frame: 0
                value: 646
            }

            Keyframe {
                easing.bezierCurve: [0.219,1.01,0.667,1,1,1]
                frame: 500
                value: 474
            }

            Keyframe {
                easing.bezierCurve: [0.559,0.00516,1.01,-0.0204,1,1]
                frame: 1000
                value: 648
            }
        }

        KeyframeGroup {
            target: rectangle2
            property: "width"
            Keyframe {
                frame: 0
                value: 117
            }

            Keyframe {
                easing.bezierCurve: [0.333,1,0.667,1,1,1]
                frame: 500
                value: 289
            }

            Keyframe {
                easing.bezierCurve: [0.561,0.00748,0.999,0.00748,1,1]
                frame: 1000
                value: 115
            }
        }

        KeyframeGroup {
            target: rectangle2
            property: "height"
            Keyframe {
                frame: 500
                value: 42
            }

            Keyframe {
                frame: 1000
                value: 42
            }
        }

        KeyframeGroup {
            target: rectangle2
            property: "y"
            Keyframe {
                frame: 500
                value: 424
            }

            Keyframe {
                frame: 1000
                value: 424
            }
        }
    }

    Timeline {
        id: timeline1
        animations: [
            TimelineAnimation {
                id: timelineAnimation1
                duration: 1000
                running: true
                loops: 1
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: false
    }
}


