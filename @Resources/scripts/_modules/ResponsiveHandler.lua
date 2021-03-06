--[[
module for responsive size handling of Rainmeter Measures and Meters
]]--

ResponsiveHandler = {}

-- constructor
function ResponsiveHandler:new()

    local newObj = {}

    newObj.sizeModifier = SKIN:GetVariable('Size')/100
    newObj.strokeWidth = self:getStrokeWidth()

    self.__index = self
    return setmetatable(newObj, self)

end

-- private methods
function ResponsiveHandler:getStrokeWidth()

    local strokeWidth = SKIN:GetVariable('MyModifiers1')
    strokeWidth = string.match(strokeWidth, '.-StrokeWidth%s*(%d+)')

    return strokeWidth

end

function ResponsiveHandler:calculateSizeToTable(size)

    for k, v in pairs(size) do
        size[k] = v * self.sizeModifier
    end

    return size

end

-- public methods
function ResponsiveHandler:setStrokeWidth()

    local newStrokeWidth = self.strokeWidth * self.sizeModifier
    local MyModifiers1 = SKIN:GetVariable('MyModifiers1')

    MyModifiers1 = string.gsub(MyModifiers1, 'StrokeWidth.-|' ,
    'StrokeWidth ' .. newStrokeWidth .. ' |', 1)

    SKIN:Bang('!SetVariable "MyModifiers1" "' .. MyModifiers1 .. '"')

end

function ResponsiveHandler:getMeasurePos(measureName)

    local MeasureObject = SKIN:GetMeasure(measureName)
    local X = MeasureObject:GetNumberOption('X')
    local Y = MeasureObject:GetNumberOption('Y')
    local W = MeasureObject:GetNumberOption('W')
    local H = MeasureObject:GetNumberOption('H')
    local FontSize = MeasureObject:GetNumberOption('FontSize')

    return {['X'] = X, ['Y'] = Y, ['W'] = W, ['H'] = H, ['FontSize'] = FontSize}

end

function ResponsiveHandler:resizeMeasure(measureSize)

    -- Note MEASURE "Input Plugin" cannot handle float pixel inch (tested in Rainmeter v4.0)
    measureSize.X = math.floor((measureSize.X * self.sizeModifier)+0.5)
    measureSize.Y = math.floor((measureSize.Y * self.sizeModifier)+0.5)
    measureSize.W = math.floor((measureSize.W * self.sizeModifier)+0.5)
    measureSize.H = math.floor((measureSize.H * self.sizeModifier)+0.5)
    measureSize.FontSize = math.floor((measureSize.FontSize * self.sizeModifier)+0.5)

    SKIN:Bang('!SetOption "MeasureInput" "X" " ' .. measureSize.X .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "Y" " ' .. measureSize.Y .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "W" " ' .. measureSize.W .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "H" " ' .. measureSize.H .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "FontSize" " ' .. measureSize.FontSize .. '"')

end

function ResponsiveHandler:getMeterPos(meterName)
    local meterObject = SKIN:GetMeter(meterName)
    local X = meterObject:GetX()
    local Y = meterObject:GetY()

    return {['X'] = X, ['Y'] = Y}
end

function ResponsiveHandler:getMeterSize(meterName)

    local meterObject = SKIN:GetMeter(meterName)
    local W = meterObject:GetW()
    local H = meterObject:GetH()

    return {['W'] = W, ['H'] = H}

end

function ResponsiveHandler:getMeterShapeParam(meterName)

    local meterObject = SKIN:GetMeter(meterName)
    local optionShape = meterObject:GetOption('Shape')

    local optionShapeX = string.match(optionShape, '%a+%s+(%d*%.?%d+),%d*%.?%d+,%d*%.?%d+,%d*%.?%d+')
    local optionShapeY = string.match(optionShape, '%a+%s+%d*%.?%d+,(%d*%.?%d+),%d*%.?%d+,%d*%.?%d+')
    local optionShapeW = string.match(optionShape, '%a+%s+%d*%.?%d+,%d*%.?%d+,(%d*%.?%d+),%d*%.?%d+')
    local optionShapeH = string.match(optionShape, '%a+%s+%d*%.?%d+,%d*%.?%d+,%d*%.?%d+,(%d*%.?%d+)')
    
    return {['X'] = optionShapeX, ['Y'] = optionShapeY, ['W'] = optionShapeW, ['H'] = optionShapeH}

end

function ResponsiveHandler:getMeterFontSize(meterName)

    local meterObject = SKIN:GetMeter(meterName)
    local FontSize = meterObject:GetOption('InlineSetting2')
    FontSize = string.match(FontSize, 'Size%s*|%s*(%d+)')

    return {['FontSize'] = tonumber(FontSize)}

end

function ResponsiveHandler:setMeterPos(meterName, meterPosition)

    SKIN:Bang('!SetOption "' .. meterName .. '" "X" " ' .. meterPosition['X'] .. '"')
    SKIN:Bang('!SetOption "' .. meterName .. '" "Y" " ' .. meterPosition['Y'] .. '"')

end

function ResponsiveHandler:setMeterSize(meterName, meterSize)

    SKIN:Bang('!SetOption "' .. meterName .. '" "W" " ' .. meterSize['W'] .. '"')
    SKIN:Bang('!SetOption "' .. meterName .. '" "H" " ' .. meterSize['H'] .. '"')

end

function ResponsiveHandler:setMeterFontSize(meterName, meterSize)

    local meterObject = SKIN:GetMeter(meterName)
    local FontSize = string.gsub(meterObject:GetOption('InlineSetting2'), '.*', 'Size | ' .. meterSize['FontSize'], 1)

    SKIN:Bang('!SetOption "' .. meterName .. '" "InlineSetting2" " ' .. FontSize .. '"')

end

function ResponsiveHandler:setMeterShapeParam(meterName, meterShapeParam)

    local meterObject = SKIN:GetMeter(meterName)
    local optionShape = meterObject:GetOption('Shape')
    optionShape = string.gsub(optionShape, '.-%s|' ,
    'Rectangle ' .. meterShapeParam['X'] .. ',' .. meterShapeParam['Y'] ..
    ',' .. meterShapeParam['W'] .. ',' .. meterShapeParam['H'] .. ' |', 1)

    SKIN:Bang('!SetOption "' .. meterName .. '" "Shape" "' .. optionShape .. '"')

end

function ResponsiveHandler:resizeMeter(meterName)

    local meterPosition = self:getMeterPos(meterName)
    local meterShapeParam = self:getMeterShapeParam(meterName)
    meterPosition = self:calculateSizeToTable(meterPosition)
    meterShapeParam = self:calculateSizeToTable(meterShapeParam)
    self:setMeterPos(meterName, meterPosition)
    self:setMeterShapeParam(meterName, meterShapeParam)
    
    -- TODO: equal size with every value of size var
    -- if meterName == 'MeterBackgroundMode' then
        -- round = false -- TODO: var global leaking
        -- if (math.floor((meterShapeParam.H)+0.5) - meterShapeParam.H) > 0 then
            -- --print ("True")
            -- round = true
            -- --meterPosition.Y = meterPosition.Y + 1
        -- end
    -- end
    
    -- if (meterName == 'MeterBackgroundField2' or meterName == 'MeterBackgroundField1') and round then
        -- print ("Hello World", meterName)
        -- meterPosition.Y = meterPosition.Y + 1
    -- end

    -- print(meterName, meterPosition['X'], meterPosition['Y'], meterShapeParam['W'], meterShapeParam['H'])
    --print(meterName, meterPosition['W'], meterPosition['H'])

end

function ResponsiveHandler:resizeText(meterName)

    local meterPosition = self:getMeterPos(meterName)
    local meterSize = self:getMeterSize(meterName)
    local FontSize = self:getMeterFontSize(meterName)
    meterPosition = self:calculateSizeToTable(meterPosition)
    meterSize = self:calculateSizeToTable(meterSize)
    FontSize = self:calculateSizeToTable(FontSize)
    self:setMeterPos(meterName, meterPosition)
    self:setMeterSize(meterName, meterSize)
    self:setMeterFontSize(meterName, FontSize)

end

function ResponsiveHandler:resizeIcon(meterName)

    local meterSize = self:getMeterSize(meterName)
    meterSize = self:calculateSizeToTable(meterSize)
    self:setMeterSize(meterName, meterSize)
    SKIN:Bang('[!Update]')

end

function ResponsiveHandler:findIcon(meterName, current)

    local meterSize = self:getMeterSize(meterName)

    if meterSize.W <= 16 then
        current.icon = current.icon..'16x16.png'
    elseif meterSize.W <= 24 then
        current.icon = current.icon..'24x24.png'
    elseif meterSize.W <= 32 then
        current.icon = current.icon..'32x32.png'
    elseif meterSize.W <= 48 then
        current.icon = current.icon..'48x48.png'
    else  --meterSize.W > 48
        current.icon = current.icon..'256x256.png'
    end

    return current

end

function ResponsiveHandler:applyXPaddingMeter(meterName, relativeToMeter, padding)

    local meterPosition = self:getMeterPos(meterName)
    local meterSize = self:getMeterSize(meterName)

    local meterPositionR = self:getMeterPos(relativeToMeter)
    local meterSizeR = self:getMeterShapeParam(relativeToMeter)
    
    
    meterPosition['X'] = meterPositionR['X'] + meterSizeR['W'] * (padding / 100)

    self:setMeterPos(meterName, meterPosition)

end

function ResponsiveHandler:applyXPaddingMeasure(measureName, relativeToMeter, padding)

    local measurePosition = self:getMeasurePos(measureName)
   
    local meterPositionR = self:getMeterPos(relativeToMeter)
    local meterSizeR = self:getMeterShapeParam(relativeToMeter)

    measurePosition['X'] = meterPositionR['X'] + meterSizeR['W'] * (padding / 100)
    measurePosition['X'] = math.floor(measurePosition['X']+0.5)


    measurePosition.X = math.floor((measurePosition.X)+0.5)
    measurePosition.Y = math.floor((measurePosition.Y)+0.5)
    measurePosition.W = math.floor((measurePosition.W)+0.5)
    measurePosition.H = math.floor((measurePosition.H)+0.5)
    measurePosition.FontSize = math.floor((measurePosition.FontSize)+0.5)

    SKIN:Bang('!SetOption "MeasureInput" "X" " ' .. measurePosition.X .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "Y" " ' .. measurePosition.Y .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "W" " ' .. measurePosition.W .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "H" " ' .. measurePosition.H .. '"')
    SKIN:Bang('!SetOption "MeasureInput" "FontSize" " ' .. measurePosition.FontSize .. '"')
    --self:resizeMeasure(measurePosition)
    --self:setMeterPos(measureName, measurePosition)

end

function ResponsiveHandler:centerIcon(meterName, relativeToMeter)

    local meterPositionR = self:getMeterPos(relativeToMeter)
    local meterSizeR = self:getMeterShapeParam(relativeToMeter)

    local meterSize = self:getMeterSize(meterName)

    meterPosition = {}
    meterPosition['X'] = meterPositionR['X'] + meterSizeR['W'] / 2 - meterSize['W'] / 2
    meterPosition['Y'] = meterPositionR['Y'] + meterSizeR['H'] / 2 - meterSize['H'] / 2

    self:setMeterPos(meterName, meterPosition)

end