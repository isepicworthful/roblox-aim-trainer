local sphere = script.Parent 
local gui = game.Workspace.Sign2.SurfaceGui


local textLabel = gui:FindFirstChild("SIGN")
if not textLabel or not textLabel:IsA("TextLabel") then
	error("Could not find a valid TextLabel within the SurfaceGui.")
end

local pointValue = 5

local function onSphereClick()
	local currentPoints = tonumber(textLabel.Text) or 0
	local newPoints = currentPoints - pointValue
	textLabel.Text = tostring(newPoints)
	script.Parent.Error:Play()
end

local clickDetector = sphere:FindFirstChildOfClass("ClickDetector")
if not clickDetector then
	error("Could not find a ClickDetector on the sphere.")
end

clickDetector.MouseClick:Connect(onSphereClick)
