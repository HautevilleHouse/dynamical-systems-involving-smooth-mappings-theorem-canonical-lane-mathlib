import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.HyperbolicDynamics

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure StableManifoldTheorem (H : HyperbolicDynamics B) where
  stableManifoldChart : Type
  localStability : Prop
  smoothConjugacy : Prop
  exponentialDecay : Prop

structure StableManifoldTheoremEvidence {B : SmoothMapBundle} {H : HyperbolicDynamics B} (S : StableManifoldTheorem H) where
  localStabilityClosed : S.localStability
  smoothConjugacyClosed : S.smoothConjugacy
  exponentialDecayClosed : S.exponentialDecay

def StableManifoldTheoremClosed {B : SmoothMapBundle} {H : HyperbolicDynamics B} (S : StableManifoldTheorem H) : Prop :=
  S.localStability ∧ S.smoothConjugacy ∧ S.exponentialDecay

theorem stable_manifold_theorem_closed_from_evidence {B : SmoothMapBundle} {H : HyperbolicDynamics B} (S : StableManifoldTheorem H) (E : StableManifoldTheoremEvidence S) : StableManifoldTheoremClosed S := by
  exact And.intro E.localStabilityClosed (And.intro E.smoothConjugacyClosed E.exponentialDecayClosed)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse