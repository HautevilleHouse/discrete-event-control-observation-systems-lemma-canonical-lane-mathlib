import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiscreteEventControlFramework where
  eventSet : Type
  observableSet : Type
  controlSet : Type
  stateSet : Type
  transitionFunction : stateSet → eventSet → stateSet
  observationFunction : stateSet → observableSet
  admissibleControls : controlSet → Prop
  initialStates : Set stateSet
  controlledInvariance : ∀ (s : stateSet) (c : controlSet), admissibleControls c → transitionFunction s c = s

structure ControlFrameworkEvidence (F : DiscreteEventControlFramework) where
  transitionFunctionTotal : ∀ (s : F.stateSet) (e : F.eventSet), F.transitionFunction s e = F.transitionFunction s e
  observationFunctionConsistent : ∀ (s : F.stateSet), F.observationFunction s = F.observationFunction s
  admissibleControlsDecidable : DecidablePred F.admissibleControls
  initialStatesNonempty : F.initialStates.Nonempty
  controlledInvarianceClosed : ∀ (s : F.stateSet) (c : F.controlSet), F.admissibleControls c → F.transitionFunction s c = s

def ControlFrameworkClosed (F : DiscreteEventControlFramework) : Prop :=
  F.transitionFunction = F.transitionFunction ∧
  F.observationFunction = F.observationFunction ∧
  ∀ (s : F.stateSet) (c : F.controlSet), F.admissibleControls c → F.transitionFunction s c = s

theorem control_framework_closed_from_evidence (F : DiscreteEventControlFramework)
    (E : ControlFrameworkEvidence F) : ControlFrameworkClosed F := by
  exact And.intro rfl (And.intro rfl E.controlledInvarianceClosed)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse