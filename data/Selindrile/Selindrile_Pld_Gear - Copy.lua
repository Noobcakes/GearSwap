function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT_HP','PDT','PDT_Reraise')
    state.MagicalDefenseMode:options('MDT_HP','MDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA_HP','MEVA')
	state.IdleMode:options('Tank','PDT','MDT','KiteTank','Normal',)--'Refresh','Reraise'
	-- state.Weapons:options('None','SakpataAegis','SakpataOchain','NaeglingBlurred','ClubOchain')
	state.Weapons:options('Sakpata','NaeglingAegis','NaeglingBlurred',) --'Monty','Paoja'
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}

	autows = 'Savage Blade'
	-- autows = 'Torcleaver'
	autofood = 'Omelette Sandwich'

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind ^q gs c set IdleMode Kiting')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()
	

	organizer_items = {
		echos="Echo Drops",
		Remedy="Remedy",
		HolyH2O="Holy Water",
		shihei="Shihei",
		sublime="Sublime Sushi",
		Thrower="Mamoolbane",
		Pana="Panacea",
		ShiheBag="Toolbag (Shihe)",
		EggSando="Om. Sandwich",
    }

	-- Weapons sets

	sets.weapons.Sakpata = {main="Sakpata's Sword",sub="Priwen",}
	sets.weapons.NaeglingAegis = {main="Naegling",sub="Priwen",}
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Demersal Degen +1"}
	-- Dumb Stuff
	sets.weapons.Paoja =  {main="Chatoyant Staff",sub="Niobid Strap",}
	sets.weapons.Monty =  {main="Montante +1",sub="Niobid Strap",}
	-- sets.weapons.SakpataAegis = {main="Sakpata's Sword",sub="Aegis"}
	-- sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield"}
	-- sets.weapons.SakpataOchain = {main="Sakpata's Sword",sub="Ochain"}
	-- sets.weapons.ClubOchain = {main="Mafic Cudgel",sub="Ochain"}
	-- sets.weapons.DualWeapons = {main="Naegling",sub="Demersal Degen +1"}
	
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=TH_VAL_HEAD,legs=TH_ODDY_legs})
	
    sets.Enmity = {
	    ammo="Sapience Orb",
		head="Loess Barbuta +1", -- DT -20%
		body="Souv. Cuirass +1", -- DT -10%
		hands="Souv. Handsch. +1", -- MDT -5%
		legs="Souv. Diechlings +1", -- DT -4%
		feet="Souveran Schuhs +1", -- PDT -5%
		neck="Moonlight Necklace", -- Emnity +15
		waist="Silver Mog. Belt",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Moonlight Ring", -- DT -5%
		right_ring="Petrov Ring",
		back=EMNITY_PLD_back, -- DT -3%
	}
		-- {ammo="Paeapua",
        -- head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        -- body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
        -- back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1",} --feet="Eschite Greaves"
    sets.Enmity.SIRD = {
	    ammo="Sapience Orb",
		head="Souv. Schaller +1", -- SIRD +20%, DT -20%
		body="Souv. Cuirass +1", -- DT -10%
		hands="Souv. Handsch. +1", -- MDT -5%
		legs="Souv. Diechlings +1", -- DT -4%
		feet="Souveran Schuhs +1", -- PDT -5%
		neck="Moonlight Necklace", -- Emnity +15
		waist="Silver Mog. Belt",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Moonlight Ring", -- DT -5%
		right_ring="Petrov Ring",
		back=EMNITY_PLD_back, -- DT -3%
	}
	
	-- {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		-- head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
		-- body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Moonlight Ring",
		-- back=gear.enmity_jse_back,waist="Rumination Sash",legs="Founder's Hose",feet="Odyssean Greaves"}
		
    sets.Enmity.DT = {
	    ammo="Sapience Orb",
		head="Loess Barbuta +1",
		body="Souv. Cuirass +1",
		hands="Souv. Handsch. +1",
		legs="Souv. Diechlings +1",
		feet="Souveran Schuhs +1",
		neck="Moonlight Necklace",
		waist="Silver Mog. Belt",
		left_ear="Friomisi Earring",
		right_ear="Cryptic Earring",
		left_ring="Moonlight Ring",
		right_ring="Petrov Ring",
		back=EMNITY_PLD_back,
	}
		-- {ammo="Staunch Tathlum",
        -- head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        -- body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        -- back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Stikini Ring +1",ring2="Rufescent Ring",
		back=gear.enmity_jse_back,waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}
		
    sets.precast.JA['Chivalry'].DT = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +1"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Regal Gauntlets",ring1="Asklepian Ring",ring2="Valseur's Ring",
		back="Moonlight Cape",waist="Chaac Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {ammo="Aurgelmir Orb +1",
        head="Carmine Mask +1",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
        body="Flamma Korazin +2",hands="Regal Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Loquacious Earring",
		body="Souv. Cuirass +1",hands="Leyline Gloves",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs=FC_ODDY_legs,feet="Carmine Greaves +1",}
		
    sets.precast.FC.DT = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {neck="Diemer Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",body="Jumalik Mail"})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		body="Nyame Mail", 
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Abyssal Beads +1",
		waist="Sailfi Belt +1",
		left_ear="Lugra Earring +1",
		right_ear="Moonshade Earring", 
		left_ring="Epaminondas's Ring",
		right_ring="Regal Ring",
		back=STR_WSD_DRK_CAPE,
	}
		
    sets.precast.WS.DT = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		body="Nyame Mail", 
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Abyssal Beads +1",
		waist="Sailfi Belt +1",
		left_ear="Lugra Earring +1",
		right_ear="Moonshade Earring", 
		left_ring="Epaminondas's Ring",
		right_ring="Regal Ring",
		back=STR_WSD_DRK_CAPE,
	}

    sets.precast.WS.Acc = {
		ammo="Knobkierrie",
		head="Nyame Helm", 
		body="Nyame Mail", 
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Abyssal Beads +1",
		waist="Sailfi Belt +1",
		left_ear="Lugra Earring +1",
		right_ear="Moonshade Earring", 
		left_ring="Epaminondas's Ring",
		right_ring="Regal Ring",
		back=STR_WSD_DRK_CAPE,
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Mache Earring +1",ear2="Moonshade Earring"})
	
	sets.precast.WS['Flat Blade'] = {ammo="Aurgelmir Orb +1",
        head="Flam. Zucchetto +2",neck="Erra Pendant",ear1="Gwati Earring",ear2="Digni. Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum +1",
        head="Pixie Hairpin +1",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Metamor. Ring +1",
        back="Toro Cape",waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Atonement'] = {ammo="Paeapua",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Apeile Ring +1",ring2="Apeile Ring",
        back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Loquacious Earring",
		body="Souv. Cuirass +1",hands="Leyline Gloves",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs=FC_ODDY_legs,feet="Carmine Greaves +1",}
		
	sets.midcast.FastRecast.DT = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Loquacious Earring",
		body="Souv. Cuirass +1",hands="Leyline Gloves",ring1="Moonlight Ring",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs=FC_ODDY_legs,feet="Carmine Greaves +1",}

    sets.midcast.Flash = set_combine(sets.Enmity, {
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs=FC_ODDY_legs,feet="Odyssean Greaves"})
	
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
		-- main="Chatoyant Staff",
		-- sub="Niobid Strap",
		ammo="Staunch Tathlum +1", -- DT -3%
		head="Loess Barbuta +1", -- DT -20%
		body="Souv. Cuirass +1", -- DT -10%
		hands="Souv. Handsch. +1", -- MDT -5%
		legs="Souv. Diechlings +1", -- DT -4%
		feet=CURE_POT_ODDY_feet, -- Cure Pot. +12%, SIRD 20%
		neck="Moonlight Necklace",
		waist="Silver Mog. Belt",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Menelaus's Ring",
		right_ring="Moonlight Ring", -- DT -5%
		back="Solemnity Cape", -- DT -4%, Cure Pot. +7%
	}
		
    sets.midcast.Cure.SIRD = {
		-- main="Chatoyant Staff",
		-- sub="Niobid Strap",
		ammo="Staunch Tathlum +1", -- DT -3%
		head="Loess Barbuta +1", -- DT -20%
		body="Souv. Cuirass +1", -- DT -10%
		hands="Souv. Handsch. +1", -- MDT -5%
		legs="Souv. Diechlings +1", -- DT -4%
		feet=CURE_POT_ODDY_feet, -- Cure Pot. +12%, SIRD 20%
		neck="Moonlight Necklace",
		waist="Silver Mog. Belt",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Menelaus's Ring",
		right_ring="Moonlight Ring", -- DT -5%
		back="Solemnity Cape", -- DT -4%, Cure Pot. +7%
	}
	
	-- {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		-- head="Souveran Schaller +1",neck="Loricate Torque +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		-- body="Jumalik Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		-- back=gear.enmity_jse_back,waist="Creed Baudrier",legs="Founder's Hose",feet="Odyssean Greaves"}
		
    sets.midcast.Cure.DT = {
		-- main="Chatoyant Staff",
		-- sub="Niobid Strap",
		ammo="Staunch Tathlum +1", -- DT -3%
		head="Loess Barbuta +1", -- DT -20%
		body="Souv. Cuirass +1", -- DT -10%
		hands="Souv. Handsch. +1", -- MDT -5%
		legs="Souv. Diechlings +1", -- DT -4%
		feet=CURE_POT_ODDY_feet, -- Cure Pot. +12%, SIRD 20%
		neck="Moonlight Necklace",
		waist="Silver Mog. Belt",
		left_ear="Nourish. Earring",
		right_ear="Nourish. Earring +1",
		left_ring="Menelaus's Ring",
		right_ring="Moonlight Ring", -- DT -5%
		back="Solemnity Cape", -- DT -4%, Cure Pot. +7%
	}
		
    sets.midcast.Reprisal = {main="Sakpata's Sword",sub="Forfend +1",ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Arke Cosc. +1",feet="Souveran Schuhs +1"}

	sets.Self_Healing = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
	sets.Self_Healing.SIRD = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Solemnity Cape",waist="Flume Belt +1",legs="Founder's Hose",feet="Odyssean Greaves"}
		
	sets.Self_Healing.DT = {main="Deacon Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

	sets.Cure_Received = {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Andoaa Earring",
		body="Shab. Cuirass +1",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Kishar Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Carmine Cuisses +1",feet="Odyssean Greaves"}
		
    sets.midcast['Enhancing Magic'].SIRD = {main="Colada",sub="Ochain",ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Tuisto Earring",
		body="Shab. Cuirass +1",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back="Merciful Cape",waist="Olympus Sash",legs="Rev. Leggings +3",feet="Odyssean Greaves"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {main="Sakpata's Sword",sub="Forfend +1",hands="Souv. Handsch. +1",back=EMNITY_PLD_back,legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"})
	
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {main="Sakpata's Sword",sub="Ochain",hands="Souv. Handsch. +1",back=EMNITY_PLD_back,feet="Souveran Schuhs +1"})
	
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {})	
	
	sets.Phalanx_Received = {main="Sakpata's Sword",hands="Souv. Handsch. +1",back=EMNITY_PLD_back,legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonbeam Cape",waist="Fucho-no-obi",legs="Sulev. Cuisses +2",feet="Cab. Leggings +1"}

    -- Idle sets
    sets.idle = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Vim Torque +1", -- DT -6%
		--neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}
		
    sets.idle.PDT = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}
		
    sets.idle.MDT = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}
		
	sets.idle.Refresh = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}

	sets.idle.Tank = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}
		
	sets.idle.KiteTank = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Moonlight Ring", -- DT -5%
        right_ring="Shneddick Ring",
        back="Moonbeam Cape", -- DT -5%
	}
		
    sets.idle.Reraise = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}
		
    sets.idle.Weak = {    
        ammo="Staunch Tathlum +1", -- DT -3%
        head="Sakpata's Helm", -- DT -7%
        body="Sakpata's Plate", -- DT -10%
        hands="Sakpata's Gauntlets", -- DT -8%
        legs="Sakpata's Cuisses", -- Pahlanx +5, DT -9%
        feet="Sakpata's Leggings", -- DT -6%
        neck="Loricate Torque +1", -- DT -6%
        waist="Flume Belt +1", -- PDT -4%
        left_ear="Odnowa Earring +1", -- MDT -2%
        right_ear="Eabani Earring",
        left_ring="Stikini Ring +1",
        right_ring="Moonlight Ring", -- DT -5%
        back="Moonbeam Cape", -- DT -5%
	}

	sets.Kiting = {right_ring="Shneddick Ring",} -- {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt",feet="Rev. Leggings +3"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	

    
    sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Chev. Armet +1",neck="Diemer Gorget",ear1="Creed Earring",ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Warden's Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Thureous Earring",
        body="Twilight Mail",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {ammo="Staunch Tathlum",
        head="Twilight Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Engulfer Cape +1",waist="Flume Belt",legs=FC_ODDY_legs,feet="Cab. Leggings +1"}

	sets.defense.BDT = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonbeam Cape",waist="Asklepian Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.defense.Tank = {ammo="Staunch Tathlum",
		head="Chev. Armet +1",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=FC_ODDY_legs,feet="Hippo. Socks +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Warden's Ring",ring2="Shadow Ring",
        back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=FC_ODDY_legs,feet="Odyssean Greaves"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum",
        head="Founder's Corona",neck="Unmoving Collar +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
        back="Solemnity Cape",waist="Asklepian Belt",legs="Souv. Diechlings +1",feet="Odyssean Greaves"}
		
		-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Chev. Cuisses +1",feet="Chev. Sabatons +1"}
		
    sets.defense.OchainNoShellMDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Flax Sash",legs="Sulev. Cuisses +2",feet="Chev. Sabatons +1"}
		
    sets.defense.AegisMDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs=FC_ODDY_legs,feet="Odyssean Greaves"}
		
    sets.defense.AegisNoShellMDT = {ammo="Staunch Tathlum",
		head="Founder's Corona",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.fastcast_jse_back,waist="Asklepian Belt",legs="Sulev. Cuisses +2",feet="Amm Greaves"}	
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		--feet="Pumm. Calligae +3",
		neck="Vim Torque +1",
		waist="Sailfi Belt +1",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Grounded Mantle",
	}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
        head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Tempus Fugit",legs="Carmine Cuisses +1",feet="Sulev. Leggings +2"}

    sets.engaged.DW = {
		ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		body={ name="Valorous Mail", augments={'Accuracy+25','"Dbl.Atk."+5','STR+2','Attack+7',}},
		hands={ name="Emi. Gauntlets +1", augments={'HP+65','DEX+12','Accuracy+20',}},
		legs={ name="Odyssean Cuisses", augments={'Accuracy+22','"Store TP"+6','Attack+1',}},
		feet={ name="Valorous Greaves", augments={'Attack+28','"Store TP"+7','Accuracy+11',}},
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Mache Earring +1",
		left_ring="Moonlight Ring",
		right_ring="Chirich Ring +1",
		back="Moonbeam Cape",
	}

    sets.engaged.DW.Acc = {ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Flamma Ring",ring2="Ramuh Ring +1",
		back="Letalis Mantle",waist="Olseni Belt",legs="Sulev. Cuisses +2",feet="Founder's Greaves"}

	sets.engaged.Tank = {ammo="Staunch Tathlum",
		head="Chev. Armet +1",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.engaged.Dawn = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonbeam Cape",waist="Tempus Fugit",legs="Arke Cosciales",feet="Rev. Leggings +3"}
		
    sets.engaged.Acc.Tank = {ammo="Aurgelmir Orb +1",
        head="Sulevia's Mask +2",neck="Combatant's Torque",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Patricius Ring",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Patricius Ring",
		back=EMNITY_PLD_back,waist="Tempus Fugit",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Patricius Ring",
		back=EMNITY_PLD_back,waist="Tempus Fugit",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.engaged.NoShellTank = {ammo="Staunch Tathlum",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
        body="Rev. Surcoat +3",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs=FC_ODDY_legs,feet="Cab. Leggings +1"}
		
	sets.engaged.BreathTank = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
	sets.engaged.Acc.BreathTank = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Thureous Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Shadow Ring",
		back="Engulfer Cape +1",waist="Creed Baudrier",legs="Sulev. Cuisses +2",feet="Amm Greaves"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 21)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 21)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 21)
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 21)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 21)
    else
        set_macro_page(1, 21) --War/Etc
    end
end