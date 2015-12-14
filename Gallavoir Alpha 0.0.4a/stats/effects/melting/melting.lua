function init()
  animator.setParticleEmitterOffsetRegion("flames", mcontroller.boundBox())
  animator.setParticleEmitterActive("flames", true)
  effect.setParentDirectives("fade=FF8800=0.2")
  
  script.setUpdateDelta(5)

  self.tickTime = 1.0
  self.tickTimer = self.tickTime
  self.damage = 30 * status.stat("occaFireArmor")

  status.applySelfDamageRequest({
      damageType = "IgnoresDef",
      damage = 30 * status.stat("occaFireArmor"),
      sourceEntityId = entity.id()
    })
end

function update(dt)
  self.tickTimer = self.tickTimer - dt
  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    self.damage = self.damage * 2
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = self.damage,
        sourceEntityId = entity.id()
      })
  end
end

function uninit()
  status.addEphemeralEffect("burning")
end