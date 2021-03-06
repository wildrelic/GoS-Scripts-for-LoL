if GetObjectName(GetMyHero()) ~= "Jayce" then return end
PrintChat(string.format("<font color='#80F5F5'>MonTour Jayce:</font> <font color='#EFF0F0'>loaded by MarCiii!</font>"))
PrintChat(string.format("<font color='#80F5F5'>Reworked Version:</font> <font color='#EFF0F0'>1.0.0.1</font>"))
PrintChat(string.format("<font color='#80F5F5'>Credits to:</font> <font color='#EFF0F0'>Platypus Jayce Version</font>"))
PrintChat(string.format("<font color='#80F5F5'>Credits to:</font> <font color='#EFF0F0'> Deftsu for ItemsUse Code</font>"))
  spellData = 
	{
	QG ={name = "jayceshockblast", 
			windup = 0.214,
			dmg = function () return 20 + 50*GetCastLevel(myHero,_Q) + 1.2*GetBonusDmg(myHero) end, 
			range = 1100, 
			rangeAcc = 1750,
			mana = function () return 50 + 5*GetCastLevel(myHero,_Q) end,
			speed = 1450,
			speedAcc = 2350,
			width = 70,
			CD = function () return 8000 * (1+GetCDR(myHero)) end,
			up = 0},
	WG ={name = "jaycehypercharge",
			windup = 0.125,
			windup2 = 0.080,
			dmg = function () return 0.6*(GetBaseDamage(myHero)+GetBonusDmg(myHero)) + 0.08*GetCastLevel(myHero,_W)*(GetBaseDamage(myHero)+GetBonusDmg(myHero)) end, 
			range = 500, 
			mana = 40,
			CD = function () return (13000 - 1600*GetCastLevel(myHero,_W)) * (1+GetCDR(myHero)) end,
			up = 0},
	EG ={name = "jayceaccelerationgate",
			windup = 0.250, 
			range = 0, 
			mana = 30,
			CD = function () return 16000 * (1+GetCDR(myHero)) end,
			up = 0},
	RG ={name = "jaycestancegth", 
			windup = 0.125,
			CD = function () return 6000 * (1+GetCDR(myHero))end,
			up = 0},
	QH ={name = "JayceToTheSkies",
			windup = 0.125,
			dmg = function () return 40*GetCastLevel(myHero,_Q) + GetBonusDmg(myHero) - 10 end,
			mana = function () return 40 + 5*GetCastLevel(myHero,_Q) end,
			range = 600,
			CD = function () return (18000 - 2000*GetCastLevel(myHero,_Q)) * (1+GetCDR(myHero)) end,
			up = 0},
	WH ={name = "JayceStaticField",
			windup = 0,
			dmg = function () return 40 + 60*GetCastLevel(myHero,_Q) + GetBonusAP(myHero) end,
			mana = 40,
			range = 300,
			CD = function () return 10000 * (1+GetCDR(myHero)) end,
			up = 0},
	EH = {name = "JayceThunderingBlow",
			windup = 0.250,
			dmg = function (unit) return 10 + 30*GetCastLevel(myHero,_Q) + GetBonusDmg(myHero) + 0.2*GetMaxHP(unit)end,
			mana = 40,
			range = 300,
			knockback = 250,
			CD = function () return (16000 - 1000*GetCastLevel(myHero,_E)) * (1+GetCDR(myHero)) end,
			up = 0},
	RH ={name = "JayceStanceHtG",
			windup = 0.125,
			CD = function () return 6000 * (1+GetCDR(myHero)) end,
			up = 0},
	PH ={dmg = function () return 40*GetCastLevel(myHero,_R)-20 end,
			up = 0}
	}
local Jayce = MenuConfig("Jayce", "Jayce")
Jayce:SubMenu("Combo", "Combo")
Jayce.Combo:Boolean("QG", "Use Gun-Q", true)
Jayce.Combo:Boolean("QH", "Use Hammer-Q", true)
Jayce.Combo:Boolean("WG", "Use Gun-W", true)
Jayce.Combo:Boolean("WH", "Use Hammer-W", true)
Jayce.Combo:Boolean("EG", "Use Gun-E", true)
Jayce.Combo:Boolean("EH", "Use Hammer-E", true)
Jayce.Combo:Boolean("RG", "Use Gun-R", true)
Jayce.Combo:Boolean("RH", "Use Hammer-R", true)
Jayce:SubMenu("Items", "Items")
Jayce.Items:Info("Jayce", "Only in Combo and Harass")
Jayce.Items:Boolean("Ignite","AutoIgnite if OOR",true)
Jayce.Items:Boolean("CutBlade", "Bilgewater Cutlass", true)  
Jayce.Items:Slider("CutBlademyhp", "if My Health < x%", 50, 5, 100, 1)
Jayce.Items:Slider("CutBladeehp", "if Enemy Health < x%", 20, 5, 100, 1)
Jayce.Items:Info("Jayce", " ")
Jayce.Items:Boolean("bork", "Blade of the Ruined King", true)
Jayce.Items:Slider("borkmyhp", "if My Health < x%", 50, 5, 100, 1)
Jayce.Items:Slider("borkehp", "if Enemy Health < x%", 20, 5, 100, 1)
Jayce.Items:Info("Jayce", " ")
Jayce.Items:Boolean("ghostblade", "Youmuu's Ghostblade", true)
Jayce.Items:Slider("ghostbladeR", "If Enemy in Range (def: 600)", 600, 100, 2000, 1)
Jayce.Items:Info("Jayce", " ")
Jayce.Items:Boolean("useRedPot", "Elixir of Wrath(REDPOT)", true)
Jayce.Items:Slider("useRedPotR", "If Enemy in Range (def: 600)", 600, 100, 2000, 1)
Jayce.Items:Info("Jayce", " ")
Jayce.Items:Info("Jayce", "Only on Hammertime!")
Jayce.Items:Boolean("useTiamat", "Tiamat", true)
Jayce.Items:Boolean("useHydra", "Hydra", true)
Jayce.Items:Info("Jayce", " ")
Jayce.Items:Boolean("QSS", "Always Use QSS", true)
Jayce.Items:Slider("QSSHP", "if My Health < x%", 75, 0, 100, 1)
--Jayce:SubMenu("LH", "LastHit")
--Jayce.LH:Boolean("W", "Use W Gun LastHit", true)
Jayce:SubMenu("Draw", "Draw")
Jayce.Draw:Boolean("Draw", "Draw selected", true)
Jayce.Draw:Boolean("QG", "Draw Gun-Q", true)
Jayce.Draw:Boolean("QH", "Draw Hammer-Q", true)
Jayce.Draw:Boolean("WG", "Draw Gun-W", true)
Jayce.Draw:Boolean("WH", "Draw Hammer-W", true)
Jayce.Draw:Boolean("EG", "Draw Gun-E", true)
Jayce.Draw:Boolean("EH", "Draw Hammer-E", true)
Jayce.Draw:Info("Jayce", " ")
Jayce.Draw:Boolean("CD", "Draw Cooldowns", true)
Jayce.Draw:Slider("MGUNSIZE", "CD Text Size", 25, 5, 60, 1)
Jayce.Draw:Slider("MGUNX", "CD X POS", 10, 0, 1600, 1)
Jayce.Draw:Slider("MGUNY", "CD Y POS", 400, 0, 1055, 1)
Jayce:SubMenu("KS", "Killsteal")
Jayce.KS:Boolean("KS", "Killsteal", true)
targetsselect = TargetSelector(spellData.QG.rangeAcc, TARGET_LESS_CAST, DAMAGE_PHYSICAL)
Jayce:TargetSelector("ts", "TargetSelector", targetsselect)

OnTick(function(myHero)
	Checks()
  ItemUse()
 -- Ignite()
  if Jayce.Draw.CD:Value() then
    CDs()
  end
	if Jayce.Draw.Draw:Value() then
		Draws()
	end
	if Jayce.KS.KS:Value() then
		Killsteal()
	end
	if IOW:Mode() == "Combo" then
		Combo()
	end
	if IOW:Mode() == "Harass" then
		Harass()
	end
--  if IOW:Mode() == "LastHit" then
--		LastHit(minion)OnDraw
--	end
end)

OnDraw(function(myHero)
  if Jayce.Draw.CD:Value() then
    CDs()
  end
	if Jayce.Draw.Draw:Value() then
		Draws()
	end
end)


function Checks()
	QREADY = CanUseSpell(myHero,_Q) == READY
	WREADY = CanUseSpell(myHero,_W) == READY
	EREADY = CanUseSpell(myHero,_E) == READY
	RREADY = CanUseSpell(myHero,_R) == READY
  target = Jayce.ts:GetTarget()
  --target = GetCurrentTarget()
	targetPos = GetOrigin(target)
	--myHeroPos = GetOrigin(myHero)
	rangedPassive = GotBuff(myHero,"jaycepassiverangedattack")
	meleePassive = GotBuff(myHero,"jaycepassivemeleeattack")
	HammerTime = GetCastName(myHero,_R) == "JayceStanceHtG"
  Jayce.ts.range = spellData.QG.rangeAcc
end

--function LastHit(minion)
--    --  Move()
--    for i,minion in pairs(GetAllMinions(MINION_ENEMY)) do
--      local WGDmg = spellData.WG.dmg() or 0
--      local Alldmg = GetBonusDmg(myHero)+GetBaseDamage(myHero)
--      local DamageWG = CalcDamage(myHero, minion, WGDmg, 0)
--      local  targetPos123 = GetOrigin(minion) 
--      if GetCurrentHP(minion) < DamageWG and Jayce.LH.W:Value() then --and Alldmg > GetCurrentHP(minion)
--        if WREADY and not HammerTime and IsInDistance(minion, GetRange(myHero)) and ValidTarget(minion, GetRange(myHero)) then			
--				CastSpell(_W) DelayAction(function() IOW:DisableAutoAttacks() DelayAction(function() AttackUnitM(minion) DelayAction(function() AttackUnitM(minion) DelayAction(function() AttackUnitM(minion) DelayAction(function() IOW:EnableAutoAttacks() end, 1) end, 270) end, 270) end, 270) end, 700)
--        end
--      end
--    end
--end

--function AttackUnitM(minion)
--	for i,minion in pairs(GetAllMinions(MINION_ENEMY)) do  
--  if IsInDistance(minion, GetRange(myHero)) and GetDistance(myHero, minion) <= (GetRange(myHero)) and GetDistance(myHero, minion) >= 1 then 
--    AttackUnit(minion)
--  end
--  end
--end

function Ignite()
  for _, unit in pairs(GetEnemyHeroes()) do
    if ValidTarget(unit, 700) and Ignite and Jayce.Items.Ignite:Value() and GetDistance(unit) > 450 then 
            if CanUseSpell(GetMyHero(), Ignite) == READY and (20*GetLevel(GetMyHero())+50) > GetCurrentHP(unit)+GetHPRegen(unit)*2.5 and GetDistanceSqr(GetOrigin(unit)) < 600*600 then
                CastTargetSpell(unit, Ignite)
            end
        end
     end     
end

function CDs()
	--CD
	local c = 0
	for _, d in pairs(spellData) do
		local rcd = (d.up-GetTickCount())/1000
		local rcd = rcd > 0 and rcd or 0
		DrawText(_..": "..math.ceil(rcd),Jayce.Draw.MGUNSIZE:Value(),Jayce.Draw.MGUNX:Value(),Jayce.Draw.MGUNY:Value()+c*25,0xffff9999)
		c = c + 1
	end
end  

function Draws()
	--Q
	if QREADY and HammerTime and Jayce.Draw.QH:Value() then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QH.range,1,150,ARGB(0xff,255,247,0))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QG.range,0,150,ARGB(50,200,200,255))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QG.rangeAcc,0,150,ARGB(50,200,200,255))
	elseif QREADY and not HammerTime and Jayce.Draw.QG:Value() then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QG.range,1,150,ARGB(0xff,200,200,255))
			if EREADY then
				DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QG.rangeAcc,1,150,ARGB(0xff,200,200,255))
			end
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.QH.range,0,150,ARGB(50,255,247,0))
	end
	--W
	if WREADY and HammerTime and Jayce.Draw.WH:Value() then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.WH.range,1,150,ARGB(0xff,255,247,0))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.WG.range,0,150,ARGB(50,200,200,255))
	elseif WREADY and not HammerTime and Jayce.Draw.WG:Value() then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.WH.range,1,150,ARGB(50,255,247,0))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.WG.range,0,150,ARGB(0xff,200,200,255))
	end
	--E
	if EREADY and HammerTime and Jayce.Draw.EH:Value()then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.EH.range,1,150,ARGB(0xff,255,247,0))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.EG.range,0,150,ARGB(50,200,200,255))
	elseif EREADY and not HammerTime and Jayce.Draw.EG:Value() then
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.EH.range,0,150,ARGB(50,255,247,0))
		DrawCircle(GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z,spellData.EG.range,1,150,ARGB(0xff,200,200,255))
	end
end

function ItemUse()
  for _,target in pairs(GetEnemyHeroes()) do
  	if GetItemSlot(myHero,3153) > 0 and Jayce.Items.bork:Value() and ValidTarget(target, 550) and HammerTime and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") and GetCurrentHP(myHero)/GetMaxHP(myHero) < (Jayce.Items.borkmyhp:Value()/100) and GetCurrentHP(target)/GetMaxHP(target) > (Jayce.Items.borkehp:Value()/100) then
        CastTargetSpell(target, GetItemSlot(myHero,3153)) --bork
        end

        if GetItemSlot(myHero,3144) > 0 and Jayce.Items.CutBlade:Value() and ValidTarget(target, 550) and HammerTime and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") and GetCurrentHP(myHero)/GetMaxHP(myHero) < (Jayce.Items.CutBlademyhp:Value()/100) and GetCurrentHP(target)/GetMaxHP(target) > (Jayce.Items.CutBladeehp:Value()/100) then 
        CastTargetSpell(target, GetItemSlot(myHero,3144)) --CutBlade
        end

        if GetItemSlot(myHero,3142) > 0 and Jayce.Items.ghostblade:Value() and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") and ValidTarget(target, Jayce.Items.ghostbladeR:Value()) then --ghostblade
        CastTargetSpell(myHero, GetItemSlot(myHero,3142))
        end
		
	if GetItemSlot(myHero,3140) > 0 and Jayce.Items.QSS:Value() and GotBuff(myHero, "rocketgrab2") > 0 or GotBuff(myHero, "charm") > 0 or GotBuff(myHero, "fear") > 0 or GotBuff(myHero, "flee") > 0 or GotBuff(myHero, "snare") > 0 or GotBuff(myHero, "taunt") > 0 or GotBuff(myHero, "suppression") > 0 or GotBuff(myHero, "stun") > 0 or GotBuff(myHero, "zedultexecute") > 0 or GotBuff(myHero, "summonerexhaust") > 0 and 100*GetCurrentHP(myHero)/GetMaxHP(myHero) < Jayce.Items.QSSHP:Value() then
        CastTargetSpell(myHero, GetItemSlot(myHero,3140))
        end

        if GetItemSlot(myHero,3139) > 0 and Jayce.Items.QSS:Value() and GotBuff(myHero, "rocketgrab2") > 0 or GotBuff(myHero, "charm") > 0 or GotBuff(myHero, "fear") > 0 or GotBuff(myHero, "flee") > 0 or GotBuff(myHero, "snare") > 0 or GotBuff(myHero, "taunt") > 0 or GotBuff(myHero, "suppression") > 0 or GotBuff(myHero, "stun") > 0 or GotBuff(myHero, "zedultexecute") > 0 or GotBuff(myHero, "summonerexhaust") > 0 and 100*GetCurrentHP(myHero)/GetMaxHP(myHero) < Jayce.Items.QSSHP:Value() then
        CastTargetSpell(myHero, GetItemSlot(myHero,3139))
      end
   
     if Jayce.Items.useRedPot:Value() and GetItemSlot(myHero,2140) >= 1 and ValidTarget(target,Jayce.Items.useRedPotR:Value()) and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") then --redpot
        if CanUseSpell(myHero,GetItemSlot(myHero,2140)) == READY then
          CastSpell(GetItemSlot(myHero,2140))
        end
      end
         if Jayce.Items.useTiamat:Value() and GetItemSlot(myHero, 3077) >= 1 and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") and ValidTarget(target, 550) and HammerTime then --tiamat
        if GetDistance(target) < 400 then
         CastTargetSpell(myHero, GetItemSlot(myHero, 3077))
        end 
        end
    if Jayce.Items.useHydra:Value() and GetItemSlot(myHero, 3074) >= 1 and (IOW:Mode() == "Combo" or IOW:Mode() == "Harass") and ValidTarget(target, 550) and HammerTime then --hydra
      if GetDistance(target) < 385 then
        CastTargetSpell(myHero, GetItemSlot(myHero, 3074))
      end
    end
      end
end      
  

function CastQH(unit)
	if HammerTime and QREADY and Jayce.Combo.QH:Value() then
		CastTargetSpell(unit,_Q)
	end
end

function CastQGAcc(unit)
	if not HammerTime and QREADY and Jayce.Combo.QG:Value() then
		local unitPos = GetOrigin(unit)
		if ValidTarget(unit,spellData.QG.rangeAcc) and EREADY and Jayce.Combo.QG:Value() then
			local QAccPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),spellData.QG.speedAcc,spellData.QG.windup,spellData.QG.rangeAcc, spellData.QG.width, true, true)
			if QREADY and QAccPred.HitChance == 1 then
				CastSkillShot(_Q,QAccPred.PredPos.x,QAccPred.PredPos.y,QAccPred.PredPos.z) 
				return true
			end 
			return false 
		end
	end
end

function CastQG(unit)
	if not HammerTime and spellData.QG.up <= GetTickCount() and Jayce.Combo.QG:Value() then
		local unitPos = GetOrigin(unit)
		if ValidTarget(unit,spellData.QG.range) and spellData.EG.up >= GetTickCount() and Jayce.Combo.QG:Value() then
			local QPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),spellData.QG.speed,spellData.QG.windup,spellData.QG.range, spellData.QG.width, true, true)
			if QREADY and QPred.HitChance == 1 then
				CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
		end
	end
end

function CastKnockQ(unit)
	local unitPos = GetOrigin(unit)
	CastSkillShot(_Q,unitPos.x,unitPos.y,unitPos.z)
end

function CastQGEG(unit)
	if ValidTarget(unit,spellData.QG.rangeAcc) and QREADY and EREADY and not HammerTime then
		if CastQGAcc(unit) then
			DelayAction(function() CastEG(unit) end,250)
		end
	end
end

function CastEHRHQGEG(unit)
	if ValidTarget(unit,spellData.EH.range) and QREADY and EREADY and RREADY and HammerTime then
		CastEH(unit) DelayAction(function() CastRH() DelayAction(function() CastEG(unit) DelayAction(function() CastKnockQ(unit) end, 250) end, 125) end, 125)
	end
end

function CastWH()
	if HammerTime and WREADY and Jayce.Combo.WH:Value() then
		CastSpell(_W)
	end
end

function CastWG()
	if not HammerTime and WREADY and Jayce.Combo.WG:Value() then
		CastSpell(_W)
	end
end

function CastEH(unit)
	if HammerTime and EREADY and Jayce.Combo.EH:Value() then
		CastTargetSpell(unit,_E)
		return true
	end
	return false
end

function CastEG(unit)
	if not HammerTime and EREADY and Jayce.Combo.EG:Value() then
		local eVector = Vector(myHero)+Vector(Vector(unit)-Vector(myHero)):normalized()*50+Vector(Vector(unit)-Vector(myHero)):normalized():perpendicular()*100
		CastSkillShot(_E,eVector.x,eVector.y,eVector.z)
	end
end

function CastRH()
  if Jayce.Combo.RH:Value() then
	CastSpell(_R)
  end
end

function CastRG()
  if Jayce.Combo.RG:Value() then
	CastSpell(_R)
  end
end

function Combo()
  unit = Jayce.ts:GetTarget()
target = Jayce.ts:GetTarget()
	local QHup = spellData.QH.up <= GetTickCount()
	local WHup = spellData.WH.up <= GetTickCount()
	local EHup = spellData.EH.up <= GetTickCount()
	local RHup = spellData.RH.up <= GetTickCount()
	local QGup = spellData.QG.up <= GetTickCount()
	local WGup = spellData.WG.up <= GetTickCount()
	local EGup = spellData.EG.up <= GetTickCount()
	local RGup = spellData.RG.up <= GetTickCount()
	--Guncombos
	if not HammerTime then
		if ValidTarget(target,spellData.QG.rangeAcc) and QGup and EGup then
			CastQGEG(target)
		elseif ValidTarget(target, spellData.QG.range) and QGup and not EGup then
			CastQG(target)
		elseif ValidTarget(target, spellData.QH.range) and WGup and RGup then
			CastWG()
		elseif ValidTarget(target, spellData.WG.range) and WGup then
			CastWG()
		elseif ValidTarget(target, spellData.QH.range) and not QGup and not EGup and not WGup and QHup and EHup then
			CastRG()
		end
	--Hammercombos
	elseif HammerTime then
		if ValidTarget(target, spellData.EH.range) and EHup and QHup then
			if CastEH(target) then
				DelayAction(function() CastQH(target) end, 250)
			end
		elseif ValidTarget(target, spellData.WH.range) and WHup then
			CastWH()
		elseif ValidTarget(target, spellData.QH.range) and QHup then
			CastQH(target)
		elseif ValidTarget(target, spellData.EH.range) and EHup and RHup then
			if CastEH(target) then
				DelayAction(function() CastRH() end, 250)
			end
		elseif ValidTarget(target, spellData.QH.range) and RHup and not QHup then
			CastRH()
		end
	end
end

function Harass()
  unit = Jayce.ts:GetTarget()
target = Jayce.ts:GetTarget()
	if ValidTarget(target,spellData.QG.rangeAcc) and spellData.EG.up <= GetTickCount() and spellData.QG.up <= GetTickCount() and not HammerTime then
		CastQGEG(target)
	elseif ValidTarget(target,spellData.QG.range) and spellData.EG.up >= GetTickCount() and spellData.QG.up <= GetTickCount() and not HammerTime then
		CastQG(target)
	end
end

function Killsteal()
	for i,enemy in pairs(GetEnemyHeroes()) do
		local enemyhp = GetCurrentHP(enemy)
		if HammerTime then
			if ValidTarget(enemy,spellData.QH.range) and enemyhp < CalcDamage(myHero, enemy, spellData.QH.dmg(),0) and QREADY then
				CastQH(enemy)
			elseif ValidTarget(enemy,spellData.EH.range) and enemyhp < CalcDamage(myHero, enemy, 0, spellData.EH.dmg(enemy)) and EREADY then
				CastEH(enemy)
			elseif ValidTarget(enemy,spellData.WH.range) and enemyhp < CalcDamage(myHero, enemy, 0, spellData.WH.dmg()/8) and WREADY then
				CastWH()
			elseif ValidTarget(enemy,spellData.QH.range) and enemyhp < CalcDamage(myHero, enemy, spellData.QH.dmg(), spellData.EH.dmg(enemy)) and QREADY and EREADY then
				CastQH(enemy) DelayAction(function() CastEH(enemy)end, 250)
			end
		elseif not HammerTime then
			if ValidTarget(enemy,spellData.QG.range) and enemyhp < CalcDamage(myHero, enemy, spellData.QG.dmg(), 0) and QREADY then
				CastQG(target)
			elseif ValidTarget(enemy, spellData.QG.rangeAcc) and enemyhp < CalcDamage(myHero, enemy, spellData.QG.dmg()*1.4, 0) and QREADY and EREADY then
				CastQGEG(target)
			end
		end
	end
end

OnProcessSpell(function(unit, spell) 
	if unit and unit == myHero then
		for _, d in pairs(spellData) do
			if spell.name == d.name then
				d.up = d.CD() + GetTickCount() + spell.windUpTime*1000
			end
		end
	end
end)
