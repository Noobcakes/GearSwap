--This is where functions go that are for all characters that you play.

function set_macro_page(set,book)
    if not tonumber(set) then
        add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
        return
    end
    if set < 1 or set > 10 then
        add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
        return
    end
    
    if book then
        if not tonumber(book) then
            add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
            return
        end
        if book < 1 or book > 40 then
            add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 40.')
            return
        end
        send_command('@input /macro book '..tostring(book)..';wait .3;input /macro set '..tostring(set))
        else
        send_command('@input /macro set '..tostring(set))
    end
end

    send_command('alias synth wait 4; input /lastsynth')
    send_command('alias cracker wait 1.5; input /item "Garlic Cracker" <t>')
    send_command('alias cracker2 wait 1.5; input /targetnpc;wait .5;input /item "Garlic Cracker" <t>')
    send_command('alias millioncorn wait 2;input /targetnpc;wait 2;tradenpc 3 millioncorn;wait 4;setkey enter;wait .2;setkey enter up')
    send_command('alias brd send @brd exec brd_buffs')
    send_command('alias mins send zonobia exec brd_min_buffs')
    ---COR/RNG Ammo settings
	ammostock = 98


---TEST SHIT---
    send_command('alias derp ord @@ terminate; wait 1; terminate')
    send_command('alias trial scripted toggle farmbot; wait 1; send @all /warp')

-- send_command('alias team1 send @others /assist '..player.name..';wait 0.5;send @others /tell '..player.name..' Targeting:    <t>;wait 1; send @brd /attack <t>; wait 1; send @brd /follow <t>')

-- send_command('alias team3 sat alltarget ;wait 0.5;send @others /tell '..player.name..' Targeting:    <t>;wait 1; sat allattack; wait 1; send @others /follow <t>')
    send_command('alias team1 sat allattack;wait 0.5;sat allattack;send @others /tell '..player.name..' Targeting: <t>; wait 1; send @others /follow <t>; wait 5; lme; wait .5; lme')

    send_command('alias brak send @others /tell '..player.name..' Targeting: <t> ' )
--  BrdGeoDebuff
send_command('alias team2 sat alltarget; sat youattack @cor;sat youattack @brd;send @others /tell '..player.name..' Targeting: <t>; wait 1; send @cor /follow <t>; send @brd /follow <t>; wait 5; lme; wait .5; lme')


---INVITE SHIT --------
    send_command('alias addm input /pcmd add Misskillface')
    send_command('alias addb input /pcmd add Bazookatooth')
    send_command('alias addd input /pcmd add Discreetskeet')
    send_command('alias addz input /pcmd add Zonobia')
    send_command('alias addy input /pcmd add Funcrusher')
    send_command('alias addk input /pcmd add Kaht')
    send_command('alias adde input /pcmd add Elli')
    send_command('alias addp input /pcmd add Paoja')
    send_command('alias adddier input /pcmd add Dierdren')
    send_command('alias addmuf input /pcmd add Muffintops')
    send_command('alias addf input /pcmd add Faithfulx')
    send_command('alias addg input /pcmd add genoside')

    send_command('alias addall input /pcmd add Bazookatooth; wait .1; input /pcmd add Funcrusher; wait .1; input /pcmd add Zonobia; wait .1; input /pcmd add Misskillface;wait .1;') --  input /pcmd add Discreetskeet;
    send_command('alias addmine  addb; wait 2; addy; wait 2; addm') --  wait 2; addd; wait 2; addg;
    send_command('alias addkahts addb; wait 2; addy; wait 2; addm;  wait 2; addk; wait 2; addz') -- wait 2; addd;

    --- Leader
    send_command('alias passlead send @others /pcmd leader '..player.name..' ')
    
---KAHT'S FOLLOW SHIT---
    -- send_command('bind ^f send @others /follow '..player.name..';wait 0.5;send @all /echo *** Follow on. ***')
    -- send_command('bind !f send @others setkey numpad7 down;wait 0.1;send @others setkey numpad7 up;wait 0.5;send @all /echo === Follow off. ===')

---MY FOLLOW SHIT ---
    send_command('bind ^f ord oo input /follow '..player.name..';wait 0.5;ord z input /echo *** Follow on. ***')
    send_command('bind !f ord oo setkey numpad7 down;wait 0.1;ord oo setkey numpad7 up;wait 0.5;ord z input /echo === Follow off. ===')
    send_command('alias fme ord oo input /follow '..player.name..';wait 0.5;ord z input /echo *** Follow on. ***')
    send_command('alias lme ord oo setkey numpad7 down;wait 0.1;ord oo setkey numpad7 up;wait 0.5;ord z input /echo === Follow off. ===')

    -- send_command('allias follow input /follow')
    -- send_command('bind ^f send @others input /follow '..player.name..';wait 0.5;send @all input /echo *** Follow on. ***')
    -- send_command('bind !f send @others setkey numpad7 down;wait 0.1;send @others setkey numpad7 up;wait 0.5;send @all input /echo === Follow off. ===')
    -- send_command('alias fme send @others input /follow '..player.name..';wait 0.5;send @all input /echo *** Follow on. ***')
    -- send_command('alias lme send @others setkey numpad7 down;wait 0.1;send @others setkey numpad7 up;wait 0.5;send @all input /echo === Follow off. ===')
    
---SPECIFIC FOLLOW SHIT ---

    send_command('alias lmages send @brd setkey numpad7 down;wait 0.1;send @brd setkey numpad7 up; wait 0.1;send @geo setkey numpad7 down;wait 0.1;send @geo setkey numpad7 up;wait 0.1;send @whm setkey numpad7 down;wait 0.1;send @whm setkey numpad7 up;wait 0.1;send @sch setkey numpad7 down;wait 0.1;send @sch setkey numpad7 up;wait 0.1;send @cor setkey numpad7 down;wait 0.1;send @cor setkey numpad7 up')
    send_command('alias lmeall send @all setkey numpad7 down;wait 0.1;send @all setkey numpad7 up;wait 0.5;send @all /echo === Follow off. ===')

    send_command('alias dmme dall input /follow '..player.name..';wait 0.5;dall input /echo *** Follow on. ***')
    send_command('alias sheep dall lua l herd ;wait 2; herd shepherd; wait 0.5;send @all /echo *** Shepherd on. ***')
    send_command('alias wolves send @others setkey numpad7 down;wait 0.1;send @others setkey numpad7 up;dall lua u herd;wait 0.5;send @all /echo === Follow off. ===')


    send_command('alias wall send @all /warp')
    send_command('alias pwall ord pp /warp')

    send_command('alias ol12 ord rr* /assist '..player.name..';wait 1.5;dall input /echo *** targeting <t>. ***')

---ROLLS
    send_command('alias french send @cor //roller roll')

--Treasury Stuff
    send_command('alias pass send @others //tr passall')
    send_command('alias piss send @all //tr passall')
    send_command('alias lot input //tr lotall')
    send_command('alias eltee send @all lua l treasury')

---MOUNT STUFF
    send_command('alias crabs ord rr mr')
    send_command('bind @m ord rr mr')
    send_command('alias walk ord rr /dismount')
    send_command('alias bsnk send bazookatooth /sneak misskillface; wait 6; send bazookatooth /invisible misskillface; wait 6; send bazookatooth /sneak <me>; wait 6; send bazookatooth /invisible <me>; ')

---WARP PARTY //d2X
    send_command('alias d21 input /warp2 <p1>; wait 8; input /warp <me>; ')
    send_command('alias d22 input /warp2 <p1>; wait 8; input /warp2 <p2>; wait 8; input /warp <me>; ')
    send_command('alias d23 input /warp2 <p1>; wait 8; input /warp2 <p2>; wait 8; input /warp2 <p3>; wait 8; input /warp <me>; ')
    send_command('alias d24 input /warp2 <p1>; wait 8; input /warp2 <p2>; wait 8; input /warp2 <p3>; wait 8; input /warp2 <p4>; wait 8; input /warp <me>; ')
    send_command('alias d25 input /warp2 <p1>; wait 8; input /warp2 <p2>; wait 8; input /warp2 <p3>; wait 8; input /warp2 <p4>; wait 8; input /warp2 <p5>; wait 8; input /warp <me>; ')
--Reisen Warps etc.
    ---All Warps
    send_command('alias alldem ord @@ gs c useitem ring1 "Dim. Ring (Dem)" ')
    send_command('alias allmea ord @@ gs c useitem ring1 "Dim. Ring (mea)" ')
    send_command('alias allholla ord @@ gs c useitem ring1 "Dim. Ring (holla)" ')
    ---Party Warps
    send_command('alias pdem ord pp gs c useitem ring1 "Dim. Ring (Dem)" ')
    send_command('alias pmea ord pp gs c useitem ring1 "Dim. Ring (mea)" ')
    send_command('alias pholla ord pp gs c useitem ring1 "Dim. Ring (holla)" ')
    ---Solo warps
    send_command('alias medem gs c useitem ring1 "Dim. Ring (Dem)" ')
    send_command('alias memea gs c useitem ring1 "Dim. Ring (mea)" ')
    send_command('alias meholla gs c useitem ring1 "Dim. Ring (holla)" ')
    -- esccha/abby enter things
    send_command('alias abe ab enter')
    send_command('alias aabe ab all enter')
    send_command('alias ewe ew enter')
    send_command('alias aewe ew all enter')
    send_command('alias dom ew domain')
    

---SNEAK/INVIS PARTY //sipx

    send_command('alias gsnk send @geo /sneak <tid>;')
    send_command('alias ginv send @geo /invisible <tid>;')
    
    send_command('alias rakasnk send @others /sneak <meid>; wait 5; send @geo /invisible <meid>; wait 5; send @others /sneak <me>; wait 6; send @others /invisible <me>')

    send_command('alias sall send @all /sneak <me>')
    send_command('alias iall send @all /invisible <me>')
    send_command('alias ciall send @all //cancel 69')
    send_command('alias csall send @all //cancel 71')

---GEO BUBBLES
	send_command('alias bahh send @geo gs c autoindi haste')
	send_command('alias hfrw send @geo gs c autoindi haste; wait 1; send @geo gs c autogeo frailty; wait 1; send @geo gs c autoentrust wilt; wait 0.5;send @all input /echo === Indi-Haste | Geo-Frailty | Entrust Indi-Wilt ===')
	
	send_command('alias hfew send @geo gs c autoindi haste; wait 1; send @geo gs c autogeo Fend; wait 1; send @geo gs c autoentrust wilt; wait 0.5;send @all input /echo === Indi-Haste | Geo-Fend | Entrust Indi-Wilt ===')
	
	send_command('alias ffed send @geo gs c autoindi Fury; wait 1; send @geo gs c autogeo Frailty; wait 1; send @geo gs c autoentrust Wilt; wait 0.5;send @all input /echo === Indi-Fury | Geo-Frailty | Entrust Indi-Wilt ===')
	
	send_command('alias bfestr send @geo gs c autoindi Fury; wait 1; send @geo gs c autogeo Barrier; wait 1; send @geo gs c autoentrust STR; wait 0.5;send @all input /echo === Indi-Fury | Geo-Barrier | Entrust Indi-STR ===')


--- ALL TYPES O' BUFFS N SHIT
	send_command('alias kill send @others /assist '..player.name..';wait 0.5;send @brd /attack <t>;wait 0.5;send @brd gs c set Autowsmode On')

--- makes DDs run in and attack
    -- send_command('alias godds sat alltarget; wait 1; exec DDsAttack; wait 0.1; exec DDsAproach; wait 3; send @all sat stop')
    -- send_command('alias godds sao simp Misskillface; wait 2.1; send @others gs c facemob <tid>; wait 0.1;send @others react runto 2.6;')
    -- send_command('alias godds sat youattack @others; wait 1; send @others gs c facemob <tid>; wait 0.1;send @others react runto 3;')

    -- send_command('alias stopdds sat alltarget; wait 1; exec DDsAttack; wait 0.1; exec DDsAproach; wait 3; send @all sat stop')
    send_command('alias bat exec battack')
    send_command('alias fat exec fattack')
    send_command('alias mat exec mattack')
    send_command('alias gerp sat youtarget bazookatooth; wait 2; send bazookatooth react runaway 10')


    send_command('alias pns send @whm /ma "protectra V" <me>; wait 6; send @whm /ma "Shellra V" <me> ')
    send_command('alias pss send @whm /ma "protect V" '..player.name..'; wait 6; send @whm /ma "Shell V" '..player.name..' ')

    send_command('alias mall sta @others /target')
    send_command('alias tall sat alltarget')


    send_command('alias savbrd send @brd gs c set unlockweapons on; send @brd gs c set weapons Naegling; send @brd gs c set autowsmode on')


--- Cures yo
    send_command('alias cme send @whm gs c smartcure '..player.name..'; wait 0.1; send @brd gs c smartcure '..player.name..'; wait 0.1; send @geo gs c smartcure '..player.name..'; wait 0.1; send @sch gs c smartcure '..player.name..' wait 0.1; send @rdm gs c smartcure '..player.name..'  ')

    send_command('alias cm3 send @geo gs c smartcure '..player.name..' ')


--- EIJIN ALIAS STUFF ---
--SEND Shortcuts
	send_command('alias sa send @all')
	send_command('alias sac send @all gs c')
	send_command('alias sas send @all exec')
	send_command('alias sao send @others')
	send_command('alias sab send Bazookatooth')
	send_command('alias sabe send Bazookatooth exec')
	send_command('alias sabg send Bazookatooth gs c')
	send_command('alias saf send Funcrusher')
	send_command('alias safe Funcrusher exec')
	send_command('alias safg Funcrusher gs c')
	send_command('alias saw send @whm')
    -- Dia 2 target
    send_command('alias db2 send Bazookatooth /ma "Dia II" <tid>')
    send_command('alias df2 send Funcrusher /ma "Dia II" <tid>')


--------Random SHIT
	send_command('alias show gs c showset ')
	send_command('alias showe gs c showset sets.engaged')
	send_command('alias unshow gs enable all')
	send_command('alias rhot lua r xivhotbar')
    send_command('alias cy gs c cycle')


--- COR SHIT ---
	send_command('alias bolt send @cor /boltersroll')
	send_command('alias dubs send @cor /doubleup')
	send_command('alias snake send @cor /snakeeye')
	send_command('alias randy send @cor /randomdeal')
	send_command('alias wild send @cor /wildcard')

---ROLLS
	send_command('alias french send @all //roller roll')

---RANDOM SHIT ---
	send_command('alias stats input /checkparam <me>')
	send_command('alias naked gs c naked')
	send_command('alias npc dall input /target <stnpc>')
	send_command('alias undress dall lua unload dressup')
	send_command('alias dress dall lua load dressup')
    send_command('alias unlock gs c set unlockweapons on')
    send_command('alias lock gs c set unlockweapons off')
	

	send_command('alias c3test send @drk gs c naked; wait 1; send @drk gs c showset sets.midcast[\'Dread Spikes\']; wait 3; input /c3 misskillface')

	send_command('alias 012 send @others gs c odb')
	send_command('alias sublime gs c autofood Sublime Sushi; wait 0.3; gs c cycle autofoodmode')
	send_command('alias omelette gs c autofood Omelette Sandwich; wait 0.3; gs c cycle autofoodmode')

---TEMP ITEM USEAGE
	send_command('alias use gs c useitem item ')
	send_command('alias charm dall cbuffer')
	send_command('alias cbuffer gs c useitem item Lucid Wings II') --"Charm Buffer"


 --- Misc. Binds and alias stuff
	send_command('alias repo send misskillface exec logins/reposition')
    send_command('bind @w gs c cycle SkipProcWeapons')
    send_command('alias frd1 config FrameRateDivisor 1')
    send_command('alias frd2 config FrameRateDivisor 2')




-- send_command('alias pholla ord pp gs c useitem ring1 "Dim. Ring (holla)" ')

    -- -- Should transition these slot maps to be based off res.slots, but it's very unlikely to change.
-- default_slot_map = T{'sub','range','ammo','head','neck','left_ear','right_ear','body','hands','left_ring', 'right_ring','back','waist','legs','feet'}
-- default_slot_map[0]= 'main'

    -- -- Should transition these slot maps to be based off res.slots, but it's very unlikely to change.
-- default_slot_map = T{'sub','range','ammo','head','body','hands','legs','feet','neck','waist',
    -- 'left_ear', 'right_ear', 'left_ring', 'right_ring','back'}
-- default_slot_map[0]= 'main'

-- function handle_weapons(cmdParams)
	-- local weaponSet
	-- if type(cmdParams) == 'string' then
		-- weaponSet = cmdParams
	-- elseif type(cmdParams) == 'table' then
		-- weaponSet = cmdParams[1]
	-- end
	-- if weaponSet == nil then
		-- if sets.weapons[state.Weapons.value] then
			-- equip_weaponset(state.Weapons.value)
		-- elseif state.Weapons.value == 'None' then
			-- enable('main','sub','range','ammo')
		-- end
	-- elseif weaponSet:lower() == 'default' then
		-- if (player.sub_job == 'DNC' or player.sub_job == 'NIN') and state.Weapons:contains('DualWeapons') and sets.weapons.DualWeapons then
			-- if state.Weapons.value ~= 'DualWeapons' then
				-- state.Weapons:set('DualWeapons')
			-- end
			-- equip_weaponset('DualWeapons')
		-- else
			-- state.Weapons:reset()
			-- if sets.weapons[state.Weapons.value] then
				-- equip_weaponset(state.Weapons.value)
			-- elseif state.Weapons.value == 'None' then
				-- enable('main','sub','range','ammo')
			-- end
		-- end
	-- elseif sets.weapons[weaponSet] then
		-- if state.Weapons:contains(weaponSet) and state.Weapons.value ~= weaponSet then
			-- state.Weapons:set(weaponSet)
		-- end
		-- equip_weaponset(weaponSet)
	-- elseif weaponSet:lower() == 'none' then
		-- if state.Weapons:contains('None') then
			-- enable('main','sub','range','ammo')
			-- state.Weapons:set('None')
		-- end
	-- else
		-- if sets.weapons[state.Weapons.value] then
			-- equip_weaponset(state.Weapons.value)
		-- end
		-- add_to_chat(123,"Error: A weapons set for ["..weaponSet.."] does not exist.")
	-- end

	-- if autows_list[state.Weapons.value] then
		-- autows = autows_list[state.Weapons.value]
		-- -- autowstp = autowstp_list[state.Weapons.value]
	-- end
	-- if autowstp_list[state.Weapons.value] then
		-- autowstp = autowstp_list[state.Weapons.value]
		-- -- windower.send_command('gs c set autows tp '..autowstp.value..' ')
	-- end
		
	-- if state.DisplayMode.value then update_job_states()	end
-- end

-- <<<<<<< Updated upstream
--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
send_command('bind @pause gs c cycle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.

NotifyBuffs = S{'doom','petrification'}
-- =======

-- >>>>>>> Stashed changes
