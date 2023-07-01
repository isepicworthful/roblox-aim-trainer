local respawnDelay = 0.1
local respawnRadius = 10
local boundaryMin = Vector3.new(15, 26, -1000)
local boundaryMax = Vector3.new(41, 46, 1000)
local maxAttempts = 10

local sphere = script.Parent

local function isWithinBoundary(position)
	return position.X >= boundaryMin.X and position.X <= boundaryMax.X
		and position.Y >= boundaryMin.Y and position.Y <= boundaryMax.Y
		and position.Z >= boundaryMin.Z and position.Z <= boundaryMax.Z
end

local function onSphereClick()
	local previousPosition = sphere.Position
	local respawnPosition

	local attempts = 0
	repeat
		respawnPosition = previousPosition + Vector3.new(
			math.random(-respawnRadius, respawnRadius),
			math.random(-respawnRadius, respawnRadius),
			0
		)
		attempts += 1
	until isWithinBoundary(respawnPosition) or attempts >= maxAttempts

	if isWithinBoundary(respawnPosition) then
		wait(respawnDelay)
		sphere.Position = respawnPosition
	else
		warn("Failed to find a valid position within the boundary.")
	end
end

local clickDetector = sphere.ClickDetector
if clickDetector then
	clickDetector.MouseClick:Connect(onSphereClick)
else
	error("No ClickDetector found on the sphere.")
end
