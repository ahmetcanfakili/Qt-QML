import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 600
    height: 400
    visible: true
    title: qsTr("BUTTON_TEST")


    Button {
        id: myButton
        x: 100
        y: 50 
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
        placeholderText: "Enter Password Here ... "
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
}
