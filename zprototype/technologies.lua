-- ------------------------------------------------------------------------------------------------
-- ---------- 基础数据 ----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

local baseTechnologyPack =
{
	"automation-science-pack" ,
	"logistic-science-pack" ,
	"chemical-science-pack" ,
	"production-science-pack" ,
	"utility-science-pack" ,
	"space-science-pack"
}

-- ------------------------------------------------------------------------------------------------
-- ---------- 配方科技 ----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

-- 研发高级研究中心
local labMk2 = SIGen.NewTechnology( SIEXIT.labMk2Name )
.SetTechnologies{ "logistics-2" , "advanced-electronics" }
.SetCosts( { ["automation-science-pack"] = 1 , ["logistic-science-pack"] = 1 , ["chemical-science-pack"] = 1 } , 250 )
.SetSpeed( 30 )
.AddResults( SIEXIT.labMk2RecipeName )
.GetCurrentEntityName()

-- 研发超级研究中心
SIGen.NewTechnology( SIEXIT.labMk3Name )
.SetTechnologies{ "logistics-3" , "advanced-electronics-2" , "low-density-structure" , labMk2 }
.SetCosts( { ["automation-science-pack"] = 1 , ["logistic-science-pack"] = 1 , ["chemical-science-pack"] = 1 , ["production-science-pack"] = 1 } , 400 )
.SetSpeed( 30 )
.AddResults( SIEXIT.labMk3RecipeName )

-- 研发无尽科技包
SIEXIT.sciencePackTechnology = SIGen.NewTechnology( SIEXIT.sciencePackName )
.SetTechnologies{ "space-science-pack" }
.SetCosts( baseTechnologyPack , 3500 )
.AddResults( SIEXIT.sciencePackRecipeName )
.GetCurrentEntityName()

-- ------------------------------------------------------------------------------------------------
-- ---------- 生产科技 ----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

baseTechnologyPack = table.deepcopy( baseTechnologyPack )
table.insert( baseTechnologyPack , SIEXIT.sciencePackName )

SIGen

-- 添加统一图标
.Inserter.InsertIcon( 1 , SIEXIT.picturePath.."technology/infinity.png" )

-- 普通机械臂搬运数量
.NewTechnology( "inserter-size-bonus-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "inserter-capacity-bonus-7" }
.SetCosts( baseTechnologyPack , "3^(L-1)*1000" )
.AddResults( SITypes.modifier.inserterStackSizeBonus , 1 )

-- 集装箱机械臂搬运数量
.NewTechnology( "inserter-capacity-bonus-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "inserter-capacity-bonus-7" }
.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
.AddResults( SITypes.modifier.stackInserterCapacityBonus , 2 )

-- 列车制动力
.NewTechnology( "braking-force-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "braking-force-7" }
.SetCosts( baseTechnologyPack , "2^(L-1)*500" )
.AddResults( SITypes.modifier.trainBrakingForceBonus , 0.12 )

-- 无人机器人搬运数量
.NewTechnology( "worker-robots-storage-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "worker-robots-storage-3" }
.SetCosts( baseTechnologyPack , "2^(L-1)*500" )
.AddResults( SITypes.modifier.workerRobotStorage , 1 )

-- 无人机器人移动速度
.NewTechnology( "worker-robots-speed-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "worker-robots-speed-5" }
.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
.AddResults( SITypes.modifier.workerRobotSpeed , 0.55 )

-- 研究速度
.NewTechnology( "research-speed-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "research-speed-6" }
.SetCosts( baseTechnologyPack , "2^(L-1)*500" )
.AddResults( SITypes.modifier.laboratorySpeed , 0.5 )

-- 研究产能
.NewTechnology( "research-productivity-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "research-speed-6" }
.SetCosts( baseTechnologyPack , "2^(L-1)*500" )
.AddResults( SITypes.modifier.laboratoryProductivity , 0.1 )

-- 采矿产能
.NewTechnology( "mining-productivity-1" )
.SetLevel( 1 , "infinite" )
.SetTechnologies{ SIEXIT.sciencePackTechnology , "mining-productivity-3" }
.SetCosts( baseTechnologyPack , "L*3000" )
.AddResults( SITypes.modifier.miningDrillProductivityBonus , 0.1 )

-- ------------------------------------------------------------------------------------------------
-- ---------- 军事科技 ----------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------

baseTechnologyPack = table.deepcopy( baseTechnologyPack )
table.insert( baseTechnologyPack , "military-science-pack" )

-- 烈性炸药制备
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "stronger-explosives-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "stronger-explosives-7"

-- 精炼燃料制备
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "refined-flammables-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "refined-flammables-7"

-- 动能武器伤害
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "physical-projectile-damage-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "physical-projectile-damage-7"

-- 能量武器伤害
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "energy-weapons-damage-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "energy-weapons-damage-7"

-- 动能武器射速
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "weapon-shooting-speed-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "weapon-shooting-speed-6"

-- 激光武器射速
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "laser-turret-speed-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "laser-turret-speed-7"

-- 重型武器射速
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "artillery-shell-speed-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "3^(L-1)*1000" )
	.GetCurrentEntityName()
] = "artillery-shell-speed-1"

-- 重型武器射程
SIEXIT.changedTechnology[
	SIGen.NewTechnology( "artillery-shell-range-1" )
	.SetLevel( 1 , "infinite" )
	.SetCosts( baseTechnologyPack , "2^(L-1)*1000" )
	.GetCurrentEntityName()
] = "artillery-shell-range-1"

-- 清空统一图标缓存
SIGen.FinishData().Inserter.Clear()