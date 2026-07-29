import canonicalLaneMathlib.AdmissibleClass
import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.DiscreteEventSystem

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservabilityLemmaPackage (S : DiscreteEventSystem) where
  indistinguishableStates : Set (S.stateSpace × S.stateSpace)
  observableProjection : S.stateSpace → S.stateSpace
  observationEquivalence : Prop
  observationEquivalenceTerm : observationEquivalence

structure ObservabilityLemmaEvidence {S : DiscreteEventSystem}
    (O : ObservabilityLemmaPackage S) where
  observationEquivalenceClosed : O.observationEquivalence

def ObservabilityLemmaClosed {S : DiscreteEventSystem}
    (O : ObservabilityLemmaPackage S) : Prop :=
  O.observationEquivalence

theorem observability_lemma_closed_from_evidence {S : DiscreteEventSystem}
    (O : ObservabilityLemmaPackage S) (E : ObservabilityLemmaEvidence O) :
    ObservabilityLemmaClosed O := by
  exact E.observationEquivalenceClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse