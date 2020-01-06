if not wikipedia then
wikipedia = {
name = 'wikipedia',
size = 2,
icon = SKIN:GetVariable('@')..'plugins\\wikipedia\\icon\\png\\',
field1 = {''},
field2 = {''},
text = 'Search Wikipedia',
field1_cmd = {''},
field2_cmd = {''},
cmd = 'https://wikipedia.org/wiki/Special:Search?search=',
additional = {''}
}
end

fplugin.wikipedia_init = function(current)

    current = deepcopy(wikipedia)

    return current
    
end

fplugin.wikipedia_cmd = function(current, UserInput)

    SKIN:Bang('["'..current.cmd..UserInput..'"]')
    
end

fplugin.wikipedia_terminate = function()

    
end