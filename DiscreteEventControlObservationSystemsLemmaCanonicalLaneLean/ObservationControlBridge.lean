import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservationSpecification
import HautevilleHouse.DiscreteEventControlControlSpecificationLemmaCanonicalLaneLean.ControlSpecification

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

/-!
# Observation-Control Bridge Package

This module bridges the observation specification and control specification
into a combined admissible-class closure. The bridge ensures that the
observation and control specifications are consistent.
-/

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ObservationSpecClosed A.observationSpec ∧ ControlSpecClosed A.controlSpec

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro (observation_spec_closed_from_evidence A.observationSpec A.observationSpecEvidence)
    (control_spec_closed_from_evidence A.controlSpec A.controlSpecEvidence)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse