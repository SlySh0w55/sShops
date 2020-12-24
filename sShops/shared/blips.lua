Citizen.CreateThread(function()
    for a,b in pairs(Config.Pos) do  
        for c,d in pairs(b) do
            local blip = AddBlipForCoord(d.Position)
  
            SetBlipSprite (blip, d.Sprite)
            SetBlipDisplay(blip, d.Display)
            SetBlipScale  (blip, d.Scale)
            SetBlipColour (blip, d.Colour)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(d.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)