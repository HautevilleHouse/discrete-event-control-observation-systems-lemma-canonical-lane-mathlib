import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilityGateLemmas

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

def ConstrainedObservabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_observability_endgame (A : AdmissibleClass) :
    ConstrainedObservabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
