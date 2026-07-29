import canonicalLaneMathlib.AdmissibleClass
import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.DiscreteEventSystem

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ControllabilityLemmaPackage (S : DiscreteEventSystem) where
  uncontrollableEvents : Set S.eventSet
  reachableSet : Set S.stateSpace
  controllabilityCondition : Prop
  controllabilityConditionTerm : controllabilityCondition

structure ControllabilityLemmaEvidence {S : DiscreteEventSystem}
    (C : ControllabilityLemmaPackage S) where
  controllabilityClosed : C.controllabilityCondition

def ControllabilityLemmaClosed {S : DiscreteEventSystem}
    (C : ControllabilityLemmaPackage S) : Prop :=
  C.controllabilityCondition

theorem controllability_lemma_closed_from_evidence {S : DiscreteEventSystem}
    (C : ControllabilityLemmaPackage S) (E : ControllabilityLemmaEvidence C) :
    ControllabilityLemmaClosed C := by
  exact E.controllabilityClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse