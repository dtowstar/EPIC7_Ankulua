-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========
function sellBackage()
    while true do 
        getLastMatch():highlight(1)
        click(Pattern("backageFullness.png"):targetOffset(0,0))

        if exists(Pattern("topLeftOfBackage.png"):similar(0.85), 5) then
            getLastMatch():highlight(1)
            click(Pattern("topLeftOfBackage.png"):targetOffset(0,50))
        end

        if exists(Pattern("partOfBackage.png"):similar(0.75), 5) then
            getLastMatch():highlight(1)
            click(Pattern("partOfBackage.png"):targetOffset(100,50))
            if exists(Pattern("autochoose.png"):similar(0.75), 5) then
                getLastMatch():highlight(1)
                click(Pattern("autochoose.png"):targetOffset(0,50))
            end
            wait(2)
            if exists(Pattern("autochoose.png"):similar(0.75), 5) then
                getLastMatch():highlight(1)
                click(Pattern("autochoose.png"):targetOffset(-50,-50))
            end
            if exists(Pattern("sell.png"):similar(0.75), 5) then
                getLastMatch():highlight(1)
                click(Pattern("sell.png"):targetOffset(50,0))
            end
            if exists(Pattern("sellConfirm.png"):similar(0.75), 5) then
                getLastMatch():highlight(1)
                click(Pattern("sellConfirm.png"):targetOffset(100,0))
            end
            if exists(Pattern("partOfBackage.png"):similar(0.75), 5) then
                getLastMatch():highlight(1)
                click(Pattern("partOfBackage.png"):targetOffset(250,50))
                break
            end
        end
    end
end


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
    toast("chooseTeam")
    getLastMatch():highlight(1)
    click("chooseTeam.png")
    
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
        end

        if exists(Pattern("buy.png"):similar(0.95), 3) then
            toast("click buy")
            getLastMatch():highlight(1)
            click("buy.png")
        end

        if exists(Pattern("backageFullness.png"):similar(0.85), 3) then
            sellBackage()
        end

        if exists(Pattern("fightingTop.png"):similar(0.85), 3) then
            break
        end

    end

    wait(100)

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

        if exists(Pattern("wantedConfirmAndGo.png"):similar(0.75), 3) then
            toast("wantedConfirmAndGo")
            getLastMatch():highlight(1)
            click(Pattern("wantedConfirmAndGo.png"):targetOffset(-100,0))
            
        end
    
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
    wait(2)
end

print ("win = "..win)
print ("lose = "..lose)
