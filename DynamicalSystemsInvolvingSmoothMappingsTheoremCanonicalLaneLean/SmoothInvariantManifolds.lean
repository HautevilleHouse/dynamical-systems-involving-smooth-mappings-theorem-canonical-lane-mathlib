import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure InvariantManifoldPackage where
  stableManifold : Prop
  unstableManifold : Prop
  centerManifold : Prop
  smoothnessPersists : Prop

structure InvariantManifoldEvidence (I : InvariantManifoldPackage) where
  stableManifoldClosed : I.stableManifold
  unstableManifoldClosed : I.unstableManifold
  centerManifoldClosed : I.centerManifold
  smoothnessPersistsClosed : I.smoothnessPersists

def InvariantManifoldClosed (I : InvariantManifoldPackage) : Prop :=
  I.stableManifold ∧ I.unstableManifold ∧ I.centerManifold ∧ I.smoothnessPersists

theorem invariant_manifold_closed_from_evidence
    (I : InvariantManifoldPackage) (E : InvariantManifoldEvidence I) :
    InvariantManifoldClosed I := by
  exact And.intro E.stableManifoldClosed
    (And.intro E.unstableManifoldClosed
      (And.intro E.centerManifoldClosed E.smoothnessPersistsClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse