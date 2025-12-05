-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Midbuff')
	state.RangedMode:options('Normal', 'Midbuff')
	state.WeaponskillMode:options('Match','Midbuff','Proc')
	state.CastingMode:options('Normal','Fodder','Proc')
	state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('Savage','Leaden','Last','WildFire','Aeolian','Hotshot','Custom')
	autows_list = {
		['Savage']='Savage Blade',
		['Leaden']='Leaden Salute',
		['Last']='Last Stand',
		['WildFire']='Wildfire',
		['Aeolian']='Aeolian Edge',
		['Hotshot']='Hot Shot',
		['Custom']='Flat Blade',
	}
	state.CompensatorMode:options('Always','300','1000','Never')

	gear.RAbullet = "Chrono Bullet"
	gear.WSbullet = "Chrono Bullet"
	gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
	gear.QDbullet = "Hauksbok Bullet"
	options.ammo_warning_limit = 15

	state.Mainroll = M{['description']='Main Roll','Chaos', 'Samurai', 'Tactician', 'Hunter','Monk', 'Wizard', 'Naturalist', 'Evoker'}
    state.Secroll = M{['description']='Secondary Roll','Samurai', 'Tactician', 'Hunter', 'Wizard', 'Warlock', 'Naturalist', 'Chaos', 'Evoker'}
    state.UseSecroll = M(false, 'Use Secondary Roll')

	Mroll =  {
        ['Chaos'] = 'Chaos Roll',
        ['Samurai'] = 'Samurai Roll',
        ['Tactician'] = 'Tactician\'s Roll',
        ['Hunter'] = 'Hunter\'s Roll',
        ['Monk'] = 'Monk\'s Roll',
        ['Wizard'] = 'Wizard\'s Roll',
        ['Naturalist'] = 'Naturalist\'s Roll',
        ['Evoker'] = 'Evoker\'s Roll'
    }
    Sroll =  {
        ['Samurai'] = 'Samurai Roll',
        ['Tactician'] = 'Tactician\'s Roll',
        ['Hunter'] = 'Hunter\'s Roll',
        ['Wizard'] = 'Wizard\'s Roll',
        ['Warlock'] = 'Warlock\'s Roll',
        ['Naturalist'] = 'Naturalist\'s Roll',
        ['Chaos'] = 'Chaos Roll',
        ['Evoker'] = 'Evoker\'s Roll'
    }   
    WSMap =  {
        ['Leaden'] = 'Leaden Salute',
        ['Last'] = 'Last Stand',
        ['Savage'] = 'Savage Blade',
        ['WildFire'] = 'Wildfire',
        ['Aeolian'] = 'Aeolian Edge',
        ['Hotshot'] = 'Hot Shot',
        ['Custom'] = 'Flat Blade'
	}

	-- Additional local binds
	--send_command('bind ^` gs c cycle ElementalMode')
	--send_command('bind !` gs c elemental quickdraw')
	send_command('bind @` gs c cycle Mainroll')
    send_command('bind !` gs c cycle Secroll')
    send_command('bind ^` gs c roll')
    send_command('bind !z gs c toggle UseSecroll')

	send_command('bind !z input /ja "Double-up" <me>')
	send_command('bind #s input /ja "Snake Eye" <me>')
	send_command('bind @f input /ja "Fold" <me>')
    send_command('bind ^c input /ja "Crooked Cards" <me>')
	send_command('bind @w gs c wskill <t>')

	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
	send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @!^f9 gs c toggle RngHelper')

	send_command('bind @pause roller roll')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	--Weapons
    Roll_Dagger			={ name="Rostam", augments={'Path: C',}}
	STP_Dagger			={ name="Rostam", augments={'Path: A',}}
    --AF
	AF_head				={ name="Laksa. Tricorne +2"}																													
	AF_body				={ name="Laksa. Frac +3"}																														
	AF_hands			={ name="Laksa. Gants +2"}																														
	AF_legs				={ name="Laksa. Trews +3"}																														
	AF_feet				={ name="Laksa. Boots +2"}
    --Relic																													
	Relic_head			={ name="Lanun Tricorne +3"}																	
	Relic_body			={ name="Lanun Frac +3"}																			
	Relic_hands			={ name="Lanun Gants +3"}																					
	Relic_legs			={ name="Lanun Trews +3"}																			
	Relic_feet			={ name="Lanun Bottes +4"}
    --Empy
	Empy_head			={ name="Chass. Tricorne +3"}																													
	Empy_body			={ name="Chasseur's Frac +3"}     																												
	Empy_hands			={ name="Chasseur's Gants +3"}	  																												
	Empy_legs			={ name="Chas. Culottes +3"}
	Empy_feet			={ name="Chass. Bottes +3"}
	--Backs
	Null_TP_back        ={ name="Null Shawl"}
    JSE_DW_back		    ={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
	JSE_STP_back	    ={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	JSE_STR_WS_back		={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	JSE_RA_WS_back	    ={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc+10','Weapon skill damage +10%',}}
	JSE_MAB_WS_back		={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
	--Accessories
	JSE_Neck            ={ name="Comm. Charm +2", augments={'Path: A',}}
    JSE_Ear             ={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rat+3',}}
	-- Precast Sets
	-- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body=Empy_body} --body="Chasseur's Frac +3"
	sets.precast.JA['Snake Eye'] = {legs=Relic_legs} --legs="Lanun Trews +3" (+1 is fine)
	sets.precast.JA['Wild Card'] = {feet=Relic_feet} --feet="Lanun Bottes +3"
	sets.precast.JA['Random Deal'] = {body=Relic_body} --body="Lanun Frac +3"
	sets.precast.JA['Double Up'] = {} --main="Rostam",sub="Rostam"
	sets.precast.FoldDoubleBust = {hands=Relic_hands} --hands="Lanun Gants +3"
	sets.precast.CorsairRoll = {
		range="Compensator", --Duration +20
		main=Roll_Dagger, --Duration+60, Roll effect +8
		head=Relic_head, --Effct +50 (Chance to apply Job bonus to rolls)
		body=Empy_body, --DT:-13%
		hands=Empy_hands, --Duration +60
		legs=Empy_legs, --DT:-12%
		feet=gear.malignance_feet, --DT:-4%
		ring2="Defending Ring", --DT:-10%
		neck="Regal Necklace", --Duration +20
		back=JSE_DW_back --Duration +30
	} --main="Rostam",legs="Desultor Tassets"

	sets.precast.LuzafRing = {ring2="Luzaf's Ring"}

	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs=Empy_legs}) --legs="Chas. Culottes +3"
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet=Empy_feet}) --feet="Chass. Bottes +3"
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head=Empy_head}) --head="Chass. Tricorne +3"
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body=Empy_body}) --body="Chasseur's Frac +3"
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands=Empy_hands}) --hands="Chasseur's Gants +3"
	sets.precast.CorsairRoll["Bolter's Roll"] = set_combine(sets.precast.CorsairRoll, {
		main=Roll_Dagger, --Duration+60, Roll effect +8
		hands=gear.malignance_hands,
		neck=JSE_Neck,
		back=Null_TP_back,
	})
	sets.precast.CorsairRoll.Recast = {}
	sets.precast.CorsairRoll.Weak = {}

	--Standard TP Generating Shot
	sets.precast.CorsairShot = {
        ammo=gear.QDbullet,
        head=gear.ikenga_head,
        neck=JSE_Neck,
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body=Relic_body,
        hands=gear.carmine_hands,
        ring1="Fenrir Ring +1",
        ring2="Dingir Ring",
        back=MAB_WS_Back,
        waist="Null Belt",
        legs=AF_legs,
        feet=Empy_feet
	}

	--Damage shot for use with CastingMode: Fodder
	sets.precast.CorsairShot.Damage = {
        ammo=gear.QDbullet,
        head=gear.ikenga_head,
        neck="Baetyl Pendant",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body=Relic_body,
        hands=gear.carmine_hands,
        ring1="Fenrir Ring +1",
        ring2="Dingir Ring",
        back=MAB_WS_Back,
        waist="Orpheus's Sash",
        legs=AF_legs,
        feet=Relic_feet
	}

	--TH & Low Damage Shot for Procs.
	sets.precast.CorsairShot.Proc = set_combine(sets.precast.CorsairShot, {
	})

	--Macc Shot for Sleep/Dispel
	sets.precast.CorsairShot['Light Shot'] = {
        ammo=gear.QDbullet,
        head=Empy_head,
        neck="Null Loop",
        ear1="Crep. Earring",
        ear2=JSE_Ear,
        body=Empy_body,
        hands=Empy_hands,
        ring1="Crepuscular Ring",
        ring2="Stikini Ring",
        legs=Empy_legs,
        feet=Empy_feet,
        waist="Null Belt",
		back=MAB_WS_Back
	}

	sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",waist="Gishdubar Sash"}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Step sets
	--Step set for accuracy
	sets.precast.Step = {
		ammo=gear.QDbullet,
		head=Empy_head,
		neck="Null Loop",
		ear1="Telos Earring",
		ear2=JSE_Ear,
		body=Empy_body,
		hands=Empy_hands,
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back=JSE_STP_back,
		waist="Null Belt",
		legs=Empy_legs,
		feet=Empy_feet
	}
	--Flourish set for Magic Accuracy
	sets.precast.JA['Violent Flourish'] = {
		ammo=gear.QDbullet,
        head=Empy_head,
        neck="Null Loop",
        ear1="Crep. Earring",
        ear2=JSE_Ear,
        body=Empy_body,
        hands=Empy_hands,
        ring1="Crepuscular Ring",
        ring2="Stikini Ring",
        legs=Empy_legs,
        feet=Empy_feet,
        waist="Null Belt",
		back=MAB_WS_Back
	}

	-- Fast cast sets for spells
	sets.precast.FC = {
		head=gear.carmine_head,
        neck="Baetyl Pendant",
        ear1="Enchntr. Earring +1",
        ear2="Loquac. Earring",
        body=gear.herculean_FC_body,
        ring1="Kishar Ring",
        back=DW_Back,
        legs=gear.herculean_FC_legs,
        feet=gear.herculean_FC_feet
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})
	sets.precast.RA = {
		ammo=gear.RAbullet,
		head=Empy_head,
		neck=JSE_Neck,
		body=AF_body,
		hands=gear.carmine_hands,
		ring1="Crepuscular Ring",
		waist="Yemaya Belt",
		feet="Meg. Jam. +2",
		back=JSE_STP_back
	}
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo=gear.WSbullet,
		head="Blistering Sallet +1",
		neck="Rep. Plat. Medal",
		ear1="Brutal Earring",
		ear2="Ishvara Earring",
		body=AF_body,
		hands=Empy_hands,
		ring1="Epaminondas's Ring",
		ring2="Regal Ring",
		back=JSE_STR_WS_back,
		waist=gear.sailfi_belt,
		legs=gear.nyame_legs,
		feet=Relic_feet
	}
	sets.precast.WS.Midbuff = set_combine(sets.precast.WS, {})	
	sets.precast.WS.Proc = {}
	--Savage Blade
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ear1=gear.moonshade_earring,
		neck=JSE_Neck
	})
	sets.precast.WS['Savage Blade'].Midbuff = set_combine(sets.precast.WS.Midbuff, {
		ear1=gear.moonshade_earring
	})
	--Physical Ranged WS
	sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, {
		ammo=gear.WSbullet,
		head=AF_head,
		body=gear.ikenga_body,
		neck="Fotia Gorget",
		ring2="Sroda Ring",
		ear1=gear.moonshade_earring,
		waist="Fotia Belt",
		back=JSE_RA_WS_back
	})
	sets.precast.WS['Last Stand'].Midbuff = set_combine(sets.precast.WS.Midbuff, {
		ammo=gear.WSbullet,
		head=AF_head,
		body=gear.ikenga_body,
		neck="Fotia Gorget",
		ring1="Dingir Ring",
		ear1=gear.moonshade_earring,
		waist="Fotia Belt",
		back=JSE_RA_WS_back
	})
	sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Midbuff = sets.precast.WS['Last Stand'].Midbuff
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Midbuff = sets.precast.WS['Last Stand'].Midbuff
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Midbuff = sets.precast.WS['Last Stand'].Midbuff
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Midbuff = sets.precast.WS['Last Stand'].Midbuff
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Midbuff = sets.precast.WS['Last Stand'].Midbuff
	--Magic Ranged WS
	sets.precast.WS['Leaden Salute'] = set_combine(sets.precast.WS, {
        ammo=gear.MAbullet,
        head="Pixie Hairpin +1",
		neck=JSE_Neck,
		ear1=gear.moonshade_earring,
		ear2="Friomisi Earring",
        body=Relic_body,
		ring1="Dingir Ring",
		ring2="Archon Ring",
        back=MAB_WS_back,
		waist="Orpheus's Sash"
    })
	sets.precast.WS['Leaden Salute'].Midbuff = set_combine(sets.precast.WS['Leaden Salute'], {})
	sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS['Leaden Salute'], {
		ear1="Hecate's Earring",
		ring2="Epaminondas's Ring"
	})
	sets.precast.WS['Wildfire'].Midbuff = set_combine(sets.precast.WS['Wildfire'], {})
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Leaden Salute'], {
		gear.nyame_head,
		ring2="Epaminondas's Ring"
	})
	sets.precast.WS['Aeolian Edge'].Midbuff = set_combine(sets.precast.WS['Aeolian Edge'], {})
	sets.precast.WS['Hot Shot'] = set_combine(sets.precast.WS['Wildfire'], {})
	sets.precast.WS['Hot Shot'].Midbuff = set_combine(sets.precast.WS['Hot Shot'], {})
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Hecate's Earring"}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = {}

	-- Specific spells

	sets.midcast.Cure = {}

	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"} --hands="Buremte Gloves",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"} --hands="Buremte Gloves",
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast.Utsusemi = sets.midcast.FastRecast

	-- Ranged gear
	sets.midcast.RA = {
		ammo=gear.RAbullet,
		head=gear.ikenga_head,
		neck="Iskur Gorget",
		ear1="Telos Earring",
		ear2="Crep. Earring",
		body=gear.ikenga_body,
		hands=gear.ikenga_hands,
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		legs=Empy_legs,
		waist="Yemaya Belt",
		feet=gear.ikenga_feet,
		back=JSE_STP_back
	}

	sets.midcast.RA.Midbuff = set_combine(sets.midcast.RA, {})

	sets.buff['Triple Shot'] = {
		body=Empy_body,
		hands=AF_hands
	}

	-- Sets to return to when not performing an action.

	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head=Empy_head,
		body=Empy_body,
		hands=gear.malignance_hands,
		--hands=COR_Empy_Hands,
		legs=gear.carmine_legs,
		feet=gear.malignance_feet,
		--feet=COR_Empy_Feet,
		neck="Loricate Torque +1",
		waist="Null Belt",
		ear1="Etiolation Earring",
		ear2="Odnow Earring +1",
		ring1="Defending Ring",
		ring2="Murky Ring",
		back=DW_Back
	}

	sets.idle.PDT = {
		head=gear.nyame_head,
		body=gear.nyame_body,
		hands=gear.nyame_hands,
		legs=gear.nyame_legs,
		feet=gear.nyame_feet,
		neck="Loricate Torque +1",
		waist="Null Belt",
		ear1="Genmei Earring",
		ear2="Odnow Earring +1",
		ring1="Defending Ring",
		ring2="Shneddick Ring",
		back=DW_Back
	}

	sets.idle.Refresh = {}

	-- Defense sets
	sets.defense.PDT = {
		head=Empy_head,
		body=Empy_body,
		hands=gear.malignance_hands,
		legs=Empy_legs,
		feet=gear.malignance_feet,
		neck="Null Loop",
		waist="Null Belt",
		ear1="Alabaster Earring",
		ear2="Odnow Earring +1",
		ring1="Defending Ring",
		ring2="Merky Ring",
		back=DW_Back
	}

	sets.defense.MDT = {
		head=gear.malignance_head,
		body=gear.malignance_body,
		hands=gear.malignance_hands,
		legs=gear.malignance_legs,
		feet=gear.malignance_feet,
		neck="Null Loop",
		waist="Null Belt",
		ear1="Eabani Earring",
		ear2="Odnow Earring +1",
		ring1="Defending Ring",
		ring2="Merky Ring",
		back=Null_TP_Back
	}

	sets.defense.MEVA = {
		head=gear.malignance_head,
		body=gear.malignance_body,
		hands=gear.malignance_hands,
		legs=gear.malignance_legs,
		feet=gear.malignance_feet,
		neck="Null Loop",
		waist="Null Belt",
		ear1="Eabani Earring",
		ear2="Odnow Earring +1",
		ring1="Defending Ring",
		ring2="Merky Ring",
		back=Null_TP_Back
	}

	sets.Kiting = {ring2="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets
	sets.weapons.Leaden = {main=STP_Dagger,sub="Tauret",range="Death Penalty"}
	sets.weapons.Last = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.WildFire = {main="Rostam",sub="Tauret",range="Fomalhaut"}
	sets.weapons.Aeolian = {main="Tauret",sub="Naegling",range="Fomalhaut"}
	sets.weapons.Hotshot = {main=STP_Dagger,sub="Tauret",range="Death Penalty"}
	sets.weapons.Custom = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		ammo=gear.RAbullet,
		sub="Nusku Shield",
		head=gear.malignance_head,
		neck="Iskur Gorget",
		ear1="Dedition Earring",
		ear2="Brutal Earring",
		body=gear.malignance_body,
		hands=gear.adhemar_hands,
		legs=Empy_legs,
		feet=gear.carmine_feet,
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back=Null_TP_Back,
		waist=gear.sailfi_belt
	}

	sets.engaged.Midbuff = set_combine(sets.engaged, {
		neck="Lissome Necklace",
		ear1="Telos Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		feet=gear.malignance_feet,
	})

	sets.engaged.DT = {
		ammo=gear.RAbullet,
		sub="Nusku Shield",
		head=gear.malignance_head,
		neck="Iskur Gorget",
		ear1="Dedition Earring",
		ear2="Brutal Earring",
		body=gear.malignance_body,
		hands=gear.malignance_hands,
		legs=Empy_legs,
		feet=gear.malignance_feet,
		ring1="Murky Ring",
		ring2="Epona's Ring",
		back=JSE_STP_back,
		waist=gear.sailfi_belt
	}

	sets.engaged.Midbuff.DT = set_combine(sets.engaged.DT, {
		neck="Lissome Necklace",
		ear1="Telos Earring",
		ring2="Chirich Ring +1",
	})

	sets.engaged.DW = {
        ammo=gear.RAbullet,
        head=gear.malignance_head,
        body=gear.adhemar_body,
        hands=gear.adhemar_hands,
        legs=Empy_legs,
        feet=gear.carmine_feet,
        neck="Iskur Gorget",
        ear1="Dedition Earring",
        ear2="Brutal Earring",
        ring1="Petrov Ring",
        ring2="Epona's Ring",
        back=Null_TP_Back,
        waist="Windbuffet Belt +1"
	}

	sets.engaged.DW.Midbuff = set_combine(sets.engaged.DW, {
		neck="Lissome Necklace",
		ear1="Telos Earring",
		ring1="Chirich Ring +1",
		feet=gear.malignance_feet,
		waist="Reiki Yotai"
	})

	sets.engaged.DW.DT = {
		head=gear.malignance_head,
		neck="Iskur Gorget",
		ear1="Dedition Earring",
		ear2="Brutal Earring",
		body=gear.malignance_body,
		hands=gear.malignance_hands,
		legs=Empy_legs,
		feet=gear.malignance_feet,
		ring1="Murky Ring",
		ring2="Epona's Ring",
		back=JSE_STP_back,
		waist="Windbuffet Belt +1"
	}

	sets.engaged.DW.Midbuff.DT = set_combine(sets.engaged.DW.DT, {
		neck="Lissome Necklace",
		ear1="Telos Earring",
		ring2="Chirich Ring +1",
		waist="Reiki Yotai"
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'NIN' then
		set_macro_page(2, 11)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
	elseif player.sub_job == 'RNG' then
		set_macro_page(9, 11)
	elseif player.sub_job == 'DRG' then
		set_macro_page(5, 11)
	else
		set_macro_page(2, 11)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end

--RV Updates
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'wskill' then
        if WSMap[state.Weapons.current] then
            send_command('@input /ws "'..WSMap[state.Weapons.current]..'" <t>')
        else
            add_to_chat(123,'No WS defined for weapon: '..state.Weapons.current)
        end
    end
    if cmdParams[1] == 'roll' then
        local rolls = ''
        if state.UseSecroll.value == true then
            rolls = state.Secroll.current
            send_command('@input /ja "'..Sroll[state.Secroll.current]..'" <me>')
        else
            rolls = state.Mainroll.current
            send_command('@input /ja "'..Mroll[state.Mainroll.current]..'" <me>')
        end
    end
end
function display_current_job_state(eventArgs)
    local r_msg = state.Mainroll.current
    if state.UseSecroll.value == true then
        r_msg = r_msg .. '/'..state.Secroll.current
    end

    local e_msg = state.Mainqd.current
    if state.UseAltqd.value == true then
        e_msg = e_msg .. '/'..state.Altqd.current
    end
end
