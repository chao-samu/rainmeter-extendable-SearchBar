--------------------------------------------------------------------------------
-- info
--------------------------------------------------------------------------------
-- Config file for "Extendable Search Bar" Skin for Rainmeter
-- Important: Edit everything in "globals and settings" to your needs!
-- Keep it LUA language conform because it's read as LUA code!
-- You have to use "\\" instead of "\" because of lua language!
-- every line that has "--" in front of are a comment and not read by lua parser
-- disable plugins by comment it out with "--"

-- This config is for the technical aspects of the Skin not the appearance!
-- Use the appropriate skin.ini file for the appearance.

-- Any change in this config file requires a skin renew to use the new settings!

--------------------------------------------------------------------------------
-- globals
--------------------------------------------------------------------------------
-- drives, add as many as you want (first index 'ALL' cannot be changed!)
drives = { 'ALL', 'C:\\', 'D:\\', 'E:\\' }

--------------------------------------------------------------------------------
-- settings
--------------------------------------------------------------------------------
-- save current selected plugin, if skin is closed (set it to "true" or "false")
-- you can set your start settings in the "store" file under the "@Resources"
-- directory, but set it always >= 1 !
savesettings = false

-- save individual plugin setting
saveSettingInd = false

-- select plugins, comment it out if you don't need it e.g: --"totalcommander",
-- or delete it. Renew Skin!
-- doublecommander and totalcommander plugin require Autohotkey!

plugins = {

"amazon",
-- "commandline",
-- "doublecommander",
-- "doublecommander_small",
"everything",
"everything_small",
-- "totalcommander",
-- "totalcommander_small",
"twitch",
"urlopen",
"websearch_duckduckgo",
"websearch_google",
"wikipedia",
"youtube",

}

--------------------------------------------------------------------------------
-- plugin override (advanced section, read FAQ)
--------------------------------------------------------------------------------

-- amazon = {
-- name = 'amazon',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\amazon\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Amazon',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=',
-- additional = {''}
-- }

-- commandline = {
-- name = 'commandline',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\commandline\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Enter cmd',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = '',
-- additional = {''}
-- }

-- doublecommander = {
-- name = 'doublecommander',
-- size = 1,
-- icon = SKIN:GetVariable('@')..'plugins\\doublecommander\\icon\\png\\',
-- field1 = drives,
-- field2 = { 'ALL' , 'FOLDER', 'FILE' },
-- text = 'Search Double Commander',
-- field1_cmd = {},
-- field2_cmd = {'-A', '-V', '-F' },
-- cmd = SKIN:GetVariable('@')..'plugins\\doublecommander_small\\helper\\DC-search-rainmeter.ahk',
-- additional  = {SKIN:ReplaceVariables('C:\\Program Files\\Double Commander\\doublecmd.exe')}
-- }

-- doublecommander_small = {
-- name = 'doublecommander_small',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\doublecommander_small\\icon\\png\\',
-- field1 = drives,
-- field2 = { 'ALL' , 'FOLDER', 'FILE' },
-- text = 'Search Double Commander',
-- field1_cmd = {},
-- field2_cmd = {'-A', '-V', '-F' },
-- cmd = SKIN:GetVariable('@')..'plugins\\doublecommander_small\\helper\\DC-search-rainmeter.ahk',
-- additional  = {SKIN:ReplaceVariables('C:\\Program Files\\Double Commander\\doublecmd.exe')}
-- }

-- everything = {
-- name = 'everything',
-- size = 1,
-- icon = SKIN:GetVariable('@')..'plugins\\Everything\\icon\\png\\',
-- field1 = drives,
-- field2 = { 'ALL' , 'FOLDER', 'FILE' },
-- text = 'Search Everything',
-- field1_cmd = {},
-- field2_cmd = { '', 'folder:', 'file:' },
-- cmd = SKIN:ReplaceVariables('C:\\Program Files\\Everything\\Everything.exe'),
-- additional = {drive = {}}
-- }

-- everything_small = {
-- name = 'everything_small',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\everything_small\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Everything',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = SKIN:ReplaceVariables('C:\\Program Files\\everything\\everything.exe'),
-- additional = {''}
-- }

-- totalcommander = {
-- name = 'totalcommander',
-- size = 1,
-- icon = SKIN:GetVariable('@')..'plugins\\totalcommander\\icon\\png\\',
-- field1 = drives,
-- field2 = { 'ALL' , 'FOLDER', 'FILE' },
-- text = 'Search Total Commander',
-- field1_cmd = {},
-- field2_cmd = {'-A', '-V', '-F' },
-- cmd = SKIN:GetVariable('@')..'plugins\\totalcommander\\helper\\TC-search-rainmeter.ahk',
-- additional  = {SKIN:ReplaceVariables('C:\\totalcmd\\TOTALCMD64.EXE')}
-- }

-- totalcommander_small = {
-- name = 'totalcommander_small',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\totalcommander_small\\icon\\png\\',
-- field1 = drives,
-- field2 = { 'ALL' , 'FOLDER', 'FILE' },
-- text = 'Search Total Commander',
-- field1_cmd = {},
-- field2_cmd = {'-A', '-V', '-F' },
-- cmd = SKIN:GetVariable('@')..'plugins\\totalcommander_small\\helper\\TC-search-rainmeter.ahk',
-- additional  = {SKIN:ReplaceVariables('C:\\totalcmd\\TOTALCMD64.EXE')}
-- }

-- twitch = {
-- name = 'twitch',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\twitch\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Twitch',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://www.twitch.tv/search?term=',
-- additional = {''}
-- }

-- urlopen = {
-- name = 'urlopen',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\urlopen\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Enter URL',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'http://',
-- additional = {''}
-- }

-- websearch_duckduckgo = {
-- name = 'websearch_duckduckgo',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\websearch_duckduckgo\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search DuckDuckGo',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://duckduckgo.com/?q=',
-- additional = {''}
-- }

-- websearch_google = {
-- name = 'websearch_google',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\websearch_google\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Google',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://www.google.com/#q=',
-- additional = {''}
-- }

-- wikipedia = {
-- name = 'wikipedia',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\wikipedia\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Wikipedia',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://wikipedia.org/wiki/Special:Search?search=',
-- additional = {''}
-- }

-- youtube = {
-- name = 'youtube',
-- size = 2,
-- icon = SKIN:GetVariable('@')..'plugins\\youtube\\icon\\png\\',
-- field1 = {''},
-- field2 = {''},
-- text = 'Search Youtube',
-- field1_cmd = {''},
-- field2_cmd = {''},
-- cmd = 'https://www.youtube.com/results?search_query=',
-- additional = {''}
-- }