import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemsMappings

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure GenericPropertiesPackage {D : DynamicalSystemsMappingsPackage}
    (M : DynamicalSystemsMappingsPackage) where
  openDenseSet : Set (M.timeDomain → M.manifold → M.manifold)
  genericProperty : (M.timeDomain → M.manifold → M.manifold) → Prop
  residualSet : Prop
  baireProperty : Prop

structure GenericPropertiesEvidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (G : GenericPropertiesPackage M) where
  openDenseSetClosed : G.openDenseSet ≠ ∅
  residualSetClosed : G.residualSet
  bairePropertyClosed : G.baireProperty

def GenericPropertiesClosed {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (G : GenericPropertiesPackage M) : Prop :=
  (G.openDenseSet ≠ ∅) ∧ G.residualSet ∧ G.baireProperty

theorem generic_properties_closed_from_evidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (G : GenericPropertiesPackage M)
    (E : GenericPropertiesEvidence G) : GenericPropertiesClosed G :=
  And.intro E.openDenseSetClosed
    (And.intro E.residualSetClosed E.bairePropertyClosed)

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse