import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilityAdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiagnosisPackage where
  faultSet : Type u
  observableFaultMapping : faultSet -> Set (AdmittedObject.system.system.stateSet)
  diagnosticAlgorithm : AdmittedObject.system.system.stateSet -> faultSet
  correctnessCondition : Prop

structure DiagnosisEvidence (D : DiagnosisPackage) where
  algorithmSatisfiesCondition : D.correctnessCondition

def DiagnosisClosed (D : DiagnosisPackage) : Prop :=
  D.correctnessCondition

theorem diagnosis_closed_from_evidence (D : DiagnosisPackage) (E : DiagnosisEvidence D) :
    DiagnosisClosed D := by
  exact E.algorithmSatisfiesCondition

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
