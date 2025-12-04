-------------------------------------------------------------------------------------------------------------------
--  Global Keybinds
-------------------------------------------------------------------------------------------------------------------
--  Keybinds:
--              ^   Ctrl
--              !   Alt
--              @   Win
--              #   Apps
--              ~   Shift
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------

--Ninja
    --send_command('bind #, input /ma "Utsusemi: Ichi" <me>')
    --send_command('bind @. input /ma "Utsusemi: Ni" <me>')
    --send_command('bind @, input /ma "Utsusemi: San" <me>')

    -- Default Enhancing HotKeys
    if player.main_job == 'WHM' then
        send_command('bind !e input /ma "Haste" <stpc>')
        send_command('bind !r input /ma "Regen IV" <stpc>')
        send_command('bind !t input /ma "Blink" <me>')
        send_command('bind !y input /ma "Dia II" <bt>')
        send_command('bind !u input /ma "Stoneskin" <me>')
        send_command('bind !i input /ma "Aquaveil" <me>')
        send_command('bind !o input /ma "Cure IV" <stpc>')
        send_command('bind @o input /ma "Cure III" <stpc>"')
        send_command('bind #o input /ma "Curaga III" <stpc>"')
    elseif player.main_job == 'RDM' then
        send_command('bind !e input /ma "Haste" <stpc>')
        send_command('bind !r input /ma "Refresh III" <stpc>')
        send_command('bind !t input /ma "Blink" <me>')
        send_command('bind !y input /ma "Dia III" <bt>')
        send_command('bind !u input /ma "Stoneskin" <me>')
        send_command('bind !i input /ma "Aquaveil" <me>')
        send_command('bind !o input /ma "Cure III" <stpc>')
    end

    -- Default Status Cure HotKeys
 --   send_command('bind !numpad7 input /ma "Paralyna" <t>')
 --   send_command('bind !numpad8 input /ma "Silena" <t>')
 --   send_command('bind !numpad9 input /ma "Blindna" <t>')
 --   send_command('bind !numpad4 input /ma "Poisona" <t>')
 --   send_command('bind !numpad5 input /ma "Stona" <t>')
 --   send_command('bind !numpad6 input /ma "Viruna" <t>')
 --   send_command('bind !numpad1 input /ma "Cursna" <t>')
 --   send_command('bind !numpad+ input /ma "Erase" <t>')
 --   send_command('bind !numpad0 input /ma "Sacrifice" <t>')
 --   send_command('bind !numpad. input /ma "Esuna" <me>')

    -- Default Status Enfeebling HotKeys
    send_command('bind ~pageup input /ma "Paralyze II" <t>')
    send_command('bind ~numpad8 input /ma "Silence" <t>')
    send_command('bind ~numpad9 input /ma "Blind" <t>')
    send_command('bind ~numpad4 input /ma "Poison" <t>')
    send_command('bind ~numpad5 input /ma "Slow II" <t>')
    send_command('bind ~numpad6 input /ma "Addle" <t>')
    send_command('bind ~numpad1 input /ma "Distract III" <t>')
    send_command('bind ~numpad2 input /ma "Frazzle III" <t>')
    send_command('bind ~numpad0 input /ma "Dia III" <t>')

-- Default Item HotKeys
    send_command('bind ~F1 input /con send @all /item "Remedy" <me>')
    send_command('bind ~F2 input /con send @all /item "Echo Drops" <me>')
    send_command('bind ~F3 input /con send @all /item "Eye Drops" <me>')
    send_command('bind ~F4 input /con send @all /item "Antidote" <me>')
    send_command('bind ~F5 input /con send @all /item "Panacea" <me>')
    send_command('bind ~F6 input /con send @all /item "Holy Water" <me>')
    send_command('bind ~F7 input /con send @all /item "Silent Oil" <me>')
    send_command('bind ~F8 input /con send @all /item "Prism Powder" <me>')
--Bard
    send_command('bind ^F1 input //send Obella //gs c set SongMode FullLength;wait 0.1; input //send Obella //gs c sa')
    send_command('bind ^F2 input //send Obella //gs c set SongMode FullLength;wait 0.1; input //send Obella //gs c sb')
    send_command('bind ^F3 input //send Obella //gs c set SongMode FullLength;wait 0.1; input //send Obella //gs c sc')
    send_command('bind ^F4 input //send Obella //gs c set SongMode FullLength;wait 0.1; input //send Obella //gs c sd')
    send_command('bind ^F5 input //send Obella //gs c set SongMode FullLength;wait 0.1; input //send Obella //gs c se')
    send_command('bind @F2 input //send Obella /ja "Pianissimo" <me>; wait 1; input //sat youcommand Obella magesballad3')
    send_command('bind @F3 input //send Obella /ja "Pianissimo" <me>; wait 1; input //sat youcommand Obella magesballad2')
    send_command('bind @F4 input //send Obella /ja "Pianissimo" <me>; wait 1; input //sat youcommand Obella knightsminne5')
    send_command('bind @F5 input //send Obella //gs c set SongMode Placeholder; wait 0.1; input //send Obella /ja "Pianissimo" <me>; wait 1; input //sat youcommand Obella icecarol')
    send_command('bind @F1 input //send Obella /ja "Nightingale" <me>; wait 1; input //send Obella /ja "Troubadour" <me>')
    send_command('bind ^delete input //sat youcommand Obella CarnageElegy')
    send_command('bind !delete input //sat youcommand Obella MagicFinale')
    send_command('bind ~delete input //send Obara /ja "Full Circle" <me>')
    send_command('bind @pageup input //sat youcommand Obella "Foe Lullaby II"')
    send_command('bind @pagedown input //sat youcommand Obella "Horde Lullaby II"')
    send_command('bind !F1 input //send Obella //gs c set SongMode Placeholder;wait 0.1; input //send Obella /magic "Knight\'s Minne" Obella')
    send_command('bind !F2 input //send Obella //gs c set SongMode Placeholder;wait 0.1; input //send Obella /magic "Army\'s Paeon" Obella')
    send_command('bind !F3 input //send Obella //gs c set SongMode Placeholder;wait 0.1; input //send Obella /ja "Clarion Call" <me>; wait 0.1; input //send Obella /magic "Dark Carol" Obella')
--White Mage
    send_command('bind @1 input //sat youcommand Obara c3')
    send_command('bind #1 input //sat youcommand Obara curaga3')
    send_command('bind @2 input //sat youcommand Obara c4')
    send_command('bind #2 input //sat youcommand Obara curaga4')
    send_command('bind @3 input //sat youcommand Obara c5')
    send_command('bind #3 input //sat youcommand Obara curaga5')
    send_command('bind @4 input //send Obara /ja Accession <me>; wait 1; input //sat youcommand Obara Paralyna')
    send_command('bind #4 input //send Obara /ja Accession <me>; wait 1; input //sat youcommand Obara Poisona')
    send_command('bind @5 input //send Obara /ja Accession <me>; wait 1; input //sat youcommand Obara Cursna')
    send_command('bind #5 input //send Obara /ja Accession <me>; wait 1; input //sat youcommand Obara Blindna')
    send_command('bind @6 input //send Obara //gs c BarElement; wait 6; input //send Obara //gs c BarStatus')
    send_command('bind #6 input //send Obara //gs c BoostSpell; wait 6; input //send Obara /ma "Auspice" <me>')
    send_command('bind @7 input //send Obara //gs c set RegenMode Potency; wait 0.1; input //sat youcommand Obara regen4')
    send_command('bind #7 input //send Obara //gs c set RegenMode Duration; wait 0.1; input //send Obara /ja Accession <me>; wait 1; input //sat youcommand Obara regen4')
--Follow
    send_command('bind ^- input //send @others //hb follow Redviper; wait 0.1; input //send @others //hb follow dist .5; wait 0.1; input //send @others //hb off')
    send_command('bind ^= input //send @others //hb follow Redviper; wait 0.1; input //send @others //hb follow dist 19; wait 0.1; input //send @others //hb on')
    send_command('bind !- input //send Obella //hb follow Redviper; wait 0.1; input //send Obella //hb follow dist 1')
    send_command('bind != input //send Obella //hb follow dist 19; wait 0.1; input //send Obella setkey s down;wait 6; input //send Obella Setkey s up;')
    send_command('bind ~- input //send Obara //hb follow Redviper; wait 0.1; input //send Obara //hb follow dist 1')
    send_command('bind ~= input //send Obara //hb follow dist 19; wait 0.1; input //send Obara setkey s down;wait 6; input //send Obara Setkey s up;')
--Target
    send_command('bind ] input //send @others /ma c3 Redviper')
    send_command('bind [ input //send @others /ma c4 Redviper')
    send_command('bind ^] input //send @others /ma c3 Cruamros')
    send_command('bind ^[ input //send @others /ma c4 Cruamros')
    send_command('bind !] input //send @others /ma c3 Pegisus')
    send_command('bind ![ input //send @others /ma c4 Pegisus')
    send_command('bind @] input //send @others /ma c3 Forien')
    send_command('bind @[ input //send @others /ma c4 Forien')
    send_command('bind ~] input //send Obara //gs c set RegenMode Duration; wait 0.1; input //send Obara /ja Accession <me>; wait 1; input //send Obara /ma regen4 Redviper')
--attack
    send_command('bind ^, input //send Obara /ja Accession <me>; wait 1; input //send Obara /ma "Sneak" <me>')
    send_command('bind ^. input //send Obara /ja Accession <me>; wait 1; input //send Obara /ma "Invisible" <me>')
    --send_command('bind ^, input //send @others //hb follow dist 3; wait 0.1;input //sat allattack')
    --send_command('bind ^. input //send @others //hb follow dist 3; wait 0.1;input //sat allswitch')