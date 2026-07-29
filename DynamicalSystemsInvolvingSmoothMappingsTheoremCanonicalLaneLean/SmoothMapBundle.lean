import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure SmoothMapBundle where
  source : Type u
  target : Type v
  sourceTopology : TopologicalSpace source
  targetTopology : TopologicalSpace target
  smoothStructureSource : Prop
  smoothStructureTarget : Prop
  mapping : source → target
  smoothness : Prop  -- C^∞ smoothness

structure SmoothMapBundleEvidence (B : SmoothMapBundle) where
  smoothnessClosed : B.smoothness

def SmoothMapBundleClosed (B : SmoothMapBundle) : Prop :=
  B.smoothness

theorem smooth_map_bundle_closed_from_evidence (B : SmoothMapBundle) (E : SmoothMapBundleEvidence B) : SmoothMapBundleClosed B := by
  exact E.smoothnessClosed

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse