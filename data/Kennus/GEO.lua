-- Original: Motenten / Modified: Arislan

-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ ALT+` ]           Magic Burst Mode Toggle
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+` ]          Full Circle
--              [ CTRL+B ]          Blaze of Glory
--              [ CTRL+A ]          Ecliptic Attrition
--              [ CTRL+D ]          Dematerialize
--              [ CTRL+L ]          Life Cycle
--
--  Weapons:    [ CTRL+W ]          Toggles Weapon Lock
--
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    geo_timer = ''
    indi_timer = ''
    indi_duration = 308
    entrust_timer = ''
    entrust_duration = 344
    entrust = 0
    newLuopan = 0

    state.Buff['Blaze of Glory'] = buffactive['Blaze of Glory'] or false

    -- state.CP = M(false, "Capacity Points Mode")

    state.Auto = M(true, 'Auto Nuke')
    state.Element = M{['description']='Element','Fire','Blizzard','Aero','Stone','Thunder','Water'}

    no_swap_gear = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)",
              "Trizek Ring", "Echad Ring", "Facility Ring", "Capacity Ring"}

    degrade_array = {
        ['Fire'] = {'Fire','Fire II','Fire III','Fire IV','Fire V'},
        ['Ice'] = {'Blizzard','Blizzard II','Blizzard III','Blizzard IV','Blizzard V'},
        ['Wind'] = {'Aero','Aero II','Aero III','Aero IV','Aero V'},
        ['Earth'] = {'Stone','Stone II','Stone III','Stone IV','Stone V'},
        ['Lightning'] = {'Thunder','Thunder II','Thunder III','Thunder IV','Thunder V'},
        ['Water'] = {'Water', 'Water II','Water III', 'Water IV','Water V'},
        ['Aspirs'] = {'Aspir','Aspir II','Aspir III'},
        }

    lockstyleset = 5

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'OccultAcumen')
    state.IdleMode:options('Normal', 'DT', 'Prime', 'Melee')

    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')

    -- Additional local binds
    send_command('bind ^` input /ja "Full Circle" <me>')
    send_command('bind ^b input /ja "Blaze of Glory" <me>')
    send_command('bind ^a input /ja "Ecliptic Attrition" <me>')
    send_command('bind ^d input /ja "Dematerialize" <me>')
    send_command('bind ^c input /ja "Life Cycle" <me>')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind ^insert gs c cycleback Element')
    send_command('bind ^delete gs c cycle Element')
    send_command('bind !w input /ma "Aspir III" <t>')
    send_command('bind !p input /ja "Entrust" <me>')
    send_command('bind ^, input /ma Sneak <stpc>')
    send_command('bind ^. input /ma Invisible <stpc>')
    -- send_command('bind @c gs c toggle CP')
    send_command('bind @w gs c toggle WeaponLock')

    send_command('bind ^numpad7 input /ws "Black Halo" <t>')
    send_command('bind ^numpad8 input /ws "Hexa Strike" <t>')
    send_command('bind ^numpad9 input /ws "Realmrazer" <t>')
    send_command('bind ^numpad6 input /ws "Exudation" <t>')
    send_command('bind ^numpad1 input /ws "Flash Nova" <t>')

    send_command('bind #- input /follow <t>')

    select_default_macro_book()

    state.Auto_Kite = M(false, 'Auto_Kite')
    moving = false
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind ^b')
    send_command('unbind ^a')
    send_command('unbind ^d')
    send_command('unbind ^c')
    send_command('unbind !`')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind !w')
    send_command('unbind !p')
    send_command('unbind ^,')
    send_command('unbind !.')
    -- send_command('unbind @c')
    send_command('unbind @w')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad1')
    send_command('unbind !numpad7')
    send_command('unbind !numpad8')
    send_command('unbind !numpad9')
    send_command('unbind !numpad4')
    send_command('unbind !numpad5')
    send_command('unbind !numpad6')
    send_command('unbind !numpad1')
    send_command('unbind !numpad+')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Precast Sets -----------------------------------------
    ------------------------------------------------------------------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
    sets.precast.JA['Life Cycle'] = {head="Bagua Galero", body="Geo. Tunic +3",back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}}


    -- Fast cast sets for spells

    sets.precast.FC = {
		main="Solstice", --5%
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, --3%
		head="Merlinic Hood", --13%
		body="Azimuth Coat +3", --0
		hands="Agwu's Gages", --6%
		legs="Geomancy Pants +3", --15%
		feet="Merlinic Crackows", --5%
		neck="Bagua Charm +2", --0
		waist="Embla Sash", --5%
		left_ear="Malignance Earring", --4%
		right_ear="Loquac. Earring", -- 2%
		left_ring="Prolix Ring", --2%
		right_ring="Kishar Ring", --4%
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, --10%
		}

    sets.precast.FC.Enhancing = sets.precast.FC

    sets.precast.FC.Elemental = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        body="Vanya Robe", --7
        hands="Vanya Cuffs", --7
        Feet="Vanya Clogs", --7
		waist="Acerbic Sash +1",
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head="", body="Twilight Cloak",})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Crepuscluar Pebble",
		head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
        ear1="Moonshade Earring",
        ear2="Ishvara Earring",
        ring1="Metamor. Ring +1",
        ring2="Epaminondas's Ring",
		back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		waist="Cornelia's Belt",
        }

    sets.precast.WS['Hexastrike'] = set_combine(sets.precast.WS, {
        neck="Caro Necklace",
        waist="Grunfeld Rope",
        })

    sets.precast.WS['Exudation'] = sets.precast.WS['Hexastrike']

    sets.precast.WS['Flash Nova'] = {
        head="Bagua Galero +3",
        body="Amalric Doublet +1",
        hands="Amalric Gages +1",
        legs="Jhakri Slops +2",
        feet="Amalric Nails +1",
        neck="Saevus Pendant +1",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Freke Ring",
        ring2="Metamor. Ring +1",
        back=gear.GEO_MAB_Cape,
        waist="Sacro Cord",
        }

sets.precast.WS['Judgment'] = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		--hands={ name="Gazu Bracelets +1", augments={'Path: A',}}, -- acc swap if needing more than 1,189 accuracy in base WS set
		hands="Nyame Gauntlets",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Null Loop",
		waist="Cornelia's Belt",
		ear1="Ishvara Earring",
		ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		ring1="Rufescent Ring",
		ring2={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
		
sets.precast.WS['Dagda'] = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		--hands={ name="Gazu Bracelets +1", augments={'Path: A',}}, -- acc swap if needing more than 1,189 accuracy in base WS set
		hands="Nyame Gauntlets",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Null Loop",
		waist="Cornelia's Belt",
		ear1="Ishvara Earring",
		ear2={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		ring1="Rufescent Ring",
		ring2={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
    ------------------------------------------------------------------------
    ----------------------------- Midcast Sets -----------------------------
    ------------------------------------------------------------------------

    -- Base fast recast for spells

-- Haste

   sets.midcast.Geomancy = {
		main="Solstice", --Conserve MP 6.
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		sub="Ammurapi Shield",
		head="Ipoca Beret", --unrealistic to get. Its from Vinipata Reisnjima HELM
		body="Vedic Coat", --You already have.
		hands="Shrieker's Cuffs",  -- Fleetstalker Escha-Zitah. Good Conserve MP
		legs="Vanya Slops", --Ferrodon Escha-Zitah - Path C. Conserve MP 6. 
		feet="Vanya Clogs", --Gulltop Escha-Zitah - Path C. Conserve MP 6 Cure potency 5%
		neck="Bagua Charm +2",
		waist="Luminary Sash", --Neak Reisnjima - Conserve MP 4
		left_ear="Calamitous Earring", --Nosoi Escha-Zitah - Conserve MP 4
		right_ear="Azimuth Earring", --Do you have this?
		right_ring="Stikini Ring +1",
		left_ring="Stikini Ring +1", --Can throw Stinky in here if you dont have another option. or if you grabbed the ring from Limbus.
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        main="Idris",
		legs="Bagua Pants +2",
        feet="Azimuth Gaiters +3",
        back="Lifestream Cape",
        })

    sets.midcast.Cure = {
        main="Gada",
		sub="Sors Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Elite Royal Collar",
		waist="Bishop's Sash +1",
		left_ear="Malignance Earring",
		right_ear="Hearty Earring",
		right_ring="Lebeche Ring",
		left_ring="Naji's Loop",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
	--main="Daybreak",
    --sub="Ammurapi Shield",
    --range="Ghastly Tathlum +1",
    --head="Ea Hat +1",
	--body="Azimuth Coat +3",
    --hands="Agwu's Gages",
    --legs="Azimuth Tights +3",
    --feet="Azimuth Gaiters +3",
    --neck="Sibyl Scarf",
    --waist="Olympus Sash",
    --left_ear="Malignance Earring",
    --right_ear="Azimuth Earring",
    --left_ring="Medada's Ring",
    --right_ring="Freke Ring",
    --back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Enhancing = set_combine(sets.midcast.Cure, { 
		main="Gada", 
		sub="Ammurapi Shield",
		waist="Embla Sash", 
		left_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini ring +1",
		head="Telchine Cap",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",})

    sets.midcast.EnhancingDuration = sets.midcast.Enhancing

    sets.midcast.Regen = sets.midcast.EnhancingDuration

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, { head = "Amalric Coif +1" })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, { right_ear="Earthcry Earring"})

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, { main="Vadose Rod", head = "Amalric Coif +1", waist = "Emphatikos Rope", legs = "Shedir Seraweels", })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect


    sets.midcast.MndEnfeebles = {
        main="Mpaca's Staff",
		sub="Khonsu",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Bagua Charm +2",
		waist="Carrier's Sash",
		left_ear="Malignance Earring",
		right_ear="Azimuth Earring",
		right_ring="Kishar Ring",
		left_ring="Medada's Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
} -- MND/Magic accuracy

    sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles

    sets.midcast.LockedEnfeebles = sets.midcast.MndEnfeebles

    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {main="Daybreak"})
	
	sets.midcast.Impact = set_combine(sets.midcast.IntEnfeebles, {head="", body="Twilight Cloak",})

    sets.midcast['Dark Magic'] = {
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Bagua Charm +2",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Azimuth Earring",
		right_ring="Stikini Ring +1",
		left_ring="Medada's Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Bagua Galero +2", neck = "Null Loop", left_ring = "Evanescence Ring", feet = "Agwu's Pigaches"})

    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Absorb = {
		head="Agwu's Cap",
		body="Agwu's Robe",
		hands="Agwu's Gages",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches",
		neck="Erra Pendant",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Azimuth Earring",
		right_ring="Stikini Ring +1",
		left_ring="Medada's Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
}
    sets.midcast.Stun = sets.midcast['Dark Magic']

    -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
		main="Wizard's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Bagua Charm +2",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Freke Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		--back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].OccultAcumen = {
		head="Mallquis Chapeau +2",
		body="Merlinic Jubbah",
		hands="Merlinic Dastanas",
		legs="Perdition Slops",
		feet="Merlinic Crackows",
		neck="Bagua Charm +2",
		waist="Oneiros Rope",
		left_ear="Malignance Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Null Shawl",
}

    sets.midcast['Elemental Magic'].GeoNuke =  {
		head="Mallquis Chapeau +2",
		body="Merlinic Jubbah",
		hands="Merlinic Dastanas",
		legs="Azimuth Tights +3",
		feet="Merlinic Crackows",
		neck="Bagua Charm +2",
		waist="Oneiros Rope",
		left_ear="Malignance Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ------------------------------------------ Idle Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
		main="Malignance Pole",
		sub="Kaja Grip",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assid. Pants +1",
		feet="Azimuth Gaiters +3",
		neck="Elite Royal Collar",
		waist="Null Belt",
		left_ear="Eabani Earring",
		right_ear="Azimuth Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
}

    sets.resting = sets.idle

    sets.idle.DT = {
		main="Idris",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Warder's Charm +1",
		waist="Isa Belt",
		left_ear="Eabani Earring",
		right_ear="Azimuth Earring",
		right_ring="Shneddick Ring",
		left_ring="Defending Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.Prime = {
		main="Lorg Mor",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assid. Pants +1",
		feet="Azimuth Gaiters +3",
		neck="Elite Royal Collar",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Azimuth Earring",
		left_ring="Shneddick Ring",
		right_ring="Roller's Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Magic dmg. taken-10%',}},
	}

	sets.idle.Melee = {
		main="Tishtrya",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands={ name="Bagua Mitaines +3", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assid. Pants +1",
		feet="Azimuth Gaiters +3",
		neck="Elite Royal Collar",
		waist="Carrier's Sash",
		left_ear="Eabani Earring",
		right_ear="Azimuth Earring",
		left_ring="Shneddick Ring",
		right_ring="Roller's Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Magic dmg. taken-10%',}},
	}
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {
		main="Solstice",
		sub="Ammurapi Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands="Geo. Mitaines +3",
		legs="Nyame Flanchard",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},
		neck="Bagua Charm +2",
		waist="Isa Belt",
		right_ear="Handler's Earring +1",
		left_ear="Alabaster Earring",
		right_ring="Stikini Ring +1",
		left_ring="Murky Ring",
		back="Null Shawl",
		--back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
	}

	sets.idle.Prime.Pet = {
		main="Lorg Mor",
		sub="Genmei Shield",
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands="Geo. Mitaines +4",
		legs={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}},
		feet={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}},
		neck="Bagua Charm +2",
		waist="Isa Belt",
		right_ear="Handler's Earring +1",
		left_ear="Eabani Earring",
		right_ring="Roller's Ring",
		left_ring="Defending Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Magic dmg. taken-10%',}},
	}

	sets.idle.Melee.Pet = {
		main="Tishtrya",
		sub="Genmei Shield",
		body="Azimuth Coat +3",
		head="Azimuth Hood +3",
		hands="Geo. Mitaines +4",
		legs={ name="Telchine Braconi", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}},
		feet={ name="Telchine Pigaches", augments={'Pet: "Regen"+2','Pet: Damage taken -4%',}},
		neck="Bagua Charm +2",
		waist="Isa Belt",
		right_ear="Handler's Earring +1",
		left_ear="Eabani Earring",
		right_ring="Roller's Ring",
		left_ring="Defending Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Magic dmg. taken-10%',}},
	}
    sets.PetHP = {head="Bagua Galero"}

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
    --sets.idle.DT.Indi = set_combine(sets.idle.DT, {})
    --sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {})

    sets.idle.Town = sets.idle

    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {feet="Geomancy Sandals"}

    sets.latent_refresh = {waist="Fucho-no-Obi"}

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head="Azimuth Hood +3",
        body="Nyame Mail",
        hands="Geo. Mitaines +4",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		neck="Null Loop",
        ear1="Brutal Earring",
        ear2="Telos Earring",
        ring1="Crepuscluar Ring",
        ring2="Defending Ring",
		back="Null Shawl",
        waist="Isa Belt",
        }


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.magic_burst = {
		main="Wizard's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Bagua Charm +2",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Freke Ring",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		--back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.buff.Doom = {neck = "Debilis Medallion", ring1="Menelaus's Ring", ring2="Ephedra Ring",}
    sets.Obi = {waist="Hachirin-no-Obi"}
	sets.buff.Sleep = {main = "Lorg Mor"}
    -- sets.CP = {back="Mecisto. Mantle"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_pretarget(spell, spellMap, eventArgs)
    if spell.type == 'Geomancy' then
        if spell.name:startswith('Indi') and buffactive.Entrust and spell.target.type == 'SELF' then
            add_to_chat(002, 'Entrust active - Select a party member!')
            cancel_spell()
        end
    end
end

function job_precast(spell, action, spellMap, eventArgs)
    if spell.name:startswith('Aspir') then
        refine_various_spells(spell, action, spellMap, eventArgs)
    elseif state.Auto.value == true then
        if spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' and spellMap ~= 'GeoNuke' then
            refine_various_spells(spell, action, spellMap, eventArgs)
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
            equip(sets.midcastElemental)
            elseif spell.english == "Impact" then
                equip(sets.midcast.Impact)
            end
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
        elseif spellMap == 'Refresh' then
            equip(sets.midcast.Refresh)
			end
    if spell.skill == 'Enfeebling Magic' and newLuopan == 1 then
        -- prevent Cohort Cloak from unequipping head when relic head is locked
        equip(sets.midcast.LockedEnfeebles)
    elseif spell.skill == 'Geomancy' then
        if buffactive.Entrust and spell.english:startswith('Indi-') then
            equip({main="Gada"})
                entrust = 1
        end
		end
    end


function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        --[[if spell.english:startswith('Geo') then
            geo_timer = spell.english
            send_command('@timers c "'..geo_timer..'" 600 down spells/00136.png')
        elseif spell.english:startswith('Indi') then
            if entrust == 1 then
                entrust_timer = spell.english
                send_command('@timers c "'..entrust_timer..' ['..spell.target.name..']" '..entrust_duration..' down spells/00136.png')
                entrust = 0
            else
                send_command('@timers d "'..indi_timer..'"')
                indi_timer = spell.english
                send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
            end
        end ]]
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        elseif spell.english:startswith('Geo-') or spell.english == "Life Cycle" then
            newLuopan = 1
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
             disable('ring1','ring2','waist','neck')
        else
            enable('ring1','ring2','waist','neck')
            handle_equipping_gear(player.status)
        end
    end

end

function job_buff_change(buff, gain)
    if buff == "sleep" then
        if gain then
            equip(sets.buff.Sleep)
             disable('main')
        else
            enable('main')
            handle_equipping_gear(player.status)
        end
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end

-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet was gained, false if it was lost.
function job_pet_change(petparam, gain)
    if gain == false then
        send_command('@timers d "'..geo_timer..'"')
        enable('head')
        newLuopan = 0
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
    classes.CustomIdleGroups:clear()
end

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' then
            if spellMap == 'GeoElem' then
                return 'GeoElem'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end
    if state.Auto_Kite.value == true then
       idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    local c_msg = state.CastingMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end
    if state.Auto.value then
        msg = ' Auto: On |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(060, '| Magic: ' ..string.char(31,001)..c_msg.. string.char(31,002)..  ' |'
        ..string.char(31,004).. ' Defense: ' ..string.char(31,001)..d_msg.. string.char(31,002)..  ' |'
        ..string.char(31,008).. ' Idle: ' ..string.char(31,001)..i_msg.. string.char(31,002)..  ' |'
        ..string.char(31,002)..msg)

    eventArgs.handled = true
end

function refine_various_spells(spell, action, spellMap, eventArgs)

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if spell.skill == 'Elemental Magic' and spellMap ~= 'GeoElem' then
            spell_index = table.find(degrade_array[spell.element],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array[spell.element][spell_index - 1]
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        elseif spell.name:startswith('Aspir') then
            spell_index = table.find(degrade_array['Aspirs'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aspirs'][spell_index - 1]
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        end
    end
end

windower.register_event('chat message', function(message,sender,mode,gm)

local play = windower.ffxi.get_player().name

if message == 'erase' and sender == 'Odessyus' then
	send_command('@input /ma Erase ' .. sender)
end

if message == 'stona' and sender == 'Odessyus' then
	send_command('@input /ma Stona ' .. sender)
	end

if message == 'para' and sender == 'Odessyus' then
	send_command('@input /ma Paralyna ' .. sender)
	end

if message == 'poison' and sender == 'Odessyus' then
	send_command('@input /ma Poisona ' .. sender)
	end
	
if message == 'blind' and sender == 'Odessyus' then
	send_command('@input /ma Blindna ' .. sender)
	end

if message == 'doom' and sender == 'Odessyus' then
	send_command('@input /ma Cursna ' .. sender)
	end

if message == 'Doomed.' and sender == 'Odessyus' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'cursna' and sender == 'Odessyus' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'silena' and sender == 'Odessyus' then
	send_command('@input /ma Silena ' .. sender)
	end
	
if message == 'virus' and sender == 'Odessyus' then
	send_command('@input /ma Viruna ' .. sender)
	end
	
if message == 'c3' and sender == 'Odessyus' then
	send_command('@input /ma Cure 3 ' .. sender)
	end
	
if message == 'c4' and sender == 'Odessyus' then
	send_command('@input /ma Cure 4 ' .. sender)
	end
	
if message == 'c5' and sender == 'Odessyus' then
	send_command('@input /ma Cure 5 ' .. sender)
	end
	
if message == 'c6' and sender == 'Odessyus' then
	send_command('@input /ma Cure 6 ' .. sender)
	end
	
if message == 'cg3' and sender == 'Odessyus' then
	send_command('@input /ma Curaga 3 ' .. sender)
	end
	
if message == 'cg4' and sender == 'Odessyus' then
	send_command('@input /ma Curaga 4 ' .. sender)
	end
	
if message == 'cg5' and sender == 'Odessyus' then
	send_command('@input /ma Curaga 5 ' .. sender)
	end

end)

windower.register_event('chat message', function(message,sender,mode,gm)

local play = windower.ffxi.get_player().name

if message == 'erase' and sender == 'Eddx' then
	send_command('@input /ma Erase ' .. sender)
end

if message == 'stona' and sender == 'Eddx' then
	send_command('@input /ma Stona ' .. sender)
	end

if message == 'para' and sender == 'Eddx' then
	send_command('@input /ma Paralyna ' .. sender)
	end

if message == 'poison' and sender == 'Eddx' then
	send_command('@input /ma Poisona ' .. sender)
	end
	
if message == 'blind' and sender == 'Eddx' then
	send_command('@input /ma Blindna ' .. sender)
	end

if message == 'doom' and sender == 'Eddx' then
	send_command('@input /ma Cursna ' .. sender)
	end

if message == 'Doomed.' and sender == 'Eddx' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'cursna' and sender == 'Eddx' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'silena' and sender == 'Eddx' then
	send_command('@input /ma Silena ' .. sender)
	end
	
if message == 'virus' and sender == 'Eddx' then
	send_command('@input /ma Viruna ' .. sender)
	end
	
if message == 'c3' and sender == 'Eddx' then
	send_command('@input /ma Cure 3 ' .. sender)
	end
	
if message == 'c4' and sender == 'Eddx' then
	send_command('@input /ma Cure 4 ' .. sender)
	end
	
if message == 'c5' and sender == 'Eddx' then
	send_command('@input /ma Cure 5 ' .. sender)
	end
	
if message == 'c6' and sender == 'Eddx' then
	send_command('@input /ma Cure 6 ' .. sender)
	end
	
if message == 'cg3' and sender == 'Eddx' then
	send_command('@input /ma Curaga 3 ' .. sender)
	end
	
if message == 'cg4' and sender == 'Eddx' then
	send_command('@input /ma Curaga 4 ' .. sender)
	end
	
if message == 'cg5' and sender == 'Eddx' then
	send_command('@input /ma Curaga 5 ' .. sender)
	end

end)

windower.register_event('chat message', function(message,sender,mode,gm)

local play = windower.ffxi.get_player().name

if message == 'erase' and sender == 'Favre' then
	send_command('@input /ma Erase ' .. sender)
end

if message == 'stona' and sender == 'Favre' then
	send_command('@input /ma Stona ' .. sender)
	end

if message == 'para' and sender == 'Favre' then
	send_command('@input /ma Paralyna ' .. sender)
	end

if message == 'poison' and sender == 'Favre' then
	send_command('@input /ma Poisona ' .. sender)
	end
	
if message == 'blind' and sender == 'Favre' then
	send_command('@input /ma Blindna ' .. sender)
	end

if message == 'doom' and sender == 'Favre' then
	send_command('@input /ma Cursna ' .. sender)
	end

if message == 'Doomed.' and sender == 'Favre' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'cursna' and sender == 'Favre' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'silena' and sender == 'Favre' then
	send_command('@input /ma Silena ' .. sender)
	end
	
if message == 'virus' and sender == 'Favre' then
	send_command('@input /ma Viruna ' .. sender)
	end
	
if message == 'c3' and sender == 'Favre' then
	send_command('@input /ma Cure 3 ' .. sender)
	end
	
if message == 'c4' and sender == 'Favre' then
	send_command('@input /ma Cure 4 ' .. sender)
	end
	
if message == 'c5' and sender == 'Favre' then
	send_command('@input /ma Cure 5 ' .. sender)
	end
	
if message == 'c6' and sender == 'Favre' then
	send_command('@input /ma Cure 6 ' .. sender)
	end
	
if message == 'cg3' and sender == 'Favre' then
	send_command('@input /ma Curaga 3 ' .. sender)
	end
	
if message == 'cg4' and sender == 'Favre' then
	send_command('@input /ma Curaga 4 ' .. sender)
	end
	
if message == 'cg5' and sender == 'Favre' then
	send_command('@input /ma Curaga 5 ' .. sender)
	end

end)

windower.register_event('chat message', function(message,sender,mode,gm)

local play = windower.ffxi.get_player().name

if message == 'erase' and sender == 'Bluelaser' then
	send_command('@input /ma Erase ' .. sender)
end

if message == 'stona' and sender == 'Bluelaser' then
	send_command('@input /ma Stona ' .. sender)
	end

if message == 'para' and sender == 'Bluelaser' then
	send_command('@input /ma Paralyna ' .. sender)
	end

if message == 'poison' and sender == 'Bluelaser' then
	send_command('@input /ma Poisona ' .. sender)
	end
	
if message == 'blind' and sender == 'Bluelaser' then
	send_command('@input /ma Blindna ' .. sender)
	end

if message == 'doom' and sender == 'Bluelaser' then
	send_command('@input /ma Cursna ' .. sender)
	end

if message == 'Doomed.' and sender == 'Bluelaser' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'cursna' and sender == 'Bluelaser' then
	send_command('@input /ma Cursna ' .. sender)
	end
	
if message == 'silena' and sender == 'Bluelaser' then
	send_command('@input /ma Silena ' .. sender)
	end
	
if message == 'virus' and sender == 'Bluelaser' then
	send_command('@input /ma Viruna ' .. sender)
	end
	
if message == 'c3' and sender == 'Bluelaser' then
	send_command('@input /ma Cure 3 ' .. sender)
	end
	
if message == 'c4' and sender == 'Bluelaser' then
	send_command('@input /ma Cure 4 ' .. sender)
	end
	
if message == 'c5' and sender == 'Bluelaser' then
	send_command('@input /ma Cure 5 ' .. sender)
	end
	
if message == 'c6' and sender == 'Bluelaser' then
	send_command('@input /ma Cure 6 ' .. sender)
	end
	
if message == 'cg3' and sender == 'Bluelaser' then
	send_command('@input /ma Curaga 3 ' .. sender)
	end
	
if message == 'cg4' and sender == 'Bluelaser' then
	send_command('@input /ma Curaga 4 ' .. sender)
	end
	
if message == 'cg5' and sender == 'Bluelaser' then
	send_command('@input /ma Curaga 5 ' .. sender)
	end

end)

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'nuke' and not midaction() then
        send_command('@input /ma "' .. state.Element.current .. ' V" <t>')
    end
    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end

function check_moving()
    if state.DefenseMode.value == 'None'  and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 16)
end