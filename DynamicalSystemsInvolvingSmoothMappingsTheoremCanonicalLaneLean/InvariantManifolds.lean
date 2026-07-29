import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemsMappings

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure InvariantManifoldsPackage {D : DynamicalSystemsMappingsPackage}
    (M : DynamicalSystemsMappingsPackage) where
  stableManifold : Set M.manifold
  unstableManifold : Set M.manifold
  centerManifold : Set M.manifold
  stableInvariant : Prop
  unstableInvariant : Prop
  centerInvariant : Prop
  smoothness : Prop

structure InvariantManifoldsEvidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (I : InvariantManifoldsPackage M) where
  stableInvariantClosed : I.stableInvariant
  unstableInvariantClosed : I.unstableInvariant
  centerInvariantClosed : I.centerInvariant
  smoothnessClosed : I.smoothness

def InvariantManifoldsClosed {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (I : InvariantManifoldsPackage M) : Prop :=
  I.stableInvariant ∧ I.unstableInvariant ∧ I.centerInvariant ∧ I.smoothness

theorem invariant_manifolds_closed_from_evidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (I : InvariantManifoldsPackage M)
    (E : InvariantManifoldsEvidence I) : InvariantManifoldsClosed I :=
  And.intro E.stableInvariantClosed
    (And.intro E.unstableInvariantClosed
      (And.intro E.centerInvariantClosed E.smoothnessClosed))

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse