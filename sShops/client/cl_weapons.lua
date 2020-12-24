local open = false

RMenu.Add('weapon', 'main', RageUI.CreateMenu("Armurerie", "Bonjour, que puis-je fair pour vous ?"))
RMenu.Add('weapon', 'blanche', RageUI.CreateSubMenu(RMenu:Get('weapon', 'main'), "Armes Blanches", "Les armes blanches ! Que voulez-vous ?"))
RMenu:Get('weapon', 'blanche').Closed = function()end
RMenu.Add('weapon', 'weapons', RageUI.CreateSubMenu(RMenu:Get('weapon', 'main'), "Accessoires", "Les accessoires ! Que voulez-vous ?"))
RMenu:Get('weapon', 'weapons').Closed = function()end
RMenu.Add('weapon', 'accesories', RageUI.CreateSubMenu(RMenu:Get('weapon', 'main'), "Armes", "Les armes ! Que voulez-vous ?"))
RMenu:Get('weapon', 'accesories').Closed = function()end
RMenu:Get('weapon', 'main').Closed = function()
    open = false
end

function openWeaponsMenu()
    if not open then
        open = true
        RageUI.Visible(RMenu:Get('weapon', 'main'), true)
        while open do 
            RageUI.IsVisible(RMenu:Get('weapon', 'main'), true, true, true, function()
                RageUI.ButtonWithStyle("Armes Blanches", "Voici les armes blanches !", {RightBadge = RageUI.BadgeStyle.Gun},true, function()
                end, RMenu:Get('weapon', 'blanche'))
                RageUI.ButtonWithStyle("Accessoires", "Voici les accessoires !", {RightBadge = RageUI.BadgeStyle.Gun},true, function()
                end, RMenu:Get('weapon', 'accesories'))
                RageUI.ButtonWithStyle("Armes", "Voici les armes !", {RightBadge = RageUI.BadgeStyle.Gun},true, function()
                end, RMenu:Get('weapon', 'weapons'))
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('weapon', 'blanche'), true, true, true, function()
                for k,v in pairs(Config.Config['ArmesBlanches']) do
                    RageUI.ButtonWithStyle(v.label, "Appuyez sur ENTRER pour acheter.", {RightLabel = "~r~"..v.price.."$"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('Shop:buyWeapons', v.price, v.name, v.label)
                        end
                    end)
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('weapon', 'accesories'), true, true, true, function()
                for k,v in pairs(Config.Config['Accessoires']) do
                    RageUI.ButtonWithStyle(v.label, "Appuyez sur ENTRER pour acheter.", {RightLabel = "~r~"..v.price.."$"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('Shop:buyItem', v.price, v.name, v.label)
                        end
                    end)
                end
            end, function()
            end)
            RageUI.IsVisible(RMenu:Get('weapon', 'weapons'), true, true, true, function()
                for k,v in pairs(Config.Config['Weapons']) do
                    RageUI.ButtonWithStyle(v.label, "Appuyez sur ENTRER pour acheter.", {RightLabel = "~r~"..v.price.."$"}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('Shop:buyWeapons', v.price, v.name, v.label)
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