import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlControlSpecificationLemmaCanonicalLaneLean

/-!
# Control Specification Package

This module defines the control specification for discrete event control
systems. It includes the set of control patterns and the supervisory control
constraint.
-/

structure ControlSpecPackage where
  controlPatternSet : Type u
  admissibleControlPatterns : controlPatternSet -> Prop
  supervisoryControlConstraint : Prop
  nonblockingControl : Prop

structure ControlSpecEvidence (C : ControlSpecPackage) where
  admissibleControlPatternsClosed : C.admissibleControlPatterns
  supervisoryControlConstraintClosed : C.supervisoryControlConstraint
  nonblockingControlClosed : C.nonblockingControl

def ControlSpecClosed (C : ControlSpecPackage) : Prop :=
  C.admissibleControlPatterns ∧ C.supervisoryControlConstraint ∧ C.nonblockingControl

theorem control_spec_closed_from_evidence (C : ControlSpecPackage)
    (E : ControlSpecEvidence C) : ControlSpecClosed C := by
  exact And.intro E.admissibleControlPatternsClosed
    (And.intro E.supervisoryControlConstraintClosed E.nonblockingControlClosed)

end DiscreteEventControlControlSpecificationLemmaCanonicalLaneLean
end HautevilleHouse