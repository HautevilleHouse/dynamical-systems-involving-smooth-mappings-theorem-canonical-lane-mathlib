import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.HyperbolicDynamics

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure HartmanGrobman (H : HyperbolicDynamics B) where
  linearizationExists : Prop
  topologicalConjugacy : Prop
  neighborhoodAssignment : Prop

structure HartmanGrobmanEvidence {B : SmoothMapBundle} {H : HyperbolicDynamics B} (G : HartmanGrobman H) where
  linearizationExistsClosed : G.linearizationExists
  topologicalConjugacyClosed : G.topologicalConjugacy
  neighborhoodAssignmentClosed : G.neighborhoodAssignment

def HartmanGrobmanClosed {B : SmoothMapBundle} {H : HyperbolicDynamics B} (G : HartmanGrobman H) : Prop :=
  G.linearizationExists ∧ G.topologicalConjugacy ∧ G.neighborhoodAssignment

theorem hartman_grobman_closed_from_evidence {B : SmoothMapBundle} {H : HyperbolicDynamics B} (G : HartmanGrobman H) (E : HartmanGrobmanEvidence G) : HartmanGrobmanClosed G := by
  exact And.intro E.linearizationExistsClosed (And.intro E.topologicalConjugacyClosed E.neighborhoodAssignmentClosed)

end DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse