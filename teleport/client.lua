function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function teleport(coord)
    local playerSource = PlayerPedId()
    SetEntityCoords(playerSource, coord.x, coord.y, coord.z)
end

local marker1Pos = vector3(-1694.7819, -1049.7209, 13.0174)
local marker2Pos = vector3(-1704.5812, -1039.0116, 3.2128)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerSource = PlayerPedId()
        local playerCoord = GetEntityCoords(playerSource)

        local distance1 = #(marker1Pos - playerCoord)
        local distance2 = #(marker2Pos - playerCoord)

        if distance1 < 25 then
            DrawMarker(1, marker1Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 245, 69, 69, 0.5, false, true, 2, false, nil, nil, false)
            if distance1 < 0.8 then
                alert("Nyomd meg az ~b~[E] ~s~gombot a teleportáláshoz. A>B")
                if IsControlJustReleased(1, 38) then
                    teleport(marker2Pos)
                end
            end
        end

        if distance2 < 25 then
            DrawMarker(1, marker2Pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 245, 69, 69, 0.5, false, true, 2, false, nil, nil, false)
            if distance2 < 0.8 then
                alert("Nyomd meg az ~b~[E] ~s~gombot a teleportáláshoz. B>A")
                if IsControlJustReleased(1, 38) then
                    teleport(marker1Pos)
                end
            end
        end

    end
end)