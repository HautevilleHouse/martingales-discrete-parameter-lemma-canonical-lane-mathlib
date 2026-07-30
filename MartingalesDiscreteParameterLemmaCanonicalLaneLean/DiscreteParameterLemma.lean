import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure DiscreteParameterLemmaPackage (M : MartingaleAdmittedObject) where
  stoppedProcess : Type u
  optionalStopping : Prop
  maximalInequality : Prop
  convergence : Prop
  regularity : Prop

structure DiscreteParameterLemmaEvidence {M : MartingaleAdmittedObject}
    (P : DiscreteParameterLemmaPackage M) where
  stoppedProcessClosed : P.stoppedProcess = M.adaptedProcess
  optionalStoppingClosed : P.optionalStopping
  maximalInequalityClosed : P.maximalInequality
  convergenceClosed : P.convergence
  regularityClosed : P.regularity

def DiscreteParameterLemmaClosed {M : MartingaleAdmittedObject}
    (P : DiscreteParameterLemmaPackage M) : Prop :=
  P.stoppedProcess = M.adaptedProcess ∧ P.optionalStopping ∧ P.maximalInequality ∧ P.convergence ∧ P.regularity

theorem discrete_parameter_lemma_closed_from_evidence
    {M : MartingaleAdmittedObject} (P : DiscreteParameterLemmaPackage M)
    (E : DiscreteParameterLemmaEvidence P) : DiscreteParameterLemmaClosed P := by
  exact And.intro E.stoppedProcessClosed
    (And.intro E.optionalStoppingClosed
      (And.intro E.maximalInequalityClosed
        (And.intro E.convergenceClosed E.regularityClosed)))

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse