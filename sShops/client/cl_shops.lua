local open = false

RMenu.Add('shop', 'main', RageUI.CreateMenu("Superette", "Bonjour, que puis-je fair pour vous ?"))
RMenu.Add('shop', 'manger', RageUI.CreateSubMenu(RMenu:Get('shop', 'main'), "Nourriture", "La nourriture ! Que voulez-vous ?"))
RMenu:Get('shop', 'manger').Closed = function()end
RMenu.Add('shop', 'boissons', RageUI.CreateSubMenu(RMenu:Get('shop', 'main'), "Boissons ", "Les boissons ! Que voulez-vous ?"))
RMenu:Get('shop', 'boissons').Closed = function()end
RMenu:Get('shop', 'main').Closed = function()
    open = false
end

function openShopMenu()
    if not open then
        open = true
        RageUI.Visible(RMenu:Get('shop', 'main'), true)
        while open do 
            RageUI.IsVisible(RMenu:Get('shop', 'main'), true, true, true, function()
                RageUI.ButtonWithStyle("Nourriture", "Voici la nourriture !", {RightLabel = ">"},true, function()

                end, RMenu:Get('shop', 'manger'))
                RageUI.ButtonWithStyle("Boissons", "Voici les boissons !", {RightLabel = ">"},true, function()

                end, RMenu:Get('shop', 'boissons'))
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('shop', 'manger'), true, true, true, function()
                for k,v in pairs(Config.Config['Nourritures']) do
                    RageUI.ButtonWithStyle(v.label, "Appuyez sur ENTRER pour acheter.", {RightLabel = "~r~"..v.price.."$"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('Shop:buyItem', v.price, v.name, v.label)
                        end
                    end)
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('shop', 'boissons'), true, true, true, function()
                for k,v in pairs(Config.Config['Boissons']) do
                    RageUI.ButtonWithStyle(v.label, "Appuyez sur ENTRER pour acheter.", {RightLabel = "~r~"..v.price.."$"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('Shop:buyItem', v.price, v.name, v.label)
                        end
                    end)
                end
            end, function()
            end)
        Citizen.Wait(0)
        end 
    else 
        open = false
    end
end