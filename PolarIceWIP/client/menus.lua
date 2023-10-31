local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function()
		exports['qb-target']:AddBoxZone("polar_tray_1", vector3(274.39, 136.46, 104.59), 1.0, 1.0, {
			name = "polar_tray_1",
			heading = 180.46,
			debugPoly = false,
			minZ=104.0,
			maxZ=105.0,
		}, {
			options = {
			    {
				event = "AS-polar:Tray1",
				icon = "far fa-clipboard",
				label = "Tray",
			    },
			},
			distance = 1.5
		})

         exports['qb-target']:AddBoxZone("polarfridge", vector3(276.77, 125.16, 105.44), 1.8, 0.7, {
            name="polarfridge",
            heading=171.92,
            debugPoly=false,
            minZ=104.0,
            maxZ=106.0,
        }, {
                options = {
                    {
                        event = "AS-polar:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "polar",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("polardisplay", vector3(276.25, 135.17, 104.44), 0.7, 1.8, {
            name="polardisplay",
            heading=181.62,
            debugPoly=false,
            minZ=103.0,
            maxZ=105.8,
        }, {
                options = {
                    {
                        event = "AS-polar:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "polar",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftpolar", vector3(271.19, 135.1, 105.44), 1.8, 0.7, {
            name="craftpolar",
            heading=171.92,
            debugPoly=false,
            minZ=104.0,
            maxZ=106.0,
        }, {
                options = {
                    {
                        event = "AS-polar:PaanMenu",
                        icon = "fas fa-cheeseburger",
                        label = "Make icecream Here",
                        job = "polar",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("polar_register_1", vector3(271.8, 137.85, 104.32), 0.5, 0.4, {
            name="polar_register_1",
            debugPoly=false,
            heading=0.57,
            minZ=103.5,
            maxZ=105,
        }, {
                options = {
                    {
                        event = "AS-polar:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "polar",
                    },
                },
                distance = 1.5
            })
end)


-- NH - Context --
RegisterNetEvent('AS-polar:PaanMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "polar Menu",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },

        {
            header = "chocolate ice cream",
            txt = "milk, chocolate, cone",
            params = {
                event = "AS-polar:chocolate_icecream",
                args = {
                    number = 1,
                }
            }
        },
        {
            header = "gelato",
            txt = "milk, chocolate, vanilla essence",
            params = {
                event = "AS-polar:gelato",
                args = {
                    number = 2,
                }
            }
        },
        {
            header = "strawberry ice cream",
            txt = "milk, chocolate, strawberry, cone",
            params = {
                event = "AS-polar:strawberry_icecream",
                args = {
                    number = 3,
                }
            }
        },
        {
            header = "snowcone",
            txt = "syrup",
            params = {
                event = "AS-polar:snowcone",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "coffee ice cream",
            txt = "coffee bean, milk, ice cream cone",
            params = {
                event = "AS-polar:coffee_icecream",
                args = {
                    number = 5,
                }
            }
        },
        {
            header = "vanilla ice cream",
            txt = "vanilla essence, milk, ice cream cone",
            params = {
                event = "AS-polar:vanilla_icecream",
                args = {
                    number = 6,
                }
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "",
                args = {
                    number = 7,
                }
            }
        },
    })
end)

RegisterNetEvent('AS-polar:OrderMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Fridge",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },

       {
           header = "Purchase Ingredients",
           txt = "Order Items",
           params = {
               event = "AS-polar:shop", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "Fridge",
           txt = "Store items in the fridge",
           params = {
               event = "AS-polar:Storage2",
               args = {
                   number = 1,
               }
           }
       },

       {
           header = "close",
           txt = "",
           params = {
               event = "",
               args = {
                   number = 2,
               }
           }
       },
   })
   end)

-- Till Stuff --
RegisterNetEvent("AS-polar:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                name = 'id',
                text = 'Magic Number',
                isRequired = true

            },
            {
                type = 'number',
                name = 'amount',
                text = '$0.00',
                isRequired = true

            }
        }
    })
    if bill then
        if not bill.id or not bill.amount then return end
        TriggerServerEvent("AS-polar:bill:player", bill.id, bill.amount)
    end
end)

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("polarduty", vector3(275.27, 133.63, 104.44), 1.0, 1.0, {
		name = "polarduty",
		heading = 354.87,
		debugPoly = false,
		minZ=104.0,
		maxZ=105.0,
	}, {
		options = {
		    {  
			event = "AS-polarduty:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "polar",
		    },
		},
		distance = 1.5
	})
end)






