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

keyList = { "effects" }
for k , v in pairs( SIEXIT.changedTechnology ) do
	local vanillaTechnology = SIGen.GetData( SITypes.technology , v )
	local selfTechnology = SIGen.GetData( SITypes.technology , k )
	table.insert( SIEXIT.packTechnology , k )
	for j , x in pairs( keyList ) do selfTechnology[x] = vanillaTechnology[x] end
	
	local prerequisites = table.deepcopy( vanillaTechnology.prerequisites )
	for j , x in pairs( prerequisites ) do if x ~= "space-science-pack" then table.insert( selfTechnology.prerequisites , x ) break end end
end