-- Create frame GUI element
local frame = CreateFrame("Frame", "TateFlipMainFrame", UIParent, "BasicFrameTemplateWithInset")
frame:SetSize(400, 300)
frame:SetPoint("CENTER")

-- Add quality of life features to frame
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()

-- Create text box in frame for displaying information
frame.title = frame:CreateFontString(nil, "OVERLAY")
frame.title:SetFontObject("GameFontHighlight")
frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
frame.title:SetText("TateFlip Vendor Auction Scanner")
frame.output = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
frame.output:SetPoint("TOPLEFT", 10, -30)
frame.output:SetWidth(360)
frame.output:SetJustifyH("LEFT")
frame.output:SetJustifyV("TOP")
frame.output:SetWordWrap(true)
frame.output:SetText("")


-- Function for writing to text in frame
local function WriteToFrame(line)
    local current = frame.output:GetText() or ""
    frame.output:SetText(current .. line .. "\n")
end

-- Create /tateflip.  This will be used to nest all tateflip commands
SLASH_TATEFLIP1 = "/tateflip"
SlashCmdList["TATEFLIP"] = function(msg)
    --deal with wow parsing of multiple words in a command
    local cmd, param = msg:match("^(%S*)%s*(.-)$")

-- Create scan command
    -- Requirements: Have auction house open and a search (with at least 2 letters typed)
    -- Output: Sorted profit high to low in TateFlips GUI element
    if cmd == "scan" then
        frame:Show()
        
        --make sure auction house is open
        if not AuctionHouseFrame or not AuctionHouseFrame:IsShown() then
            WriteToFrame("The auction house needs to be open to use scan")
            return
        end
        local results = C_AuctionHouse.GetBrowseResults()

        -- make sure there are results in auction house
        if not results or #results == 0 then
            frame.output:SetText("")
            WriteToFrame("Make sure you search in the auction house and have results (2 letter search works)")
            return
        end

        frame.output:SetText("")
        WriteToFrame("TateFlip: Items Sorted by Profit > 0")
        WriteToFrame("")
        local Results = {}

        -- put a cap of 100 results at a time to ensure not causing issues
        for i = 1, math.min(100, #results) do
            local auction = results[i]

            if auction.itemKey then
                -- get item information
                local itemID = auction.itemKey.itemID
                local AH_QTY = auction.totalQuantity or 0
                local AH_Price = auction.minPrice or 0
                local itemName, itemLink, _, _, _, _, _, _, _, _, vendorSell = GetItemInfo(itemID)
                local Profit = (vendorSell or 0) - AH_Price

                --make sure it is profitable
                if Profit > 0 then
                    table.insert(Results,{
                        itemID=itemID,
                        link=itemLink or "unknown",
                        name=itemName or "unknown",
                        AH_QTY=AH_QTY,
                        AH_Price=AH_Price,
                        VendorSell=vendorSell or 0,
                        Profit=Profit
                    })
                end
            end
        end

        --sort by descending profit
        table.sort(Results,function(a,b) return a.Profit > b.Profit end)

        --write the results to text box in GUI
        for _,row in ipairs(Results) do
            WriteToFrame(string.format(
                "ItemID: %d | Link: %s | Name: %s | AH_QTY: %d | AH_Price: %s | VendorSell: %s | Profit: %s",
                row.itemID,
                row.link,
                row.name,
                row.AH_QTY,
                row.AH_Price,
                row.VendorSell,
                row.Profit
            ))
            WriteToFrame("")
        end

    --tooltip information so people know its the only command
    else
        print("/tateflip scan")
        print("Scans auction house for items you can vendor for profit")
    end
end

--TODO: if 0 profitable results return text that says 0 results
--TODO: make the links in text box clickable
--TODO: make the links in text box open the auction page of the item
--TODO: go through more listings per search (make sure doesnt go against TOS)
--TODO: go through all 2 letter combinations as a time isntead of 1 at a time
--TODO: see if there is a way to not 2 letter search and can do 0 letter search
--TODO: make the UI nicer, maybe integrate as a tab on auction house
--TODO: look for items you can buy from vendors and sell for more on the acution house