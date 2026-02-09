-- =========================================================
-- AUTO UI (WINDUI)
-- =========================================================

local AutoSellAPI = _G.NYXHUB.Modules["autosell/api.lua"]
if not AutoSellAPI then
    warn("[NYXHUB][AutoSell] API not found")
    return
end

local AutoSellEnabled = false

local auto = Window:Tab({
    Title = "Automatic",
    Icon  = "repeat",
})

local sellSection = auto:Section({
    Title = "Auto Sell Inventory"
})

sellSection:Toggle({
    Title = "Auto Sell All",
    Desc  = "Automatically sell all items in inventory",
    Default = false,
    Callback = function(state)
        AutoSellEnabled = state

        WindUI:Notify({
            Title = "Auto Sell",
            Content = state and "Enabled" or "Disabled",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})
task.spawn(function()
    while task.wait(2) do
        if not AutoSellEnabled then continue end

        local ok, res = AutoSellAPI:SellAll()

        if ok then
            print("[AUTO SELL] Success", res)
        else
            warn("[AUTO SELL] Failed", res)
        end
    end
end)

