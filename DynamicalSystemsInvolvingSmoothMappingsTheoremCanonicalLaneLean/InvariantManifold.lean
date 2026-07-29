import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.SmoothMapBundle

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure InvariantManifold (B : SmoothMapBundle) where
  submanifold : Set B.source
  invariantUnderFlow : Prop
  smoothEmbedding : Prop
  stability : Prop

structure InvariantManifoldEvidence {B : SmoothMapBundle} (I : InvariantManifold B) where
  invariantUnderFlowClosed : I.invariantUnderFlow
  smoothEmbeddingClosed : I.smoothEmbedding
  stabilityClosed : I.stability

def InvariantManifoldClosed {B : SmoothMapBundle} (I : InvariantManifold B) : Prop :=
  I.invariantUnderFlow ∧ I.smoothEmbedding ∧ I.stability

theorem invariant_manifold_closed_from_evidence {B : SmoothMapBundle} (I : InvariantManifold B) (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.invariantUnderFlowClosed (And.intro E.smoothEmbeddingClosed E.stabilityClosed)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse