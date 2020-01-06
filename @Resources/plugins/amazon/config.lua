if not amazon then
amazon = {
name = 'amazon',
size = 2,
icon = SKIN:GetVariable('@')..'plugins\\amazon\\icon\\png\\',
field1 = {''},
field2 = {''},
text = 'Search Amazon',
field1_cmd = {''},
field2_cmd = {''},
cmd = 'https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=',
additional = {''}
}
end

fplugin.amazon_init = function(current)

    current = deepcopy(amazon)

    return current
    
end

fplugin.amazon_cmd = function(current, UserInput)

    SKIN:Bang('["'..current.cmd..UserInput..'"]')
    
end

fplugin.amazon_terminate = function()
    
end