import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure ControllerSynthesisPackage where
  plantModel : Type u
  specification : Type v
  controllerCandidate : Type w
  controllabilityCondition : Prop
  observabilityCondition : Prop

structure ControllerSynthesisEvidence (C : ControllerSynthesisPackage) where
  controllabilityConditionClosed : C.controllabilityCondition
  observabilityConditionClosed : C.observabilityCondition

def ControllerSynthesisClosed (C : ControllerSynthesisPackage) : Prop :=
  C.controllabilityCondition ∧ C.observabilityCondition

theorem controller_synthesis_closed_from_evidence (C : ControllerSynthesisPackage)
    (E : ControllerSynthesisEvidence C) : ControllerSynthesisClosed C := by
  exact And.intro E.controllabilityConditionClosed E.observabilityConditionClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
