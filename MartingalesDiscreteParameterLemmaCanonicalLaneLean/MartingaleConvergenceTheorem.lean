import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.DoobInequality

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure MartingaleConvergenceTheoremPackage (M : DiscreteMartingalePackage) where
  boundedInL1 : Prop
  almostSureLimitExists : Prop
  limitIsIntegrable : Prop
  conditionalExpectationConverges : Prop

structure MartingaleConvergenceTheoremEvidence {M : DiscreteMartingalePackage}
    (C : MartingaleConvergenceTheoremPackage M) where
  boundedInL1Closed : C.boundedInL1
  almostSureLimitExistsClosed : C.almostSureLimitExists
  limitIsIntegrableClosed : C.limitIsIntegrable
  conditionalExpectationConvergesClosed : C.conditionalExpectationConverges

def MartingaleConvergenceTheoremClosed {M : DiscreteMartingalePackage}
    (C : MartingaleConvergenceTheoremPackage M) : Prop :=
  C.boundedInL1 ∧ C.almostSureLimitExists ∧ C.limitIsIntegrable ∧ C.conditionalExpectationConverges

theorem martingale_convergence_theorem_closed_from_evidence {M : DiscreteMartingalePackage}
    (C : MartingaleConvergenceTheoremPackage M) (E : MartingaleConvergenceTheoremEvidence C) :
    MartingaleConvergenceTheoremClosed C := by
  exact And.intro E.boundedInL1Closed
    (And.intro E.almostSureLimitExistsClosed
      (And.intro E.limitIsIntegrableClosed E.conditionalExpectationConvergesClosed))

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse