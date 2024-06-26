-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========

stratNember = 0
endNember = 0
win = 0
lose = 0

dialogInit()
addTextView("How many times to run Altar")
addEditNumber("AltarRunTIme", 10)
dialogShow("祭壇選單")

if exists(Pattern("chooseTeam.png"):similar(0.85), 5) then
    getLastMatch():highlight(1)
    click("chooseTeam.png")
    toast("chooseTeam")
end

endNember = AltarRunTIme

wait(2)

while stratNember < endNember do

    while true do

        if exists(Pattern("startFight.png"):similar(0.65), 3) then
            toast("startFight")
            getLastMatch():highlight(1)
            click("startFight.png")
            
        end

        if exists(Pattern("buy.png"):similar(0.95), 3) then
            toast("buyEnergy")
            getLastMatch():highlight(1)
            click("buy.png")
            
        end

        if exists(Pattern("backageFullness.png"):similar(0.85), 2) then
            toast("backageFullness")
            getLastMatch():highlight(1)
            click(Pattern("backageFullness.png"):targetOffset(-200,0))
            existsClick(Pattern("manageTeam.png"):targetOffset(-30,100),5)
            print("backageFullness")
            print ("win = "..win)
        end

        if exists(Pattern("fightingTop.png"):similar(0.85), 2) then
            toast("fightingTop")
            break
        end

    end

    wait(30)

    while true do

        if exists(Pattern("stageClear.png"):similar(0.75), 2) then
            toast("stageClear")
            getLastMatch():highlight(1)
            click("stageClear.png")
            stratNember = stratNember+1
            win = win+1
            break
        end

        if exists(Pattern("stageFailed.png"):similar(0.75), 2) then
            toast("stageFailed")
            getLastMatch():highlight(1)
            click("stageFailed.png")
            lose = lose+1
            break
        end
    end

    while true do
    
        if exists(Pattern("battleEndConfirm.png"):similar(0.75), 5) then
            toast("battleEndConfirm")
            getLastMatch():highlight(1)
            click("battleEndConfirm.png")
            
        end
    
        if exists(Pattern("reStart.png"):similar(0.75), 5) then
            toast("reStart")
            getLastMatch():highlight(1)
            click("reStart.png")
            break
        end
    end
    toast("winNumber = "..win)

end

print ("win = "..win)
print ("lose = "..lose)