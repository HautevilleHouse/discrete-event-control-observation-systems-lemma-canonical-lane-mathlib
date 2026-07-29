import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservableStateSpace where
  states : Type
  events : Type
  observationAlphabet : Type
  transitionDynamics : Prop
  observableEvents : Set observationAlphabet
  transitionDynamicsTerm : transitionDynamics

structure ObservationPackage where
  stateSpace : ObservableStateSpace
  eventSet : Set stateSpace.events
  observationFunction : stateSpace.states -> stateSpace.observationAlphabet
  admissibleLabels : Prop
  admissibleLabelsTerm : admissibleLabels

structure ObservationEvidence (O : ObservationPackage) where
  observationFunctionDefined : Prop
  admissibleLabelsClosed : Prop
  observationFunctionDefinedTerm : observationFunctionDefined
  admissibleLabelsClosedTerm : admissibleLabelsClosed

def ObservationClosed (O : ObservationPackage) : Prop :=
  O.admissibleLabels

theorem observation_closed_from_evidence (O : ObservationPackage)
    (E : ObservationEvidence O) : ObservationClosed O :=
  E.admissibleLabelsClosedTerm

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse