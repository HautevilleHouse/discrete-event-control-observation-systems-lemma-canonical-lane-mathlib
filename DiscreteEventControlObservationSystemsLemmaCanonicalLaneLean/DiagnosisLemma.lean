import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiagnosisLemmaPackage where
  faultSet : Type u
  observableSymptoms : Set faultSet
  diagnosabilityCondition : Prop
  diagnosisAlgorithm : Type v

structure DiagnosisLemmaEvidence (D : DiagnosisLemmaPackage) where
  diagnosabilityConditionClosed : D.diagnosabilityCondition

def DiagnosisLemmaClosed (D : DiagnosisLemmaPackage) : Prop :=
  D.diagnosabilityCondition

theorem diagnosis_lemma_closed_from_evidence (D : DiagnosisLemmaPackage)
    (E : DiagnosisLemmaEvidence D) : DiagnosisLemmaClosed D := by
  exact E.diagnosabilityConditionClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
