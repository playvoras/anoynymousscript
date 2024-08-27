function protectgui(gui)
    gui.Parent = game.CoreGui.RobloxGui
    gui.AncestryChanged:Connect(function(_, parent) if not parent then gui.Parent = game.CoreGui.RobloxGui end end)
    gui:GetPropertyChangedSignal("Position"):Connect(function() gui.Position = UDim2.new(0, gui.Position.X.Offset, 0, gui.Position.Y.Offset) end)
    gui:GetPropertyChangedSignal("Size"):Connect(function() gui.Size = UDim2.new(0, gui.Size.X.Offset, 0, gui.Size.Y.Offset) end)
    gui:GetPropertyChangedSignal("Visible"):Connect(function() gui.Visible = true end)
    for _, prop in ipairs({"Transparency", "BackgroundColor3", "Text"}) do
        gui:GetPropertyChangedSignal(prop):Connect(function() gui[prop] = gui:GetAttribute("Initial"..prop) or gui[prop] end)
    end
end
