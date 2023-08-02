-- ========== Settings ================
Settings:setCompareDimension(true, 1600)
Settings:setScriptDimension(true, 1600)
Settings:set("MinSimilarity", 0.85)

-- ==========  main program ===========

function goFireDragon13()
    if exists(Pattern("firedragon13.png"):similar(0.75), 5) then
        getLastMatch():highlight(1)
        click(Pattern("firedragon13.png"):targetOffset(-150,10 ),1)
        toast("firedragon13")
    end
end

stratNember = 0
endNember = 0
win = 0
lose = 0

dialogInit()
addTextView("How many times to run firedragon13")
addEditNumber("firedragon13RunTIme", 1)
dialogShow("firedragon13RunTIme")
endNember = firedragon13RunTIme
wait(1)
goFireDragon13()
wait(1)

if exists(Pattern("chooseTeam.png"):similar(0.85), 5) then
    getLastMatch():highlight(1)
    click("chooseTeam.png",1)
    toast("chooseTeam")
end

wait(3)

while stratNember < endNember do

    while true do

        if exists(Pattern("dragon13Fighting.png"):similar(0.85), 2) then
            break

        elseif exists(Pattern("buy.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click("buy.png",1)
            toast("buyEnergy")

        elseif exists(Pattern("startFight.png"):similar(0.85), 2) then
            getLastMatch():highlight(1)
            click(Pattern("startFight.png"):similar(0.85),1)
            toast("startFight")

        end

    end

    wait(150)

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

        if exists(Pattern("wantedConfirmAndGo.png"):similar(0.75), 3) then
            getLastMatch():highlight(1)
            click(Pattern("wantedConfirmAndGo.png"):targetOffset(-100,0),1)
            toast("wantedConfirmAndGo")
        end
    
        if exists(Pattern("battleEndConfirm.png"):similar(0.85), 5) then
            getLastMatch():highlight(1)
            click("battleEndConfirm.png",1)
            toast("battleEndConfirm")
        end
    
        if exists(Pattern("reStart.png"):similar(0.85), 5) then
            getLastMatch():highlight(1)
            click("reStart.png")
            toast("reStart")
            break
        end
    end
end

print ("win = "..win)
print ("lose = "..lose)
