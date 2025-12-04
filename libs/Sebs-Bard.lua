res = require('resources')
require('tables')
--res = require('strings')

function on_action_for_songs(action)
	target = ''
	if action.actor_id == player.id then
       -- category == 1=melee, 2=ranged, 3=weaponskill, 4=spell, 6=job ability, 14=unblinkable JA
	   -- if action.category == 8 then
			-- add_to_chat(200,'cat 8')
			-- if table.length(action.targets) == 1 then
				-- id = action.targets[1].actions[1].param
				-- add_to_chat(200,'Spellid: '..id)
			-- end
		-- end
	   if action.category == 4 then
			local spell = res.spells:with('id', action.param)
			if spell.type == 'BardSong' then
				add_to_chat(200,'Spell: '..spell.name)
				if table.length(action.targets) > 1 then
					--add_to_chat(200,'AoE')
					target = 'AoE'
				else
					target = windower.ffxi.get_mob_by_id(action.targets[1].id).name
				end
				--add_to_chat(200,spell.name..' '..target)
				local newString =  string.split(spell.name, ' ', 1)
				--add_to_chat(200,spell.name..' '..newString[2])
				local song_buffsSpellMap = S{'Minuet', 'Minne', 'March', 'Madrigal', 'Prelude', 'Mambo', 'Mazurka', 'Etude', 'Ballad', 'Paeon', 'Carol','Lullaby'}
				local song_buffsSpellName = S{"Fowl Aubade", "Herb Pastoral", "Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte", "Goddess's Hymnus", "Maiden's Virelai", "Sentinel's Scherzo"}
				if song_buffsSpellMap:contains(newString[2]) or song_buffsSpellName:contains(spell.name) then
					adjust_timers(spell,newString[2], target)
				end
			end
	   end
	end
end

function adjust_string(str)
	local newString =  string.split(str, ' ', 1)
	--print(newString)
	newStringOne = newString[1]
	newStringTwo =  string.split(str,newStringOne, 1)
	newStringTwo = newStringTwo[2]
	--print(newStringTwo)
	--newStringTwo = newString[2]
	
	local res = {}
	local key = 0
	for c in newStringOne:gmatch('.') do
		key = key + 1
		res[key] = c
	end
		
	newStringOne = res[1]
	newString = newStringOne..'.'..newStringTwo

	--print(newString)
	return newString
	
end

windower.raw_register_event('action', on_action_for_songs)