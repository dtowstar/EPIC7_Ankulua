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

        if exists(Pattern("fightingTop.png"):similar(0.85), 3) then
            break
        end

        if exists(Pattern("startFight.png"):similar(0.75), 3) then
            getLastMatch():highlight(1)
            click("startFight.png")
            toast("startFight")
        end

        if exists(Pattern("buy.png"):similar(0.95), 3) then
            getLastMatch():highlight(1)
            click("buy.png")
            toast("buyEnergy")
        end

        if exists(Pattern("backageFullness.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click(Pattern("backageFullness.png"):targetOffset(-200,0))
            existsClick(Pattern("manageTeam.png"):targetOffset(-30,100),5)
            print("backageFullness")
            print ("win = "..win)
        end

    end

    wait(30)

    while true do

        if exists(Pattern("stageClear.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("stageClear.png")
            toast("stageClear")
            stratNember = stratNember+1
            win = win+1
            break
        end

        if exists(Pattern("stageFailed.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("stageFailed.png")
            toast("stageFailed")
            lose = lose+1
            break
        end
    end

    while true do
    
        if exists(Pattern("battleEndConfirm.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click("battleEndConfirm.png")
            toast("battleEndConfirm")
        end
    
        if exists(Pattern("reStart.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click("reStart.png")
            toast("reStart")
            break
        end
    end
    toast("winNumber = "..win)
    wait(2)
end

print ("win = "..win)
print ("lose = "..lose)