function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc')
	state.WeaponskillMode:options('Normal','Proc')
	state.HybridMode:options('Normal', 'DT')
	state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Twilight'}
	state.Weapons:options('GreatAxe','GreatSword','Ragnarok','Naegling','Mace','FellCleave','ShiningOne','DualWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcKatana','ProcGreatKatana','ProcClub','ProcStaff','custom')
	
	autows_list = {
		['GreatAxe']='Upheaval',
		['GreatSword']='Resolution',
		['Ragnarok']='Scourge',
		['Naegling']='Savage Blade',
		['Mace']='Judgment',
		['FellCleave']='Fell Cleave',
		['ShiningOne']='Impulse Drive',
		['DualWeapons']='Savage Blade',
		['ProcDagger']='Cyclone',
		['ProcSword']='Red Lotus Blade',
		['ProcGreatSword']='Freezebite',
		['ProcScythe']='Shadow of Death',
		['ProcPolearm']='Raiden Thrust',
		['ProcGreatKatana']='Tachi: Koki',
		['ProcKatana']='Blade: Ei',
		['ProcClub']='Seraph Strike',
		['ProcStaff']='Earth Crusher',
	}

	WSMap = {
		['GreatAxe']='Upheaval',
		['GreatSword']='Resolution',
		['Ragnarok']='Scourge',
		['Naegling']='Savage Blade',
		['Mace']='Judgment',
		['FellCleave']='Fell Cleave',
		['ShiningOne']='Impulse Drive',
		['DualWeapons']='Savage Blade',
		['ProcDagger']='Cyclone',
		['ProcSword']='Red Lotus Blade',
		['ProcGreatSword']='Freezebite',
		['ProcScythe']='Shadow of Death',
		['ProcPolearm']='Raiden Thrust',
		['ProcGreatKatana']='Tachi: Koki',
		['ProcKatana']='Blade: Ei',
		['ProcClub']='Seraph Strike',
		['ProcStaff']='Earth Crusher',
	}

	-- Additional local binds
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @w gs c wskill <t>')
	send_command('bind ^\\\\ gs c toggle AutoFoodMode')
	send_command('bind !\\\\  gs c toggle AutoBuffMode')

	--Ikenga_axe_bonus = 300  -- It is 300 at R25. Uncomment if you need to manually adjust because you are using below R25 or above

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	AF_head				={ name="Pumm. Mask +2"}
	AF_body				={ name="Pumm. Lorica +4"}
	AF_hands			={ name="Pumm. Mufflers +2"}
	AF_legs				={ name="Pumm. Cuisses +4"}
    AF_feet				={ name="Pumm. Calligae +4"}
	
	Relic_head			={ name="Agoge Mask +4"}
    Relic_body			={ name="Agoge Lorica +3", augments={'Enhances "Aggressive Aim" effect',}}
    Relic_hands			={ name="Agoge Mufflers +3", augments={'Enhances "Mighty Strikes" effect',}}
    Relic_legs			={ name="Agoge Cuisses +3", augments={'Enhances "Warrior\'s Charge" effect',}}
    Relic_feet			={ name="Agoge Calligae +3", augments={'Enhances "Tomahawk" effect',}}

	Empy_head			={ name="Boii Mask +3"}
    Empy_body			={ name="Boii Lorica +3"}
    Empy_hands			={ name="Boii Mufflers +3"}
    Empy_legs			={ name="Boii Cuisses +3"}
    Empy_feet			={ name="Boii Calligae +3"}

	JSE_neck			={ name="War. Beads +2", augments={'Path: A',}}
	JSE_ear				={ name="Boii Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}}
	JSE_STR_ws			={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	JSE_DA				={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	JSE_VIT_ws			={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}}
	JSE_STR_crit		={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Damage taken-5%',}}
	
	-- Weapons sets
	sets.weapons.GreatAxe = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.GreatSword = {main="Agwu's Claymore",sub="Utu Grip"}
	sets.weapons.Ragnarok = {main="Ragnarok",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Mace = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.FellCleave = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Demers. Degen +1"}
	sets.weapons.ProcDagger = {main="Qutrub Knife",sub="Beatific Shield +1"}
	sets.weapons.ProcSword = {main="Kyukoto",sub="Beatific Shield +1"}
	sets.weapons.ProcGreatSword = {main="Goujian",sub="Niobid Strap"}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub="Niobid Strap"}
	sets.weapons.ProcPolearm = {main="Pitchfork",sub="Niobid Strap"}
	sets.weapons.ProcKatana = {main="Debahocho",sub="Beatific Shield +1"}
	sets.weapons.ProcGreatKatana = {main="Lotus Katana",sub="Niobid Strap"}
	sets.weapons.ProcClub = {main="Hagoita",sub="Beatific Shield +1"}
	sets.weapons.ProcStaff = {main="Caver's Shovel",sub="Niobid Strap"}
	sets.weapons.custom = {}

	-- Precast Sets
	
	sets.Enmity = {
		head=Relic_head,
		body="Emet Harness +1",
		hands=gear.souv_hands,
		legs=gear.odyssean_legs,
		feet=gear.souv_feet,
		ring1="Petrov Ring"
	}
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back=JSE_DA, body=AF_body, feet=Relic_feet}
	sets.precast.JA['Warcry'] = {head=Relic_head}
	sets.precast.JA['Defender'] = {hands=Relic_hands}
	sets.precast.JA['Aggressor'] = {body=Relic_body}
	sets.precast.JA['Mighty Strikes'] = {hands=Relic_hands}
	sets.precast.JA["Warrior's Charge"] = {legs=Relic_legs}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk", feet=Relic_feet}
	sets.precast.JA['Retaliation'] = {feet=Empy_feet}
	sets.precast.JA['Restraint'] = {hands=Empy_hands}
	sets.precast.JA['Blood Rage'] = {body=Empy_body}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
				   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
				   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
		   
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
				   
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Cure_Received = {
		neck="Phalaina Locket",
		hands="Buremte Gloves",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"
	}
	sets.Phalanx_Received = {
		body=gear.odyssean_body,
		hands=gear.souv_hands,
		legs=gear.sakpata_legs,
		feet=gear.souv_feet
	}		
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Knobkierrie", 
		head=Relic_head,
		neck=JSE_neck,
		ear1="Schere Earring",
		ear2="Thrud earring",
		body=AF_body,
		hands=Empy_hands,
		ring1="Regal Ring",
		ring2="Ephramad's Ring",
		back=JSE_STR_ws,
		waist=gear.sailfi_belt,
		legs=Empy_legs,
		feet="Sulev. Leggings +2"
	}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ear2=gear.moonshade_earring,
		ring1="Sroda Ring"
	})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {
		ring1="Epaminondas's Ring"
	})
    
	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {
		ring1="Niqmaddu Ring",
		ear1=gear.moonshade_earring,
		feet=gear.sakpata_feet,
		back=JSE_VIT_ws
	})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS['Upheaval'], {
		ammo="Crepuscular Pebble",
		ring2="Niqmaddu Ring",
		ear1="Lugra Earring +1",
		feet="Sulev. Leggings +2",
		back=JSE_VIT_ws
	})

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head=gear.sakpata_head,
		body=gear.sakpata_body,
		hands=gear.sakpata_hands,
		feet=gear.sakpata_feet,
		ear2="Schere Earring",
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
	})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
		ammo="Coiste Bodhar",
		body=Relic_body,
		hands=Relic_hands,
		feet=gear.sakpata_feet,
		ear2="Schere Earring",
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		back=JSE_DA
	})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {
		ammo="Yetshila +1",
		ear1=gear.moonshade_earring,
		ear2=JSE_ear,
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		feet=Empy_feet,
	})
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS['Impulse Drive'], {
		ammo="Yetshila +1",
		ear2=JSE_ear,
		body=gear.sakpata_body,
		--ring1="Begrudging Ring", (Best Low buff Option)
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		feet=Empy_feet
	})

	sets.precast.WS['Scourge'] = set_combine(sets.precast.WS, {
		ear1="Thrud earring",
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring"
	})
	sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'], {
		legs=gear.nyame_legs,
		feet=gear.nyame_feet,
		ear1="Schere Earring",
		ear2="Thrud earring",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring"
	})

    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS['Ruinator'], {})
	
    sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS['Rampage'], {})
	
    sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {
		ammo="Yetshila +1",
		head=Empy_head,
		body=gear.sakpata_body,
		hands=gear.sakpata_hands,
		feet=Empy_feet,
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		ear2=JSE_ear
	})
    sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS['Raging Rush'], {
		ammo="Yetshila +1",
		head=Empy_head,
		hands="Flam. Manopolas +2",
		feet=Empy_feet,
		ring1="Begrudging Ring",
		ring2="Niqmaddu Ring",
		ear2=JSE_ear
	})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {
		ammo="Yetshila +1",
		head=Empy_head,
		feet=Empy_feet,
		ring1="Niqmaddu Ring",
		ear2=JSE_ear,
		back=JSE_STR_crit
	})
    sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS["Ukko's Fury"], {
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back=JSE_STR_ws
	})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {
		ring2="Niqmaddu Ring",
		ear1="Lugra Earring +1",
	})
    sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS["King's Justice"], {})

	sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		waist="Fotia Belt",
		feet=gear.sakpata_feet
	})
	sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS['Steel Cyclone'], {
		ear1="Lugra Earring +1",
		ring2="Niqmaddu Ring",
		feet="Sulev. Leggings +2"
	})
	sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {
		ear1=gear.moonshade_earring,
		ring1="Epaminondas's Ring"
	})
	sets.precast.WS['Fell Cleave'].Acc = set_combine(sets.precast.WS['Fell Cleave'], {
		ring2="Niqmaddu Ring",
		ear1="Lugra Earring +1",
	})
	sets.precast.WS.Proc = {}
	
--[[WS set examples.
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {back="Letalis Mantle",})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	 
	sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Ruinator'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Ruinator'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Ruinator'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Rampage'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Rampage'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Rampage'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Rampage'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Raging Rush'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Raging Rush'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Raging Rush'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
	sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {})
]]

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2=gear.moonshade_earring,}
	
	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

	 -- Sets to return to when not performing an action.
		   
	 -- Resting sets
	 sets.resting = {}
		   
	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head=Empy_head,
		neck="Rep. Plat. Medal",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
		body="Sacro Breastplate",
		hands=gear.sakpata_hands,
		ring1="Defending Ring",
		ring2="Moonlight Ring",
		back=JSE_DA,
		waist="Null Belt",
		legs=gear.sakpata_legs,
		feet=gear.sakpata_feet
	}

	sets.idle.Town = set_combine(sets.idle, {
		ammo="Aurgelmir Orb +1",
		neck=JSE_neck,
		ear1=gear.schere_earring,
		ear2=JSE_ear,
		body=Empy_body,
		hands=Empy_hands,
		ring1="Moonlight Ring",
		back="Null Shawl",
		waist="Ioskeha Belt +1",
		legs=Empy_legs,
		feet=Empy_feet
	})
		
	-- Defense sets
	sets.defense.PDT = {
		head=gear.sakpata_head,
    	body=gear.sakpata_body,
    	hands=gear.sakpata_hands,
    	legs=gear.sakpata_legs,
    	feet=gear.sakpata_feet,
    	neck=JSE_neck,
    	waist="Null Belt",
    	ear1="Alabaster Earring",
    	ear2=JSE_ear,
    	ring1="Murky Ring",
    	ring2="Moonlight Ring",
    	back="Null Shawl"
	}
	sets.defense.HP = set_combine(sets.defense.PDT, {
		body="Sacro Breastplate",
		hands=gear.souv_hands,
		feet=gear.souv_feet,
		waist="Plat. mog. Belt",
		ear2="Odnowa Earring +1"
	})
	sets.defense.MDT = {
		head=gear.sakpata_head,
    	body=gear.sakpata_body,
    	hands=gear.sakpata_hands,
    	legs=gear.sakpata_legs,
    	feet=gear.sakpata_feet,
    	neck=JSE_neck,
    	waist="Null Belt",
    	ear1="Alabaster Earring",
    	ear2=JSE_ear,
    	ring1="Murky Ring",
    	ring2="Moonlight Ring",
    	back="Null Shawl"
	}
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {})
	
	sets.defense.MEVA = {
		head=gear.sakpata_head,
    	body=gear.sakpata_body,
    	hands=gear.sakpata_hands,
    	legs=gear.sakpata_legs,
    	feet=gear.sakpata_feet,
    	neck=JSE_neck,
    	waist="Null Belt",
    	ear1="Alabaster Earring",
    	ear2="Eabani Earring",
    	ring1="Murky Ring",
    	ring2="Moonlight Ring",
    	back="Null Shawl"
	}

	sets.Kiting = {ring2="Shneddick Ring"}
	sets.Reraise = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	 
    -- Engaged sets
	--DT:-37%, acc:1564, DA:101%, QA:3%
	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Hjarrandi Helm",
		neck=gear.vim_torque,
		ear1=gear.schere_earring,
		ear2=JSE_ear,
		body=Empy_body,
		hands=gear.sakpata_hands,
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back=JSE_DA,
		waist="Ioskeha Belt +1",
		legs=AF_legs,
		feet=AF_feet
	}
	--DT:-38, acc:1599, DA:105%, TA:2%
    sets.engaged.Acc = set_combine (sets.engaged, {
		head=Empy_head,
		neck=JSE_neck,
		waist=gear.sailfi_belt,
		ring1="Chirich Ring +1",
	})

	--DT:42, acc:1562, DA:101%, QA:3%
	sets.engaged.DT = set_combine (sets.engaged, {
		ring2="Moonlight Ring"
	})
	--DT:48, acc:1595, DA:105%, TA:2%
	sets.engaged.Acc.DT = set_combine (sets.engaged.DT, {
		head=Empy_head,
		neck=JSE_neck,
		ring1="Moonlight Ring",
		waist=gear.sailfi_belt
	})

	sets.engaged.Ragnarok = set_combine (sets.engaged, {})
	sets.engaged.Ragnarok.Acc = set_combine (sets.engaged.Acc, {})
	sets.engaged.Ragnarok.DT = set_combine (sets.engaged.DT, {})
	sets.engaged.Ragnarok.Acc.DT = set_combine (sets.engaged.Acc.DT, {})
    sets.engaged.Ragnarok.AM = set_combine (sets.engaged.Ragnarok, {})
	sets.engaged.Ragnarok.Acc.AM = set_combine (sets.engaged.Ragnarok.Acc, {})
	sets.engaged.Ragnarok.DT.AM = set_combine (sets.engaged.Ragnarok.DT, {})
	sets.engaged.Ragnarok.Acc.DT.AM = set_combine (sets.engaged.Ragnarok.Acc.DT, {})

	--DT:-33%, acc:1455, DA:101%, TA:2%, QA:3%
	sets.engaged.Naegling = set_combine (sets.engaged, {
		ammo="Aurgelmir Orb +1",
		body=gear.sakpata_body,
		waist=gear.sailfi_belt
	})
	--DT:-38%, acc:1542, DA:102%, TA:2%
	sets.engaged.Naegling.Acc = set_combine (sets.engaged.Naegling, {
		head=Empy_head,
		body=Empy_body,
		neck=JSE_neck,
		ring1="Chirich Ring +1"
	})
	--DT:38%, acc:1453, DA:102%, TA:2%, QA:3%
	sets.engaged.Naegling.DT = set_combine (sets.engaged.Naegling, {
		ring2="Moonlight Ring"
	})
	--DT:48%, acc:1538, DA:102%, TA:2%
	sets.engaged.Naegling.Acc.DT = set_combine (sets.engaged.Naegling.DT, {
		head=Empy_head,
		body=Empy_body,
		neck=JSE_neck,
		ring1="Moonlight Ring"
	})
		
--[[Engaged set examples
	sets.engaged.Charge = {}
	sets.engaged.SomeAcc.Charge = {}
	sets.engaged.Acc.Charge = {}
	sets.engaged.FullAcc.Charge = {}
	sets.engaged.Fodder.Charge = {}
	
	sets.engaged.Mighty = {}
	sets.engaged.SomeAcc.Mighty = {}
	sets.engaged.Acc.Mighty = {}
	sets.engaged.FullAcc.Mighty = {}
	sets.engaged.Fodder.Mighty = {}

	sets.engaged.Charge.Mighty = {}
	sets.engaged.SomeAcc.Charge.Mighty = {}
	sets.engaged.Acc.Charge.Mighty = {}
	sets.engaged.FullAcc.Charge.Mighty = {}
	sets.engaged.Fodder.Charge.Mighty = {}
	
	sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.Adoulin.Charge = {}
	sets.engaged.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Acc.Adoulin.Charge = {}
	sets.engaged.FullAcc.Adoulin.Charge = {}
	sets.engaged.Fodder.Adoulin.Charge = {}
	
	sets.engaged.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Acc.Adoulin.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Fodder.Adoulin.Mighty = {}
	
	sets.engaged.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.Adoulin.Charge.Mighty = {}

	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Charge = {}
	sets.engaged.SomeAcc.PDT.Charge = {}
	sets.engaged.Acc.PDT.Charge = {}
	sets.engaged.FullAcc.PDT.Charge = {}
	sets.engaged.Fodder.PDT.Charge = {}
	
	sets.engaged.PDT.Mighty = {}
	sets.engaged.SomeAcc.PDT.Mighty = {}
	sets.engaged.Acc.PDT.Mighty = {}
	sets.engaged.FullAcc.PDT.Mighty = {}
	sets.engaged.Fodder.PDT.Mighty = {}

	sets.engaged.PDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.PDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.PDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.PDT.Adoulin.Charge.Mighty = {}

	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Charge = {}
	sets.engaged.SomeAcc.MDT.Charge = {}
	sets.engaged.Acc.MDT.Charge = {}
	sets.engaged.FullAcc.MDT.Charge = {}
	sets.engaged.Fodder.MDT.Charge = {}
	
	sets.engaged.MDT.Mighty = {}
	sets.engaged.SomeAcc.MDT.Mighty = {}
	sets.engaged.Acc.MDT.Mighty = {}
	sets.engaged.FullAcc.MDT.Mighty = {}
	sets.engaged.Fodder.MDT.Mighty = {}

	sets.engaged.MDT.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
	sets.engaged.MDT.Adoulin.Charge = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.MDT.Adoulin.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
			-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
			-- sets if more refined versions aren't defined.
			-- If you create a set with both offense and defense modes, the offense mode should be first.
			-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Conqueror melee sets
	sets.engaged.Conqueror = {}
	sets.engaged.Conqueror.SomeAcc = {}
	sets.engaged.Conqueror.Acc = {}
	sets.engaged.Conqueror.FullAcc = {}
	sets.engaged.Conqueror.Fodder = {}
	
	sets.engaged.Conqueror.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin = {}
	sets.engaged.Conqueror.Acc.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.Adoulin = {}
	sets.engaged.Conqueror.Fodder.Adoulin = {}
	
	sets.engaged.Conqueror.AM = {}
	sets.engaged.Conqueror.SomeAcc.AM = {}
	sets.engaged.Conqueror.Acc.AM = {}
	sets.engaged.Conqueror.FullAcc.AM = {}
	sets.engaged.Conqueror.Fodder.AM = {}
	
	sets.engaged.Conqueror.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.AM = {}

	sets.engaged.Conqueror.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Charge = {}
	sets.engaged.Conqueror.Acc.Charge = {}
	sets.engaged.Conqueror.FullAcc.Charge = {}
	sets.engaged.Conqueror.Fodder.Charge = {}
	
	sets.engaged.Conqueror.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.AM = {}
	
	sets.engaged.Conqueror.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.PDT = {}
	sets.engaged.Conqueror.SomeAcc.PDT = {}
	sets.engaged.Conqueror.Acc.PDT = {}
	sets.engaged.Conqueror.FullAcc.PDT = {}
	sets.engaged.Conqueror.Fodder.PDT = {}
	
	sets.engaged.Conqueror.PDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Conqueror.PDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.AM = {}
	sets.engaged.Conqueror.Acc.PDT.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.PDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Conqueror.MDT = {}
	sets.engaged.Conqueror.SomeAcc.MDT = {}
	sets.engaged.Conqueror.Acc.MDT = {}
	sets.engaged.Conqueror.FullAcc.MDT = {}
	sets.engaged.Conqueror.Fodder.MDT = {}
	
	sets.engaged.Conqueror.MDT.Adoulin = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Conqueror.MDT.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.AM = {}
	sets.engaged.Conqueror.Acc.MDT.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Conqueror.MDT.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.AM = {}
	
	sets.engaged.Conqueror.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Mighty = {}
	sets.engaged.Conqueror.Acc.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Mighty = {}
	sets.engaged.Conqueror.Fodder.Mighty = {}
	
	sets.engaged.Conqueror.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Mighty.AM = {}
	
	sets.engaged.Conqueror.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Mighty.AM = {}

	sets.engaged.Conqueror.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty = {}
	
	sets.engaged.Conqueror.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.PDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Conqueror.MDT.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Conqueror.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Conqueror.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Conqueror.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Bravura melee sets
	sets.engaged.Bravura = {}
	sets.engaged.Bravura.SomeAcc = {}
	sets.engaged.Bravura.Acc = {}
	sets.engaged.Bravura.FullAcc = {}
	sets.engaged.Bravura.Fodder = {}
	
	sets.engaged.Bravura.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.Adoulin = {}
	sets.engaged.Bravura.Acc.Adoulin = {}
	sets.engaged.Bravura.FullAcc.Adoulin = {}
	sets.engaged.Bravura.Fodder.Adoulin = {}
	
	sets.engaged.Bravura.AM = {}
	sets.engaged.Bravura.SomeAcc.AM = {}
	sets.engaged.Bravura.Acc.AM = {}
	sets.engaged.Bravura.FullAcc.AM = {}
	sets.engaged.Bravura.Fodder.AM = {}
	
	sets.engaged.Bravura.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.AM = {}

	sets.engaged.Bravura.Charge = {}
	sets.engaged.Bravura.SomeAcc.Charge = {}
	sets.engaged.Bravura.Acc.Charge = {}
	sets.engaged.Bravura.FullAcc.Charge = {}
	sets.engaged.Bravura.Fodder.Charge = {}
	
	sets.engaged.Bravura.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge = {}
	
	sets.engaged.Bravura.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.AM = {}
	sets.engaged.Bravura.Acc.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Charge.AM = {}
	
	sets.engaged.Bravura.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.PDT = {}
	sets.engaged.Bravura.SomeAcc.PDT = {}
	sets.engaged.Bravura.Acc.PDT = {}
	sets.engaged.Bravura.FullAcc.PDT = {}
	sets.engaged.Bravura.Fodder.PDT = {}
	
	sets.engaged.Bravura.PDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Bravura.PDT.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.AM = {}
	sets.engaged.Bravura.Acc.PDT.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.AM = {}
	sets.engaged.Bravura.Fodder.PDT.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.PDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Charge = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.PDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.MDT = {}
	sets.engaged.Bravura.SomeAcc.MDT = {}
	sets.engaged.Bravura.Acc.MDT = {}
	sets.engaged.Bravura.FullAcc.MDT = {}
	sets.engaged.Bravura.Fodder.MDT = {}
	
	sets.engaged.Bravura.MDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Bravura.MDT.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.AM = {}
	sets.engaged.Bravura.Acc.MDT.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.AM = {}
	sets.engaged.Bravura.Fodder.MDT.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.MDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Charge = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.MDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.AM = {}
	
	sets.engaged.Bravura.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Mighty = {}
	sets.engaged.Bravura.Acc.Mighty = {}
	sets.engaged.Bravura.FullAcc.Mighty = {}
	sets.engaged.Bravura.Fodder.Mighty = {}
	
	sets.engaged.Bravura.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Mighty.AM = {}
	
	sets.engaged.Bravura.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty.AM = {}

	sets.engaged.Bravura.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty = {}
	
	sets.engaged.Bravura.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.PDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.PDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.MDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.MDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Ragnarok melee sets
	sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
	sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
	sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
	sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

	sets.engaged.Ragnarok.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Charge = {}
	sets.engaged.Ragnarok.Acc.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Charge = {}
	sets.engaged.Ragnarok.Fodder.Charge = {}
	
	sets.engaged.Ragnarok.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.AM = {}
	
	sets.engaged.Ragnarok.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.AM = {}
	
	sets.engaged.Ragnarok.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty = {}
	sets.engaged.Ragnarok.Acc.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Mighty = {}
	
	sets.engaged.Ragnarok.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Mighty.AM = {}
	
	sets.engaged.Ragnarok.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty.AM = {}

	sets.engaged.Ragnarok.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.PDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.MDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
]]--
	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg"})
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 18)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 003')
end