-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.85)

-- ==========  main program ===========
wait(1)

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

if exists(Pattern("fightingTop.png"):similar(0.75), 2) then
    getLastMatch():highlight(1)
    toast("break")
end

print("noon")