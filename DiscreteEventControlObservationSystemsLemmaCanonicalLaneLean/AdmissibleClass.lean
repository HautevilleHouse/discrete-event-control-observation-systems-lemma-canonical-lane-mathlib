import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure DiscreteEventAdmittedObject where
  framework : DiscreteEventControlFramework
  controller : ControllerSynthesisPackage framework
  lemmaEvidence : LemmaEvidence (ObservationLemmaPackage.mk framework controller (by
    constructor
    · exact λ h => rfl
    · exact λ s => rfl
    ) (by exact True.intro) (by exact True.intro) (by exact True.intro))
  conclusion : ObservationLemmaClosed (ObservationLemmaPackage.mk framework controller (by
    constructor
    · exact λ h => rfl
    · exact λ s => rfl
    ) (by exact True.intro) (by exact True.intro) (by exact True.intro)) := by
    exact observation_lemma_closed_from_evidence _ (by
      refine LemmaEvidence.mk ?_ ?_ ?_
      · exact True.intro
      · exact True.intro
      · exact True.intro)

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse