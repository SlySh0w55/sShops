local function closeMenu()
    RageUI.CloseAll()
end

Citizen.CreateThread(function()
    while true do
        local open = false
        
        for k,v in pairs(Config.Pos['Shop']) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.Position) < 5 then
                RageUI.Text({
                    message = "Appuyer sur ~b~E~w~ pour intéragir.",
                    time_display = 100,
                })
                open = true
                if IsControlJustPressed(1, 51) then
                    openShopMenu()
                end
            else
                closeMenu()
            end
        end

        for k,v in pairs(Config.Pos['Weapons']) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.Position) < 5 then
                RageUI.Text({
                    message = "Appuyer sur ~b~E~w~ pour intéragir.",
                    time_display = 100,
                })
                open = true
                if IsControlJustPressed(1, 51) then
                    openWeaponsMenu()
                end
            else
                closeMenu()
            end
        end

        for k,v in pairs(Config.Pos['Informatique']) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.Position) < 5 then
                RageUI.Text({
                    message = "Appuyer sur ~b~E~w~ pour intéragir.",
                    time_display = 100,
                })
                open = true
                if IsControlJustPressed(1, 51) then
                    openInfoMenu()
                end
            else
                closeMenu()
            end
        end


        if open then
            Citizen.Wait(5)
        else
            Citizen.Wait(1000)
        end
    end
end)