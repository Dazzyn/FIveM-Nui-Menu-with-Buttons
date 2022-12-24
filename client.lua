local display = false

function SetDisplay(bool) -- kann true oder false sein
    display = bool
    SetNuiFocus(bool, bool) -- true/false cursor
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterCommand("menu", function(source, args)
    SetDisplay(not display)
end)

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)

        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride

    end
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    print("exited")
    -- Trigger
end)

RegisterNUICallback("button", function(data)
    SetDisplay(false)
    print("triggered")
    -- Trigger
end)