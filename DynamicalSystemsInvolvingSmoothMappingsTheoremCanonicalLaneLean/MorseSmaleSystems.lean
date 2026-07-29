import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemsMappings

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure MorseSmaleSystemsPackage {D : DynamicalSystemsMappingsPackage}
    (M : DynamicalSystemsMappingsPackage) where
  fixedPoints : Set M.manifold
  periodicOrbits : Set (M.timeDomain × M.manifold)
  transversalityCondition : Prop
  hyperbolicity : Prop
  morseSmaleProperty : Prop

structure MorseSmaleSystemsEvidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (S : MorseSmaleSystemsPackage M) where
  transversalityConditionClosed : S.transversalityCondition
  hyperbolicityClosed : S.hyperbolicity
  morseSmalePropertyClosed : S.morseSmaleProperty

def MorseSmaleSystemsClosed {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (S : MorseSmaleSystemsPackage M) : Prop :=
  S.transversalityCondition ∧ S.hyperbolicity ∧ S.morseSmaleProperty

theorem morse_smale_systems_closed_from_evidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (S : MorseSmaleSystemsPackage M)
    (E : MorseSmaleSystemsEvidence S) : MorseSmaleSystemsClosed S :=
  And.intro E.transversalityConditionClosed
    (And.intro E.hyperbolicityClosed E.morseSmalePropertyClosed)

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse