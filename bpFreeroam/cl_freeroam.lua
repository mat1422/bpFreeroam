ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

local cooldown = false
local cooldown2 = false


openFreeroam = function()
    local createmenu = RageUI.CreateMenu("Freeroam", "Que voulez-vous faire ?", 10,80)
    local zone_gf = RageUI.CreateSubMenu(createmenu, "Freeroam", "Que voulez-vous faire ?", 10, 80)
    local zone_drift = RageUI.CreateSubMenu(createmenu, "Freeroam", "Que voulez-vous faire ?", 10, 80)

    createmenu:SetRectangleBanner(76, 0, 131, 155)
    zone_gf:SetRectangleBanner(76, 0, 131, 155)
    zone_drift:SetRectangleBanner(76, 0, 131, 155)
    if open then
        open = false
    else
        open = true
        RageUI.Visible(createmenu, true)
    end
    CreateThread(function()
        while open do
            Wait(0)

            RageUI.IsVisible(createmenu, function()

                RageUI.Button("Zone GF", nil, {}, true, {}, zone_gf)
                RageUI.Button("Zone Drift / course", nil, {}, true, {}, zone_drift)
                RageUI.Button("Se Heal", nil, {}, not cooldown2, {
                    onSelected = function()
                        local health = GetEntityHealth(PlayerPedId())
                        print(health)
                        if health == 200 then
                            ESX.ShowNotification("<C>Alistra Freeroam</C>\n~r~Vous etes déjà aux maximum de votre vie")
                        else
                            SetEntityHealth(PlayerPedId(), 200)
                            cooldown2 = true
                            Citizen.SetTimeout(cfg_freeroam.timeheal, function()
                                cooldown2 = false
                            end)
                        end
                    end
                })
                RageUI.Button("Kevlar", nil, {}, not cooldown, {
                    onSelected = function()
                        local armour = GetPedArmour(PlayerPedId())
                        if armour == 100 then
                            ESX.ShowNotification("<C>Alistra Freeroam</C>\n~r~Vous avez déjà mis un kevlar")
                        else
                            SetPedArmour(PlayerPedId(), 100)
                            ESX.ShowNotification("<C>Alistra Freeroam</C>\n~p~Ajoue du kevlar réussit !")
                            cooldown = true
                            Citizen.SetTimeout(cfg_freeroam.timekevlar, function()
                                cooldown = false
                            end)
                        end
                    end
                })
            end)

            RageUI.IsVisible(zone_gf, function()
                for k,v in pairs(cfg_freeroam.zone_gf) do
                    RageUI.Button(v.name, nil, {},  true , {
                        onSelected = function()
                            SetEntityCoords(PlayerPedId(), v.pos)
                            ESX.ShowNotification("<C>Alistra Freeroam</C>\n~p~Téléportation réussite !")
                        end
                    })
                end
            end)
            RageUI.IsVisible(zone_drift, function()
                for k,v in pairs(cfg_freeroam.zone_drift) do
                    RageUI.Button(v.name, nil, {}, true, {
                        onSelected = function()
                            SetEntityCoords(PlayerPedId(), v.pos)
                            ESX.ShowNotification("<C>Alistra Freeroam</C>\n~p~Téléportation réussite !")
                        end
                    })
                end
            end)

        end
    end)
end

RegisterKeyMapping('-openFreeroam', "Ouvrir votre Menu freeroam", "keyboard", "F10")
RegisterCommand('-openFreeroam', function()
    openFreeroam()
end)

RegisterCommand('armour', function()
    SetPedArmour(PlayerPedId(), 0)
end)

RegisterCommand('health', function()
    SetEntityHealth(PlayerPedId(), 100)
end)