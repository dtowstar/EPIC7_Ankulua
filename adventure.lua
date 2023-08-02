-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.85)

-- ==========  main program ===========
wait(1)

stratNember = 0
endNember = 0
win = 0
lose = 0

dialogInit()
addTextView("How many times to run this advanture")
addEditNumber("advantureRunTIme", 1)
dialogShow("advantureRunTIme")
endNember = advantureRunTIme
wait(1)

if exists(Pattern("readyToFight.png"):similar(0.85), 5) then
    getLastMatch():highlight(1)
    click("readyToFight.png",1)
    toast("readyToFight")
end

wait(3)

while stratNember < endNember do

    while true do

        if exists(Pattern("skillOn.png"):similar(0.85), 3) then
            break
        end

        if exists(Pattern("chooseSupportHero.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("chooseSupportHero.png",1)
            toast("chooseSupportHero")
        end
    
        if exists(Pattern("chooseTeamNoShowEnergy.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("chooseTeamNoShowEnergy.png",1)
            toast("chooseTeamNoShowEnergy")
        end
    
        if exists(Pattern("startFight.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("startFight.png",1)
            toast("startFight")
        end
    
        if exists(Pattern("buy.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("buy.png",1)
            toast("buyEnergy")
        end

        if exists(Pattern("startFight.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("startFight.png",1)
            toast("startFight")
        end
    end

    wait(30)

    while true do
        if exists(Pattern("stageClear.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("stageClear.png",1)
            toast("stageClear")
            stratNember = stratNember+1
            win = win+1
            toast(win)
            break
        end

        if exists(Pattern("stageFailed.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("stageFailed.png",1)
            toast("stageFailed")
            lose = lose+1
            break
        end
    end

    while true do

        if exists(Pattern("cancelAndApply.png"):similar(0.75), 1) then
            getLastMatch():highlight(1)
            click(Pattern("cancelAndApply.png"):targetOffset(100,0))
            toast("cancelAndApply")
        end

        if exists(Pattern("battleEndConfirm.png"):similar(0.75), 1) then
            getLastMatch():highlight(1)
            click("battleEndConfirm.png")
            toast("battleEndConfirm")
        end

        wait(2)

        if exists(Pattern("certainAndGo.png"):similar(0.75), 1) then
            getLastMatch():highlight(1)
            click(Pattern("certainAndGo.png"):targetOffset(-100,0))
            toast("certainAndGo")
        end    

        if exists(Pattern("reStart.png"):similar(0.85), 1) then
            getLastMatch():highlight(1)
            click("reStart.png")
            toast("reStart")
            break
        end
    end
end

print ("win = "..win)
print ("lose = "..lose)
