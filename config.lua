fx = {}

--[[ Choose your preferred notification system
    'esx'
    'ox_lib' (requires ox_lib) ]]
fx.notifysystem = 'ox_lib'

--[[ Choose how players receive their payment
    'bank' 
    'cash' 
    'item' (Make sure to use this option if you are using ox_inventory and you want that players receive it in cash) ]]
fx.paymentmethod = 'bank'
fx.itemname = 'money'

-- How often will players receive their paycheck (in minutes)
fx.paycheckinterval = 15

-- If certain job isnt configured in fx.jobs the players will receive this amount
fx.defaultpay = 500

fx.enabletaxes = true
fx.taxrate = 15

--[[ Jobs
    You can set salaries in 2 ways
    1. Same salary for all grades ['jobname'] = 5000
    2. Individual salary per grade ['jobname'] = { [0] = 1000, [1] = 2000, [2] = 3000 }
]]
fx.jobs = {
    ['police'] = {
        [0] = 3000,  
        [1] = 3500,  
        [2] = 4000,  
        [3] = 4500,  
        [4] = 5000, 
        [5] = 5500,  
    },
    ['ambulance'] = {
        [0] = 2500,  
        [1] = 3000,  
        [2] = 3500,  
        [3] = 4000, 
        [4] = 4500, 
    },
    ['mechanic'] = 3500,  -- Same salary for all grades
    ['unemployed'] = 250,
}
