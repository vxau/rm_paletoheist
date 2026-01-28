--RAINMAD SCRIPTS - discord.gg/rccvdkmA5X - rainmad.tebex.io
Config = {}

Config['PaletoHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Framework script name work framework exports. (Example: qb-core or es_extended)
        eventName = 'QBCore:GetCoreObject', -- If your framework using trigger event for shared object, you can set in here.
    },
    ['bagClothesID'] = 45,
    ['buyerFinishScene'] = true,
    ["dispatch"] = "ps-dispatch", -- cd_dispatch | qs-dispatch | ps-dispatch | rcore_dispatch | default
    ['requiredPoliceCount'] = 5, -- required police count for start heist
    ['dispatchJobs'] = {'police'},
    ['nextRob'] = 7200, -- Seconds for next heist.
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        'bag',
        'drill',
        'c4_bomb',
        'blowtorch',
        'hack_usb'
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names. You can add more items for lockboxes.
        {itemName = 'paleto_goldbar', count = 1, sellPrice = 50000}, -- For trollys/lockboxes.
        {itemName = 'paleto_diamond', count = 1, sellPrice = 50000}, -- For trollys/lockboxes.
        {itemName = 'paleto_coke_pooch', count = 1, sellPrice = 50000}, -- For trollys/lockboxes.
    },
    ['rewardMoneys'] = {
        ['trollys'] = function()
            return math.random(100000, 120000) -- Per grab in trolly, one trolly give you (45 * this price) money.
        end,
        ['stacks'] = function()
            return math.random(100000, 120000) -- Per grab in stacks.
        end,
    },
    ['rewardLockbox'] = function()
        local random = math.random(#Config['PaletoHeist']['rewardItems'])
        local lockboxBag = {
            item = Config['PaletoHeist']['rewardItems'][random]['itemName'],
            count = math.random(1, 5), -- For lockbox reward items count
        }
        return lockboxBag
    end,
    ['rewardGoldStacks'] = 25, --For gold stacks
    ['moneyItem'] = { -- If your server have money item, you can set it here.
        status = false,
        itemName = 'cash'
    },
    ['black_money'] = true,  -- If change true, all moneys will convert to black. QBCore players can change itemName.
    ['finishHeist'] = { -- Heist finish coords.
        buyerPos = vector3(100.328, -2706.3, 5.00362)
    },
}

Config['PaletoSetup'] = {
    ['lockboxSetup'] = { -- Dont change.
        {model = 'ch_prop_ch_sec_cabinet_01g', coords = vector3(-107.30, 6475.87, 30.6267), heading = 45.0},
        {model = 'ch_prop_ch_sec_cabinet_01a', coords = vector3(-107.00, 6473.51, 30.6267), heading = 135.0},
        {model = 'ch_prop_ch_sec_cabinet_01j', coords = vector3(-108.292, 6474.41, 30.6267), heading = 135.0},
        {model = 'ch_prop_ch_sec_cabinet_01d', coords = vector3(-102.80, 6475.62, 30.6267), heading = 225.0},
        {model = 'ch_prop_ch_sec_cabinet_01j', coords = vector3(-108.292, 6474.41, 30.6267), heading = 225.0},
        {model = 'ch_prop_ch_sec_cabinet_01a', coords = vector3(-105.99, 6478.48, 30.6267), heading = 45.0},
        {model = 'ch_prop_ch_sec_cabinet_01j', coords = vector3(-108.292, 6474.41, 30.6267), heading = 45.0},
        {model = 'ch_prop_ch_sec_cabinet_01d', coords = vector3(-103.71, 6478.52, 30.6267), heading = 315.0},
        {model = 'ch_prop_ch_sec_cabinet_01g', coords = vector3(-102.30, 6477.11, 30.6267), heading = 315.0},

        --For K4MB1 Extended
        {model = -2109233454, coords = vector3(-100.31, 6459.37, 30.6267), heading = -45.0},
        {model = 1034526103, coords = vector3(-100.44, 6457.63, 30.6267), heading = 225.0},
        {model = 1227076747, coords = vector3(-101.87, 6456.20, 30.6267), heading = 225.0},
        {model = 376131363, coords = vector3(-103.04, 6456.04, 30.6267), heading = 135.0},
    },
    ['tables'] = { -- You can add new table with money/gold stacks.
        {coords = vector3(-104.80, 6458.00, 30.6267), heading = 225.0, type = 'money'},
        {coords = vector3(-107.86, 6461.50, 30.6267), heading = 45.0, type = 'money'},
    },
    ['trollys'] = { -- You can add new trollys. Money/Gold/Diamond
        {coords = vector3(-106.80, 6457.82, 30.6267), heading = 315.0, type = 'diamond'},
        {coords = vector3(-107.60, 6458.63, 30.6267), heading = 315.0, type = 'gold'},
    },
    ['mainStack'] = {coords = vector3(-104.42, 6476.94, 31.4817), heading = 315.0},
    ['cellPlant'] = vector3(-105.68, 6461.18, 31.6267),
    ['doors'] = { -- Dont change.
        {model = -1185205679, coords = vector3(-104.47, 6472.69, 31.6267), heading = 45.0, locked = true},
        {model = 1622278560,  coords = vector3(-104.47, 6472.69, 31.6267), heading = 45.0, locked = true},
        --For K4MB1 Extended
        {model = -1528546233,  coords = vector3(-102.07, 6459.53, 31.6267), heading = 225.0, locked = true},
    },
    ['blowtorch'] = vector3(-105.44, 6472.58, 31.6267),
    ['breakDoor'] = vector3(-103.84, 6471.73, 31.6267),
    ['enter'] = vector3(-111.92, 6460.86, 31.4684),
    ['storm'] = vector3(-111.92, 6460.86, 31.4684),
    ['getKeyCard'] = vector3(-108.09, 6467.07, 31.6267),
    ['cardSwipe'] = vector3(-102.60, 6471.97, 31.6267),
    ['keypad'] = {coords = vector3(-102.4655, 6472.343, 31.9267), heading = 315.0},
    ['extendedKeypad'] = {coords = vector3(-102.98, 6459.29, 31.6267)},
    ['enterPeds'] = { -- Dont change. Fixed with animations.
        {model = 's_f_y_airhostess_01', coords = vector3(-109.622, 6467.932, 30.712)},
        {model = 'a_m_m_business_01',   coords = vector3(-109.622, 6467.932, 30.712)},
        {model = 'a_m_m_business_01',   coords = vector3(-109.622, 6467.932, 30.712)},
        {model = 'a_m_m_business_01',   coords = vector3(-109.622, 6467.932, 30.712)},
        {model = 'a_m_m_business_01',   coords = vector3(-109.622, 6467.932, 30.712)},
    }
}

policeAlert = function(coords)
    if Config['PaletoHeist']["dispatch"] == "default" then
        TriggerServerEvent('paletoheist:server:policeAlert', coords)
    elseif Config['PaletoHeist']["dispatch"] == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config["PaletoHeist"]['dispatchJobs'], 
            coords = coords,
            title = 'Paleto Robbery',
            message = 'A '..data.sex..' robbing a Paleto Bank at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Paleto Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config['PaletoHeist']["dispatch"] == "qs-dispatch" then
        exports['qs-dispatch']:PaletoBankRobbery()
    elseif Config['PaletoHeist']["dispatch"] == "ps-dispatch" then
        exports['ps-dispatch']:PaletoBankRobbery()
    elseif Config['PaletoHeist']["dispatch"] == "rcore_dispatch" then
        local data = {
            code = '10-64', -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = Config["PaletoHeist"]['dispatchJobs'], -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = 'Paleto Robbery', -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = 'Paleto Robbery', -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config['PaletoHeist']["dispatch"] == "sonoran_cad" then
        local pos = GetEntityCoords(PlayerPedId())
        local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        local streetLabel = street1
        if street2 ~= nil then
            streetLabel = streetLabel .. ' ' .. street2
        end
        TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'A silent alarm has been triggered at ' .. streetLabel .. '.', exports['nearest-postal']:getPostal(), nil)
    end
end


Strings = {
    ["closest_player"] = "誰かが近くにいるときはこれを行うことはできません。",
    ['grab_stack'] = '山を掴むには ~INPUT_CONTEXT~ を押してください',
    ['grab_trolly'] = 'トロリーを掴むには ~INPUT_CONTEXT~ を押してください',
    ['plant_bomb'] = 'C4を設置するには ~INPUT_CONTEXT~ を押してください',
    ['detonate_bombs'] = '爆弾を起爆するには ~INPUT_CONTEXT~ を押してください',
    ['drill'] = '箱をドリルで開けるには ~INPUT_CONTEXT~ を押してください',
    ['hack'] = 'ハックを開始するには ~INPUT_CONTEXT~ を押してください',
    ['open_vault'] = '金庫にアクセスするには ~INPUT_CONTEXT~ を押してください',
    ['take_keycard'] = 'キーガードを取るには ~INPUT_CONTEXT~ を押してください',
    ['no_keycard'] = 'キーガードを持っていません。',
    ['blowtorch'] = 'バーナーを使用するには ~INPUT_CONTEXT~ を押してください',
    ['break_door'] = 'ドアを破るには ~INPUT_CONTEXT~ を押してください',
    ['storm_bank'] = '銀行を急襲するには ~INPUT_CONTEXT~ を押してください',
    ['wait_nextrob'] = '再度強盗を開始するにはこれだけ時間を待つ必要があります',
    ['minute'] = '分。',
    ['need_this'] = 'これが必要です: ',
    ['need_police'] = '街に警察が足りません。',
    ['total_money'] = 'これだけ手に入れました: ',
    ['police_alert'] = 'パレト銀行の強盗警報！GPSを確認してください。',
    ['not_cop'] = 'あなたは警察ではありません！',
    ['buyer_blip'] = '買い手',
    ['deliver_to_buyer'] = '戦利品を買い手に届けてください。GPSを確認してください。',

    --ミニゲームのため
    ['confirm'] = '確認',
    ['change'] = '縦に変える',
    ['change_slice'] = 'スライスを変更',
    ['exit'] = '終了',
}
