local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('fx:paycheck:notify', function(basesalary, taxamount, taxrate, finalamount, paymentmethod, itemname)
    local Strings = Locales[fx.locale]

    if fx.notifysystem == 'esx' then
        local finalmessage
        if paymentmethod == 'bank' then
            finalmessage = string.format(Strings['received_bank'], finalamount)
        elseif paymentmethod == 'cash' then
            finalmessage = string.format(Strings['received_cash'], finalamount)
        elseif paymentmethod == 'item' then
            finalmessage = string.format(Strings['received_item'], itemname)
        end

        local message = string.format(Strings['base_salary'], basesalary)
        if fx.enabletaxes and taxamount > 0 then
            message = message .. string.format(Strings['tax'], taxrate, taxamount)
        end
        message = message .. finalmessage
        ESX.ShowNotification(message)

    elseif fx.notifysystem == 'ox_lib' then
        local finaltext
        if paymentmethod == 'bank' then
            finaltext = string.format(Strings['lib_received_bank'], finalamount)
        elseif paymentmethod == 'cash' then
            finaltext = string.format(Strings['lib_received_cash'], finalamount)
        elseif paymentmethod == 'item' then
            finaltext = string.format(Strings['lib_received_item'], finalamount)
        end
        
        local text = string.format(Strings['lib_base_salary'], basesalary)
        if fx.enabletaxes and taxamount > 0 then
            text = text .. string.format(Strings['lib_tax'], taxrate, taxamount)
        end
        text = text .. finaltext

        exports.ox_lib:notify({
            id = 'fx_paycheck',
            title = Strings['lib_title'],
            description = text,
            type = 'success',
            icon = 'money-bill-wave',
            duration = 7000
        })

    else 
        local finaltext
        if paymentmethod == 'bank' then
            finaltext = string.format(Strings['other_received_bank'], finalamount)
        elseif paymentmethod == 'cash' then
            finaltext = string.format(Strings['other_received_cash'], finalamount)
        elseif paymentmethod == 'item' then
            finaltext = string.format(Strings['other_received_item'], itemname)
        end

        local text = string.format(Strings['base_salary'], basesalary)
        if fx.enabletaxes and taxamount > 0 then
            text = text .. string.format(Strings['other_tax'], taxrate, taxamount)
        end
        text = text .. finaltext

        exports.ox_lib:notify({
            id = 'fx_paycheck',
            title = Strings['lib_title'],
            description = text,
            type = 'success',
            icon = 'money-bill-wave',
            duration = 7000
        })
    end
end)

