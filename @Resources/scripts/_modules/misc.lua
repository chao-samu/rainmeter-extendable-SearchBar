-- PLUGIN HANDLER ==============================================================
function callPlugin(plugins, fplugin, current, cF1, cF2)
  
    for k, v in ipairs(plugins) do
        if aSBar == k then
            current = fplugin[v..'_init'](current)
            setBarStyleSize_init(current)
            cF1, cF2 = readStoreIndividual(saveSettingInd, current)
            local sizeSkin = ResponsiveHandler:new()
            sizeSkin:resizeIcon('MeterIconMode')
            current = sizeSkin:findIcon('MeterIconMode', current)
            sizeSkin:centerIcon('MeterIconMode', 'MeterBackgroundMode')
            SKIN:Bang('!SetOption MeterIconMode ImageName "' .. current.icon .. '"')
            SKIN:Bang('!SetOption MeterTextField1 Text "' .. current.field1[cF1] .. '"')
            SKIN:Bang('!SetOption MeterTextField2 Text "' .. current.field2[cF2] .. '"')
            SKIN:Bang('!SetOption MeterTextBar Text "' .. current.text .. '"')
        end
    end

    return current, cF1, cF2

end

function loadPlugins(plugins)
        for k, v in ipairs(plugins) do
            dofile(SKIN:GetVariable('@')..'plugins\\'..v..'\\config.lua')
        end
end

-- SIZE HANDLER ================================================================
function setResponsiveSize(current)
    
    local sizeSkin = ResponsiveHandler:new()
    sizeSkin:setStrokeWidth()
    sizeSkin:resizeMeasure(sizeSkin:getMeasurePos('MeasureInput'))
    sizeSkin:resizeMeter('MeterBackgroundMode')
    sizeSkin:resizeMeter('MeterBackgroundField1')
    sizeSkin:resizeMeter('MeterBackgroundField2')
    sizeSkin:resizeMeter('MeterBackgroundBar')

    sizeSkin:resizeText('MeterTextField1')
    sizeSkin:resizeText('MeterTextField2')
    sizeSkin:resizeText('MeterTextBar')
    SKIN:Bang('[!Update]')

    sizeSkin:applyXPaddingMeter('MeterTextField1', 'MeterBackgroundField1', SKIN:GetVariable('padSmallBoxesLeft'))
    sizeSkin:applyXPaddingMeter('MeterTextField2', 'MeterBackgroundField2', SKIN:GetVariable('padSmallBoxesLeft'))
    sizeSkin:applyXPaddingMeter('MeterTextBar', 'MeterBackgroundBar', SKIN:GetVariable('padBigBoxesLeft'))
    sizeSkin:applyXPaddingMeasure('MeasureInput', 'MeterBackgroundBar', SKIN:GetVariable('padBigBoxesLeft'))
    
    -- icon updated after plugin call

end

function setBarStyleSize_init(current)

        if current.size == 1 then
            --pass (nothing to do right now)
        elseif current.size == 2 then
            hiddeBarFields()
        else
            --pass (allow own implementation for user)
        end

        return
end

function setBarStyleSize_terminate(current)

        if current.size == 1 then
            --pass (nothing to do right now)
        elseif current.size == 2 then
            revealBarFields()
        else
            --pass (allow own implementation for user)
        end

        return
end

-- MISCELLANEOUS HANDLER =======================================================
function resetBarIfOutOfRange(plugins, aSBar)
    
        if aSBar > table.getn(plugins) then
            aSBar = 1
        end

        return aSBar
end

-- deepcopy of lua table
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end