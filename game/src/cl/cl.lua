local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('fx:paycheck:notify', function(basesalary, taxamount, taxrate, finalamount, paymentmethod, itemname)
    if fx.notifysystem == 'esx' then
        local finalmessage
        if paymentmethod == 'bank' then
            finalmessage = string.format("You received: ~g~$%s", finalamount)
        elseif paymentmethod == 'cash' then
            finalmessage = string.format("You received: ~g~$%s", finalamount)
        elseif paymentmethod == 'item' then
            finalmessage = string.format("You received: ~g~%s", itemname)
        end

        local message = string.format("Base Salary: $%s", basesalary)
        if fx.enabletaxes and taxamount > 0 then
            message = message .. string.format("~n~Tax (%s%%)", taxrate, taxamount)
        end
        message = message .. finalmessage
        ESX.ShowNotification(message)

    elseif fx.notifysystem == 'ox_lib' then
        local finaltext
        if paymentmethod == 'bank' then
            finaltext = string.format("\n\nYou received: $%s", finalamount)
        elseif paymentmethod == 'cash' then
            finaltext = string.format("\n\nYou received: $%s", finalamount)
        elseif paymentmethod == 'item' then
            finaltext = string.format("\n\nYou received: $%s", finalamount)
        end
        
        local text = string.format("Base Salary: $%s", basesalary)
        if fx.enabletaxes and taxamount > 0 then
            text = text .. string.format("\nTax (%s%%)", taxrate, taxamount)
        end
        text = text .. finaltext

        exports.ox_lib:notify({
            id = 'fx_paycheck',
            title = 'Paycheck Received',
            description = text,
            type = 'success',
            icon = 'money-bill-wave',
            duration = 7000
        })

    else 
        local finaltext
        if paymentmethod == 'bank' then
            finaltext = string.format("\n\nDeposited to bank: $%s", finalamount)
        elseif paymentmethod == 'cash' then
            finaltext = string.format("\n\nReceived in cash: $%s", finalamount)
        elseif paymentmethod == 'item' then
            finaltext = string.format("\n\nReceived item: %s", itemname)
        end

        local text = string.format("Base Salary: $%s", basesalary)
        if fx.enabletaxes and taxamount > 0 then
            text = text .. string.format("\nTax (%s%%): -$%s", taxrate, taxamount)
        end
        text = text .. finaltext

        exports.ox_lib:notify({
            id = 'fx_paycheck',
            title = 'Paycheck Received',
            description = text,
            type = 'success',
            icon = 'money-bill-wave',
            duration = 7000
        })
    end
end)

