import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiscreteEventSystem where
  stateSpace : Type u
  eventSet : Type v
  transitionFunction : stateSpace → eventSet → stateSpace
  initialStates : Set stateSpace
  observableEvents : Set eventSet
  controllabilityCondition : Prop
  observabilityCondition : Prop
  controllabilityConditionTerm : controllabilityCondition
  observabilityConditionTerm : observabilityCondition

structure DiscreteEventEvidence (S : DiscreteEventSystem) where
  controllabilityClosed : S.controllabilityCondition
  observabilityClosed : S.observabilityCondition

def DiscreteEventClosed (S : DiscreteEventSystem) : Prop :=
  S.controllabilityCondition ∧ S.observabilityCondition

theorem discrete_event_closed_from_evidence (S : DiscreteEventSystem)
    (E : DiscreteEventEvidence S) : DiscreteEventClosed S := by
  exact And.intro E.controllabilityClosed E.observabilityClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse