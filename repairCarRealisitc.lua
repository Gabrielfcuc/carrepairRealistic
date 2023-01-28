-- Declare variables for the initial price of the car and the current damage
local initialPrice = 0
local currentDamage = 0

-- Declare a variable for the repair cost
local repairCost = 0

-- Declare a variable for the minimum repair cost
local MIN_REPAIR_COST = 550

-- Declare a variable for the maximum repair cost
local MAX_REPAIR_COST = 7500

-- Declare a variable for the repair cost factor
local REPAIR_FACTOR = 0.05

-- Function to calculate the repair cost
function CalculateRepairCost(initialPrice, currentDamage)
    -- Check if the initial price of the car is greater than 0
    if initialPrice > 0 then
        -- Calculate the repair cost based on the initial price and the current damage
        repairCost = initialPrice * REPAIR_FACTOR * currentDamage
    else
        -- If the initial price is less than or equal to 0, set the repair cost to the minimum repair cost
        repairCost = MIN_REPAIR_COST
    end

    -- Check if the repair cost is greater than the maximum repair cost
    if repairCost > MAX_REPAIR_COST then
        -- If the repair cost is greater than the maximum repair cost, set the repair cost to the maximum repair cost
        repairCost = MAX_REPAIR_COST
    end

    -- Return the repair cost
    return repairCost
end

-- Register an event to calculate the repair cost when the player attempts to repair their car
AddEventHandler("vRP:playerRepair", function()
    -- Get the initial price of the car and the current damage
    initialPrice = vRP.getVehiclePrice(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    currentDamage = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false))

    -- Call the CalculateRepairCost function and store the result in a variable
    repairCost = CalculateRepairCost(initialPrice, currentDamage)

    -- Notify the player of the repair cost
    vRP.notify({"Repair cost: $"..repairCost})

    -- Check if the player has enough money to pay for the repair
    if vRP.tryFullPayment(repairCost) then
        -- If the player has enough money, repair the car
        SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    else
        -- If the player does not have enough money, notify them
        vRP.notify({"You do not have enough money to pay for the repair."})
    end
end)
