if not everything then
everything = {
name = 'everything',
size = 1,
icon = SKIN:GetVariable('@')..'plugins\\Everything\\icon\\png\\',
field1 = drives,
field2 = { 'ALL' , 'FOLDER', 'FILE' },
text = 'Search Everything',
field1_cmd = {},
field2_cmd = { '', 'folder:', 'file:' },
cmd = SKIN:ReplaceVariables('C:\\Program Files\\Everything\\Everything.exe'),
additional = {drive = {}}
}
end

fplugin.everything_init = function(current)
    current = deepcopy(everything) everything_drive()
    return current
end

fplugin.everything_cmd = function(current, UserInput)
    if cF1 == 1 and cF2 == 1 then
        SKIN:Bang('["' .. current.cmd .. '" -s "' .. UserInput .. '"]')
    elseif cF1 == 1 then   
        SKIN:Bang('["' .. current.cmd .. '" -s "' .. current.field2_cmd[cF2] .. ' ' .. UserInput .. '"]')
    elseif cF2 == 1 then   
        SKIN:Bang('["' .. current.cmd .. '" -s "' .. current.field1[cF1] .. ' ' .. UserInput .. '"]')
    else
        SKIN:Bang('["' .. current.cmd .. '" -s "' .. current.field2_cmd[cF2] .. ' ' .. current.field1[cF1] .. ' ' .. UserInput .. '"]')
    end
end

fplugin.everything_terminate = function()
end

-- "Everything" drive letters
function everything_drive()
    current.additional.drive = {}
    current.additional.drive[1] = ""
    for k, _ in ipairs(current.field1) do
        if k>1 then
        current.additional.drive[k] = current.field1[k]
        end
    end
end