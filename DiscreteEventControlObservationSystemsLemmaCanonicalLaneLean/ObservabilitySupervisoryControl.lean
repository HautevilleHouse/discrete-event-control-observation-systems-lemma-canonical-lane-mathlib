import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilityDiagnosisPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure SupervisoryControlPackage where
  controlSpecifications : Prop
  controllableEvents : Set (AdmittedObject.system.system.eventSet)
  observableEvents : Set (AdmittedObject.system.system.eventSet)
  supervisorExists : Prop

structure SupervisoryControlEvidence (S : SupervisoryControlPackage) where
  supervisorExistsClosed : S.supervisorExists

def SupervisoryControlClosed (S : SupervisoryControlPackage) : Prop :=
  S.supervisorExists

theorem supervisory_control_closed_from_evidence (S : SupervisoryControlPackage) (E : SupervisoryControlEvidence S) :
    SupervisoryControlClosed S := by
  exact E.supervisorExistsClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
