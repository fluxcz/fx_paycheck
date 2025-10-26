ESX = exports["es_extended"]:getSharedObject()
local version = '1.1'

CreateThread(function()
    PerformHttpRequest('https://raw.githubusercontent.com/fluxcz/versions/refs/heads/main/all.json', function(err, text, headers)
        if text then
            local data = json.decode(text)
            if data and data['fx-paycheck'] then
                local newestversion = data['fx-paycheck'].latest
                if newestversion and newestversion > version then
                    print('^1-------------------------------------------------^7')
                    print('^6New Version Released for fx_paycheck^7')
                    print('')
                    print(string.format('^1Your Version: ^7%s', version))
                    print(string.format('^6Newest Version: ^7%s', newestversion))
                    print('')
                    print('^6Changelog^7')
                    for i, change in ipairs(data['fx-paycheck'].changelog) do
                        print(string.format('^7%s', change))
                    end
                    print('^1-------------------------------------------------^7')
                else
                    print('^6[fx_paycheck] You are running the latest version.^7')
                end
            end
        else
            print('^1[fx_paycheck] Could not check for new version.^7')
        end
    end, 'GET', '', {})
end)

CreateThread(function()
    while true do
        Wait(fx.paycheckinterval * 60000)

        for _, playerid in ipairs(GetPlayers()) do
            local xplayer = ESX.GetPlayerFromId(playerid)

            if xplayer then
                local playerjob = xplayer.getJob().name
                local playergrade = xplayer.getJob().grade
                local basesalary = fx.defaultpay

                if fx.jobs[playerjob] then
                    local jobconfig = fx.jobs[playerjob]
                    
                    if type(jobconfig) == 'table' then
                        basesalary = jobconfig[playergrade] or jobconfig[0] or fx.defaultpay
                    else
                        basesalary = jobconfig
                    end
                end

                local taxamount = 0
                local finalamount = basesalary

                if fx.enabletaxes then
                    taxamount = (finalamount / 100) * fx.taxrate
                    finalamount = finalamount - taxamount
                end

                finalamount = math.floor(finalamount)
                taxamount = math.floor(taxamount)

                if finalamount > 0 then
                    if fx.paymentmethod == 'bank' then
                        xplayer.addAccountMoney('bank', finalamount)
                    elseif fx.paymentmethod == 'cash' then
                        xplayer.addMoney(finalamount)
                    elseif fx.paymentmethod == 'item' then
                        xplayer.addInventoryItem(fx.itemname, finalamount)
                    end
                end

                TriggerClientEvent('fx:paycheck:notify', playerid, basesalary, taxamount, fx.taxrate, finalamount, fx.paymentmethod, fx.itemname)
            end
        end
    end
end)
