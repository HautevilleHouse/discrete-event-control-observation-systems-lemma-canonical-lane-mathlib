import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservationLemmaPackage (F : DiscreteEventControlFramework) (C : ControllerSynthesisPackage F) where
  observabilityPreserved : Prop
  controlConsistency : Prop
  lemmaConclusion : Prop
  observabilityPreservedCondition : observabilityPreserved := by
    exact ∀ (s1 s2 : F.stateSet), F.observationFunction s1 = F.observationFunction s2 →
      F.transitionFunction s1 (C.controlPolicy s1) = F.transitionFunction s2 (C.controlPolicy s2)
  controlConsistencyCondition : controlConsistency := by
    exact ∀ (s : F.stateSet), C.controlPolicy s = C.controlPolicy (F.transitionFunction s (C.controlPolicy s))

structure LemmaEvidence {F : DiscreteEventControlFramework} {C : ControllerSynthesisPackage F}
    (L : ObservationLemmaPackage F C) where
  observabilityPreservedClosed : L.observabilityPreserved
  controlConsistencyClosed : L.controlConsistency
  lemmaConclusionClosed : L.lemmaConclusion

def ObservationLemmaClosed {F : DiscreteEventControlFramework} {C : ControllerSynthesisPackage F}
    (L : ObservationLemmaPackage F C) : Prop :=
  L.observabilityPreserved ∧ L.controlConsistency ∧ L.lemmaConclusion

theorem observation_lemma_closed_from_evidence {F : DiscreteEventControlFramework}
    {C : ControllerSynthesisPackage F} (L : ObservationLemmaPackage F C)
    (E : LemmaEvidence L) : ObservationLemmaClosed L := by
  exact And.intro E.observabilityPreservedClosed
    (And.intro E.controlConsistencyClosed E.lemmaConclusionClosed)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse