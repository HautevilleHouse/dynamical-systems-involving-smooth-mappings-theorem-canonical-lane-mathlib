import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemStateSpace

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure GenericPropertyPackage (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) where
  property : (M → M) → Prop
  densityInSmoothCategory : Prop
  preservationUnderSmallPerturbation : Prop
  residualSet : Set (M → M)

structure GenericPropertyEvidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (G : GenericPropertyPackage M D) where
  densityInSmoothCategoryClosed : G.densityInSmoothCategory
  preservationUnderSmallPerturbationClosed : G.preservationUnderSmallPerturbation
  residualSetNonempty : Set.Nonempty G.residualSet

def GenericPropertyClosed (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (G : GenericPropertyPackage M D) : Prop :=
  G.densityInSmoothCategory ∧ G.preservationUnderSmallPerturbation ∧ Set.Nonempty G.residualSet

theorem generic_property_closed_from_evidence (M : Type u) [TopologicalSpace M] (D : DynamicalSystemStateSpace M) (G : GenericPropertyPackage M D) (E : GenericPropertyEvidence M D G) :
    GenericPropertyClosed M D G := by
  exact And.intro E.densityInSmoothCategoryClosed (And.intro E.preservationUnderSmallPerturbationClosed E.residualSetNonempty)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse