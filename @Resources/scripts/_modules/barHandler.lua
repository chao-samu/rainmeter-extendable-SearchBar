function hiddeBarFields()

    local currentfile = SKIN:GetVariable('CURRENTFILE', 'n/a')
    if currentfile == 'SearchBar bottom.ini' then
        hiddeOnly()
    elseif currentfile == 'SearchBar left.ini' then
        hiddeOnly()
    elseif currentfile == 'SearchBar middle.ini' then
        hiddeOnly()
        local sizeSkin = ResponsiveHandler:new()
        local meterBMShapeParam = sizeSkin:getMeterShapeParam('MeterBackgroundMode')
        local meterBBPOS = sizeSkin:getMeterPos('MeterBackgroundBar')
        local meterTBPOS = sizeSkin:getMeterPos('MeterTextBar')


        SKIN:Bang('!SetOption', 'MeterBackgroundBar', 'X', meterBMShapeParam.W)
        SKIN:Bang('!SetOption', 'MeterTextBar', 'X', meterBMShapeParam.W + (meterTBPOS.X - meterBBPOS.X))
        SKIN:Bang('!SetOption', 'MeasureInput', 'X', math.floor((meterBMShapeParam.W + (meterTBPOS.X-meterBBPOS.X)) + 0.5))
       
        SKIN:Bang('[!Update]')
        sizeSkin:applyXPaddingMeter('MeterTextBar', 'MeterBackgroundBar', SKIN:GetVariable('padBigBoxesLeft'))
        sizeSkin:applyXPaddingMeasure('MeasureInput', 'MeterBackgroundBar', SKIN:GetVariable('padBigBoxesLeft'))

    elseif currentfile == 'SearchBar right.ini' then
        hiddeOnly()
    elseif currentfile == 'SearchBar top.ini' then
        hiddeOnly()
    else
        print('Wrong Skin name, did you change the name of the Skin ini file?')
    end

end

function revealBarFields()

    local currentfile = SKIN:GetVariable('CURRENTFILE', 'n/a')
    if currentfile == 'SearchBar bottom.ini' then
        revealOnly()
    elseif currentfile == 'SearchBar left.ini' then
        revealOnly()
    elseif currentfile == 'SearchBar middle.ini' then
        revealOnly()

        local sizeSkin = ResponsiveHandler:new()
        local meterBMShapeParam = sizeSkin:getMeterShapeParam('MeterBackgroundMode')
        local meterBF1ShapeParam = sizeSkin:getMeterShapeParam('MeterBackgroundField1')
        --local meterBF1POS = sizeSkin:getMeterPos('MeterBackgroundField1')
        local meterBBPOS = sizeSkin:getMeterPos('MeterBackgroundBar')
        local meterTBPOS = sizeSkin:getMeterPos('MeterTextBar')

        SKIN:Bang('!SetOption', 'MeterBackgroundBar', 'X', meterBMShapeParam.W + meterBF1ShapeParam.W)
        SKIN:Bang('!SetOption', 'MeterTextBar', 'X', meterBMShapeParam.W + meterBF1ShapeParam.W + (meterTBPOS.X - meterBBPOS.X))
        SKIN:Bang('!SetOption', 'MeasureInput', 'X', math.floor((meterBMShapeParam.W + meterBF1ShapeParam.W + (meterTBPOS.X-meterBBPOS.X)) + 0.5))
    elseif currentfile == 'SearchBar right.ini' then
        revealOnly()
    elseif currentfile == 'SearchBar top.ini' then
        revealOnly()
    else
        print('Wrong Skin name, did you change the name of the Skin ini file?')
    end

end

function hiddeOnly()

        SKIN:Bang('!SetOption', 'MeterBackgroundField1', 'Hidden', '1')
        SKIN:Bang('!SetOption', 'MeterBackgroundField2', 'Hidden', '1')
        SKIN:Bang('!SetOption', 'MeterTextField1', 'Hidden', '1')
        SKIN:Bang('!SetOption', 'MeterTextField2', 'Hidden', '1')
        
end

function revealOnly()

        SKIN:Bang('!SetOption', 'MeterBackgroundField1', 'Hidden', '0')
        SKIN:Bang('!SetOption', 'MeterBackgroundField2', 'Hidden', '0')
        SKIN:Bang('!SetOption', 'MeterTextField1', 'Hidden', '0')
        SKIN:Bang('!SetOption', 'MeterTextField2', 'Hidden', '0')
       
end

function restoreSettings(saveSettingInd, current, cF1, cF2)
    
    cF1, cF2 = readStoreIndividual(saveSettingInd, current)
    if cF1 <= table.getn(current.field1) then
        SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
    else
        cF1 = 1
        SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
    end

    if cF2 <= table.getn(current.field2) then
        SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
    else
        cF2 = 1
        SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
    end

    return cF1, cF2
    
end