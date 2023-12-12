-- ADD_BLIP_FOR_COORD
local SkyDiveBlip  = radar_flight_school
	AddBlipForCoord(
		x --[[ number ]], 
		y --[[ number ]], 
		z --[[ number ]]
	)

-- DRAW_MARKER
DrawMarker(
	type --[[ integer ]], 
	posX --[[ number ]], 
	posY --[[ number ]], 
	posZ --[[ number ]], 
	dirX --[[ number ]], 
	dirY --[[ number ]], 
	dirZ --[[ number ]], 
	rotX --[[ number ]], 
	rotY --[[ number ]], 
	rotZ --[[ number ]], 
	scaleX --[[ number ]], 
	scaleY --[[ number ]], 
	scaleZ --[[ number ]], 
	red --[[ integer ]], 
	green --[[ integer ]], 
	blue --[[ integer ]], 
	alpha --[[ integer ]], 
	bobUpAndDown --[[ boolean ]], 
	faceCamera --[[ boolean ]], 
	p19 --[[ integer ]], 
	rotate --[[ boolean ]], 
	textureDict --[[ string ]], 
	textureName --[[ string ]], 
	drawOnEnts --[[ boolean ]]
)

RegisterCommand( "skydive", function()
    -- We need to get the PlayerAttachVirtualBound
    GetPlayerPed(-1)



    
end)