-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========
wait(1)

stratNember = 0
endNember = 0
win = 0
lose = 0

dialogInit()
addTextView("How many times to run this advanture")
addEditNumber("advantureRunTIme", 1)
dialogShow("冒險選單")
endNember = advantureRunTIme

if exists(Pattern("readyToFight.png"):similar(0.85), 5) then
    toast("readyToFight")
    getLastMatch():highlight(1)
    click("readyToFight.png")
    
end

wait(3)

while stratNember < endNember do

    while true do

        if exists(Pattern("startFight.png"):similar(0.85), 2) then
            toast("break")
            break
        end

        if exists(Pattern("chooseSupportHero.png"):similar(0.85), 2) then
            toast("chooseSupportHero")
            getLastMatch():highlight(1)
            click("chooseSupportHero.png")
            
        end
    
        if exists(Pattern("chooseTeamNoShowEnergy.png"):similar(0.85), 2) then
            toast("chooseTeamNoShowEnergy")
            getLastMatch():highlight(1)
            click("chooseTeamNoShowEnergy.png")
            
        end
    
    end

    while true do

        if exists(Pattern("skillOn.png"):similar(0.85), 3) then
            toast("break")
            break
        end
    
        if exists(Pattern("startFight.png"):similar(0.85), 2) then
            toast("startFight")
            getLastMatch():highlight(1)
            click("startFight.png")
            
        end
    
        if exists(Pattern("buy.png"):similar(0.95), 2) then
            toast("buyEnergy")
            getLastMatch():highlight(1)
            click("buy.png")
            
        end

        if exists(Pattern("backageFullness.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click(Pattern("backageFullness.png"):targetOffset(-200,0))
            existsClick(Pattern("manageTeam.png"):targetOffset(-30,100),5)
            print("backageFullness")
            print ("win = "..win)
        end

    end

    wait(20)

    while true do
        
        if exists(Pattern("stageClear.png"):similar(0.75), 2) then
            toast("stageClear")
            getLastMatch():highlight(1)
            click("stageClear.png")  
            stratNember = stratNember+1
            win = win+1
            toast(win)
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

        if exists(Pattern("cancelAndApply.png"):similar(0.75), 1) then
            toast("cancelAndApply")
            getLastMatch():highlight(1)
            click(Pattern("cancelAndApply.png"):targetOffset(100,0))
            
        end

        if exists(Pattern("battleEndConfirm.png"):similar(0.75), 1) then
            toast("battleEndConfirm")
            getLastMatch():highlight(1)
            click("battleEndConfirm.png")

        end

        wait(2)

        if exists(Pattern("certainAndGo.png"):similar(0.75), 2) then
            toast("certainAndGo")
            getLastMatch():highlight(1)
            click(Pattern("certainAndGo.png"):targetOffset(-100,0))
            
        end    

        if exists(Pattern("reStart.png"):similar(0.75), 1) then
            toast("reStart")
            getLastMatch():highlight(1)
            click("reStart.png")
            
            break
        end
    end
end

print ("win = "..win)
print ("lose = "..lose)
