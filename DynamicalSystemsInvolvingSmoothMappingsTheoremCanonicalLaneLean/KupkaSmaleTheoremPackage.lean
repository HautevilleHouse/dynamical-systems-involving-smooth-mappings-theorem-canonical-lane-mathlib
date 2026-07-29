import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.HyperbolicFixedPointClassification
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.GenericPropertyDensity

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure KupkaSmalePackage (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) where
  allFixedPointsHyperbolic : Prop
  heteroclinicIntersectionsTransverse : Prop
  genericDensity : GenericPropertyPackage M D
  kupkaSmaleProofComplete : Prop

structure KupkaSmaleEvidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (KS : KupkaSmalePackage M D) where
  allFixedPointsHyperbolicClosed : KS.allFixedPointsHyperbolic
  heteroclinicIntersectionsTransverseClosed : KS.heteroclinicIntersectionsTransverse
  genericDensityClosed : GenericPropertyClosed M D KS.genericDensity
  kupkaSmaleProofCompleteClosed : KS.kupkaSmaleProofComplete

def KupkaSmaleClosed (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (KS : KupkaSmalePackage M D) : Prop :=
  KS.allFixedPointsHyperbolic ∧ KS.heteroclinicIntersectionsTransverse ∧ GenericPropertyClosed M D KS.genericDensity ∧ KS.kupkaSmaleProofComplete

theorem kupka_smale_closed_from_evidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (KS : KupkaSmalePackage M D) (E : KupkaSmaleEvidence M D KS) :
    KupkaSmaleClosed M D KS := by
  exact And.intro E.allFixedPointsHyperbolicClosed (And.intro E.heteroclinicIntersectionsTransverseClosed (And.intro E.genericDensityClosed E.kupkaSmaleProofCompleteClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse