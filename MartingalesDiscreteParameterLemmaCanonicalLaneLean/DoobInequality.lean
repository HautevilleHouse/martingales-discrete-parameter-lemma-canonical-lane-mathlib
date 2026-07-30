import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MartingalesDiscreteParameterLemmaCanonicalLaneLean.MartingaleConvergence

namespace HautevilleHouse
namespace MartingalesDiscreteParameterLemmaCanonicalLaneLean

structure DoobMaximalInequalityPackage (M : DiscreteMartingalePackage) where
  maximalFunction : ℕ → (indexSet → ℝ)
  inequalityBound : ℝ
  integrableMaximalFunction : Prop
  inequalityHolds : Prop

structure DoobMaximalInequalityEvidence {M : DiscreteMartingalePackage}
    (D : DoobMaximalInequalityPackage M) where
  integrableMaximalFunctionClosed : D.integrableMaximalFunction
  inequalityHoldsClosed : D.inequalityHolds

def DoobMaximalInequalityClosed {M : DiscreteMartingalePackage}
    (D : DoobMaximalInequalityPackage M) : Prop :=
  D.integrableMaximalFunction ∧ D.inequalityHolds

theorem doob_maximal_inequality_closed_from_evidence {M : DiscreteMartingalePackage}
    (D : DoobMaximalInequalityPackage M) (E : DoobMaximalInequalityEvidence D) :
    DoobMaximalInequalityClosed D := by
  exact And.intro E.integrableMaximalFunctionClosed E.inequalityHoldsClosed

end MartingalesDiscreteParameterLemmaCanonicalLaneLean
end HautevilleHouse