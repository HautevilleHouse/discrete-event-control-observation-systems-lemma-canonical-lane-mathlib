import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservationControlBridge

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

def DiscreteEventControlObservationSystemsLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem discrete_event_control_observation_systems_lemma_endgame
    (A : AdmissibleClass) : DiscreteEventControlObservationSystemsLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse