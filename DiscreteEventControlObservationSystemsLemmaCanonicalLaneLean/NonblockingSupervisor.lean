import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean

structure NonblockingSupervisorPackage where
  closedLoopSystem : Type u
  reachabilityCondition : Prop
  deadlockFreedom : Prop
  livelockFreedom : Prop
  nonblockingCondition : Prop

structure NonblockingSupervisorEvidence (N : NonblockingSupervisorPackage) where
  reachabilityConditionClosed : N.reachabilityCondition
  deadlockFreedomClosed : N.deadlockFreedom
  livelockFreedomClosed : N.livelockFreedom
  nonblockingConditionClosed : N.nonblockingCondition

def NonblockingSupervisorClosed (N : NonblockingSupervisorPackage) : Prop :=
  N.reachabilityCondition ∧ N.deadlockFreedom ∧ N.livelockFreedom ∧ N.nonblockingCondition

theorem nonblocking_supervisor_closed_from_evidence (N : NonblockingSupervisorPackage)
    (E : NonblockingSupervisorEvidence N) : NonblockingSupervisorClosed N := by
  exact And.intro E.reachabilityConditionClosed
    (And.intro E.deadlockFreedomClosed (And.intro E.livelockFreedomClosed E.nonblockingConditionClosed))

end DiscreteEventControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
