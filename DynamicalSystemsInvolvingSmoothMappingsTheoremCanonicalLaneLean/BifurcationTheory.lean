import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure BifurcationTheoryPackage where
  parameterSpace : Type u
  familyOfMaps : Type v
  bifurcationPoints : Prop
  localBifurcationDiagrams : Prop
  normalForms : Prop
  structuralStability : Prop

structure BifurcationTheoryEvidence (B : BifurcationTheoryPackage) where
  bifurcationPointsClosed : B.bifurcationPoints
  localBifurcationDiagramsClosed : B.localBifurcationDiagrams
  normalFormsClosed : B.normalForms
  structuralStabilityClosed : B.structuralStability

def BifurcationTheoryClosed (B : BifurcationTheoryPackage) : Prop :=
  B.bifurcationPoints ∧ B.localBifurcationDiagrams ∧ B.normalForms ∧ B.structuralStability

theorem bifurcation_theory_closed_from_evidence (B : BifurcationTheoryPackage) (E : BifurcationTheoryEvidence B) :
    BifurcationTheoryClosed B := by
  exact And.intro E.bifurcationPointsClosed (And.intro E.localBifurcationDiagramsClosed (And.intro E.normalFormsClosed E.structuralStabilityClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse