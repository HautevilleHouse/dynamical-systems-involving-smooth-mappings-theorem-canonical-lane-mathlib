import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemStateSpace

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure InvariantManifoldPackage (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) where
  invariantSubmanifold : SmoothManifold M
  mappingSubmanifold : SmoothMapping M M
  persistenceUnderFlow : Prop
  transversalityCondition : Prop

structure InvariantManifoldEvidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (I : InvariantManifoldPackage M D) where
  persistenceUnderFlowClosed : I.persistenceUnderFlow
  transversalityConditionClosed : I.transversalityCondition

def InvariantManifoldClosed (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (I : InvariantManifoldPackage M D) : Prop :=
  I.persistenceUnderFlow ∧ I.transversalityCondition

theorem invariant_manifold_closed_from_evidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (I : InvariantManifoldPackage M D) (E : InvariantManifoldEvidence M D I) :
    InvariantManifoldClosed M D I := by
  exact And.intro E.persistenceUnderFlowClosed E.transversalityConditionClosed

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse