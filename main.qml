import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Window {
    width: 1000
    height: 800
    visible: true
    title: qsTr("BUTTON_TEST")


    Button {
        id: myButton
        x: 100
        y: 100 
        width: 150
        height: 50

        contentItem: Text {
            id: myButtonText
            text: "Click"
            color: "#f0f0f0"
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            font.pointSize: 20
            font.bold: true
        }

        onClicked: {
            console.log("Button is clicked")
        }

        background: Rectangle {
            color: myButton.pressed ? "#0097e6" : "#273c75"
            radius: 5
        }
    }

    CheckBox
    {
        id: myCheckBox
        checked: true
        x: 100
        y: 250
        // anchors.centerIn: parent
        width: 150
        height: 50

        Text
        {
            id: myCheckBoxText
            text: "Check"
            font.pointSize: 15
            font.bold: true
            color: "#38ada9"
            x: ((myCheckBoxindicator.x  + myCheckBoxindicator.width) + 10)
            y: ((myCheckBox.height - myCheckBoxText.height) / 2)
        }

        onCheckedChanged:
        {
            console.log("CheckBox Status : " + checked)
        }

        // background: Rectangle
        // {
        //     border.width: 5
        //     border.color: "#fa983a"
        // }

        indicator: Rectangle
        {
            id: myCheckBoxindicator
            implicitWidth: 40
            implicitHeight: 40
            radius: 10
            border.color: "#1e3799"
            border.width: 3
            x: 10
            y: ((myCheckBox.height - myCheckBoxindicator.height) / 2)
            Rectangle
            {
                visible: myCheckBox.checked
                color: "#eb2f06"
                border.color: "#eb2f06"
                radius: 20
                anchors.margins: 5
                anchors.fill: parent
            }
        }
    }

    ComboBox
    {
        id: myComboBox
        width: 150
        height: 50
        x: 100
        y: 200
        // anchors.centerIn: parent
        currentIndex: 0
        model: myComboBoxListModel

        ListModel
        {
            id: myComboBoxListModel
            ListElement { key: "Option 1" }
            ListElement { key: "Option 2" }
            ListElement { key: "Option 3" }
            ListElement { key: "Option 4" }
            ListElement { key: "Option 5" }
            ListElement { key: "Option 6" }
            ListElement { key: "Option 7" }
        }

        contentItem: Text
        {
            color: "#FFFFFF"
            text: myComboBox.displayText
            font.pointSize: 16
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        delegate: ItemDelegate
        {
            width: myComboBox.width
            background: Rectangle
            {
                color: "#8c7ae6"
                radius: 0
            }
            contentItem: Text
            {
                color: "#4cd137"
                text: modelData
                font.pointSize: 14
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        onActivated:
        {
            console.log("Selected Text : ", myComboBox.currentText)
            console.log("Selected Index : ", myComboBox.currentIndex)
        }

        background: Rectangle
        {
            gradient: Gradient
            {
                GradientStop {position: 0.0; color: "#e84118"}
                GradientStop {position: 1.0; color: "#2f3640"}
            }
            radius: 10
        }
    }

    TextField
    {
        id:myTextField
        width: 200
        height: 50
        // anchors.centerIn: parent
        x: 100
        y: 300
        placeholderText: "Enter Password Here "
        font.pointSize: 12

        validator: RegExpValidator { regExp: /[0-9]+/ }
        echoMode: "Password"
        passwordCharacter: "*"

        // Set Your Color Font Color
        color: "#574b90"

        onTextChanged:
        {
            console.log("Text Changed Data : ", myTextField.text)
        }

        background: Rectangle
        {
            // Define You TextField Active Color And Deactive color
            border.color : myTextField.activeFocus ? "#e15f41" : "#303952"
            border.width : 2
            radius: 5
        }
    }

    GroupBox
    {
        // anchors.centerIn: parent
        x: 100
        y: 400
        label: CheckBox
        {
            id: mainCheckBox
            checked: true
            text: qsTr("Main CheckBox")
            background: Rectangle
            {
                border.color: "#f7b731"
                border.width: 3
                radius: 3
            }
        }
        Row
        {
            anchors.centerIn: parent
            spacing: 15
            enabled: mainCheckBox.checked
            Button
            {
                id: myButton121
                text: qsTr("Button Control")
            }
            CheckBox
            {
                id: myCheckBox4545
                text: qsTr("CheckBox Control")
            }
            Button
            {
                id: myButton_1
                text: qsTr("Button Control")
            }
        }

        background: Rectangle
        {
            border.color: "#a55eea"
            border.width: 3
            radius: 3
        }
    }

    Column
    {
        // anchors.centerIn: parent
        x: 350
        y: 100
        spacing: 30
        RadioButton
        {
            id: myRadioButton_1
            text: "Option 1"
            font.pointSize: 20
            font.bold: true
            height: 60
            background: Rectangle
            {
                border.width: 3
                border.color: "#2C3A47"
                radius: 10
            }
            indicator: Rectangle
            {
                id: myRadioButton_1_indicator
                implicitWidth: 40
                implicitHeight: 40
                radius: width / 2
                x: 10
                y: ((myRadioButton_1.height - myRadioButton_1_indicator.height) / 2)
                color: myRadioButton_1.checked ? "#EAB543" : "transparent"
                anchors.margins: 5
                border.color: "#B33771"
                border.width: 3
            }
            onCheckedChanged:
            {
                console.log("Option 1 Status Changed To : ", myRadioButton_1.checked)
            }
        }

        RadioButton
        {
            id: myRadioButton_2
            text: "Option 2"
            font.pointSize: 20
            font.bold: true
            height: 60
            background: Rectangle
            {
                border.width: 3
                border.color: "#2C3A47"
                radius: 10
            }
            indicator: Rectangle
            {
                id: myRadioButton_2_indicator
                implicitWidth: 40
                implicitHeight: 40
                radius: width / 2
                x: 10
                y: ((myRadioButton_2.height - myRadioButton_2_indicator.height) / 2)
                color: myRadioButton_2.checked ? "#EAB543" : "transparent"
                anchors.margins: 5
                border.color: "#B33771"
                border.width: 3
            }
            onCheckedChanged:
            {
                console.log("Option 2 Status Changed To : ", myRadioButton_2.checked)
            }
        }

        RadioButton
        {
            id: myRadioButton_3
            text: "Option 3"
            font.pointSize: 20
            font.bold: true
            height: 60
            background: Rectangle
            {
                border.width: 3
                border.color: "#2C3A47"
                radius: 10
            }
            indicator: Rectangle
            {
                id: myRadioButton_3_indicator
                implicitWidth: 40
                implicitHeight: 40
                radius: width / 2
                x: 10
                y: ((myRadioButton_3.height - myRadioButton_3_indicator.height) / 2)
                color: myRadioButton_3.checked ? "#EAB543" : "transparent"
                anchors.margins: 5
                border.color: "#B33771"
                border.width: 3
            }
            onCheckedChanged:
            {
                console.log("Option 3 Status Changed To : ", myRadioButton_3.checked)
            }
        }
    }

    SpinBox
    {
        id: mySpinBox
        // anchors.centerIn: parent
        x: 350
        y: 350
        from: 0 
        to: 1000
        stepSize: 10
        editable: true
        width: 200
        height: 50

        validator: IntValidator
        {
            bottom: mySpinBox.from
            top: mySpinBox.to
        }

        onValueChanged:
        {
            console.log("SpinBox Value Is : ", mySpinBox.value)
        }

        contentItem: TextInput
        {
            text: mySpinBox.textFromValue(mySpinBox.value, mySpinBox.locale)
            font.pointSize: 15
            font.bold: true

            color: "#485460"
            selectionColor: "#0fbcf9"
            selectedTextColor: "#d2dae2"
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            validator: mySpinBox.validator
        }

        up.indicator: Rectangle
        {
            implicitWidth: 40
            implicitHeight: 40

            x: mySpinBox.mirrored ? 0 : ((parent.width - width) - 5)
            y: ((mySpinBox.height - height) / 2)

            radius: 20

            color: mySpinBox.up.pressed ? "#ff3f34" : "#00d8d6"

            border.width: 3
            border.color: "#3c40c6"

            Text
            {
                text: "+"
                font.pointSize: 20
                color: "#1e272e"
                anchors.fill: parent
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        down.indicator: Rectangle
        {
            implicitWidth: 40
            implicitHeight: 40

            x: mySpinBox.mirrored ? parent.width - width : 5
            y: ((mySpinBox.height - height) / 2)

            radius: 20

            color: mySpinBox.down.pressed ? "#ff3f34" : "#00d8d6"

            border.width: 3
            border.color: "#3c40c6"

            Text
            {
                text: "-"
                font.pointSize: 20
                color: "#1e272e"
                anchors.fill: parent
                fontSizeMode: Text.Fit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        background: Rectangle
        {
            border.color: "#1e272e"
            border.width: 5
            radius: 25
        }
    }

    Switch
    {
        id: mySwitch
        x:100
        y:50
        text: qsTr("Switch")

        indicator: Rectangle
        {
            implicitWidth: 50
            implicitHeight: 25
            x: mySwitch.leftPadding
            y: parent.height / 2 - height / 2
            radius: 15
            color: mySwitch.checked ? "#341f97" : "#ffffff"
            border.color: mySwitch.checked ? "#341f97" : "#222f3e"

            Rectangle
            {
                x: mySwitch.checked ? parent.width - width : 0
                width: 25
                height: 25
                radius: 15
                color: mySwitch.down ? "#222f3e" : "#ffffff"
                border.color: mySwitch.checked ? (mySwitch.down ? "#341f97" : "#ff9f43") : "#888888"
            }
        }

        contentItem: Text
        {
            text: mySwitch.text
            //font: mySwitch.font
            font.pointSize: 20
            color: mySwitch.down ? "#00d2d3" : "#2e86de"
            verticalAlignment: Text.AlignVCenter
            leftPadding: mySwitch.indicator.width + mySwitch.spacing
        }

        onCheckedChanged:
        {
            console.log("Switch is on : ", checked)
        }
    }

    Column
    {
        spacing: 20
        // anchors.centerIn: parent
        width: 640
        x: 15
        y: 550

        Slider
        {
            id: mySlider
            width: parent.width * 0.8
            from: 0
            to: 1000
            stepSize: 1
            anchors.centerIn: parent

            onValueChanged:
            {
                console.log("Slider Value : " , value);
            }

            background: Rectangle
            {
                x: mySlider.leftPadding
                y: mySlider.topPadding + mySlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 20
                width: mySlider.availableWidth
                height: implicitHeight
                radius: height / 2
                color: "#0abde3"

                Rectangle
                {
                    width: mySlider.visualPosition == 0 ? 0 : mySlider.handle.x  + mySlider.handle.width / 2
                    height: parent.height
                    color: "#341f97"
                    radius: height / 2
                }
            }

            handle: Rectangle
            {
                x: mySlider.leftPadding + mySlider.visualPosition * (mySlider.availableWidth - width)
                y: mySlider.topPadding + mySlider.availableHeight / 2 - height/ 2
                implicitHeight: 50
                implicitWidth: 50
                radius: implicitWidth / 2
                color: mySlider.pressed ? "#ee5253" : "#222f3e"
                border.color: "#1dd1a1"
                border.width: 2
            }
        }

        Text
        {
            id: mySliderText
            text : "Slider Value : " + mySlider.value
            anchors.top: mySlider.bottom
            anchors.horizontalCenter: mySlider.horizontalCenter
        }
    }

    Column
    {
        spacing: 20
        // anchors.centerIn: parent
        x: 100
        y: 600
        ProgressBar
        {
            id: myProgressBar
            width: 300
            value: 75
            from: 0 
            to: 750 

            onValueChanged:
            {
                console.log("ProgressBar Value : ", value)
            }
        }

        Row
        {
            spacing: 20
            Button
            {
                id: myButton_Inc
                text: "Increase"
                onClicked:
                {
                    if (myProgressBar.value < myProgressBar.to)
                    {
                        myProgressBar.value += 15
                    }
                }
            }

            Button
            {
                id: myButton_Dec
                text: "Decrease"
                onClicked:
                {
                    if (myProgressBar.value > myProgressBar.from)
                    {
                        myProgressBar.value -= 15
                    }
                }
            }
        }

        Text
        {
            id: myText
            text: "Progress: " + Math.round((myProgressBar.value * 100) / myProgressBar.to) + " %"
            font.pixelSize: 15
        }
    }

    Label
    {
        id: myLabel
        font.pixelSize: 22
        font.bold: true
        font.italic: false
        font.family: "verdana"

        text: "Ahmet Can Fakili"

        width: 300
        height: 100

        // anchors.centerIn: parent

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        x: 600
        y: 100

        background: Rectangle
        {
            border.color: "blue"
            border.width: 5
            radius: 10
        }

        color: myMouseArea.containsMouse ? "red" : "black"
        scale: myMouseArea.containsMouse ? 1.2 : 1.0

        MouseArea
        {
            id: myMouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
        }
    }

    Row
    {
        spacing: 20
        // anchors.centerIn: parent
        x:50
        y: 750
        Button
        {
            id:myButton_Information
            //anchors.centerIn: parent
            text:"Information"
            onClicked:
            {
                myMessageDialog_Information.open()
            }
        }
        Button
        {
            id:myButton_Warning
            //anchors.centerIn: parent
            text:"Warning"
            onClicked:
            {
                myMessageDialog_Warning.open()
            }
        }
        Button
        {
            id:myButton_Critical
            //anchors.centerIn: parent
            text:"Critical"
            onClicked:
            {
                myMessageDialog_Critical.open()
            }
        }
        Button
        {
            id:myButton_Question
            //anchors.centerIn: parent
            text:"Question"
            onClicked:
            {
                myMessageDialog_Question.open()
            }
        }
        Button
        {
            id:myButton_Custom
            //anchors.centerIn: parent
            text:"Custom"
            onClicked:
            {
                myMessageDialog_Custom.open()
            }
        }
    }

    MessageDialog
    {
        id:myMessageDialog_Custom
        text: "Custom Message Dialog Box"
        title: "Qt QML Custom MessageBox"
        icon: StandardIcon.Information
        standardButtons: MessageDialog.Ok | MessageDialog.Reset | MessageDialog.Help | MessageDialog.NoToAll | MessageDialog.YesToAll
        onAccepted:
        {
            console.log("Custom Ok Button Clicked.");
        }
        onHelp:
        {
            console.log("Custom Help Button Clicked.");
        }
        onNo:
        {
            console.log("Custom No Button Clicked.");
        }
        onReset:
        {
            console.log("Custom Reset Button Clicked.");
        }
    }


    MessageDialog
    {
        id:myMessageDialog_Information
        text: "Information Message Dialog Box"
        title: "Qt QML Information MessageBox"
        icon: StandardIcon.Information
        standardButtons: MessageDialog.Ok
        onAccepted:
        {
            console.log("Information Ok Button Clicked.");
        }
    }

    MessageDialog
    {
        id:myMessageDialog_Warning
        text: "Warning Message Dialog Box"
        title: "Qt QML Warning MessageBox"
        icon: StandardIcon.Warning
        standardButtons: MessageDialog.Ok | MessageDialog.Yes
        onAccepted:
        {
            console.log("Warning Ok Button Clicked.");
        }
    }

    MessageDialog
    {
        id:myMessageDialog_Critical
        text: "Critical Message Dialog Box"
        title: "Qt QML Critical MessageBox"
        icon: StandardIcon.Critical
        standardButtons: MessageDialog.Ok
        onAccepted:
        {
            console.log("Critical Ok Button Clicked.");
        }
    }

    MessageDialog
    {
        id:myMessageDialog_Question
        text: "Question Message Dialog Box"
        title: "Qt QML Question MessageBox"
        icon: StandardIcon.Question
        standardButtons: MessageDialog.Yes | MessageDialog.No
        onYes:
        {
            console.log("Question Yes Button Clicked.");
        }
        onNo:
        {
             console.log("Question No Button Clicked.");
        }
    }



    Button
    {
        id:myButton123
        x:600
        y: 50
        text:"Open File"
        onClicked:
        {
            myFileDialog.open()
        }
    }

    FileDialog
    {
        id:myFileDialog
        modality: Qt.ApplicationModal
        folder: shortcuts.pictures
        selectMultiple: true
        // nameFilters: ["Images file (*.jpg *.png)"]
        onAccepted:
        {
            console.log(fileUrl)
            console.log(fileUrls)
        }
    }


    Button
    {
        id:myButton234
        width: 100
        height: 50
        text: "Open Folder"
        // anchors.centerIn: parent
        x:600
        y: 200
        onClicked:
        {
            myFolderDialog.open()
        }
    }

    // FolderDialog
    // {
    //     id:myFolderDialog
    //     title: "Select The Folder..."
    //     onAccepted:
    //     {
    //         console.log(myFolderDialog.selectedFolder)
    //     }
    // }
    
}
