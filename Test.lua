-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.75)

-- ==========  main program ===========

function goFireDragon13()
    if exists(Pattern("firedragon13.png"):similar(0.75), 5) then
        click(Pattern("firedragon13.png"):targetOffset(-150,10 ),1)
        getLastMatch():highlight(1)
        toast("firedragon13")
    end
end

function clickMissionStage()
    if stageMission == 5 then
        print ("stageMission = "..stageMission)
    elseif stageMission == 10 then
        print ("stageMission = "..stageMission)
    elseif stageMission == 15 then
        print ("stageMission = "..stageMission)
    end
end

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

-- existsClick("button_ok.png", 1)
-- doubleClick()
-- longClick()
-- dialogInit()
-- addTextView("How many times to run this mission")
-- addEditNumber("StageMissionRunTime", 1)
-- newRow()
-- addRadioGroup("stageMission", 15)
-- addRadioButton("中級", 5)
-- addRadioButton("高級", 10)
-- addRadioButton("地獄級", 15)
-- dialogShow("任務選單")
-- print ("firedragon13RunTIme = "..StageMissionRunTime)
-- clickMissionStage()

--existsClick(Pattern("manageTeam.png"):targetOffset(-30,100),5)

if exists(Pattern("startFight.png"):similar(0.65), 3) then
    toast("startFight")
    getLastMatch():highlight(1)
    
end


