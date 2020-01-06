if not everything_small then
everything_small = {
name = 'everything_small',
size = 2,
icon = SKIN:GetVariable('@')..'plugins\\everything_small\\icon\\png\\',
field1 = {''},
field2 = {''},
text = 'Search Everything',
field1_cmd = {''},
field2_cmd = {''},
cmd = SKIN:ReplaceVariables('C:\\Program Files\\everything\\everything.exe'),
additional = {''}
}
end

fplugin.everything_small_init = function(current)

    current = deepcopy(everything_small)

    return current

end

fplugin.everything_small_cmd = function(current, UserInput)

        SKIN:Bang('["' .. current.cmd .. '" -s "' .. UserInput .. '"]')

end

fplugin.everything_small_terminate = function()
        
end