import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemStateSpace

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure HyperbolicFixedPointPackage (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) where
  fixedPoint : M
  derivativeInvertibleAtPoint : Prop
  noEigenvalueOnUnitCircle : Prop
  stableManifoldExists : Prop
  unstableManifoldExists : Prop

structure HyperbolicFixedPointEvidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (H : HyperbolicFixedPointPackage M D) where
  derivativeInvertibleAtPointClosed : H.derivativeInvertibleAtPoint
  noEigenvalueOnUnitCircleClosed : H.noEigenvalueOnUnitCircle
  stableManifoldExistsClosed : H.stableManifoldExists
  unstableManifoldExistsClosed : H.unstableManifoldExists

def HyperbolicFixedPointClosed (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (H : HyperbolicFixedPointPackage M D) : Prop :=
  H.derivativeInvertibleAtPoint ∧ H.noEigenvalueOnUnitCircle ∧ H.stableManifoldExists ∧ H.unstableManifoldExists

theorem hyperbolic_fixed_point_closed_from_evidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (H : HyperbolicFixedPointPackage M D) (E : HyperbolicFixedPointEvidence M D H) :
    HyperbolicFixedPointClosed M D H := by
  exact And.intro E.derivativeInvertibleAtPointClosed (And.intro E.noEigenvalueOnUnitCircleClosed (And.intro E.stableManifoldExistsClosed E.unstableManifoldExistsClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse