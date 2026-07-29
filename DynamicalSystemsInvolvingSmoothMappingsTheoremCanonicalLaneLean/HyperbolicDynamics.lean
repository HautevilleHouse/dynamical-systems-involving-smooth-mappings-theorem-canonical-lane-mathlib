import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemsMappings

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure HyperbolicDynamicsPackage {D : DynamicalSystemsMappingsPackage}
    (M : DynamicalSystemsMappingsPackage) where
  hyperbolicSet : Set M.manifold
  splitting : Prop
  contractionExpansion : Prop
  stableUnstableBundles : Prop
  smoothness : Prop

structure HyperbolicDynamicsEvidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (H : HyperbolicDynamicsPackage M) where
  splittingClosed : H.splitting
  contractionExpansionClosed : H.contractionExpansion
  stableUnstableBundlesClosed : H.stableUnstableBundles
  smoothnessClosed : H.smoothness

def HyperbolicDynamicsClosed {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (H : HyperbolicDynamicsPackage M) : Prop :=
  H.splitting ∧ H.contractionExpansion ∧ H.stableUnstableBundles ∧ H.smoothness

theorem hyperbolic_dynamics_closed_from_evidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (H : HyperbolicDynamicsPackage M)
    (E : HyperbolicDynamicsEvidence H) : HyperbolicDynamicsClosed H :=
  And.intro E.splittingClosed
    (And.intro E.contractionExpansionClosed
      (And.intro E.stableUnstableBundlesClosed E.smoothnessClosed))

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse