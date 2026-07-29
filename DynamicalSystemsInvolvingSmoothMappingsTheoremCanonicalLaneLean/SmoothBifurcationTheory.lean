import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure BifurcationPackage where
  parameterSpace : Type u
  smoothFamily : Prop
  criticalParameter : Prop
  bifurcationTypeClassified : Prop
  stabilityTransition : Prop

structure BifurcationEvidence (B : BifurcationPackage) where
  smoothFamilyClosed : B.smoothFamily
  criticalParameterClosed : B.criticalParameter
  bifurcationTypeClassifiedClosed : B.bifurcationTypeClassified
  stabilityTransitionClosed : B.stabilityTransition

def BifurcationClosed (B : BifurcationPackage) : Prop :=
  B.smoothFamily ∧ B.criticalParameter ∧ B.bifurcationTypeClassified ∧ B.stabilityTransition

theorem bifurcation_closed_from_evidence
    (B : BifurcationPackage) (E : BifurcationEvidence B) :
    BifurcationClosed B := by
  exact And.intro E.smoothFamilyClosed
    (And.intro E.criticalParameterClosed
      (And.intro E.bifurcationTypeClassifiedClosed E.stabilityTransitionClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse