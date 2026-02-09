-- ===============================
-- AUTO SELL API
-- ===============================

local RS = game:GetService("ReplicatedStorage")

local SellRF =
    RS.common.packages.Knit.Services
    .SellService.RF.SellInventory

local AutoSellAPI = {}

function AutoSellAPI:SellAll()
    if not SellRF then return false end

    local ok, res = pcall(function()
        return SellRF:InvokeServer({ sellAll = true })
    end)

    return ok, res
end

return AutoSellAPI
