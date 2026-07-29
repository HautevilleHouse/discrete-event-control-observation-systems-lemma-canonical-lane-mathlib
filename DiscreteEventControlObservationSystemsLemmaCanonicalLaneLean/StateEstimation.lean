import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure StateEstimationPackage where
  systemState : Type u
  observationFunction : systemState → Type v
  estimatorDynamics : Type w
  estimationError : Prop
  convergentEstimator : Prop

structure StateEstimationEvidence (E : StateEstimationPackage) where
  estimationErrorClosed : E.estimationError
  convergentEstimatorClosed : E.convergentEstimator

def StateEstimationClosed (E : StateEstimationPackage) : Prop :=
  E.estimationError ∧ E.convergentEstimator

theorem state_estimation_closed_from_evidence (E : StateEstimationPackage)
    (Ev : StateEstimationEvidence E) : StateEstimationClosed E := by
  exact And.intro Ev.estimationErrorClosed Ev.convergentEstimatorClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
