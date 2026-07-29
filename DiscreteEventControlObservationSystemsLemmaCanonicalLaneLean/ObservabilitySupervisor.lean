import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservabilitySupervisorPackage where
  eventSet : Type u
  observableEvents : Set eventSet
  controlSpecification : Prop
  supervisoryPolicy : Type v
  maximalPermissivePolicy : Prop

structure ObservabilitySupervisorEvidence (S : ObservabilitySupervisorPackage) where
  controlSpecificationClosed : S.controlSpecification
  maximalPermissivePolicyClosed : S.maximalPermissivePolicy

def ObservabilitySupervisorClosed (S : ObservabilitySupervisorPackage) : Prop :=
  S.controlSpecification ∧ S.maximalPermissivePolicy

theorem observability_supervisor_closed_from_evidence (S : ObservabilitySupervisorPackage)
    (E : ObservabilitySupervisorEvidence S) : ObservabilitySupervisorClosed S := by
  exact And.intro E.controlSpecificationClosed E.maximalPermissivePolicyClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
