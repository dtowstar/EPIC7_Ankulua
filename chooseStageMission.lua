-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========
function sellBackage()
    while true do 
        getLastMatch():highlight(1)
        click(Pattern("backageFullness.png"):targetOffset(0,0))

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


function clickMissionStage()
    if stageMission == 5 then
        if exists(Pattern("middleLevel.png"):similar(0.85), 2) then
            toast("middleLevel")
            getLastMatch():highlight(1)
            click("middleLevel.png")
            
        end
    elseif stageMission == 10 then
        if exists(Pattern("hightLevel.png"):similar(0.85), 2) then
            toast("hightLevel")
            getLastMatch():highlight(1)
            click("hightLevel.png")
            
        end
    elseif stageMission == 15 then
        if exists(Pattern("hellLevel.png"):similar(0.85), 2) then
            toast("hellLevel")
            getLastMatch():highlight(1)
            click("hellLevel.png")
            
        end
    end
end

stratNember = 0
win = 0
lose = 0
HaveChooseSupportHero = 0

dialogInit()
addTextView("How many times to run this mission")
addEditNumber("StageMissionRunTime", 1)
newRow()
addRadioGroup("stageMission", 15)
addRadioButton("中級", 5)
addRadioButton("高級", 10)
addRadioButton("地獄級", 15)
dialogShow("任務選單")
-- print ("firedragon13RunTIme = "..endNember)
-- print ("stageMission = "..stageMission)

endNember = StageMissionRunTime

if exists(Pattern("readyToFight.png"):similar(0.85), 5) then
    toast("readyToFight")
    getLastMatch():highlight(1)
    click("readyToFight.png")
    
end

wait(3)

clickMissionStage()

while stratNember < endNember do
    
    while true do

        if exists(Pattern("startFight.png"):similar(0.85), 2) then
            break
        end

        if HaveChooseSupportHero == 0 then

            if exists(Pattern("chooseFriendHero.png"):similar(0.75), 3) then
                getLastMatch():highlight(1)
                click(Pattern("chooseFriendHero.png"):targetOffset(0,250))
                wait(1)
                click(Pattern("chooseFriendHero.png"):targetOffset(0,150))
                toast("chooseFriendHero")
                HaveChooseSupportHero = 1
            end
        
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

        if exists(Pattern("skillOn.png"):similar(0.75), 3) then
            toast("break")
            break
        end
    
        if exists(Pattern("startFight.png"):similar(0.75), 2) then
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
            sellBackage()
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

        if exists(Pattern("cancelAndApply.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click(Pattern("cancelAndApply.png"):targetOffset(100,0))
            toast("cancelAndApply")
        end

        if exists(Pattern("battleEndConfirm.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("battleEndConfirm.png")
            toast("battleEndConfirm")
        end

        wait(2)

        if exists(Pattern("certainAndGo.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click(Pattern("certainAndGo.png"):targetOffset(-100,0))
            toast("certainAndGo")
        end    

        if exists(Pattern("reStart.png"):similar(0.75), 2) then
            getLastMatch():highlight(1)
            click("reStart.png")
            toast("reStart")
            break
        end
    end
    toast("winNumber = "..win)
end

print ("win = "..win)
print ("lose = "..lose)
