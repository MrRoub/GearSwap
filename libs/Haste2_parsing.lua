require('tables')
require('strings')

NPC_Bards = T{'Joachim', 'Ulmia'}
Max_Bards = S{'Kittensgomew', 'Darklabyrinth'}
T3_Bards = S{'Chitara'}
New_March_Str = 0
Old_March_Str = 0
March_Count = 0
Old_March_Count = 0
-- local_gear_table = T{}
-- old_gear = T{}
-- old_haste = 0
-- old_stp = 0
-- old_dw = 0
-- items = windower.ffxi.get_items()

print('Haste Parser loaded successfully')	

function on_action(action)
	
	local actor = windower.ffxi.get_mob_by_id(action.actor_id)
	-- --table.vprint(action)
	-- -- me
	-- action.actor_id == player.id
	-- -- melee hit
	-- action.category == 1
	-- -- what target
	-- action.targets[1].id == player.target.id
	-- -- hit or miss
	-- action.targets[1].actions[1].reaction == 8
	-- -- animation
	-- action.targets[1].actions[1].add_effect_animation == 23
	
	if action.actor_id == player.id and action.category == 1 and action.targets[1].id == player.target.id then
		if action.targets[1].actions[1].reaction == 8 then
			if action.targets[1].actions[1].add_effect_animation == 23 then
				--add_to_chat(122, 'haste spikes')
				if info['Hsamba'] ~= true then
					info['Hsamba'] = true
					send_command('gs c update')
				end
			elseif action.targets[1].actions[1].add_effect_animation ~= 23 then
				if info['Hsamba'] == true then
					info['Hsamba'] = false
					send_command('gs c update')
				end
			end
		end
	end
	if action.category == 3 and ((actor.is_npc and actor.charmed) or not actor.is_npc) and (action.param < 781 and action.param > 15 )then
		local job_abil = res.job_abilities:with('id', action.param)
		if job_abil == 602 then -- Garuda Hastega II
			for index, target in pairs(action.targets) do
				if type(target) == "table" then
					if target.id == player.id then
						state.Buff['Haste II'] = true
						--change_haste()
						--send_command('gs c update')
					end
				end
			end
		end
	end
	if action.category == 4 and ((actor.is_npc and actor.charmed) or not actor.is_npc) and (action.param < 879 and action.param > 0 ) then
		local spell = res.spells:with('id', action.param)
		if spell.id == 511 and spell ~= nil then -- Standard Haste 2
			target_id = windower.ffxi.get_mob_by_id(action.targets[1].id).id
			if target_id == player.id then
				state.Buff['Haste II'] = true
				--change_haste()
				--send_command('gs c update')
			end
		elseif spell.id == 710 and spell ~= nil then -- Blue mage "Erratic Flutter" haste 2 being AoE'ed
			for index, target in pairs(action.targets) do
				if type(target) == "table" then
					if target.id == player.id then
						state.Buff['Haste II'] = true
						--change_haste()
						--send_command('gs c update')
					end
				end
			end
		end
		if spell.type == 'BardSong' then
			if spell.name == 'Advancing March' or spell.name == 'Victory March' then				
				for index, target in pairs(action.targets) do
					if type(target) == "table" then
						if target.id == player.id then
							if Max_Bards:contains(windower.ffxi.get_mob_by_id(action.actor_id).name) then New_March_Str = 5
							elseif T3_Bards:contains(windower.ffxi.get_mob_by_id(action.actor_id).name) then New_March_Str = 3
							elseif NPC_Bards:contains(windower.ffxi.get_mob_by_id(action.actor_id).name) then New_March_Str = 0
							else New_March_Str = 4 
							end
							if New_March_Str >= Old_March_Str then
								Old_March_Str = New_March_Str
							end
							Old_March_Count = 0
							-- if player.buffs then
								-- for index, buff in pairs(player.buffs) do
									-- --add_to_chat(122, buff)
									-- if buff == 214 then
										-- March_Count = March_Count + 1
									-- end
								-- end
							-- end
							-- Change_Marches()
							-- send_command('gs c update')
						end
					end
				end
			end
		end
	end
end

function Change_Marches(int)
	local march_str = Old_March_Str
	local March_Value = 0
	
	if int == 0 then
		March_Value = 0
	elseif int == 1 then
		if march_str == 0 then March_Value = 96
		elseif march_str == 1 then March_Value = 112
		elseif march_str == 2 then March_Value = 128
		elseif march_str == 3 then March_Value = 144
		elseif march_str == 4 then March_Value = 160
		elseif march_str == 5 then March_Value = 176
		end
	elseif int == 2 then
		if march_str == 0 then March_Value = 160
		elseif march_str == 1 then March_Value = 192
		elseif march_str == 2 then March_Value = 224
		elseif march_str == 3 then March_Value = 256
		elseif march_str == 4 then March_Value = 288
		elseif march_str == 5 then March_Value = 320
		end
	end
	msg = 'March_Count: '..(March_Count)..' '
	
	-- Advancing March = 6.3%   	64/1024					-- Victory March = 9.4%   		96/1024
	-- Advancing March +1 = 7.9%   	80/1024                 -- Victory March +1 = 11%		112/1024
	-- Advancing March +2 = 9.4%   	96/1024                 -- Victory March +2 = 12.5%     128/1024
	-- Advancing March +3 = 11%    	112/1024                -- Victory March +3 = 14.1%     144/1024
	-- Advancing March +4 = 12.6	128/1024                -- Victory March +4 = 15.7%		160/1024
	-- Advancing March +5 = 14.1	144/1024                -- Victory March +5 = 17.2%		176/1024
	state.Buff['Marches'] = March_Value
	add_to_chat(122,msg..'| state.Buff[\'Marches\']: '..March_Value..' / 1024 haste')
	send_command('gs c update')
end

function update_Marches()
	March_Count = 0
	if player.buffs then
		local incr = 1
		for index, buff in pairs(player.buffs) do
			--add_to_chat(122, index)
			if buff == 214 and index == incr then
				March_Count = March_Count + 1
			end
			incr = incr +1
		end
	else
		March_Count = 0
	end
	if Old_March_Count ~= March_Count then
		Change_Marches(March_Count)
		Old_March_Count = March_Count
	end
end

windower.raw_register_event('action', on_action)
windower.raw_register_event('prerender',update_Marches)