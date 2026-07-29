import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure AnosovDiffeomorphismsPackage where
  compactManifold : Type u
  diffeomorphism : Type v
  uniformlyHyperbolic : Prop
  stableUnstableDistinction : Prop
  topologicalProperties : Prop
  ergodicProperties : Prop

structure AnosovDiffeomorphismsEvidence (A : AnosovDiffeomorphismsPackage) where
  uniformlyHyperbolicClosed : A.uniformlyHyperbolic
  stableUnstableDistinctionClosed : A.stableUnstableDistinction
  topologicalPropertiesClosed : A.topologicalProperties
  ergodicPropertiesClosed : A.ergodicProperties

def AnosovDiffeomorphismsClosed (A : AnosovDiffeomorphismsPackage) : Prop :=
  A.uniformlyHyperbolic ∧ A.stableUnstableDistinction ∧ A.topologicalProperties ∧ A.ergodicProperties

theorem anosov_diffeomorphisms_closed_from_evidence (A : AnosovDiffeomorphismsPackage) (E : AnosovDiffeomorphismsEvidence A) :
    AnosovDiffeomorphismsClosed A := by
  exact And.intro E.uniformlyHyperbolicClosed (And.intro E.stableUnstableDistinctionClosed (And.intro E.topologicalPropertiesClosed E.ergodicPropertiesClosed))

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse