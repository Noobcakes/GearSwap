-- Initialization function for this job file.
 
local jobs = T{ "Misskillface_WAR_Gear",  }
 
mysets = {}
 
for k,v in pairs(jobs) do
    include(v .. '.lua')
    init_gear_sets()
	    init_gear_sets = {
	['weapons'] = {},
	['precast'] = {
		['WS'] = {},
		['JA'] = {},
	},
	['midcast'] = {},
	['idle'] = {},
	['defense'] = {},
	['buff'] = {},
	['engaged'] = {},
}
    mysets[v] = sets
    sets = {}
 end
 
 
function get_sets()
    for k,v in pairs(mysets) do sets[k] = v end
end

-- "Misskillface_WHM_Gear", "Misskillface_BLM_Gear", "Misskillface_RDM_Gear", "Misskillface_PLD_Gear", "Misskillface_DRK_Gear", "Misskillface_BST_Gear", "Misskillface_BRD_Gear", "Misskillface_RNG_Gear", "Misskillface_SAM_Gear", "Misskillface_SMN_Gear", "Misskillface_GEO_Gear", "Misskillface_BLU_Gear", "Misskillface_COR_Gear", "Misskillface_DNC_Gear", "Misskillface_DRG_Gear", "Misskillface_MNK_Gear", "Misskillface_NIN_Gear", "Misskillface_PUP_Gear", "Misskillface_RUN_Gear", "Misskillface_SCH_Gear", "Misskillface_THF_Gear"