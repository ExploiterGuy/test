-- UI Library ModuleScript
local Library = {}

local buttonHeight = 36
local buttonSpacing = 8
local headerHeight = 36
local padding = 16
local elements = {}  -- Store UI elements

-- Function to create the main UI
function Library:CreateUI()
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Calculate dynamic height based on buttons added later
    local frameHeight = headerHeight + padding + padding + 30

    -- Main frame with dynamic height
    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 160, 0, frameHeight)
    MainFrame.Position = UDim2.new(0.5, -80, 0.5, -frameHeight / 2)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 135, 190)
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Visible = true
    MainFrame.Draggable = true

    -- Add UICorner for rounded edges
    local UICornerMain = Instance.new("UICorner")
    UICornerMain.Parent = MainFrame
    UICornerMain.CornerRadius = UDim.new(0, 12)

    -- Gradient background for a more appealing look
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Parent = MainFrame
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(0, 185, 235)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 90, 140))
    }
    UIGradient.Rotation = 90

    -- Header label
    local Header = Instance.new("TextLabel")
    Header.Parent = MainFrame
    Header.Size = UDim2.new(1, 0, 0, headerHeight)
    Header.Position = UDim2.new(0, 0, 0, 0)
    Header.BackgroundTransparency = 1
    Header.Text = "Aqua Hub"
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 18
    Header.TextXAlignment = Enum.TextXAlignment.Center

    -- Minimize button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Parent = Header
    MinimizeButton.Size = UDim2.new(0, 24, 0, 24)
    MinimizeButton.Position = UDim2.new(1, -30, 0.5, -12)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 160, 200)
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 18
    MinimizeButton.BorderSizePixel = 0

    -- Separator line
    local Separator = Instance.new("Frame")
    Separator.Parent = MainFrame
    Separator.Size = UDim2.new(0.9, 0, 0, 1)
    Separator.Position = UDim2.new(0.05, 0, 0, headerHeight + 3)
    Separator.BackgroundColor3 = Color3.fromRGB(0, 160, 200)

    -- Add minimize button functionality (toggling visibility of elements)
    local isMinimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        for _, element in ipairs(elements) do
            element.Visible = not isMinimized
        end
        Separator.Visible = not isMinimized
    end)

    return MainFrame  -- Return the frame for further customization
end

-- Function to add buttons dynamically
function Library:AddButton(text, onClickFunction)
    local button = Instance.new("TextButton")
    button.Parent = elements[1]  -- The MainFrame
    button.Size = UDim2.new(0.9, 0, 0, buttonHeight)
    button.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Gotham
    button.TextSize = 16

    -- Add rounded corners
    local UICornerButton = Instance.new("UICorner")
    UICornerButton.Parent = button
    UICornerButton.CornerRadius = UDim.new(0, 10)

    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0, 155, 195)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
    end)

    -- Button functionality
    button.MouseButton1Click:Connect(onClickFunction)
    table.insert(elements, button)  -- Add the button to the list of elements
end

-- Function to add a toggle button
function Library:AddToggle(text, onToggleFunction)
    local toggle = Instance.new("TextButton")
    toggle.Parent = elements[1]  -- The MainFrame
    toggle.Size = UDim2.new(0.9, 0, 0, buttonHeight)
    toggle.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
    toggle.Text = text
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.Gotham
    toggle.TextSize = 16

    -- Add rounded corners
    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.Parent = toggle
    UICornerToggle.CornerRadius = UDim.new(0, 10)

    -- Toggle effect
    toggle.MouseEnter:Connect(function()
        toggle.BackgroundColor3 = Color3.fromRGB(0, 155, 195)
    end)
    toggle.MouseLeave:Connect(function()
        toggle.BackgroundColor3 = Color3.fromRGB(0, 135, 180)
    end)

    -- Toggle functionality
    toggle.MouseButton1Click:Connect(function()
        onToggleFunction(toggle.Text)
    end)

    table.insert(elements, toggle)  -- Add the toggle to the list of elements
end

-- Function to add a textbox
function Library:AddTextbox(defaultText, onTextChanged)
    local textbox = Instance.new("TextBox")
    textbox.Parent = elements[1]  -- The MainFrame
    textbox.Size = UDim2.new(0.9, 0, 0, buttonHeight)
    textbox.Text = defaultText
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.Font = Enum.Font.Gotham
    textbox.TextSize = 16

    -- Add rounded corners
    local UICornerTextbox = Instance.new("UICorner")
    UICornerTextbox.Parent = textbox
    UICornerTextbox.CornerRadius = UDim.new(0, 10)

    -- Update the text
    textbox.FocusLost:Connect(function()
        onTextChanged(textbox.Text)
    end)
    table.insert(elements, textbox)
end

return Library
