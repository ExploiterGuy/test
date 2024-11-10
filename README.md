Aqua UI Library Documentation

Overview

Aqua UI Library is a modular UI framework for Roblox that allows you to easily create customizable user interfaces. It provides a simple API to add buttons, textboxes, and other UI elements without needing to modify the internal code. This library is designed for developers who want to quickly integrate user interfaces into their games with minimal setup.

Getting Started

Installation

To get started, simply load the library using the loadstring function. Copy the following line and paste it into your script:

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/test/refs/heads/main/aquasource.lua"))()

This will load the UI Library into your script and give you access to all its functions.

Creating the UI

Once you’ve loaded the library, you can create the UI by calling the CreateUI() function. This will generate the main frame, header, and basic layout for the UI.

-- Create the UI
local ui = Library:CreateUI()

Adding UI Elements

Add Button

You can add buttons to the UI by calling the AddButton function. This function requires a label (text) and a callback function to handle the button’s click event.

Example:

Library:AddButton("Click Me", function()
    print("Button Clicked")
end)

Add Textbox

To add a textbox to the UI, use the AddTextbox function. This function requires a default text (label) and a callback that will be executed when the player finishes typing in the textbox.

Example:

Library:AddTextbox("Enter Text", function(text)
    print("Text entered: " .. text)
end)

Features

CreateUI: Initializes the UI and sets up the main frame with a header and basic layout.

AddButton: Adds a button with a label and a callback function for the click event.

AddTextbox: Adds a textbox with a default label and a callback that runs when the user finishes typing.


Customization

The library offers several ways to customize the look and behavior of the UI. Here are some customization options you can take advantage of:

Draggable UI: The UI is draggable, allowing players to move the interface around the screen.

Minimize Button: The UI has a minimize button that allows players to hide or show the UI elements.

Gradient Background: The main UI frame has a gradient background to give it a sleek look.

Rounded Corners: Buttons and textboxes feature rounded corners for a more polished design.


Example Code

Here's a complete example showing how to use the Aqua UI Library in your game:

-- Load the UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/test/refs/heads/main/aquasource.lua"))()

-- Create the UI
local ui = Library:CreateUI()

-- Add buttons or other UI elements
Library:AddButton("Click Me", function()
    print("Button Clicked")
end)

Library:AddTextbox("Enter Text", function(text)
    print("Text entered: " .. text)
end)

Additional Features (Optional)

You can extend the library by adding other UI elements such as:

Add Toggle: For adding checkboxes or toggle buttons.

Add Slider: For adding sliders that let players adjust values.

Add Dropdown: For adding dropdown menus with selectable options.


Feel free to open issues or contribute to the repository if you'd like to add new features!

License

This project is licensed under the MIT License - see the LICENSE file for details.
