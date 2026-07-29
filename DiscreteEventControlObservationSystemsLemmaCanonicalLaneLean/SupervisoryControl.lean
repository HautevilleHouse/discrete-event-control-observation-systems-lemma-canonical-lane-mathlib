import canonicalLaneMathlib.AdmissibleClass
import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ControllerSynthesis
import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilityLemma
import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ControllabilityLemma

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure SupervisoryControlPackage (S : DiscreteEventSystem)
    (C : ControllerSynthesisPackage S)
    (O : ObservabilityLemmaPackage S)
    (K : ControllabilityLemmaPackage S) where
  supremalSupervisor : S.stateSpace → S.eventSet → Bool
  supervisorSoundness : Prop
  supervisorCompleteness : Prop
  supervisorSoundnessTerm : supervisorSoundness
  supervisorCompletenessTerm : supervisorCompleteness

structure SupervisoryControlEvidence {S : DiscreteEventSystem}
    {C : ControllerSynthesisPackage S}
    {O : ObservabilityLemmaPackage S}
    {K : ControllabilityLemmaPackage S}
    (P : SupervisoryControlPackage S C O K) where
  soundnessClosed : P.supervisorSoundness
  completenessClosed : P.supervisorCompleteness

def SupervisoryControlClosed {S : DiscreteEventSystem}
    {C : ControllerSynthesisPackage S}
    {O : ObservabilityLemmaPackage S}
    {K : ControllabilityLemmaPackage S}
    (P : SupervisoryControlPackage S C O K) : Prop :=
  P.supervisorSoundness ∧ P.supervisorCompleteness

theorem supervisory_control_closed_from_evidence {S : DiscreteEventSystem}
    {C : ControllerSynthesisPackage S}
    {O : ObservabilityLemmaPackage S}
    {K : ControllabilityLemmaPackage S}
    (P : SupervisoryControlPackage S C O K)
    (E : SupervisoryControlEvidence P) : SupervisoryControlClosed P := by
  exact And.intro E.soundnessClosed E.completenessClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse