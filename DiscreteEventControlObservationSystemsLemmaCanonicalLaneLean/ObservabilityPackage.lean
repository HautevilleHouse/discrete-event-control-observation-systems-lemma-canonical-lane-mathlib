import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ObservabilityPackage {O : ObservationPackage} where
  indistinguishableStates : Set (O.stateSpace.states × O.stateSpace.states)
  observationEquivalence : equivalenceRelation O.stateSpace.states
  observableLanguage : Set (List O.stateSpace.observationAlphabet)
  observableLanguageDefined : Prop
  observationEquivalenceTerm : observationEquivalence
  observableLanguageDefinedTerm : observableLanguageDefined

structure ObservabilityEvidence {O : ObservationPackage}
    (Q : ObservabilityPackage O) where
  observationEquivalenceClosed : Q.observationEquivalence
  observableLanguageClosed : Q.observableLanguageDefined

def ObservabilityClosed {O : ObservationPackage}
    (Q : ObservabilityPackage O) : Prop :=
  Q.observationEquivalence ∧ Q.observableLanguageDefined

theorem observability_closed_from_evidence {O : ObservationPackage}
    (Q : ObservabilityPackage O) (E : ObservabilityEvidence Q) :
    ObservabilityClosed Q :=
  And.intro E.observationEquivalenceClosed E.observableLanguageClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse