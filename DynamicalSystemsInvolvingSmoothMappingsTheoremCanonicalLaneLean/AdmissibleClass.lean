import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean

structure SmoothDynamicalSystem where
  manifold : Type u
  dynamics : manifold -> manifold
  smooth : Prop
  flow : ℝ -> manifold -> manifold
  groupProperty : Prop
  flowSmooth : Prop

def DynamicalSystemClosed (S : SmoothDynamicalSystem) : Prop :=
  S.smooth ∧ S.groupProperty ∧ S.flowSmooth

end DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse