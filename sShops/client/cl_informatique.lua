local open = false

RMenu.Add('info', 'main', RageUI.CreateMenu("Magasin Informatique", "Bonjour, que puis-je fair pour vous ?"))
RMenu:Get('info', 'main').Closed = function()
    open = false
end

function openInfoMenu()
    if not open then
        open = true
        RageUI.Visible(RMenu:Get('info', 'main'), true)
        while open do 
            RageUI.IsVisible(RMenu:Get('info', 'main'), true, true, true, function()
                for k,v in pairs(Config.Config['Informatique']) do
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