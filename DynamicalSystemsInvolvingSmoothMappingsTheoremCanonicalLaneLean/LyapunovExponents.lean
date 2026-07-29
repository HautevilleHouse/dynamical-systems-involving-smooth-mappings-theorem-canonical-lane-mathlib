import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean.DynamicalSystemsMappings

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure LyapunovExponentsPackage {D : DynamicalSystemsMappingsPackage}
    (M : DynamicalSystemsMappingsPackage) where
  lyapunovSpectrum : List ℝ
  exponentComputation : Prop
  regularityConditions : Prop
  exponentialGrowthRates : Prop

structure LyapunovExponentsEvidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (L : LyapunovExponentsPackage M) where
  exponentComputationClosed : L.exponentComputation
  regularityConditionsClosed : L.regularityConditions
  exponentialGrowthRatesClosed : L.exponentialGrowthRates

def LyapunovExponentsClosed {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (L : LyapunovExponentsPackage M) : Prop :=
  L.exponentComputation ∧ L.regularityConditions ∧ L.exponentialGrowthRates

theorem lyapunov_exponents_closed_from_evidence {D : DynamicalSystemsMappingsPackage}
    {M : DynamicalSystemsMappingsPackage} (L : LyapunovExponentsPackage M)
    (E : LyapunovExponentsEvidence L) : LyapunovExponentsClosed L :=
  And.intro E.exponentComputationClosed
    (And.intro E.regularityConditionsClosed E.exponentialGrowthRatesClosed)

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse