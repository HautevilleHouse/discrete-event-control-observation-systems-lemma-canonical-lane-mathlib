import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ControllabilityPackage {O : ObservationPackage}
    (C : ObservabilityPackage O) where
  controllableEvents : Set (stateSpace O).events
  reachableStates : Prop
  synthesizableSupervisor : Prop
  reachableStatesTerm : reachableStates
  synthesizableSupervisorTerm : synthesizableSupervisor

structure ControllabilityEvidence {O : ObservationPackage}
    {C : ObservabilityPackage O} (P : ControllabilityPackage C) where
  controllableEventsClosed : P.controllableEvents ⊆ (stateSpace O).events
  reachableStatesClosed : P.reachableStates
  synthesizableSupervisorClosed : P.synthesizableSupervisor

def ControllabilityClosed {O : ObservationPackage}
    {C : ObservabilityPackage O} (P : ControllabilityPackage C) : Prop :=
  P.reachableStates ∧ P.synthesizableSupervisor

theorem controllability_closed_from_evidence {O : ObservationPackage}
    {C : ObservabilityPackage O} (P : ControllabilityPackage C)
    (E : ControllabilityEvidence P) : ControllabilityClosed P :=
  And.intro E.reachableStatesClosed E.synthesizableSupervisorClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse