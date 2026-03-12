# TateFlip - World of Warcraft Auction House Flipper  

### Purpose:  
In World of Warcraft there are 2 main ways to get money from items.  You can sell them to NPC vendors for a flat amount, or you can sell to other players on the auction house.  The purpose here is to search the auction house for items that can be purchased for less than their vendor sell value, and be profitable to purchase and flip to a vendor.  
This light-weight addon adds a single command that can be used to search for those profitable opportunities.  

## How To Use:  

### Part 1: Installing Addon  
  1. Download the [most recent release here](https://github.com/tatewelty/TateFlip/releases)  
  2. Click on TateFlip.zip  
  3. Once downloaded, right click the zip file and select Extract All  
  4. Drag the unzipped TateFlip folder to your Addons folder  
>**Tip:** The default location for Addons folder is: C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns  

That is all the out of game setup that is required.  The rest of the setup will happen in game.  
![TateFlip_Addon_Installed](https://github.com/user-attachments/assets/c2c823a3-5ba8-485b-8da0-694240fb5378)  
  5. Launch retail World of Warcraft  
  6. Select a character  
  7. Press escape to get to main menu, select AddOns, make sure TateFlip shows up and has a check mark next to it  
  8. Type `/reload` to reload the UI to add the AddOn  
  9. type `/tateflip` into chat to test and make sure the AddOn is installed.  It should return the following in chat:  
![TateFlip_Addon_Installed_Correctly](https://github.com/user-attachments/assets/397d4e43-ccec-4eab-b4ec-04dee3593797)  


### Part 2: Using the Addon  
There is a single command added in this Addon: `/tateflip scan`.  This command requires the auction house to be open and have search results.  
>**Tip:** Searching 2 letters in the auction house search bar will return results  

Running `/tateflip scan` will open a GUI element with profitable items.  These items all are profitable to purchase on the auction house at their current price and then sell them to a vendor.  Here is my current intended use case.  
  1. Open the auction and search something 2 characters long.  
    **In this Example: I searched 'al'**  
![TateFlip_Step1](https://github.com/user-attachments/assets/1f293a7d-8660-4573-a8ec-c0144532fb5c)  
  2. Once you see results in auction house type `/tateflip scan`.  This will open the TateFlip GUI element.  It will return data on each profitable flip, including item name and profit.    
    **In this Example: 1 result is returned and it is the Khaz Algar Tomato**  
![TateFlip_Step2](https://github.com/user-attachments/assets/578699c4-0cf6-452d-9f54-9b236fb483e5)  
  3. Search that specific item in the auction house and pull up the item.   
     **In this Example: I'm searching for the Khaz Algar Tomato**  
  4. Once you have the item pulled up in the auction house, you can:  
     A. Hover over the item to pull up the Sell Price.  You can use this to double check the true sell price.  
     **In this Example: Khaz Algar Tomato sells to a vendor for 2 silver and 25 copper, or 225 copper**  
     B. See that there are items for sale on the auction house at a price lower than the vendor sell price.  
     **In this Example: there are 4,624 Khaz Algar Tomato available at 1 silver, below the 2 silver 25 copper vendor sell price**  
     C. Click the price you want to purchase at and it will auto-populate Quantity, Unit Price, and Total Price to buy out all at that price and below.  
     **In this Example: Quantity 4624, Unit Price 1 silver, Total Price 46 gold, 24 silver**  
     D. Click Buy to purchase profitable items to sell to vendor  
![TateFlip_FullExample](https://github.com/user-attachments/assets/3ee5bc6f-6d49-4abf-a3d3-6867fa2606d9)  
  5.   Collect your mail with all the items  
  6.   Find an NPC vendor and sell to them to collect your profit   
  **In this Example: Profit per unit is (2 silver 25 copper) - (1 silver) = (1 silver 25 copper)**  
  **There were 4,625 Quantity available at that price**  
  **So total profit from this is (Profit per unit) x Quantity: (1 silver 25 copper) x 4,625 = (5780 copper) or (57 gold 80 silver)**  

### Part 3: Feature Enhancements and Future Iterations  
This was a first pass at getting something functional.  There are a lot of improvements and enhancements to make this smoother.  
  - if 0 profitable results return text that says 0 results  
  - make the links in the text box open the auction page of the item  
  - go through all 2 letter combinations at a time instead of 1 at a time  
  - make the UI nicer, maybe integrate as a tab on auction house  
