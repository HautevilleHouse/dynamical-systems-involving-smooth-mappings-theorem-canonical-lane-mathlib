import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure CenterManifoldsPackage where
  fixedPoint : Type u
  linearization : Type v
  centerManifoldExistence : Prop
  centerManifoldSmoothness : Prop
  reductionPrinciple : Prop
  invariantFibration : Prop

structure CenterManifoldsEvidence (C : CenterManifoldsPackage) where
  centerManifoldExistenceClosed : C.centerManifoldExistence
  centerManifoldSmoothnessClosed : C.centerManifoldSmoothness
  reductionPrincipleClosed : C.reductionPrinciple
  invariantFibrationClosed : C.invariantFibration

def CenterManifoldsClosed (C : CenterManifoldsPackage) : Prop :=
  C.centerManifoldExistence ∧ C.centerManifoldSmoothness ∧ C.reductionPrinciple ∧ C.invariantFibration

theorem center_manifolds_closed_from_evidence (C : CenterManifoldsPackage) (E : CenterManifoldsEvidence C) :
    CenterManifoldsClosed C := by
  exact And.intro E.centerManifoldExistenceClosed (And.intro E.centerManifoldSmoothnessClosed (And.intro E.reductionPrincipleClosed E.invariantFibrationClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse