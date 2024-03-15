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

HaveChooseSupportHero = 0

if HaveChooseSupportHero == 0 then

    if exists(Pattern("chooseFriendHero.png"):similar(0.75), 1) then
        getLastMatch():highlight(1)
        click(Pattern("chooseFriendHero.png"):targetOffset(0,250))
        wait(1)
        click(Pattern("chooseFriendHero.png"):targetOffset(0,150))
        toast("chooseFriendHero")
        HaveChooseSupportHero = 1
    end

end