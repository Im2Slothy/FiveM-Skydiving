local markerCoords = vector3(-1164.45, -2789.79, 13.95)
local marker = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed)
        local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, markerCoords.x, markerCoords.y, markerCoords.z)

        if distance < 5 then
            DrawText3D(markerCoords.x, markerCoords.y, markerCoords.z + 1.0, "~g~Press E to fly")

            if IsControlJustReleased(0, 38) then
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
				SetPedComponentVariation(GetPlayerPed(-1), 5, drawableId, textureId, 0)
                local maxHeight = 2470.0 -- You can adjust this value to your liking
                SetEntityCoordsNoOffset(playerPed, markerCoords.x, markerCoords.y, maxHeight, true, true, true)
                SetEntityHeading(playerPed, 0.0)

                -- Apply a vertical force to make the player start flying
                SetEntityCoordsNoOffset(playerPed, markerCoords.x, markerCoords.y, maxHeight + 100.0, true, true, true)
                SetEntityCoordsNoOffset(playerPed, markerCoords.x, markerCoords.y, maxHeight, true, true, true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Create the marker on the map
        if not DoesBlipExist(marker) then
            marker = AddBlipForCoord(markerCoords.x, markerCoords.y, markerCoords.z)
            SetBlipSprite(marker, 94) 
            SetBlipDisplay(marker, 2)
            SetBlipScale(marker, 1.0)
            SetBlipColour(marker, 5) 
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Fly Marker")
            EndTextCommandSetBlipName(marker)
        end
    end
end)


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local scale = 0.5

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
