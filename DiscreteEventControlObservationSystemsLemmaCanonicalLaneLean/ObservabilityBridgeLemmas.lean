import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilityAdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ObservableWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
