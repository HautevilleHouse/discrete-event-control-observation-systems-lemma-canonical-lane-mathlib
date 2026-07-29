import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiscreteEventSystem where
  eventSet : Type u
  stateSet : Type v
  transitionFunction : eventSet -> stateSet -> stateSet
  initialStates : Set stateSet

structure ObservationMapping where
  sensorSet : Type w
  observationFunction : stateSet -> sensorSet

structure ObservableSystem where
  system : DiscreteEventSystem
  observation : ObservationMapping
  currentState : system.stateSet
  observablePartition : Setoid system.stateSet

structure AdmittedObject where
  system : ObservableSystem
  indistinguishableStates : Set (system.system.stateSet × system.system.stateSet)
  diagnosticGoal : Prop
  conclusion : diagnosticGoal

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ObservableWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
