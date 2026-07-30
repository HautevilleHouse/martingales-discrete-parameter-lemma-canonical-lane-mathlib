import MartingalesDiscreteParameterLemmaCanonicalLaneLean.Convergence

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure StoppingTimePackage {I : MartingaleIndexSet} where
  stoppingTime : Type u
  isStoppingTime : stoppedProcess → Prop
  stoppedProcess : Type v
  optionalStoppingTheorem : Prop
  isStoppingTimeClosed : isStoppingTime
  stoppedProcessClosed : stoppedProcess
  optionalStoppingTheoremClosed : optionalStoppingTheorem

structure StoppingTimeEvidence {I : MartingaleIndexSet} (S : StoppingTimePackage I) where
  isStoppingTimeClosed : S.isStoppingTime
  stoppedProcessClosed : S.stoppedProcess
  optionalStoppingTheoremClosed : S.optionalStoppingTheorem

def StoppingTimeClosed {I : MartingaleIndexSet} (S : StoppingTimePackage I) : Prop :=
  S.isStoppingTime ∧ S.stoppedProcess ∧ S.optionalStoppingTheorem

theorem stopping_time_closed_from_evidence {I : MartingaleIndexSet}
    (S : StoppingTimePackage I) (E : StoppingTimeEvidence S) : StoppingTimeClosed S := by
  exact And.intro E.isStoppingTimeClosed
    (And.intro E.stoppedProcessClosed E.optionalStoppingTheoremClosed)

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse