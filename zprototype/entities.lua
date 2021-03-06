-- ------------------------------------------------------------------------------------------------
-- ---------- 基础数据 ----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

local source = SIPackers.EnergySource( SITypes.energy.electric )

-- ------------------------------------------------------------------------------------------------
-- --------- 研究球实体 ---------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

SIEXIT.labMk2Name = SIGen.NewLab( SIEXIT.labMk2Name )
.SetProperties( 5 , 5 , 600 , 2 , "320KW" , source )
.SetPluginData( 3 )
.SetCorpse( "lab-remnants" , "lab-explosion" )
.SetPluginTypes{ SITypes.moduleEffect.speed , SITypes.moduleEffect.product , SITypes.moduleEffect.consumption , SITypes.moduleEffect.pollut }
.SetCustomData{ inputs = {} }
.FillImage()
.GetCurrentEntityName()
SIEXIT.labMk2ItemName = SIGen.GetCurrentEntityItemName()

SIEXIT.labMk3Name = SIGen.NewLab( SIEXIT.labMk3Name )
.SetProperties( 7 , 7 , 1500 , 3 , "2MW" , source )
.SetPluginData( 4 )
.SetCorpse( "lab-remnants" , "lab-explosion" )
.SetPluginTypes{ SITypes.moduleEffect.speed , SITypes.moduleEffect.product , SITypes.moduleEffect.consumption , SITypes.moduleEffect.pollut }
.SetCustomData{ inputs = {} }
.FillImage()
.GetCurrentEntityName()
SIEXIT.labMk3ItemName = SIGen.GetCurrentEntityItemName()