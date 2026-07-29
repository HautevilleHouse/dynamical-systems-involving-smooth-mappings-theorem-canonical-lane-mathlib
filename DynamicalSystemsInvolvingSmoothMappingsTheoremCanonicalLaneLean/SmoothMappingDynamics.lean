import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure SmoothDynamicalSystem where
  phaseSpace : Type u
  smoothStructure : Prop
  timeDomain : Type v
  flowMap : timeDomain → phaseSpace → phaseSpace
  smoothness : Prop
  initialCondition : phaseSpace

structure SmoothDynamicalSystemEvidence (S : SmoothDynamicalSystem) where
  smoothStructureClosed : S.smoothStructure
  smoothnessClosed : S.smoothness

structure OrbitStabilityPackage (S : SmoothDynamicalSystem) where
  fixedPoints : Prop
  periodicOrbits : Prop
  stabilityRobustness : Prop

structure OrbitStabilityEvidence {S : SmoothDynamicalSystem} (O : OrbitStabilityPackage S) where
  fixedPointsClosed : O.fixedPoints
  periodicOrbitsClosed : O.periodicOrbits
  stabilityRobustnessClosed : O.stabilityRobustness

def OrbitStabilityClosed {S : SmoothDynamicalSystem} (O : OrbitStabilityPackage S) : Prop :=
  O.fixedPoints ∧ O.periodicOrbits ∧ O.stabilityRobustness

theorem orbit_stability_closed_from_evidence
    {S : SmoothDynamicalSystem} (O : OrbitStabilityPackage S)
    (E : OrbitStabilityEvidence O) : OrbitStabilityClosed O := by
  exact And.intro E.fixedPointsClosed
    (And.intro E.periodicOrbitsClosed E.stabilityRobustnessClosed)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse