-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========

function chooseCrusade()

    if crusadeMission == 5 then
        if exists(Pattern("firedragon13.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click(Pattern("firedragon13.png"):targetOffset(-150,10 ))
            toast("firedragon13")
        end
    elseif crusadeMission == 10 then
        if exists(Pattern("woodGolem13.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click(Pattern("woodGolem13.png"):targetOffset(-150,10 ))
            toast("woodGolem13")
        end
    elseif crusadeMission == 15 then
        if exists(Pattern("waterWitch13.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click(Pattern("waterWitch13.png"):targetOffset(-150,10 ))
            toast("waterWitch13")
        end
    end

end

stratNember = 0
endNember = 0
win = 0
lose = 0

dialogInit()
addTextView("How many times to run Altat")
addEditNumber("crusadeRunTIme", 10)
newRow()
addRadioGroup("crusadeMission", 5)
addRadioButton("火龍", 5)
addRadioButton("木石", 10)
addRadioButton("水妖", 15)
dialogShow("討罰選單")

chooseCrusade()

if exists(Pattern("chooseTeam.png"):similar(0.85), 5) then
    getLastMatch():highlight(1)
    click("chooseTeam.png")
    toast("chooseTeam")
end

endNember = crusadeRunTIme

wait(2)

while stratNember < endNember do

    while true do
        
        toast("start")

        if exists(Pattern("startFight.png"):similar(0.70), 3) then
            toast("click startFight")
            getLastMatch():highlight(1)
            click("startFight.png")
            toast("startFight")
        end

        if exists(Pattern("buy.png"):similar(0.95), 3) then
            toast("click buy")
            getLastMatch():highlight(1)
            click("buy.png")
            toast("buyEnergy")
        end

        if exists(Pattern("backageFullness.png"):similar(0.85), 2) then
            toast("click backageFullness")
            getLastMatch():highlight(1)
            click(Pattern("backageFullness.png"):targetOffset(-200,0))
            existsClick(Pattern("manageTeam.png"):targetOffset(-30,100),5)
            print("backageFullness")
            print ("win = "..win)
        end

        if exists(Pattern("fightingTop.png"):similar(0.85), 3) then
            toast("break")
            break
        end

    end

    wait(130)

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

        if exists(Pattern("wantedConfirmAndGo.png"):similar(0.75), 3) then
            getLastMatch():highlight(1)
            click(Pattern("wantedConfirmAndGo.png"):targetOffset(-100,0))
            toast("wantedConfirmAndGo")
        end
    
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
