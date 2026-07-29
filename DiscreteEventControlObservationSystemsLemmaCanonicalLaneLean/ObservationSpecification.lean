import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

/-!
# Observation Specification Package

This module captures the core observation specification for discrete event
control systems. The observation specification defines what events are
observable and how observation constraints are encoded.
-/

structure ObservationSpecPackage where
  eventSet : Type u
  observationMap : eventSet -> Prop
  observabilityCondition : Prop
  unobservableEventsAccounted : Prop

structure ObservationSpecEvidence (O : ObservationSpecPackage) where
  observationMapClosed : O.observationMap
  observabilityConditionClosed : O.observabilityCondition
  unobservableEventsAccountedClosed : O.unobservableEventsAccounted

def ObservationSpecClosed (O : ObservationSpecPackage) : Prop :=
  O.observationMap ∧ O.observabilityCondition ∧ O.unobservableEventsAccounted

theorem observation_spec_closed_from_evidence (O : ObservationSpecPackage)
    (E : ObservationSpecEvidence O) : ObservationSpecClosed O := by
  exact And.intro E.observationMapClosed
    (And.intro E.observabilityConditionClosed E.unobservableEventsAccountedClosed)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse