fx = {}

--[[ Choose your preferred notification system
    'esx'
    'ox_lib' (requires ox_lib) ]]
fx.notifysystem = 'ox_lib'

--[[ Choose how players receive their payment
    'bank' 
    'cash' 
    'item' (Make sure to use this option if you are using ox_inventory and you want that players receive it in cash) ]]
fx.paymentmethod = 'item'
fx.itemname = 'money'

-- How often will players receive their paycheck (in minutes)
fx.paycheckinterval = 0

-- If certain job isnt configured in fx.jobs the players will receive this amount
fx.defaultpay = 500

fx.enabletaxes = true
fx.taxrate = 15

fx.jobs = {
    ['police'] = 5000,
    ['ambulance'] = 4500,
    ['mechanic'] = 3500,
    ['unemployed'] = 250,
}


