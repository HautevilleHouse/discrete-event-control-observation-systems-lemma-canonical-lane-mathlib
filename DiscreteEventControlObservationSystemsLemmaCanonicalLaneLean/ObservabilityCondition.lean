import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservabilityConditionPackage where
  indistinguishabilityRelation : Set (stateSet × stateSet)
  observableCover : Set observableSet
  distinguishabilityCondition : ∀ (s1 s2 : stateSet), (s1, s2) ∈ indistinguishabilityRelation → observationFunction s1 = observationFunction s2
  coveringCondition : ∀ (s : stateSet), observationFunction s ∈ observableCover

def stateSet := DiscreteEventControlFramework.stateSet
def observableSet := DiscreteEventControlFramework.observableSet
def observationFunction := DiscreteEventControlFramework.observationFunction

structure ObservabilityEvidence (P : ObservabilityConditionPackage) where
  distinguishabilityClosed : ∀ (s1 s2 : stateSet), (s1, s2) ∈ P.indistinguishabilityRelation → observationFunction s1 = observationFunction s2
  coveringClosed : ∀ (s : stateSet), observationFunction s ∈ P.observableCover

def ObservabilityClosed (P : ObservabilityConditionPackage) : Prop :=
  (∀ (s1 s2 : stateSet), (s1, s2) ∈ P.indistinguishabilityRelation → observationFunction s1 = observationFunction s2) ∧
  (∀ (s : stateSet), observationFunction s ∈ P.observableCover)

theorem observability_closed_from_evidence (P : ObservabilityConditionPackage)
    (E : ObservabilityEvidence P) : ObservabilityClosed P := by
  exact And.intro E.distinguishabilityClosed E.coveringClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse