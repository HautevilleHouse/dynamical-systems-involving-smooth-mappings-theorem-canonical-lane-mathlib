import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Flow
import Mathlib.Analysis.Calculus.ContDiff

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure SmoothManifold (M : Type u) [TopologicalSpace M] where
  smoothAtlas : Prop
  hausdorffSecondCountable : Prop
  dimensionN : Nat

structure SmoothMapping (M N : Type u) [TopologicalSpace M] [TopologicalSpace N] where
  f : M → N
  smoothInvariant : Prop

structure DynamicalSystemStateSpace (M : Type u) [TopologicalSpace M] where
  manifold : SmoothManifold M
  timeDomain : Type v
  flowMap : timeDomain → M → M
  flowSmooth : Prop
  groupAction : Prop
  invariantSets : Prop

structure DynamicalSystemStateSpaceEvidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) where
  flowSmoothClosed : D.flowSmooth
  groupActionClosed : D.groupAction
  invariantSetsClosed : D.invariantSets

def DynamicalSystemStateSpaceClosed (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) : Prop :=
  D.flowSmooth ∧ D.groupAction ∧ D.invariantSets

theorem dynamical_system_state_space_closed_from_evidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (E : DynamicalSystemStateSpaceEvidence M D) :
    DynamicalSystemStateSpaceClosed M D := by
  exact And.intro E.flowSmoothClosed (And.intro E.groupActionClosed E.invariantSetsClosed)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse