-- ------------------------------------------------------------------------------------------------
-- ------ 调整研究中心数据 ------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

local vanillaLab = SIGen.GetData( SITypes.entity.lab , "lab" )
local inputs = vanillaLab.inputs
table.insert( inputs , SIEXIT.sciencePackName )
local labMk2 = SIGen.GetData( SITypes.entity.lab , SIEXIT.labMk2Name )
local labMk3 = SIGen.GetData( SITypes.entity.lab , SIEXIT.labMk3Name )
labMk2.inputs = table.deepcopy( inputs )
labMk3.inputs = table.deepcopy( inputs )
local keyList = { "damaged_trigger_effect" , "working_sound" , "vehicle_impact_sound" , "open_sound" , "close_sound" }
for i , v in pairs( keyList ) do
	labMk2[v] = vanillaLab[v]
	labMk3[v] = vanillaLab[v]
end

-- ------------------------------------------------------------------------------------------------
-- ------- 调整研究包数据 -------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

local vanillaSpacePack = SIGen.GetData( SITypes.item.tool , "space-science-pack" )
local infinityPack = SIGen.GetData( SITypes.item.tool , SIEXIT.sciencePackName )
keyList = { "durability" , "durability_description_key" , "durability_description_value" }
for i , v in pairs( keyList ) do infinityPack[v] = vanillaSpacePack[v] end

-- ------------------------------------------------------------------------------------------------
-- ------ 调整研究项目数据 ------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

keyList = { "prerequisites" , "effects" }
for k , v in pairs( SIEXIT.changedTechnology ) do
	local vanillaTechnology = SIGen.GetData( SITypes.technology , v )
	local selfTechnology = SIGen.GetData( SITypes.technology , k )
	for j , x in pairs( keyList ) do selfTechnology[x] = vanillaTechnology[x] end
	
	selfTechnology.prerequisites = table.deepcopy( selfTechnology.prerequisites )
	for j , x in pairs( selfTechnology.prerequisites ) do if x == "space-science-pack" then table.remove( selfTechnology.prerequisites , j ) break end end
	table.insert( selfTechnology.prerequisites , SIEXIT.sciencePackTechnology )
end