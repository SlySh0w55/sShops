Citizen.CreateThread(function()
    for a,b in pairs(Config.Pos) do
        for c,d in pairs(b) do
            local hash = GetHashKey(d.Ped)
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Citizen.Wait(20)
            end
            ped = CreatePed(d.PedType, d.Ped, d.Position, false, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            SetEntityInvincible(ped, true)
            FreezeEntityPosition(ped, true)
        end
    end
end)