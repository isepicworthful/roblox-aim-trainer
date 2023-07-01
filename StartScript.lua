local part = script.Parent 
local gui = game.Workspace.Sign.SurfaceGui
local textLabel = gui.SIGN
local countdownDuration = 60 -- Duration of the countdown in seconds

local gui2 = game.Workspace.Sign2.SurfaceGui


local textLabel2 = gui2:FindFirstChild("SIGN")
if not textLabel or not textLabel:IsA("TextLabel") then
	error("Could not find a valid TextLabel within the SurfaceGui.")
end

local countdownActive = false
local countdownTime = countdownDuration

local function startCountdown()
	if countdownActive then
		return
	end

	countdownActive = true
	game.Workspace.Border.Wall.Script.Enabled = true
	textLabel.Text = tostring(countdownTime)
	textLabel2.Text = 0
	repeat
		wait(1)
		countdownTime -= 1
		textLabel.Text = tostring(countdownTime)
	until countdownTime <= 0

	textLabel.Text = "Done"
	game.Workspace.Border.Wall.Script.Enabled = false
	countdownTime = countdownDuration
	countdownActive = false
end

local function changeparent()
	game.ServerStorage.Sphere.Parent = workspace
	wait(60)
	game.Workspace.Sphere.Parent = game.ServerStorage
end

part.ClickDetector.MouseClick:Connect(startCountdown)

part.ClickDetector.MouseClick:Connect(changeparent)

