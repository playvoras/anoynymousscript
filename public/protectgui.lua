function protectgui(gui)
    local parent = game.CoreGui.RobloxGui or game.Players.LocalPlayer.PlayerGui
    gui.Parent = parent
    gui.AncestryChanged:Connect(function() gui.Parent = parent end)
    gui:GetPropertyChangedSignal("Position"):Connect(function() gui.Position = UDim2.new(0, gui.Position.X.Offset, 0, gui.Position.Y.Offset) end)
    gui:GetPropertyChangedSignal("Size"):Connect(function() gui.Size = UDim2.new(0, gui.Size.X.Offset, 0, gui.Size.Y.Offset) end)
    gui:GetPropertyChangedSignal("Visible"):Connect(function() gui.Visible = true end)
end
