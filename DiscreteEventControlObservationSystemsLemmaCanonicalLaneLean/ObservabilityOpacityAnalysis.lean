import DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean.ObservabilitySupervisoryControl

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure OpacityAnalysisPackage where
  secretStates : Set (AdmittedObject.system.system.stateSet)
  intruderObservationModel : AdmittedObject.observation
  opacityCondition : Prop
  opacityPreservingController : Prop

structure OpacityAnalysisEvidence (O : OpacityAnalysisPackage) where
  opacityConditionClosed : O.opacityCondition
  controllerPreservesOpacityClosed : O.opacityPreservingController

def OpacityAnalysisClosed (O : OpacityAnalysisPackage) : Prop :=
  O.opacityCondition ∧ O.opacityPreservingController

theorem opacity_analysis_closed_from_evidence (O : OpacityAnalysisPackage) (E : OpacityAnalysisEvidence O) :
    OpacityAnalysisClosed O := by
  exact And.intro E.opacityConditionClosed E.controllerPreservesOpacityClosed

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
