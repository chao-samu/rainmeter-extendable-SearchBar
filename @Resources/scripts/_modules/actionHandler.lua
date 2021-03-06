-- USER ACTION HANDLING ========================================================
function userInput()

    local measureObject = SKIN:GetMeasure('MeasureInput')
    local userInput = measureObject:GetStringValue()
    
    fplugin[plugins[aSBar]..'_cmd'](current, userInput)
    SKIN:Bang('!SetOption "MeterTextBar" "Text" "'..current.text..'"')
    SKIN:Bang('[!UpdateMeter MeterTextBar][!Redraw]')

end

function MeterIconMode()

    saveStoreIndividual(saveSettingInd, current, cF1, cF2)
    fplugin[plugins[aSBar]..'_terminate']()
    setBarStyleSize_terminate(current)

    aSBar = aSBar + 1
    
    aSBar = resetBarIfOutOfRange(plugins, aSBar)
    current = fplugin[plugins[aSBar]..'_init'](current)
    setBarStyleSize_init(current)
    cF1, cF2 = restoreSettings(saveSettingInd, current, cF1, cF2)
    
    local sizeSkin = ResponsiveHandler:new()
    sizeSkin:findIcon('MeterIconMode', current)

    SKIN:Bang('!SetOption MeterIconMode ImageName "' .. current.icon .. '"')
    SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
    SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
    SKIN:Bang('!SetOption MeterTextBar Text "' .. current.text .. '"')


    SKIN:Bang('!SetOption MeterIconMode ImageName "' .. current.icon .. '"')
    SKIN:Bang('!SetOption MeterTextBar Text "' .. current.text .. '"')
    
    SKIN:Bang('[!Update][!Redraw]')


    saveStoreCfg(savesettings, aSBar)
    
end

function MeterTextField1()

    cF1 = cF1 + 1

    if cF1 <= table.getn(current.field1) then
        SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
    else
        cF1 = 1
        SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
    end

    SKIN:Bang('[!UpdateMeter MeterTextField1][!Redraw]')

    saveStoreCfg(savesettings, aSBar)
    saveStoreIndividual(saveSettingInd, current, cF1, cF2)

end


function MeterTextField2()

    cF2 = cF2 + 1

    if cF2 <= table.getn(current.field2) then
        SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
    else
        cF2 = 1
        SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
    end

    SKIN:Bang('[!UpdateMeter MeterTextField2][!Redraw]')

    saveStoreCfg(savesettings, aSBar)
    saveStoreIndividual(saveSettingInd, current, cF1, cF2)

end

function MeterTextBarRestore()

    SKIN:Bang('!SetOption MeterTextBar Text "' .. current.text .. '"')

    SKIN:Bang('[!UpdateMeter MeterTextBar][!Redraw]')

end