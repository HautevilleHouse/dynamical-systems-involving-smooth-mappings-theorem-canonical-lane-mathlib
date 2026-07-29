import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean

structure DynamicalSystemsMappingsPackage where
  manifold : Type u
  manifoldTopology : TopologicalSpace manifold
  smoothStructure : Type v
  mappingFamily : Type w
  timeDomain : Type t
  initialCondition : manifold
  flowMap : timeDomain -> manifold -> manifold
  smoothDependenceOnInitialConditions : Prop
  smoothDependenceOnParameters : Prop
  flowProperty : Prop
  differentialEquationSolved : Prop

structure DynamicalSystemsMappingsEvidence (D : DynamicalSystemsMappingsPackage) where
  smoothDependenceOnInitialConditionsClosed : D.smoothDependenceOnInitialConditions
  smoothDependenceOnParametersClosed : D.smoothDependenceOnParameters
  flowPropertyClosed : D.flowProperty
  differentialEquationSolvedClosed : D.differentialEquationSolved

def DynamicalSystemsMappingsClosed (D : DynamicalSystemsMappingsPackage) : Prop :=
  D.smoothDependenceOnInitialConditions ∧ D.smoothDependenceOnParameters ∧
  D.flowProperty ∧ D.differentialEquationSolved

theorem dynamical_systems_mappings_closed_from_evidence (D : DynamicalSystemsMappingsPackage)
    (E : DynamicalSystemsMappingsEvidence D) : DynamicalSystemsMappingsClosed D :=
  And.intro E.smoothDependenceOnInitialConditionsClosed
    (And.intro E.smoothDependenceOnParametersClosed
      (And.intro E.flowPropertyClosed E.differentialEquationSolvedClosed))

end HautevilleHouse.DynamicalSystemsInvolvingSmoothMappingsTheoremCanonicalLaneLean
end HautevilleHouse