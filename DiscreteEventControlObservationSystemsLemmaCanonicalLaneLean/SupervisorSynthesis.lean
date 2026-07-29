import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure SupervisorSynthesisPackage {O : ObservationPackage}
    {C : ObservabilityPackage O} {G : ControllabilityPackage C} where
  supervisorFunction : (stateSpace O).states -> Set (stateSpace O).events
  nonblockingCondition : Prop
  controllabilityCondition : Prop
  observabilityCondition : Prop
  nonblockingConditionTerm : nonblockingCondition
  controllabilityConditionTerm : controllabilityCondition
  observabilityConditionTerm : observabilityCondition

structure SupervisorSynthesisEvidence {O : ObservationPackage}
    {C : ObservabilityPackage O} {G : ControllabilityPackage C}
    (S : SupervisorSynthesisPackage G) where
  nonblockingClosed : S.nonblockingCondition
  controllabilityClosed : S.controllabilityCondition
  observabilityClosed : S.observabilityCondition

def SupervisorSynthesisClosed {O : ObservationPackage}
    {C : ObservabilityPackage O} {G : ControllabilityPackage C}
    (S : SupervisorSynthesisPackage G) : Prop :=
  S.nonblockingCondition ∧ S.controllabilityCondition ∧ S.observabilityCondition

theorem supervisor_synthesis_closed_from_evidence {O : ObservationPackage}
    {C : ObservabilityPackage O} {G : ControllabilityPackage C}
    (S : SupervisorSynthesisPackage G) (E : SupervisorSynthesisEvidence S) :
    SupervisorSynthesisClosed S :=
  And.intro E.nonblockingClosed (And.intro E.controllabilityClosed E.observabilityClosed)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse