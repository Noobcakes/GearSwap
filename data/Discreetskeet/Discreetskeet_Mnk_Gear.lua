function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
    state.HybridMode:options('Normal', 'PDT','PDTOnly')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('None')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {}
	sets.precast.JA['Boost'] = {} --hands="Anchorite's Gloves +1"
	sets.precast.JA['Dodge'] = {}
	sets.precast.JA['Focus'] = {}
	sets.precast.JA['Counterstance'] = {} --feet="Hesychast's Gaiters +1"
	sets.precast.JA['Footwork'] = {}
	sets.precast.JA['Formless Strikes'] = {}
	sets.precast.JA['Mantra'] = {} --feet="Hesychast's Gaiters +1"

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
		
	sets.precast.Flourish1 = {}


	-- Fast cast sets for spells
	
	sets.precast.FC = {}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
	sets.precast.WSSomeAcc = {ammo="Falcon Eye",head="Dampening Tam",legs="Hiza. Hizayoroi +2"}
	sets.precast.WSAcc = {ammo="Falcon Eye",head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.precast.WSFullAcc = {ammo="Falcon Eye",head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",body="Mummu Jacket +2",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.precast.WSFodder = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, sets.precast.WSFullAcc)
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, sets.precast.WSFodder)

	-- Specific weaponskill sets.

	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",waist="Grunfeld Rope",legs="Mummu Kecks +2",feet=gear.herculean_wsd_feet})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Abnoba Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {head="Mummu Bonnet +2",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {head="Mummu Bonnet +2",ear1="Moonshade Earring",body="Sayadio's Kaftan",hands="Ryuo Tekko",ring2="Begrudging Ring",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS["Raging Fists"].FullAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Howling Fist"].FullAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFullAcc)
	sets.precast.WS["Asuran Fists"].FullAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFullAcc)
	sets.precast.WS["Ascetic's Fury"].FullAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Victory Smite"].FullAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFullAcc, {head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Ryuo Tekko",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS["Shijin Spiral"].FullAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFullAcc)
	sets.precast.WS["Dragon Kick"].FullAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFullAcc)
	sets.precast.WS["Tornado Kick"].FullAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFullAcc)
	
	sets.precast.WS["Raging Fists"].Fodder = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSFodder)
	sets.precast.WS["Howling Fist"].Fodder = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSFodder)
	sets.precast.WS["Asuran Fists"].Fodder = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSFodder)
	sets.precast.WS["Ascetic's Fury"].Fodder = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSFodder, {head="Adhemar Bonnet +1",neck="Caro Necklace",body="Abnoba Kaftan",ring1="Begrudging Ring",waist="Grunfeld Rope"})
	sets.precast.WS["Victory Smite"].Fodder = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSFodder, {ear1="Moonshade Earring",body="Abnoba Kaftan",ring1="Begrudging Ring"})
	sets.precast.WS["Shijin Spiral"].Fodder = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSFodder)
	sets.precast.WS["Dragon Kick"].Fodder = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSFodder)
	sets.precast.WS["Tornado Kick"].Fodder = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSFodder)


	sets.precast.WS['Cataclysm'] = {ammo="Dosis Tathlum",
		neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
		hands=gear.herculean_dt_hands,ring1="Shiva Ring +1",
		back="Toro Cape",legs="Nahtirah Trousers"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {}

	sets.idle.Weak = {}

	sets.idle.PDT = {}		

	-- Defense sets
	sets.defense.PDT = {}
		
	-- Defense sets
	sets.defense.HP = {}

	sets.defense.MDT = {}
		
	sets.defense.MEVA = {}

	sets.Kiting = {feet="Herald's Gaiters"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {}
	sets.engaged.SomeAcc = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back="Segomo's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	sets.engaged.Acc = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Ken. Samue",hands="Ryuo Tekko",ring1="Niqmaddu Ring",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc = {ammo="Falcon Eye",
		head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Mummu Jacket +2",hands="Ryuo Tekko",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet=gear.herculean_acc_feet}
	sets.engaged.Fodder = {ammo="Ginsen",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
		back="Segomo's Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Soku. Sune-Ate"}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.Acc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Patricius Ring",
		back="Segomo's Mantle",waist="Olseni Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.FullAcc.PDT = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Bhikku Cyclas +1",hands="Hesychast's Gloves +1",ring1="Defending Ring",ring2="Patricius Ring",
		back="Segomo's Mantle",waist="Olseni Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.Fodder.PDT = {ammo="Staunch Tathlum",
		head="Genmei Kabuto",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Black Belt",legs=gear.herculean_dt_legs,feet="Hippo. Socks +1"}
	sets.engaged.PDTOnly = {ammo="Ginsen",
		head="Genmei Kabuto",neck="Moonbeam Nodowa",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Hesychast's Hose +1",feet="Soku. Sune-Ate"}
	sets.engaged.SomeAcc.PDTOnly = {ammo="Ginsen",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Hes. Gloves +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Hesychast's Hose +1",feet="Soku. Sune-Ate"}
	sets.engaged.Acc.PDTOnly = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Emet Harness +1",hands="Hesychast's Gloves +1",ring1="Niqmaddu Ring",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}
	sets.engaged.FullAcc.PDTOnly = {ammo="Falcon Eye",
		head="Dampening Tam",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
		body="Emet Harness +1",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Patricius Ring",
		back="Solemnity Cape",waist="Black Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})
	sets.engaged.FullAcc.HF = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.Fodder.HF = set_combine(sets.engaged.Fodder, {})




	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.buff.Impetus = {} --body="Bhikku Cyclas +1"
	sets.buff.Footwork = {}
	
	sets.FootworkWS = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end