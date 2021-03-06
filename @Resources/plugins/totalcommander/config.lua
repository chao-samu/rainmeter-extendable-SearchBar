if not totalcommander then 
totalcommander = {
name = 'totalcommander',
size = 1,
icon = SKIN:GetVariable('@')..'plugins\\totalcommander\\icon\\png\\',
field1 = drives,
field2 = { 'ALL' , 'FOLDER', 'FILE' },
text = 'Search Total Commander',
field1_cmd = {},
field2_cmd = {'-A', '-V', '-F' },
cmd = SKIN:GetVariable('@')..'plugins\\totalcommander\\helper\\TC-search-rainmeter.ahk',
additional  = {SKIN:ReplaceVariables('C:\\totalcmd\\TOTALCMD64.EXE')}
}
end

fplugin.totalcommander_init = function(current)
    current = deepcopy(totalcommander)
    current = totalcommander_drive(current)

    return current
end

fplugin.totalcommander_cmd = function(current, UserInput)

    SKIN:Bang('["' .. current.cmd .. '" "' .. current.additional[1] .. '" "' .. current.field2_cmd[cF2] .. '" "'.. current.field1_cmd[cF1] .. '" "' .. UserInput .. '"]')
    
end

fplugin.totalcommander_terminate = function()
end

function totalcommander_drive(current)

    current.field1_cmd[1] = ""
    for k, _ in ipairs(current.field1) do
        if k>1 then
            current.field1_cmd[1] = current.field1_cmd[1] .. current.field1[k] .. ';'
        end
    end
    current.field1_cmd[1] = current.field1_cmd[1]:sub(1, -2)..'\\'
    for k, _ in ipairs(current.field1) do
        if k>1 then
            current.field1_cmd[k] = current.field1[k] .. '\\'
        end
    end

    return current

end
