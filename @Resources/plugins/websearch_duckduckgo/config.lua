if not websearch_duckduckgo then
websearch_duckduckgo = {
name = 'websearch_duckduckgo',
size = 2,
icon = SKIN:GetVariable('@')..'plugins\\websearch_duckduckgo\\icon\\png\\',
field1 = {''},
field2 = {''},
text = 'Search DuckDuckGo',
field1_cmd = {''},
field2_cmd = {''},
cmd = 'https://duckduckgo.com/?q=',
additional = {''}
}
end

fplugin.websearch_duckduckgo_init = function(current)

    current = deepcopy(websearch_duckduckgo)
    
    return current
end

fplugin.websearch_duckduckgo_cmd = function(current, UserInput)

    local url = urlencode(UserInput)
    SKIN:Bang('["'..current.cmd..url..'"]')
    
end

fplugin.websearch_duckduckgo_terminate = function()
    
end
