-- STORE HANDLER ===============================================================

function readStoreCfg(savesettings)

    if savesettings == false then
        aSBar = 1
        return aSBar
    end

    local filePath = SKIN:GetVariable('@')..'store'
    local fp = io.open(filePath)
    if not fp then
        print('ReadFile: unable to open file at ' .. filePath)

        fp = io.open(filePath, "w")
        if not fp then	
             print('ReadFile: unable to create file at ' .. filePath)
            return
        end
        fp:write('\naSBar = 1')
        fp:close()

        aSBar = 1
        return aSBar
    end

    local content = fp:read("*all")
    fp:seek('set')
    fp:close()

    aSBar = tonumber(string.match(content, "aSBar%s*=%s*(%d*)"))
    --cF1 = tonumber(string.match(content, "cF1%s*=%s*(%d*)"))
    --cF2 = tonumber(string.match(content, "cF2%s*=%s*(%d*)"))

    return aSBar
end

function saveStoreCfg(savesettings, aSBar)

    if savesettings == false then
        return
    end
    
    local filePath = SKIN:GetVariable('@')..'store'
    local fp = io.open(filePath, "r")
    if not fp then
		print('ReadFile: unable to open file at ' .. filePath)
		return
    end
    local content = fp:read("*a")
    fp:close()

    content = string.gsub(content, "aSBar%s*=%s*%d*", "aSBar = " .. aSBar)
    --content = string.gsub(content, "cF1%s*=%s*%d*", "cF1 = " .. cF1)
    --content = string.gsub(content, "cF2%s*=%s*%d*", "cF2 = " .. cF2)

    local fp = io.open(filePath, "w")
    fp:write(content)

    fp:close()
    

end

function readStoreIndividual(saveSettingInd, current)

    if saveSettingInd == false then
        cF1 = 1
        cF2 = 1
        return cF1, cF2
    end

    local filePath = SKIN:GetVariable('@')..'store'
    fp = io.open(filePath, "r")
    if not fp then
        print('ReadFile: unable to open file at ' .. filePath)

        fp = io.open(filePath, "a+")
        if not fp then	
             print('ReadFile: unable to create file at ' .. filePath)
            return
        end
        fp:write('\ncF1 = 1\ncF2 = 1')
        fp:close()

        return cF1, cF2
    end

    local content = fp:read("*a")
    fp:close()

    cF1 = tonumber(string.match(content, "state." .. current.name .. ".cF1%s*=%s*(%d*)"))
    if not cF1 then
        cF1 = 1
    end
    if cF1 > table.getn(current.field1) then
        cF1 = 1
    end

    cF2 = tonumber(string.match(content, "state." .. current.name .. ".cF2%s*=%s*(%d*)"))
    if not cF2 then
        cF2 = 1
    end
    if cF2 > table.getn(current.field2) then
        cF2 = 1
    end

    return cF1, cF2
end

function saveStoreIndividual(saveSettingInd, current, cF1, cF2)
    
    if saveSettingInd == false then
        return
    end
    
    local filePath = SKIN:GetVariable('@')..'store'
    local fp = io.open(filePath, "r")
    if not fp then
		print('ReadFile: unable to open file at ' .. filePath)
		return
    end
    local content = fp:read("*a")
    fp:close()

    if not string.find(content, "state." .. current.name .. ".cF1%s*=%s*%d*") then
        content = content .. "\nstate." .. current.name .. ".cF1 = " .. cF1
    else
        content = string.gsub(content, "state." .. current.name .. ".cF1%s*=%s*%d*", "state." .. current.name .. ".cF1 = " .. cF1)
    end

    if not string.find(content, "state." .. current.name .. ".cF2%s*=%s*%d*") then
        content = content .. "\nstate." .. current.name .. ".cF2 = " .. cF2
    else
        content = string.gsub(content, "state." .. current.name .. ".cF2%s*=%s*%d*", "state." .. current.name .. ".cF2 = " .. cF2)
    end
    
    local fp = io.open(filePath, "w")
    fp:write(content)

    fp:close()

end