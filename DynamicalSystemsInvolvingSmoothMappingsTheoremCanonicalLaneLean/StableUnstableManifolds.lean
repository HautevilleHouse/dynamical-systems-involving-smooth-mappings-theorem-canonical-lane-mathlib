import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean.AdmissibleClass
import DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean.InvariantManifolds

namespace HautevilleHouse
namespace DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean

structure StableManifold (S : SmoothDynamicalSystem) extends InvariantManifold S where
  contraction : ∀ x : submanifold, dist (S.flow 1 x) (S.flow 1 (basepoint x)) < dist x (basepoint x)
  basepoint : submanifold

structure UnstableManifold (S : SmoothDynamicalSystem) extends InvariantManifold S where
  expansion : ∀ x : submanifold, dist (S.flow (-1) x) (S.flow (-1) (basepoint x)) < dist x (basepoint x)
  basepoint : submanifold

theorem stable_manifold_exists (S : SmoothDynamicalSystem) (p : S.manifold) : StableManifold S := by
  -- Construction of stable manifold at hyperbolic fixed point
  sorry

end DynamicalSystemsSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse